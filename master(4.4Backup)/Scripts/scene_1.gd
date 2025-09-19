extends Node3D

@onready var ball = $Ball



# Called when the node enters the scene tree for the first time.
func _ready():
	ball.reparent(Global.current_scene, true)
	ball.position.z = position.z



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
