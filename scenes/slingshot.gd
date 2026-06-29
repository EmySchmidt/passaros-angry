extends Sprite2D

var target:RigidBody2D = null

@onready var right_line = $Right_line
@onready var left_line = $Left_line

func _process(delta):
	if not target == null:
		right_line.hide()
		left_line.hide()
	else:
		right_line.show()
		left_line.show()
		right_line.set_point_position(1,right_line.to_local(target.position)+Vector2(-30,0))
		left_line.set_point_position(1,left_line.to_local(target.position)+Vector2(30,0))
	
