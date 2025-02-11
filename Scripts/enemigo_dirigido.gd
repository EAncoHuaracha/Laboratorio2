extends Area2D

@export var velocidad = 500
@export var puntos = 50

@onready var personaje = get_tree().get_nodes_in_group("personaje")

var is_in_screen = false

func set_explosion():
	collision_mask = 0
	collision_layer = 0
	$AnimatedSprite2D.animation = "explosion"
	await $AnimatedSprite2D.animation_finished
	queue_free()

func _physics_process(delta):
	if is_in_screen:
		var posicion_personaje = personaje[0].global_position
		global_position = global_position.move_toward(posicion_personaje,velocidad*delta)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered():
	is_in_screen = true
