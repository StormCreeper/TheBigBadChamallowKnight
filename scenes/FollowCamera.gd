extends Camera3D

var player: CharacterBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_node("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var player_pos = player.global_transform.origin
	var camera_pos = global_transform.origin
	var target = Vector3(player_pos.x, camera_pos.y, camera_pos.z)
	var new_pos = camera_pos.lerp(target, 0.1)
	global_transform.origin = new_pos
