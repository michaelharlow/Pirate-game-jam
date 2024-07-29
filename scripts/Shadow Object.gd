extends RigidBody2D

@onready var shadow = $Shadow
@onready var shadow_area = $Shadow/ShadowArea
@onready var sprite_2d = $Sprite2D

var object_sprite: Texture2D

var mouse_hovered : bool = false

func _ready() -> void:
	add_to_group("shadows")

	object_sprite = sprite_2d.texture
	
	#Connecting Area2D Signals
	shadow_area.mouse_entered.connect(_on_shadow_area_mouse_entered)
	shadow_area.mouse_exited.connect(_on_shadow_area_mouse_exited)
	
	#Configure Shadow
	shadow.texture = object_sprite
	shadow.offset.y = object_sprite.get_size().y/2
	
	sprite_to_polygon(shadow_area)


func _physics_process(_delta):
	rotation = 0

func _on_shadow_area_mouse_entered() -> void:
	mouse_hovered = true


func _on_shadow_area_mouse_exited():
	mouse_hovered = false


func sprite_to_polygon(collision_object) -> void:
	
		# Destroy Existing Collision Polygons
	for node in collision_object.find_children("*", "CollisionPolygon2D"):
		node.queue_free()
	
	var image = object_sprite.get_image()
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(image)
	
	var polys = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, image.get_size()), 0.0)
	
	for poly in polys:
		var collision_polygon = CollisionPolygon2D.new()
		collision_polygon.polygon = poly
		collision_object.add_child(collision_polygon)
		collision_polygon.set_owner(get_tree().get_edited_scene_root())
		collision_polygon.position -= $Shadow.texture.get_size() / 2
