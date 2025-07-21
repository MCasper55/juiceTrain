extends Node3D

@onready var area = $Area3D

func _ready():
	pass

func _on_area_3d_body_entered(body):
	if body.name == "Player":
		Global.goto_scene.emit(Global.next_scene)
		area.queue_free()
