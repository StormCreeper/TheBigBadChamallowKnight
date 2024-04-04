extends CharacterBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var direction = Vector3.ZERO;
	
	if Input.is_key_pressed(KEY_RIGHT):
		direction.x += 1;
	if Input.is_key_pressed(KEY_LEFT):
		direction.x -= 1;
	if Input.is_key_pressed(KEY_UP):
		direction.z -= 1;
	if Input.is_key_pressed(KEY_DOWN):
		direction.z += 1;
		
	velocity = direction * 6;
	move_and_slide();
