extends Camera2D

# Assign these in the Inspector or using code when players spawn
@export var player1: Node2D
@export var player2: Node2D

@export var min_zoom := Vector2(1.0, 1.0)
@export var max_zoom := Vector2(0.5, 0.5)
@export var zoom_speed := 5.0
@export var margin := Vector2(100, 100) # Screen padding

func _process(delta: float) -> void:
	if not player1 or not player2:
		return

	# 1. Track the midpoint between both players
	var target_position = (player1.global_position + player2.global_position) / 2
	global_position = global_position.lerp(target_position, 5.0 * delta)

	# 2. Track the furthest distance between players to adjust zoom
	var distance = player1.global_position.distance_to(player2.global_position)
	
	# Determine the required zoom level (farther players = more zoomed out)
	var viewport_size = get_viewport_rect().size
	var target_zoom_x = clamp(viewport_size.x / (distance + margin.x), max_zoom.x, min_zoom.x)
	var target_zoom_y = clamp(viewport_size.y / (distance + margin.y), max_zoom.y, min_zoom.y)
	
	# Smoothly interpolate the zoom
	var target_zoom = Vector2(target_zoom_x, target_zoom_y)
	zoom = zoom.lerp(target_zoom, zoom_speed * delta)
