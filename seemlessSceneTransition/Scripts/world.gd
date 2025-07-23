extends Node

@onready var current_scene = $Areas.get_child(0)

@onready var areas = $Areas

@onready var despawn_zone = $Areas/DespawnZone

@onready var detach_manager = $DetachManager

@onready var detachAnim = $DetachManager/DetachAnim

@onready var detach_anim_marker = $DetachManager/DetachAnimMarker

#not to be confused with global.next_scene: this one is used to literally instantiate the next scene
#for seemless transition between scenes. the global one is used to keep track of the next scene
var next_scene

var rand = randi_range(1, 2)

var detaching = 0

var pos = 0

func _ready():
	pick_next_scene()
	Global.goto_scene.connect(goto_scene)
	Global.detach_complete.connect(detach_complete)
	Global.current_scene = $Areas.get_child(0)
	#Engine.time_scale = 0.1

func goto_scene(path):
	_deferred_goto_scene.call_deferred(path)
	detach()

func _deferred_goto_scene(path):
	
	if Global.previous_scene != null:
		Global.previous_scene.queue_free()
	
	Global.previous_scene = current_scene
	
	pos -= 8
	
	current_scene = next_scene
	
	Global.current_scene = next_scene
	
	current_scene.position.z = pos
	
	detach_manager.position.z = pos
	
	despawn_zone.position.z = pos
	
	print("current scene x: " + str(current_scene.position.z))
	
	pick_next_scene()



func next_scene_func():
	goto_scene(Global.next_scene)

func pick_next_scene():
	if current_scene.is_in_group("home"):
		rand = randi_range(1, 2)
		if rand == 1:
			Global.next_scene = "res://Scenes/scene_1.tscn"
		else:
			Global.next_scene = "res://Scenes/scene_2.tscn"

	elif current_scene.is_in_group("not_home"):
		Global.next_scene = "res://Scenes/home.tscn"
		
	var n = load(Global.next_scene)
	
	next_scene = n.instantiate()
	
	areas.add_child(next_scene)
	
	next_scene.position.z = pos - 8
	#print(Global.next_scene)


func detach():
	detachAnim.stop()
	detachAnim.play("detach")
	detaching = 1


func _process(delta):
	if detaching == 1:
		Global.previous_scene.position.z = detach_anim_marker.global_position.z

func detach_complete():
	detaching = 0
	detachAnim.stop()
	print(detach_anim_marker.global_position.z)
	Global.previous_scene.free()
