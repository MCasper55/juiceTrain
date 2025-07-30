extends Node3D

@onready var walkway = $Walkway
@onready var detect = $Walkway/Detect
@onready var animsretract = $Walkway/AnimsRetract
@onready var animsextend = $Walkway2/AnimsExtend

# Called when the node enters the scene tree for the first time.
func _ready():
	eggManager.eggCrack.connect(extend)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_detect_body_entered(body):
	if body.name == "Player":
		animsretract.play("retract")

func _on_anims_retract_animation_finished(anim_name):
	detect.queue_free()
	animsretract.queue_free()
	walkway.queue_free()
	


func extend(bool):
	if bool == 0:
		animsextend.play("extend")
