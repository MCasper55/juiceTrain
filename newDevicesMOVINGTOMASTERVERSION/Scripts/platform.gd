extends Node3D

@onready var anim = $Platform/Anim

func _ready():
	eggManager.eggCrack.connect(stop)


func stop(bool):
	anim.pause()
