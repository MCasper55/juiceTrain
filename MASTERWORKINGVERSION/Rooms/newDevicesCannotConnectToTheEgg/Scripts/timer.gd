extends Node3D

@onready var timer = $Timer

@onready var label = $Label3D
@onready var label_2 = $Label3D2
@onready var label_3 = $Label3D3
@onready var label_4 = $Label3D4

@onready var eggInducingStressTimer = $EggInducingStressTimer

var monitoring = 0

var number

# Called when the node enters the scene tree for the first time.
func _ready():
	eggManager.timerstart.connect(start)

func start():
	await get_tree().create_timer(15).timeout
	timer.start(30.5)
	monitoring = 1
	eggManager.begin.emit()

	eggInducingStressTimer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if monitoring == 1 and eggManager.someoneConnected == 0:

		if timer.time_left < 9.5:
			number = str("0" + str(roundi(timer.time_left)))
		else:
			number = str(roundi(timer.time_left))
		
		label.text = number
		label_2.text = number
		label_3.text = number
		label_4.text = number


func _on_timer_timeout():
	if eggManager.someoneConnected == 0:
		eggManager.eggCrack.emit(0)
		eggManager.someoneConnected = 1
