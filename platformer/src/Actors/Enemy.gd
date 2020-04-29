extends "res://src/Actors/Actor.gd"

export var score := 100

func _ready() -> void:
	_velocity.x = -speed.x
	set_physics_process(false)
	

func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.get_name() != "Player":
		return
	if (body.global_position.y >
	 get_node("StompDetector").global_position.y):
		return
	get_node("CollisionShape2D").disabled = true
	die()
	
func _physics_process(delta) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


func die() -> void:
	PlayerData.score += score
	queue_free()
	
	



