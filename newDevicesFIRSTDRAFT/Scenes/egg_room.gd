extends Node3D

@onready var devicestopperAnim = $Room/DeviceStopper/AnimationPlayer

func _ready():
	eggManager.connect("eggCrack", stop)
	
func stop():
	devicestopperAnim.pause()
