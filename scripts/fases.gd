extends Control
@onready var button_1: Button = $Button1
@onready var button_2: Button = $Button2
@onready var button_3: Button = $Button3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_1.disabled = false
	button_2.disabled = Progress.unlocked_level < 2
	button_3.disabled = Progress.unlocked_level < 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Progress.selected_level = 1
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_button_2_pressed() -> void:
	Progress.selected_level = 2
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_button_3_pressed() -> void:
	Progress.selected_level = 3
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/telas_de_controle/menu.tscn")
