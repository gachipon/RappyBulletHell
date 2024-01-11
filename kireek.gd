extends AnimatedSprite2D

@export var projectile: PackedScene
var can_slash = true
# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if can_slash:
		$SlashTimer.start()
		can_slash = false
	position.x = get_parent().get_node("Player").position.x
	
func fire():
	var slash = projectile.instantiate()
	owner.add_child(slash)
	slash.transform = get_node("SlashMarker").global_transform


func _on_slash_timer_timeout():
	fire()
	can_slash = true
