extends KinematicBody2D

export (float) var normal_speed = 0.2
export (int) var normal_hp = 5

var speed = normal_speed
var hp = normal_hp

var move_dir = Vector2.DOWN



func _physics_process(delta):
	if hp <= 0:
		print("enemy dead")
		queue_free()
	self.position += move_dir * speed

func take_dmg(_amount):
	hp -= _amount
	print("Current hp " + str(hp))
	

func _on_Hurt_box_area_shape_entered(area_id, area, area_shape, local_shape):
	if "Bullet" in area.name:
		var dmg_to_take = area.get_bullet_dmg()
		take_dmg(dmg_to_take)
		print("bullet hit")
		area.queue_free()

func set_enemy_speed(_new_speed : float):
	speed = _new_speed
	print("new speed" + str(speed))

func set_enemy_hp(_new_hp : int):
	hp = _new_hp
	print("new hp" + str(hp))

func set_enemy_dir(_new_dir : Vector2):
	move_dir = _new_dir
	print("new dir" + str(move_dir))
	
