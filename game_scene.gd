extends Node2D


func _ready() -> void:
	var enemy_array: Array = get_tree().get_nodes_in_group("enemies")
	for i in enemy_array:
		i.died.connect(experience_gained)
		
		
func experience_gained(exp_gain: int) -> void:
	if PlayerData.level == LevelData.MAX_LEVEL:
		return
	var new_experience: int = PlayerData.experience + exp_gain
	if new_experience >= LevelData.LEVEL_THRESHHOLDS[PlayerData.level - 1]:
		level_up(new_experience)
	else:
		PlayerData.experience = new_experience
		
		
func level_up(new_experience: int) -> void:
	print("yay, I got more powerful")
	new_experience -= LevelData.LEVEL_THRESHOLDS[PlayerData.level - 1]
	PlayerData.level += 1
	PlayerData.experience = new_experience 
	
