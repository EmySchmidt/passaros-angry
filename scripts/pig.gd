extends RigidBody2D

const UNALIVE_IMPACT = 100
@onready var game: Node = null

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
				game = get_tree().current_scene

				if game.has_method("pig_dead"):
					game.pig_dead()

				queue_free()
