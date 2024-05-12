extends Camera2D

@export var velocidad = 400

func _physics_process(delta):
	position.x += velocidad*delta
