extends Node


var levels = {
	1: preload("res://scenes/primeira.tscn"),
	2: preload("res://scenes/segunda.tscn"),
	3: preload("res://scenes/terceira.tscn")
}


func load_level(selected_level, container):
	print("CARREGANDO FASE:", selected_level)
	print("CONTAINER:", container)

	for child in container.get_children():
		child.queue_free()

	var level = levels[selected_level].instantiate()
	container.add_child(level)

	return level
