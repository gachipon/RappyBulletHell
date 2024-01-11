extends Area2D

var direction = Vector2(0,0)
var projectile_speed = 300
var incremental = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(direction.normalized() * projectile_speed * delta)
	incremental += 0.02
	scale = Vector2(incremental, incremental)

func _on_fizzle_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if "Player" in body.name:
		$CollisionShape2D.set_deferred("disabled", true)
		body.take_damage()
