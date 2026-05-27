extends State

@onready var collision = $"../../PlayerDetection/FollowRange"
@onready var progress_bar = owner.find_child("ProgressBar")

var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)
		progress_bar.set_deferred("visible", value)

func enter():
	super.enter()
	owner.set_physics_process(true)
	animation_player.play("idle")
	progress_bar = owner.find_child("ProgressBar")

func transition():
	if player_entered:
		get_parent().change_state("Walk")

func _on_player_detection_body_entered(body):
	player_entered = true
