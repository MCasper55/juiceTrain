extends CSGBox3D

@onready var anim = $Anim

func _on_detect_area_body_entered(body):
	anim.play("open")


func _on_detect_area_body_exited(body):
	anim.play_backwards("open")
