extends Node3D

@onready var joint = $Joint

@onready var seg_1 = $Seg1
@onready var seg_2 = $Seg2


var cracked = 0

func _ready():
	seg_1.gravity_scale = 0
	seg_2.gravity_scale = 0
func _on_area_3d_area_entered(area):
	if area.is_in_group("CanBreakEgg") and cracked == 0:
		crack()


func _on_area_3d_body_entered(body):
	if body.is_in_group("CanBreakEgg") and cracked == 0:
		crack()

func crack():
	seg_1.gravity_scale = 1
	seg_2.gravity_scale = 1
	seg_1.apply_central_impulse(Vector3(randf_range(-0.2, 0.2), randf_range(0, 0.5), randf_range(-0.2, 0.2)))
	seg_2.apply_central_impulse(Vector3(randf_range(-0.2, 0.2), randf_range(0, 0.5), randf_range(-0.2, 0.2)))
	cracked = 1
	joint.queue_free()
	eggManager.eggCrack.emit(1)
	eggManager.someoneConnected = 1
