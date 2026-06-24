extends RigidBody2D

var mouse_on_bird:bool = false
var bird_held:bool = false
var start_point:Vector2

const RADIUS = 75

@export var sling_point: Marker2D = null

func _ready():
	start_point = sling_point.position
	position = start_point
	

func _on_mouse_entered() -> void:
	mouse_on_bird = true

func _on_mouse_exited() -> void:
	mouse_on_bird = false

func _input(event):
	if Input.is_action_just_pressed("drag") and mouse_on_bird == true:
		bird_held = true
	
	if Input.is_action_just_released("drag") and bird_held == true:
		bird_held = false
		freeze = false
		
		linear_velocity = -(position - start_point) * 10
	
	if bird_held:
		if start_point.distance_to(get_global_mouse_position()) > RADIUS:
			var direction = (get_global_mouse_position() - start_point).normalized()
			var offset = direction * RADIUS
			position  = start_point + offset
		else:
			position = get_global_mouse_position()
