extends Node3D

@onready var anims = $Arm/Cylinder/AnimationPlayer

var justConnected = 0

func _ready():
	anims.speed_scale = 1
	await get_tree().create_timer(randf_range(1, 8)).timeout
	extend()
	eggManager.connect("eggCrack", reverse) #if it starts to break, move this back into the extend function

func reverse():
	if justConnected == 0:
		anims.speed_scale = -8


func _on_area_area_entered(area):
	if area.name == "EggArea":
		justConnected = 1
		eggManager.someoneConnected = 1
		anims.pause()
	if area.is_in_group("stopsDevices"):
		anims.speed_scale = 8
		anims.play_backwards("extend")
		await anims.animation_finished
		anims.speed_scale = 1
		await get_tree().create_timer(randf_range(1, 8)).timeout
		extend()

func extend():
	if eggManager.someoneConnected == 0:
		anims.play("extend")
