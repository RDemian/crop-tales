extends NodeState

## Переменные отображаются в инспекторе, где указывается ссылка на экземпляр (DI)
@export var player: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 50

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	if direction == Vector2.UP:
		animated_sprite_2d.play("walk_back")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_front")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
		
	player.velocity = direction * speed
	player.move_and_slide()

	# ДИАГНОСТИКА
	#print("Direction: ", direction)
	#print("Speed: ", speed)
	#
	#print("Velocity установлена: ", player.velocity)
	#
	#var collision = player.move_and_slide()
	#print("move_and_slide вернул: ", collision)
	#
	#print("Позиция после move_and_slide: ", player.position)
	#print("---")


func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
