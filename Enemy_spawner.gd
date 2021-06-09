extends Node2D

export var enemy_path : NodePath

var spawn_timer : Timer

export (float) var norm_spawn_time = 2.0

var spawn_time = norm_spawn_time

var spawn_range_x : float
var spawn_range_y : float

var spawn_range = Vector2(spawn_range_x, spawn_range_y)


func _init_timer():
	spawn_timer = Timer.new()
	spawn_timer = spawn_time.instance()
	spawn_timer.wait_time = spawn_time
	add_child(spawn_timer)
