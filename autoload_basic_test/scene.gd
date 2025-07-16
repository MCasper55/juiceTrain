extends Node2D


func _ready():
	pass


func _on_area_2d_body_entered(body):
	Global.goto_scene.emit("res://home.tscn")
	
	
