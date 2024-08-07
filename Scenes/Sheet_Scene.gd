extends Node3D

@onready var sheet_botton = $sheet_botton

@onready var sheet_fold_side = $sheet_fold_side
@onready var sheet_fold_side_2 = $sheet_fold_side2
@onready var sheet_fold_side_3 = $sheet_fold_side3
@onready var sheet_fold_side_4 = $sheet_fold_side4

@onready var sheet_side_cutout = $sheet_side_cutout
@onready var sheet_side_cutout_2 = $sheet_side_cutout2
@onready var sheet_side_cutout_3 = $sheet_side_cutout3
@onready var sheet_side_cutout_4 = $sheet_side_cutout4

@onready var camera_3d = $camera_target/Camera3D
@onready var camera_target = $camera_target

@onready var h_label = $h_label
@onready var h_label_2 = $h_label2




func _ready():
	camera_3d.look_at(camera_target.position)


func _on_h_slider_value_changed(value):
	var h = value
	var side = 10-(2*h)
	var scale_factor = side/8
	
	sheet_botton.scale = Vector3(scale_factor,1,scale_factor)
	
	sheet_fold_side.scale = Vector3(scale_factor,1,h)
	sheet_fold_side_2.scale = Vector3(scale_factor,1,h)
	sheet_fold_side_3.scale = Vector3(scale_factor,1,h)
	sheet_fold_side_4.scale = Vector3(scale_factor,1,h)
	
	var position_offset = (side/2) + (h/2)
	
	sheet_fold_side.position = Vector3(0,0,position_offset)
	sheet_fold_side_2.position = Vector3(0,0,-position_offset)
	sheet_fold_side_3.position = Vector3(position_offset,0,0)
	sheet_fold_side_4.position =Vector3(-position_offset,0,0)
	
	sheet_side_cutout.scale = Vector3(h,1,h)
	sheet_side_cutout_2.scale = Vector3(h,1,h)
	sheet_side_cutout_3.scale = Vector3(h,1,h)
	sheet_side_cutout_4.scale = Vector3(h,1,h)
	
	sheet_side_cutout.position =Vector3(-position_offset,0,-position_offset)
	sheet_side_cutout_2.position =Vector3(-position_offset,0,position_offset)
	sheet_side_cutout_3.position =Vector3(position_offset,0,-position_offset)
	sheet_side_cutout_4.position =Vector3(position_offset,0,position_offset)
	
