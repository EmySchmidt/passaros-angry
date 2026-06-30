extends Node2D
@onready var level_container: Node2D = $LevelContainer


var birds_left = 4
var pigs_left = 0

func _ready():
	print("ENTREI NO GAME")
	print("level_container:", level_container)
	print("tem LevelContainer?", has_node("LevelContainer"))

	if level_container != null:
		LevelManager.load_level(
			Progress.selected_level,
			level_container
		)
	else:
		print("LEVEL CONTAINER ESTÁ NULL")
func bird_used():
	birds_left -= 1
	print("Pássaros restantes:", birds_left)

	check_game_over()

func pig_dead():
	pigs_left -= 1
	print("Porcos restantes:", pigs_left)

	if pigs_left <= 0:
		victory()

func victory():
	print("VITÓRIA!")

func defeat():
	print("DERROTA!")

func check_game_over():
	if birds_left <= 0 and pigs_left > 0:
		defeat()
