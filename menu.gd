extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_normal_mode_button_down():
	get_tree().change_scene_to_file("res://level_01.tscn")

func _on_hard_mode_button_down():
	get_tree().change_scene_to_file("res://level_02.tscn")

func _on_very_hard_mode_button_down():
	get_tree().change_scene_to_file("res://level_03.tscn")

func _on_ultimate_mode_button_down():
	get_tree().change_scene_to_file("res://level_04.tscn")
