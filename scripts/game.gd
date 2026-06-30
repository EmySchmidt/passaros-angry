extends Node2D
@onready var level_container: Node2D = $LevelContainer
@onready var label: Label = $HUD/Label


var birds_left = 4
var pigs_left = 0

func _ready():
	update_iu()
	
	#print("ENTREI NO GAME")
	#print("level_container:", level_container)
	#print("tem LevelContainer?", has_node("LevelContainer"))

	if level_container != null:
		var level = LevelManager.load_level(
			Progress.selected_level,
			level_container
		)
		if level == null:
			return
			
		# Espera a fase entrar na árvore
		await get_tree().process_frame
		
		var pigs_node = level.get_node_or_null("pigs")
		
		if pigs_node == null:
			return
		
		
		
		# Conta os porcos pelo nó Pigs
		pigs_left = pigs_node.get_child_count()
		
		print("Porcos na fase:", pigs_left)

	else:
		print("LEVEL CONTAINER ESTÁ NULL")


func bird_used():
	birds_left -= 1
	print("Pássaros restantes:", birds_left)

	check_game_over()


func pig_dead():
	pigs_left -= 1
	update_iu()
	print("Porcos restantes:", pigs_left)
	
	if pigs_left <= 0:
		victory()


func victory():
	print("VITÓRIA!")
	
	# Próxima fase
	Progress.selected_level += 1
	get_tree().reload_current_scene()


func defeat():
	print("DERROTA!")


func check_game_over():
	if birds_left <= 0 and pigs_left > 0:
		defeat()

func update_iu():
	if label != null:
		label.text = "Pássaros restantes:" + str(birds_left)
