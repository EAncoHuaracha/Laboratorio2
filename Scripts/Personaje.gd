extends CharacterBody2D

@export var velocidad = 600

var movimiento = Vector2(0,0)
var cooldown = true

@onready var Disparo = preload("res://Scenes/Disparo.tscn")
@onready var HUD = get_tree().get_nodes_in_group("hud")[0]
@onready var playback: AnimationNodeStateMachinePlayback = $AnimationTree.get("parameters/playback")
		
func _ready():
	Global.vidas = 3
	Global.LabelPuntos = HUD.get_node("BarraPuntos/Label")		
func _physics_process(_delta):
	var dirX = Input.get_axis("move_left","move_right")
	var dirY = Input.get_axis("move_up","move_down")
	
	if dirX > 0:
		playback.travel("move_right")
	if dirX < 0:
		playback.travel("move_left")
	if movimiento == Vector2():
		playback.travel("RESET")
		
	
	if Input.is_action_pressed("attack"):
		disparar()
	
		
	velocity.x = dirX * velocidad
	velocity.y = dirY * velocidad
	
	move_and_slide()
	
func disparar():
	if cooldown:
		cooldown = false
		$Timer.start()
		var instancia_disparo = Disparo.instantiate()
		instancia_disparo.global_position = $DisparoPos.global_position
		get_tree().root.add_child(instancia_disparo)
		
func _on_timer_timeout():
	cooldown = true
	pass # Replace with function body.

func take_damage():
	Global.remove_vida()
	var barra_vida = HUD.get_node("BarraVida")
	var vidas = barra_vida.get_children()
	vidas[Global.vidas].visible = false
	$AnimationPlayer.play("take_damage")

func _on_area_2d_area_entered(area):
	if area.is_in_group("enemigo"):
		take_damage()
		area.set_explosion()
	pass # Replace with function body.
