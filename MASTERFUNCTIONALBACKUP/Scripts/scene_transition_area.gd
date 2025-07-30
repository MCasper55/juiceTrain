extends Area3D

func _ready():
	pass


func _on_body_entered(body):
	if body.name == "Player":
		Global.goto_scene.emit("res://home.tscn")
		Global.ball_reparent.emit()
		queue_free()
