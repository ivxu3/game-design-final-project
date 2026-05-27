extends State

func enter():
	super.enter()
	owner.set_physics_process(true)
	animation_player.play("walk")
	if not owner.is_in_group("camera"):
		owner.add_to_group("camera")

func exit():
	super.exit()
	owner.set_physics_process(false)

func transition():
	var distance = owner.direction.length()
	
	if distance < 60:
		get_parent().change_state("Attack")
