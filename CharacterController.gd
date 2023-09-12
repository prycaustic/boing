extends Node

@onready var character = get_parent()

@export var SPEED = 35.0 
@export var FRICTION = 4.0

var velocity: Vector2

func _physics_process(delta):
	var wish_dir = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		wish_dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		wish_dir.x += 1
		
	move(wish_dir, delta);
	
func move(wish_dir, delta: float):
	velocity -= velocity * FRICTION * delta
	
	velocity += wish_dir * SPEED * delta
	
	character.move_and_collide(velocity, true)
