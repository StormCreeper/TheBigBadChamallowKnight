extends CharacterBody3D

var dir = 1;
# Called when the node enters the scene tree for the first time.
func _ready():
	$Head.play()
	$Body.play()
	pass # Replace with function body.

const SPEED = 5.0
const JUMP_VELOCITY = 6

# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Vector3.ZERO
	if Input.is_action_pressed("move_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("move_right"):
		input_dir.x += 1
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dir = 1 if get_real_velocity().x>0 else -1
	$Head.flip_h = dir<0;
	$Body.flip_h = dir<0;

	var is_moving = get_real_velocity().length_squared();
	if is_moving:
		$Head.animation = "walk"
		$Body.animation = "walk"
	else:
		$Head.animation = "idle"
		$Body.animation = "idle"

	#move_and_collide(velocity*delta)
	#if (dir>0 and position.x>2) or (dir<0 and position.x<-2):
		#$AnimatedSprite3D.flip_h = not $AnimatedSprite3D.flip_h
		#dir*=-1
	#velocity.x = dir
	#position = position + velocity*delta

#traite les inputs du clavier
func _input(event):
	if event.is_action_pressed("swing_stick") and event.is_pressed() and not event.is_echo():
		$Weapon.swing() #well, no need for explanations here, right ? For now, the "swing_stick" button is S
