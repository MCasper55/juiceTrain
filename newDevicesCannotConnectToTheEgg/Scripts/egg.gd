extends Node3D

@onready var joint = $Joint

var cracked = 0



func _on_area_3d_area_entered(area):
	if area.is_in_group("CanBreakEgg") and cracked == 0:
		cracked = 1
		joint.queue_free()
		print("yeehaw")
		eggManager.emit_signal("eggCrack")


func _on_area_3d_body_entered(body):
	if body.is_in_group("CanBreakEgg") and cracked == 0:
		cracked = 1
		joint.queue_free()
		print("yeehaw")
		eggManager.emit_signal("eggCrack")
