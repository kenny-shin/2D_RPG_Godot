extends Control

signal repeat_level(origin: String)
signal main_menu(origin: String)

var victorious: bool

func _ready() -> void:
	if victorious:
		$VB/Result.set_text("Victorious")

func _on_replay_pressed() -> void:
	repeat_level.emit("end_game_screen")
	await get_tree().create_timer(0.1).timeout
	queue_free()

func _on_main_menu_pressed() -> void:
	main_menu.emit("end_game_screen")
	await get_tree().create_timer(0.1).timeout
	queue_free()
	
