extends CharacterBody3D

#Modified from this tutorial: https://www.youtube.com/watch?v=A3HLeyaBCq4

var speed

const WALK_SPEED = 2.5
const SPRINT_SPEED = 5
const JUMP_VELOCITY = 7
const SENSITIVITY = 0.002


const BOB_FREQ = 2
const BOB_AMP = 0.08
var t_bob = 0.0

#fov
const BASE_FOV = 75
const FOV_CHANGE = 2.5

@onready var pivot = $Pivot
@onready var camera = $Pivot/Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#Rotate camera / pivot
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		pivot.rotate_y(-event.relative.x * SENSITIVITY) 
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("sprint"):
		speed = SPRINT_SPEED
	else:
		speed = WALK_SPEED

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (pivot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 9)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 9)
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 3)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 3)
		
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)
	
	#Fov
	var velocity_clamped = clamp(velocity.length(), 0.5, SPRINT_SPEED * 2)
	var target_fov =  BASE_FOV + FOV_CHANGE * velocity_clamped
	if is_on_floor():
		camera.fov = lerp(camera.fov, target_fov, delta * 8)
	else:
		camera.fov
		#camera.fov = lerp(camera.fov, float(BASE_FOV), delta * 2)
	
	var fov = camera.fov

	move_and_slide()

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos
