extends Node


var levels = {
	1: preload("res://scenes/primeira.tscn"),
	2: preload("res://scenes/segunda.tscn"),
	3: preload("res://scenes/terceira.tscn")
}


func load_level(selected_level, container):
	print("CARREGANDO FASE:", selected_level)
	print("CONTAINER:", container)
	
	if !levels.has(selected_level):
		print("Não existem mais fases!")
		get_tree().change_scene_to_file("res://scenes/telas_de_controle/vitoria.tscn")
		return null

	for child in container.get_children():
		child.queue_free()

	
	var level = levels[selected_level].instantiate()
	container.add_child(level)

	return level
