extends Control


func _on_sheet_pressed():
	get_tree().change_scene_to_file("res://Scenes/sheet_scene.tscn")


func _on_box_pressed():
	get_tree().change_scene_to_file("res://Scenes/ui2.tscn")


func _on_exit_pressed():
	get_tree().quit()
