extends Node3D

@onready var anims = $Arm/Cylinder/AnimationPlayer

var justConnected = 0

func _ready():
	anims.speed_scale = 1
	await get_tree().create_timer(randf_range(1, 8)).timeout
	if eggManager.someoneConnected == 0:
		anims.play("extend")
		eggManager.connect("eggCrack", stop)
	


func stop():
	if justConnected == 0:
		anims.speed_scale = 8
		anims.play_backwards("extend")


func _on_area_area_entered(area):
	if area.name == "EggArea":
		justConnected = 1
		eggManager.someoneConnected = 1
		anims.pause()
