extends Area2D

@export var attack_damage = 1
@export var weapon_cooldown = 1
var next_attack_time = 0
func _ready():
	$".".body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(attack_damage)
		queue_free() 
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
			preform_attack()
			
func preform_attack():
	$".".disabled =false
	$AnimationPlayer.play("swing")
	_animation_finished()
func _animation_finished():
	$".".disabled = true
