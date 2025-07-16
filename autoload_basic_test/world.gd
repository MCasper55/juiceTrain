extends Node

@onready var current_scene = $Areas.get_child(0)

@onready var areas = $Areas

@onready var detachAnim = $DetachAnim/DetachAnim

@onready var detach_anim_marker = $DetachAnim/DetachAnimMarker


var rand

var playerlerp = 0

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
	# It is now safe to remove the current scene.
	Global.previous_scene = current_scene
	
	Global.previous_scene
	
	playerlerp = 1
	
	pos -= 1200
	
	var s = load(path)
	
	current_scene = s.instantiate()
	
	print(current_scene)
	
	areas.add_child(current_scene)
	
	current_scene.position.x = pos
	
	print(current_scene.position.x)
	
	print(current_scene)
	
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
	print(Global.next_scene)


func detach():
	detachAnim.play("detach")
	detaching = 1


func _process(delta):
	if detaching == 1:
		Global.previous_scene.position = detach_anim_marker.position
		


func _on_detach_anim_animation_finished(detach):
	detaching = 0
	Global.previous_scene.free()
