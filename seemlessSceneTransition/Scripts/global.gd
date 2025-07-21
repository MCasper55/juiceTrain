extends Node

var next_scene

var previous_scene

signal goto_scene(path)

var scene_lengths = {
	
	"res://Scenes/scene_1.tscn": 5,
	"res://Scenes/scene_2.tscn": 5,
	
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
