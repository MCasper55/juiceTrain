extends Node3D

@onready var anims = $AnimationPlayer
@onready var video = $TV/SubViewport/SubViewportContainer/Video


# Called when the node enters the scene tree for the first time.
func _ready():
	eggManager.timerstart.connect(play)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play():
	video.play()
	anims.play("waitnretract")
