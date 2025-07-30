extends Node3D

@onready var wall = $Walls/Wall
@onready var wall2 = $Walls/Wall2
@onready var wall3 = $Walls/Wall3
@onready var wall4 = $Walls/Wall4
@onready var wall5 = $Walls/Wall5
@onready var wall6 = $Walls/Wall6

@onready var dropmarker = $DropMarker
@onready var anim = $DropMarker/Anim

@onready var wallsList = [wall, wall2, wall3, wall4, wall5, wall6]

var walldrop = 0

var randWall

func _ready():
	eggManager.begin.connect(start)
	eggManager.eggCrack.connect(stop)

func start():
	await get_tree().create_timer(randi_range(4, 6)).timeout
	droploop()

func droploop():
	if eggManager.someoneConnected == 0:
		pickwall()
		anim.play("drop")
		walldrop = 1

func _process(delta):
	if walldrop == 1:
		randWall.position.y = dropmarker.position.y

func pickwall():
	randWall = wallsList.pick_random()


func _on_anim_animation_finished(drop):
	walldrop = 0
	droploop()

func stop(bool):
	anim.speed_scale = 4
