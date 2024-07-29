extends RigidBody2D

@onready var shadow = $Shadow
@onready var shadow_area = $Shadow/ShadowArea
@onready var sprite_2d = $ObjectSprite

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

func _physics_process(_delta):
	rotation = 0

func _on_shadow_area_mouse_entered() -> void:
	mouse_hovered = true


func _on_shadow_area_mouse_exited():
	mouse_hovered = false
