extends Node

var next_scene

var previous_scene

var current_scene

signal goto_scene(path)

signal ball_reparent

signal detach_complete

var scene_lengths = {
	
	"res://Scenes/scene_1.tscn": 5,
	"res://Scenes/scene_2.tscn": 5,
	
}


#func _ready():
	#pass # Replace with function body.

#func _process(delta):
	#pass
