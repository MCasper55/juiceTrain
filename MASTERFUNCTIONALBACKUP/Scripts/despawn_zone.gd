extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if not body.name == "Player":
		body.queue_free()
	else:
		reload.call_deferred()
		
func reload():
	get_tree().reload_current_scene()
