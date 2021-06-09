extends KinematicBody2D

onready var bullet = preload("res://Bullet/Bullet.tscn")

onready var aim = $Aim

export (int) var normal_speed = 200
export (float) var normal_shoot_cooldown = 0.5
export var bullet_dir = Vector2.UP

var speed = normal_speed

var velocity : Vector2

var shoot_timer : Timer
var shoot_cooldown = normal_shoot_cooldown
var can_shoot = true

var screen_rect

func _ready():
	init_shoot_timer()
	screen_rect = get_viewport().size

func _process(delta):
	inputs()

func _physics_process(delta):
	movment()
	
func inputs():
	
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		velocity.x += -1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y += -1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	if Input.is_action_pressed("shoot"):
		if can_shoot:
			spawn_bullet()
			shoot_timer.start()
			can_shoot = false
	
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	
func movment():
	
	velocity = velocity.normalized() * speed
	
	velocity = move_and_slide(velocity)
	
	position.x = clamp(position.x,0,screen_rect.x)
	position.y = clamp(position.y,0,screen_rect.y)
	

func init_shoot_timer():
	shoot_timer = Timer.new()
	shoot_timer.wait_time = shoot_cooldown
	shoot_timer.connect("timeout",self,"shoot_reset")
	add_child(shoot_timer)
	
func shoot_reset():
	can_shoot = true
	modulate = Color.white

func spawn_bullet():
	modulate = Color.red
	var inst_bullet = bullet.instance()
	inst_bullet.position = self.position
	inst_bullet.set_bullet_dir(bullet_dir)
	get_tree().get_root().add_child(inst_bullet)
