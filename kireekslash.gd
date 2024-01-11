extends AnimatedSprite2D

var direction = Vector2.DOWN
var bulletSpeed = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bulletSpeed *= 1.02
	translate(direction.normalized() * bulletSpeed * delta)
	scale *= 1.01


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # Replace with function body.


func _on_area_2d_body_entered(body):
	if "Player" in body.name:
		$Area2D/CollisionShape2D.set_deferred("disabled", true)
		body.take_damage()
