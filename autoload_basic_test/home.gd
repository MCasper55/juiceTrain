extends Node2D

@onready var area = $Area2D

func _ready():
	pass


func _on_area_2d_body_entered(body):
	Global.goto_scene.emit(Global.next_scene)
	area.queue_free()
