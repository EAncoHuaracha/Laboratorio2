extends RigidBody2D


func _on_area_2d_area_entered(area):
	if area.is_in_group("enemigo"):
		area.set_explosion()
		Global.add_puntos(area.puntos)
		queue_free()
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass # Replace with function body.
