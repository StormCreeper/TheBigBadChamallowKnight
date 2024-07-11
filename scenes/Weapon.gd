extends Node3D

@onready var swing_finished = true #used to prevent the player to swing to quickly, "breaking" the animations
@onready var stickType = "crosse"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#called when the player wants to swing its stick -by pressing the S button when I'm writting this
#The function has to move the stick but also deal with the cute movements of the dangle
func swing():
	if swing_finished : #the player cannot spam-click the swing
		swing_finished = false
		if stickType == "crosse" :
			$Dangle/animation.play("crosse_swing")
		$Stick/animation.play("swing")


func _on_stick_animation_finished(anim_name):
	if anim_name == "swing" :
		swing_finished = true

#handles the left/right deplacements of the player
func _on_player_idle():
	$Dangle/animation.play("RESET")
func _on_player_move_left():
	if stickType == "crosse" :
		$Dangle/animation.play("crosse_float_left")
func _on_player_move_right():
	if stickType == "crosse" :
		$Dangle/animation.play("crosse_float_right")
