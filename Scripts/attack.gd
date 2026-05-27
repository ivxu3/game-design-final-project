extends State

func enter():
	super.enter()
	owner.set_physics_process(false)
	animation_player.play("attack")

func transition():
	if owner.direction.length() > 60:
		get_parent().change_state("Walk")
