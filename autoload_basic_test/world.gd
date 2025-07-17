extends Node

@onready var current_scene = $Areas.get_child(0)

@onready var areas = $Areas



@onready var detach_manager = $DetachManager

@onready var detachAnim = $DetachManager/DetachAnim

@onready var detach_anim_marker = $DetachManager/DetachAnimMarker

#not to be confused with global.next_scene: this one is used to literally instantiate the next scene
#for seemless transition between scenes. the global one is used to keep track of the next scene
var next_scene

var rand

var detaching = 0

var pos = 0

func _ready():
	pick_next_scene()
	Global.goto_scene.connect(goto_scene)
	#Engine.time_scale = 0.1

func goto_scene(path):
	_deferred_goto_scene.call_deferred(path)
	detach()

func _deferred_goto_scene(path):
	
	if Global.previous_scene != null:
		Global.previous_scene.queue_free()
	
	Global.previous_scene = current_scene
	
	pos -= 1200
	
	current_scene = next_scene
	
	current_scene.position.x = pos
	
	detach_manager.position.x = pos
	
	print("current scene x: " + str(current_scene.position.x))
	
	pick_next_scene()



func next_scene_func():
	goto_scene(Global.next_scene)

func pick_next_scene():
	if current_scene.is_in_group("home"):
		rand = randi_range(1, 2)
		if rand == 1:
			Global.next_scene = "res://scene_2.tscn"
		else:
			Global.next_scene = "res://scene_3.tscn"

	elif current_scene.is_in_group("not_home"):
		Global.next_scene = "res://home.tscn"
		
	var n = load(Global.next_scene)
	
	next_scene = n.instantiate()
	
	areas.add_child(next_scene)
	
	next_scene.position.x = pos - 1200
	#print(Global.next_scene)


func detach():
	detachAnim.stop()
	detachAnim.play("detach")
	detaching = 1


func _process(delta):
	if detaching == 1:
		Global.previous_scene.position = detach_anim_marker.global_position
		


func _on_detach_anim_animation_finished(detach):
	detaching = 0
	detachAnim.stop()
	print(detach_anim_marker.global_position.x)
	Global.previous_scene.free()
