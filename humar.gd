extends AnimatedSprite2D

@export var projectile: PackedScene
var can_shoot = true
var speed = 125
# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 970
	position.y = 130

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_shoot:
		$SlicerTimer.start()
		can_shoot = false
		play("attack")
	else:
		play("idle")
	position.y += speed * delta

func shoot():
	var inst = projectile.instantiate()
	owner.add_child(inst)
	inst.transform = get_node("Marker2D").global_transform

func _on_timer_timeout():
	shoot()
	can_shoot = true
	


func _on_move_timer_timeout():
	speed = speed * -1
