extends Control

@onready var label = $LeftSlider/Container/Label
@onready var h_slider = $LeftSlider/HSlider

@onready var botton = $"../Sheet_Scene/sheet_botton/botton"

@onready var fold_side = $"../Sheet_Scene/sheet_fold_side/fold_side"
@onready var fold_side2 = $"../Sheet_Scene/sheet_fold_side2/fold_side"
@onready var fold_side3 = $"../Sheet_Scene/sheet_fold_side3/fold_side"
@onready var fold_side4 = $"../Sheet_Scene/sheet_fold_side4/fold_side"

@onready var side_cutout = $"../Sheet_Scene/sheet_side_cutout/side_cutout"
@onready var side_cutout2 = $"../Sheet_Scene/sheet_side_cutout2/side_cutout"
@onready var side_cutout3 = $"../Sheet_Scene/sheet_side_cutout3/side_cutout"
@onready var side_cutout4 = $"../Sheet_Scene/sheet_side_cutout4/side_cutout"


@onready var change_color = $LeftSlider/ChangeColor
@onready var remove_sides = $LeftSlider/RemoveSides

@onready var h_label = $"../Sheet_Scene/h_label"
@onready var h_label_2 = $"../Sheet_Scene/h_label2"

var color_default = true
var sides = true

var side
var scale_factor
var position_offset

func _ready():
	var h = h_slider.value
	side = 10-(2*h)
	scale_factor = side/8
	position_offset = (side/2) + (h/2)


func _on_h_slider_value_changed(value):
	label.text = str(value)
	
	var h = value
	side = 10-(2*h)
	scale_factor = side/8
	position_offset = (side/2) + (h/2)
	
	if sides:
		h_label.position = Vector3(position_offset,0.11,5.3)
		h_label_2.position = Vector3(5.2,0.11,position_offset)
	else:
		h_label.position = Vector3((side/2)-0.3,0.11,position_offset)
		h_label_2.position = Vector3(position_offset,0.11,(side/2)-0.3)


func _on_change_color_pressed():
	if color_default:
		color_default = false
		change_color.text = "Voltar cores"
		
		botton.mesh.surface_get_material(0).albedo_color = Color("#88c5fc")
		fold_side.mesh.surface_get_material(0).albedo_color = Color("#9df287")
		side_cutout.mesh.surface_get_material(0).albedo_color = Color("#d87575")
	
	else:
		color_default = true
		change_color.text = "Mudar Cor"
		
		botton.mesh.surface_get_material(0).albedo_color = Color("#ffffff")
		fold_side.mesh.surface_get_material(0).albedo_color = Color("#ffffff")
		side_cutout.mesh.surface_get_material(0).albedo_color = Color("#ffffff")


func _on_remove_sides_pressed():
	if sides:
		remove_sides.text = "Voltar Cantos"
		
		h_label.position = Vector3((side/2)-0.3,0.11,position_offset)
		h_label_2.position = Vector3(position_offset,0.11,(side/2)-0.3)
		
		sides = false
		side_cutout.visible = false
		side_cutout2.visible = false
		side_cutout3.visible = false
		side_cutout4.visible = false
	else:
		remove_sides.text = "Remover Cantos"
		
		h_label.position = Vector3(position_offset,0.11,5.3)
		h_label_2.position = Vector3(5.2,0.11,position_offset)
		
		sides = true
		side_cutout.visible = true
		side_cutout2.visible = true
		side_cutout3.visible = true
		side_cutout4.visible = true


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
