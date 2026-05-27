class_name Hitbox
extends Area2D

@export var damage: int= 1 :set= set_damage, get = get_damage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func set_damage(value :int):
	damage =value
	
func get_damage():
	return damage

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
