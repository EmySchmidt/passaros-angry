extends Control


func _on_menu_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/telas_de_controle/menu.tscn")
