extends Node3D

@onready var anims = $AnimationPlayer
@onready var video = $TV/SubViewport/SubViewportContainer/Video
@onready var introvideo = $TV/SubViewport/SubViewportContainer2/IntroVideo
@onready var introaudio = $TV/IntroAudio
@onready var audio = $TV/Audio

# Called when the node enters the scene tree for the first time.
func _ready():
	eggManager.timerstart.connect(play)
	introvideo.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play():
	video.play()
	anims.play("waitnretract")
	audio.play()
	introvideo.queue_free()
	introaudio.playing = false
	


func _on_intro_video_finished():
	introvideo.play()
