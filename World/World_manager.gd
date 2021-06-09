extends Node2D

var player_pre = preload("res://Player/Player.tscn")

export var player_start_pos : Vector2

export (bool) var default_pos = true

func _ready():
	
	if default_pos:
		var screen_rect = get_viewport().size
		player_start_pos = Vector2(screen_rect.x/2, screen_rect.y - 60)
		init_player_pos()
		
	

func init_player_pos():
	var player = player_pre.instance()
	player.position = player_start_pos
	add_child(player)
	print(player.position)
