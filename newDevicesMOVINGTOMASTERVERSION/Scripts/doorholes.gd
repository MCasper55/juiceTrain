extends Node3D

@onready var enter = $"../Enter"
@onready var exit = $"../Exit"
@onready var enterarea = $"../EnterArea"
@onready var enterarea2 = $"../EnterArea2"
@onready var exitarea = $"../ExitArea"
@onready var exitarea2 = $"../ExitArea2"


# Called when the node enters the scene tree for the first time.
func _ready():
	eggManager.eggCrack.connect(enableexit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enter_area_body_entered(body):
	if body.name == "Player":
		enter.play("enter")
		enterarea.queue_free()
		print("enter")
		eggManager.timerstart.emit()

func _on_enter_area_2_body_entered(body):
	if body.name == "Player":
		enter.play_backwards("enter")
		enterarea2.queue_free()

func _on_exit_area_body_entered(body):
	if body.name == "Player":
		exit.play("exit")
		exitarea.queue_free()

func _on_exit_area_2_body_entered(body):
	if body.name == "Player":
		exit.play_backwards("exit")
		exitarea2.queue_free()

func enableexit(bool):
	if bool == 0:
		exitarea.monitoring = true
