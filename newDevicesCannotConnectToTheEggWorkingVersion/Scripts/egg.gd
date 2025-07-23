extends Node3D

@onready var joint = $Joint

@onready var seg_1 = $Seg1
@onready var seg_2 = $Seg2


var cracked = 0

func _ready():
	seg_1.freeze
	seg_2.freeze

func _on_area_3d_area_entered(area):
	if area.is_in_group("CanBreakEgg") and cracked == 0:
		crack()


func _on_area_3d_body_entered(body):
	if body.is_in_group("CanBreakEgg") and cracked == 0:
		crack()

func crack():
	seg_1.freeze_mode = false
	seg_2.freeze_mode = false
	cracked = 1
	joint.queue_free()
	print("yeehaw")
	eggManager.emit_signal("eggCrack")
	eggManager.someoneConnected = 1
