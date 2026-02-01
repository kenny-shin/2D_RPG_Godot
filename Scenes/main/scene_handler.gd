extends Node

@export var main_menu_packed: PackedScene
@export var game_scene_packed: PackedScene

var main_menu_instance: Control = null
var game_scene_instance: Node2D = null

func _ready() -> void:
	load_main_menu("game_start")

func load_main_menu(origin: String) -> void:
	if game_scene_instance:
		game_scene_instance.queue_free()
		game_scene_instance = null

	if main_menu_instance:
		main_menu_instance.queue_free()
		main_menu_instance = null

	await get_tree().process_frame

	main_menu_instance = main_menu_packed.instantiate() as Control
	main_menu_instance.new_game_pressed.connect(new_game)
	main_menu_instance.settings_pressed.connect(settings_open)
	main_menu_instance.about_pressed.connect(about_open)
	main_menu_instance.exit_pressed.connect(exit_game)
	add_child(main_menu_instance)

func new_game(origin: String) -> void:
	if main_menu_instance:
		main_menu_instance.queue_free()
		main_menu_instance = null

	if game_scene_instance:
		game_scene_instance.queue_free()
		game_scene_instance = null

	await get_tree().process_frame

	game_scene_instance = game_scene_packed.instantiate() as Node2D
	add_child(game_scene_instance)

func settings_open(_origin: String) -> void:
	pass

func about_open(_origin: String) -> void:
	pass

func exit_game(_origin: String) -> void:
	get_tree().quit()
