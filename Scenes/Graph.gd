extends Node2D

@export var slider:HSlider

@export var label_holder:Node2D
@export var camera:Camera2D

@export var xline:Line2D
@export var yline:Line2D

@onready var dot = $LineGuide/Dot

@export var number_line_hight = 16.0

@export var point_offset_x:float = 100.0
@export var point_offset_y:float = 5.0

@export var label_offset:int = 5


func _ready() -> void:
	camera.position = Vector2((5*point_offset_x)/2,(-80*point_offset_y)/2)
	slider.connect("value_changed",slider_change)


func _draw() -> void:
	draw_graph(0,5,Colors.BLUE_E)
	draw_axes(0,5,0,80)
	add_numbers_x(0,6,1)
	add_numbers_y(0,81,10)


func draw_graph(from:float,to:float,color:String) -> void:
	for point in range(from*point_offset_x,to*point_offset_x,1):
		var from_coord = Vector2(point,v(float(point)/point_offset_x)*-point_offset_y)
		var to_coord = Vector2(point+1,v((float(point)+1.0)/point_offset_x)*-point_offset_y)
		
		draw_line(from_coord,to_coord,Color(color),0.8,true)


func v(x:float) -> float:
	return x *(10-(2*x))**2


func draw_axes(from_x,to_x,from_y,to_y) -> void:
	draw_line(Vector2(from_x*point_offset_x,0),Vector2(to_x*point_offset_x,0),Color(0,0,0),0.8,true)
	draw_line(Vector2(0,from_y*point_offset_y*-1),Vector2(0,to_y*point_offset_y*-1),Color(0,0,0),0.8,true)


func add_numbers_x(x_min,x_max,skip_x) -> void:
	for x_label in range(x_min,x_max,skip_x):
		draw_line(Vector2(x_label*point_offset_x,-number_line_hight/2),Vector2(x_label*point_offset_x,number_line_hight/2),Color(0,0,0),0.8,true)
		
		var label = Label.new()
		label.text = str(x_label)
		label.set("theme_override_colors/font_color",Color(Colors.BLACK))
		
		label.position = Vector2(x_label*point_offset_x-5,(number_line_hight/2) + label_offset)
		label_holder.add_child(label)


func add_numbers_y(y_min,y_max,skip_y) -> void:
	for y_label in range(y_min,y_max,skip_y):
		draw_line(Vector2(-number_line_hight/2,y_label*-point_offset_y),Vector2(number_line_hight/2,y_label*-point_offset_y),Color(0,0,0),0.8,true)
		if y_label != 0:
			var label = Label.new()
			label.text = str(y_label)
			label.set("theme_override_colors/font_color",Color(Colors.BLACK))
			
			label.position = Vector2(-(number_line_hight/2) - label_offset*3 - 10,y_label*-point_offset_y-12)
			label_holder.add_child(label)


func slider_change(value) -> void:
	dot.position = Vector2(value*point_offset_x,v(value)*-point_offset_y)
	
	xline.set_point_position(0,Vector2(value*point_offset_x,0))
	xline.set_point_position(1,Vector2(value*point_offset_x,v(value)*-point_offset_y))
	
	yline.set_point_position(0,Vector2(0,v(value)*-point_offset_y))
	yline.set_point_position(1,Vector2(value*point_offset_x,v(value)*-point_offset_y))

