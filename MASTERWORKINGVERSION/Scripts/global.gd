extends Node

var next_scene

var previous_scene

var current_scene

signal goto_scene(path)

signal ball_reparent

signal detach_complete

var scene_lengths = {
	
	"res://Rooms/scene_1.tscn": 5,
	"res://Rooms/scene_2.tscn": 5,
	"res://Rooms/newDevicesCannotConnectToTheEgg/Scenes/egg_room.tscn": 6,
	"res://Scenes/home.tscn": 8

}


#func _ready():
	#pass # Replace with function body.

#func _process(delta):
	#pass
