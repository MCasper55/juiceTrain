extends SpotLight3D

@onready var anims = $Anims

# Called when the node enters the scene tree for the first time.
func _ready():
	eggManager.eggCrack.connect(red)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func red(bool):
	if bool == 1:
		anims.play("makered")
	elif bool == 0:
		anims.play("makegreen")
	
