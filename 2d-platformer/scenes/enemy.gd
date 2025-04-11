extends RigidBody2D
@onready var game_manager: Node = %GameManager


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		var y_delta = position.y - body.position.y
		var x_delta = position.x - body.position.x

		if y_delta > 20:
			queue_free()
			body.jump()
		else:
			game_manager.decrease_health()
			if x_delta > 0:
				body.jump_side(500)
			else:
				body.jump_side(-500)
