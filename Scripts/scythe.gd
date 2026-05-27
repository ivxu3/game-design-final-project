extends Area2D

@export var weapon_damage = 1

func _ready():
	$".".body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(weapon_damage)
		queue_free() 
