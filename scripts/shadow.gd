extends Sprite2D

@onready var shadowArea = $ShadowArea

var object_sprite: Sprite2D
var mouse_hovered: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("shadows")
	
	object_sprite = get_parent().find_child("Sprite2D")

	if object_sprite == null:
		return

	self.texture = object_sprite.texture
	self.offset.y = -object_sprite.texture.get_size().y / 2

	self.scale.x = object_sprite.scale.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_shadow_area_mouse_entered():
	print("asdsad")
	mouse_hovered = true

func _on_shadow_area_mouse_exited():
	mouse_hovered = false
