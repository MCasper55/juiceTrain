extends CSGCylinder3D

@onready var stand_anim = $StandAnim

@onready var stand = self

func _ready():
	eggManager.eggCrack.connect(retract)
	
func retract(bool):
	if bool == 1:
		stand_anim.play("standretract")

func _on_stand_anim_animation_finished(anim_name):
	stand.queue_free()
