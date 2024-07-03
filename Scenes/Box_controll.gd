extends Node3D

@export var mouse_sensitivity:float = 1

@export var slider:HSlider

@export var box:MeshInstance3D
@export var shadow:Sprite3D

@export var camera:Camera3D
@onready var camera_target = $CameraTarget

@onready var h_line = $h_line
@onready var h_label = $h_label


@export var decal1:Sprite3D
@export var decal2:Sprite3D
@export var decal3:Sprite3D

@export var side_label1:Sprite3D
@export var side_label2:Sprite3D


func _ready():
	camera.look_at(camera_target.position)
	slider.connect("value_changed",slider_change)
	
	change_box(slider.value)


func _process(delta) -> void:
	h_label.position = h_line.position + Vector3(0.2,0.0,-0.2)


func change_box(value):
	var h = value
	var scale_factor = (10-(2*h))/8
	
	
	var tween = get_tree().create_tween()
	tween.set_parallel()
	tween.tween_property(box, "scale", Vector3(scale_factor,h,scale_factor), 0.2).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(box, "position", Vector3(0,h/2,0), 0.2).set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property(shadow, "scale", Vector3(scale_factor *2,scale_factor *2,1), 0.2).set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property(side_label1, "position", Vector3(0.3 + (10-2*h)/2,0.042,0),0.2).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(side_label2, "position", Vector3(0,0.042,0.3 + (10-2*h)/2),0.2).set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property(decal1, "position", Vector3((((10-2*h)/2) - 0.4)*-1,0.129,((10-2*h)/2)+0.003),0.2).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(decal2, "position", Vector3(((10-2*h)/2) +0.003,h-0.2,((10-2*h)/2) - 0.3),0.2).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(decal3, "position", Vector3(((10-2*h)/2) + 0.003,0.189,((10-2*h)/2) - 0.3),0.2).set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property(h_line, "position", Vector3(((10-2*h)/2) + 0.03, h/2 ,-((10-2*h)/2) - 0.03),0.2).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(h_line, "scale", Vector3(1,h,1),0.2).set_trans(Tween.TRANS_QUAD)
	
	
	

func slider_change(value) -> void:
	change_box(value)

