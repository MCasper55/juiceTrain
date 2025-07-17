extends Node2D

@onready var areas = self


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.current_scene = areas.get_child(0)
	Global.connect("current_scene_signal", reset)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func reset():
	Global.current_scene = areas.get_child(0)
