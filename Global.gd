extends Node

onready var best_score := 0


func _ready():
	var loaded_score = load_best_score()
	if loaded_score > 0:
		best_score = loaded_score
	else:
		save_best_score(0)
	print("User's best score:", best_score)


func save_best_score(score):
	var file = File.new()
	file.open("user:save_game.dat", File.WRITE)
	file.store_var(score)
	file.close()


func load_best_score():
	var file = File.new()
	file.open("user:save_game.dat", File.READ)
	var best_score = file.get_var(false)
	file.close()
	return best_score
