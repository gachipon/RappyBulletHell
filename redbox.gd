extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.visible = true
	$CollisionShape2D.disabled = false
	position.x = randf_range(155, 885)
	position.y = randf_range(155, 490)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if "Player" in body.name:
		self.queue_free()

