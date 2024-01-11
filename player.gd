extends CharacterBody2D

const MAX_SPEED = 150.0
const ACCEL = 1500.0
const FRICTION = 1200.0
var Health = 5
var Invulnerable = false
var is_sprinting = false
var can_sprint = true
var score

@onready var axis = Vector2.ZERO

func _ready(): 
	score = 0
	$AnimatedSprite2D.play("idle")
	position.x = 500
	position.y = 300

func _physics_process(delta):
	if Health > 0:
		move(delta)
	else:
		$AnimatedSprite2D.set_self_modulate('#ffffff')
		$StaminaBerry.visible = false
		$CollisionShape2D.disabled = true
		$AnimatedSprite2D.play("dead")
		$StaminaCharge.stop()
		
	if Invulnerable:
		$AnimatedSprite2D.set_self_modulate('#e88047')
	elif is_sprinting:
		$AnimatedSprite2D.set_self_modulate(Color(5,5,5,1))
	else:
		$AnimatedSprite2D.set_self_modulate('#ffffff')
		
	if Input.is_action_just_pressed("sprint"):
		if can_sprint == true:
			$StaminaBerry.visible = false
			is_sprinting = true
			$SprintTimer.start()
			$StaminaCharge.start()
			can_sprint = false
		
	
func get_input_axis():
	axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	if axis.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif axis.x > 0:
		$AnimatedSprite2D.flip_h = false
	axis.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return axis.normalized()

func move(delta):
	axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		apply_friction(FRICTION * delta)
		$AnimatedSprite2D.play("idle")
		
	else:
		apply_movement(axis * ACCEL * delta)
		$AnimatedSprite2D.play("run")
	
	move_and_slide()
	
func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:	
		velocity = Vector2.ZERO
	
func apply_movement(accel):
	velocity += accel
	if is_sprinting:
		velocity = velocity.limit_length(1.7 * MAX_SPEED)
	else:
		velocity = velocity.limit_length(MAX_SPEED)
	
func take_damage():
	if Invulnerable != true:
		Health -= 1
		$DamageSound.play()
		Invulnerable = true
		print(Health)
		$InvinTimer.start()
		
func increase_score():
	score += 100

func _on_invin_timer_timeout():
	Invulnerable = false

func _on_sprint_timer_timeout():
	is_sprinting = false

func _on_stamina_charge_timeout():
	$StaminaBerry.visible = true
	can_sprint = true
