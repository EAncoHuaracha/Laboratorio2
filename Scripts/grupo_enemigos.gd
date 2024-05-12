extends Path2D

@export var speed = 200

@onready var recorridos = get_children()

var is_in_screen = false

func _physics_process(delta):
	if is_in_screen:
		for recorrido in recorridos:
			if recorrido.get_class() == "PathFollow2D":
				recorrido.progress += speed*delta


func _on_visible_on_screen_notifier_2d_screen_entered():
	is_in_screen = true
