extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_fases_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/telas_de_controle/fases.tscn")


func _on_sair_pressed() -> void:
	get_tree().quit()
	
