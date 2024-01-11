extends AnimatedSprite2D

@export var projectile: PackedScene
var can_shoot = true
var walkSpeed = 50
var ammo = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 40
	position.y = 165


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_shoot:
		$ShotTimer.start()
		can_shoot = false
	position.y += walkSpeed * delta
	
func fire():
	if ammo > 0:
		var bullet1 = projectile.instantiate()
		owner.add_child(bullet1)
		bullet1.direction = $bullet01.global_position - global_position
		bullet1.transform = get_node("bullet01").global_transform
		var bullet2 = projectile.instantiate()
		owner.add_child(bullet2)
		bullet2.direction = $bullet02.global_position - global_position
		bullet2.transform = get_node("bullet02").global_transform
		var bullet3 = projectile.instantiate()
		owner.add_child(bullet3)
		bullet3.direction = $bullet03.global_position - global_position
		bullet3.transform = get_node("bullet03").global_transform
		var bullet4 = projectile.instantiate()
		owner.add_child(bullet4)
		bullet4.direction = $bullet04.global_position - global_position
		bullet4.transform = get_node("bullet04").global_transform
		var bullet5 = projectile.instantiate()
		owner.add_child(bullet5)
		bullet5.direction = $bullet05.global_position - global_position
		bullet5.transform = get_node("bullet05").global_transform


func _on_shot_timer_timeout():
	fire()
	ammo -= 1
	can_shoot = true


func _on_move_timer_timeout():
	walkSpeed = walkSpeed * -1


func _on_burst_timer_timeout():
	ammo = 3
