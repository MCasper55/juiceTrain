extends Area3D

func _ready():
	pass


func _on_body_entered(body):
	if body.name == "Player":
		Global.goto_scene.emit("res://home.tscn")
		queue_free()
		print("i done it")
