extends Node

@export var main_menu_packed: PackedScene

func _ready() -> void:
	load_main_menu("game_start")
	

func load_main_menu(origin: String) -> void:
	var main_menu: Control = main_menu_packed.instantiate()
	main_menu.new_game_pressed.connect(new_game)
	main_menu.settings_pressed.connect(settings_open)
	main_menu.about_pressed.connect(about_open)
	main_menu.exit_pressed.connect(exit_game)
	add_child(main_menu)
	
func new_game(origin: String) -> void:
	pass
	
func settings_open(_origin: String) -> void:
	pass
	
func about_open(_origin: String) -> void:
	pass
	
func exit_game(_origin: String) -> void:
	get_tree().quit()
	
	
