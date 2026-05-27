extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D

@export var gravity : float = 500
@export var speed : float = 30

var direction : Vector2

func _ready():
	set_physics_process(false)

func _process(_delta):
	if not player:
		return
	direction = player.position - position
	sprite.flip_h = direction.x < 0

func _physics_process(delta):
	velocity.y += gravity * delta
	if player:
		var direction = (player.position - position).normalized()
		velocity.x = direction.x * speed
	move_and_slide()
