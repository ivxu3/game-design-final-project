extends Node2D

var parallax : float = 0.7
@onready var camera = $"../Camera2D"

func _process(_delta):
	global_position = camera.global_position
