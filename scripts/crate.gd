extends RigidBody2D

const UNALIVE_IMPACT = 300
const MEIO_QUEBRADO = 100
@onready var animCrate: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	if animCrate == null:
		print("Erro em:", name)

func _physics_process(delta):
	if not get_colliding_bodies().is_empty():
		for i in get_colliding_bodies():
			var body_velocity: Vector2
			
			if i is RigidBody2D:
				body_velocity = i.linear_velocity
			else:
				body_velocity = Vector2(0, 0)
			
			var velocity_difference = linear_velocity - body_velocity
			
			if velocity_difference.length() > UNALIVE_IMPACT:
				queue_free()
			elif velocity_difference.length() > MEIO_QUEBRADO:
				animCrate.play("cratedano")
