extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal hit
signal unhit
var hxy
export var speed = 3.5


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hxy = get_parent().get_node("hullmyts").position
	var vel =  hxy-position
	vel = vel.normalized()*speed
	move_and_collide(vel)


func _on_Area2D_body_entered(body):
	if body == get_parent().get_node("hullmyts"):
		connect("hit", get_parent().get_node("main/hullmyts"),"hit")
		emit_signal("hit")


func _on_Area2D_body_exited(body):
	if body == get_parent().get_node("hullmyts"):
		emit_signal("unhit")


