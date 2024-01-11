extends Area2D

var direction = Vector2.RIGHT
var bulletSpeed = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(direction.normalized() * bulletSpeed * delta)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # Replace with function body.


func _on_body_entered(body):
	if "Player" in body.name:
		$CollisionShape2D.set_deferred("disabled", true)
		body.take_damage()
