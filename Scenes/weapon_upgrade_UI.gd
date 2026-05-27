extends Control


func ready():
	$AnimationPlayer.play("RESET")

func Upgrade():
	pass

func testTab():
	if Input.is_action_just_pressed("Tab"):
		show()



func _process(delta: float) -> void:
	testTab()





#@onready var popup_scene = preload("res://Scenes/weapon_upgrade.tscn")
#var current_popup

#func _on_button_pressed():
	# Instantiate the popup
	#current_popup = popup_scene.instantiate()
	
	#get_window().add_child(current_popup)
	
	
	#current_popup.close_requested.connect(func(): 
	#	current_popup.queue_free()
	#)


#func _on_window_close_requested() -> void:
	#$Window.hide()


func _on_cancelbutton_pressed() -> void:
	hide()
