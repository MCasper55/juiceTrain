extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.ball_reparent.connect(re_parent)
	re_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func re_parent():
	rp.call_deferred()
	
func rp():
	reparent(Global.current_scene, true)
	print(Global.current_scene)
