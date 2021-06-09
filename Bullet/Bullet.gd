extends Area2D

var bullet_dir : Vector2

export (int) var norm_bullet_speed = 6

var bullet_speed = norm_bullet_speed

export var bullet_life = 2

export var bullet_dist = 1000

onready var bullet_timer = $Timer

var dmg = 1


func _ready():
	bullet_timer.wait_time = bullet_life
	bullet_timer.start()

	
	
func _physics_process(delta):
	self.position += (bullet_dir * bullet_speed)
	if position.y < -bullet_dist:
		on_timeout()
	
func set_bullet_dir(_bullet_dir):
	bullet_dir = _bullet_dir

func set_bullet_speed(_bullet_speed):
	bullet_speed = _bullet_speed

func set_bullet_life(_bullet_life):
	bullet_life = _bullet_life
	bullet_timer.wait_time = bullet_life

func set_bullet_dist(_bullet_dist):
	bullet_dist = _bullet_dist

func on_timeout():
	queue_free()

func get_bullet_dmg():
	return dmg
