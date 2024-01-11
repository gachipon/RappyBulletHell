extends Area2D

var direction = Vector2.UP
var fireballspeed = 100
var incremental = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(direction.normalized() * fireballspeed * delta)


func _on_fizzle_timer_timeout():
	queue_free()
