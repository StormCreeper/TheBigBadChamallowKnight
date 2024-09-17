extends Node3D

@onready var swing_finished = true #used to prevent the player to swing to quickly, "breaking" the animations
@onready var stickType = "baluchon"

# Called when the node enters the scene tree for the first time.
func _ready():
	if stickType == "crosse":
		$Dangle.play("crosse")
		$Stick/sprite.play("crosse")
	if stickType == "baluchon":
		$Dangle.play("baluchon")
		$Stick/sprite.play("baluchon")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#called when the player wants to swing its stick -by pressing the S button for now
#The swing function has to move the stick but also deal with the movements of the dangle
func swing():
	if swing_finished : #the player cannot spam-click the swing
		swing_finished = false
		if stickType == "crosse" :
			$Dangle/animation.play("crosse_swing") 
		if stickType == "baluchon" :
			$Dangle/animation.play("crosse_swing")
		$Stick/animation.play("swing")


func _on_stick_animation_finished(anim_name):
	if anim_name == "swing" :
		swing_finished = true



#handles the movements while the walk of the player
func _on_player_idle():
	if swing_finished :
		$Dangle/animation.play("low_reset")
		$Stick/animation.play("RESET")
func _on_player_move_left():
	if swing_finished :
		$Stick/animation.play("walk")
		if stickType == "crosse" :
			$Dangle/animation.play("crosse_float_left")
		if stickType == "baluchon" :
			$Dangle/animation.play("crosse_float_left")
func _on_player_move_right():
	if swing_finished :
		$Stick/animation.play("walk")
		if stickType == "crosse" :
			$Dangle/animation.play("crosse_float_right")
		if stickType == "baluchon" :
			$Dangle/animation.play("crosse_float_right")
