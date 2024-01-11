extends Area2D

const GRAVITY = 1.5
var vertical_speed = randf_range (-2.5,-1)
var horizontal_speed = randf_range(100,300)
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= horizontal_speed * delta
	vertical_speed += GRAVITY * delta
	position.y += vertical_speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if "Player" in body.name:
		$CollisionShape2D.set_deferred("disabled", true)
		body.take_damage()
