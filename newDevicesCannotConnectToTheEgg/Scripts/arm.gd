extends Node3D

@onready var segment1 = $Segment1
@onready var segment2 = $Segment2

@onready var segment3 = $Segment3
#>
@onready var seg3mesh = $Segment3/MeshInstance3D
@onready var seg3col = $Segment3/CollisionShape3D


var forceStrength = -100

func _process(delta):
	if Input.is_action_just_pressed("space"):
		segment2.apply_torque(Vector3(2000, 2000, 2000))
	
	segment3.apply_central_impulse(Vector3(0, 0, forceStrength) * delta)

	if forceStrength >= -2000:
		forceStrength *= 1.005
	
	if seg3mesh.scale.y < 2:
		seg3mesh.scale.y *= 1.0006
		seg3col .scale.y *= 1.0006
	
	print(forceStrength)
