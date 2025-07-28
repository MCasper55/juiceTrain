extends Node3D

@onready var anims = $Arm/Cylinder/AnimationPlayer

var justConnected = 0

func _ready():
	anims.speed_scale = randf_range(0.5, 1.2)
	eggManager.eggCrack.connect(reverse) #if it starts to break, move this back into the extend function
	eggManager.begin.connect(start)

func start():
	await get_tree().create_timer(randf_range(0, 10)).timeout
	extend()

func reverse(bool):
	if justConnected == 0:
		anims.speed_scale = -8


func _on_area_area_entered(area):
	if area.name == "EggArea":
		justConnected = 1
		eggManager.someoneConnected = 1
		anims.speed_scale = 0
		
	if area.is_in_group("stopsDevices"):
		anims.speed_scale = -8
		await anims.animation_finished
		anims.speed_scale = randf_range(0.5, 1.2)
		await get_tree().create_timer(randf_range(0, 6)).timeout
		extend()

func extend():
	if eggManager.someoneConnected == 0:
		anims.play("extend")
