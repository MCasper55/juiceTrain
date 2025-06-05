extends Node3D

@onready var anims = $Arm/Cylinder/AnimationPlayer

func _ready():
	await get_tree().create_timer(randf_range(0, 5)).timeout
	anims.play("extend")
