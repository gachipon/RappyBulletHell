extends AnimatedSprite2D

@export var projectile: PackedScene
var can_move = true
var can_cast = false
var ammo = 12
var new_player_position

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 512
	position.y = 600
	new_player_position = get_parent().get_node("Player").global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if can_move:
		$MoveTimer.start()
		can_move = false
	if can_cast:
		$SpellTimer.start()
		can_cast = false
		
func _on_move_timer_timeout():
	new_player_position = get_parent().get_node("Player").global_position
	position.x = randf_range(250, 800)
	ammo = 12
	can_move = true
	can_cast = true

func cast_gibarta():
	if ammo > 0:
		var randx = randf_range(-50,50)
		var randy = randf_range(-50,50)
		var gibarta = projectile.instantiate()
		owner.add_child(gibarta)
		gibarta.direction = new_player_position - global_position + Vector2(randx, randy)
		gibarta.global_transform = get_node("leftMarker").global_transform
	

func _on_spell_timer_timeout():
	cast_gibarta()
	ammo -= 1
	can_cast = true
