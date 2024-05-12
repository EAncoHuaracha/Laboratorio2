extends Area2D
@export var puntos = 50
func set_explosion():
	collision_mask = 0
	collision_layer = 0
	$AnimatedSprite2D.animation = "explosion"
	await $AnimatedSprite2D.animation_finished
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
