extends Node3D

@onready var swing_finished = true #used to prevent the player to swing to quickly, "breaking" the animations


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#called when the player wants to swing its stick -by pressing the S button when I'm writting this
#The function has to move the stick but also deal with the cute movements of the dangle
func swing():
	if swing_finished :
		swing_finished = false
		if $Dangle.animation == "crosse" :
			$Dangle/animation.play("crosse_swing")
		$Stick/animation.play("swing")


func _on_dangle_animation_finished(anim_name):
	if anim_name == "crosse_swing" :
		$Dangle/animation.play("crosse_swing_back")


func _on_stick_animation_finished(anim_name):
	if anim_name == "swing" :
		swing_finished = true
