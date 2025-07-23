extends Camera3D

const RAY_LENGTH = 1000

var buttonIsPressed = false

@onready var sphere: RigidBody3D = $"../Sphere"

func _physics_process(delta: float) -> void:
	
	if buttonIsPressed:
		var space_state = get_world_3d().direct_space_state
		var cam = self
		var mousepos = get_viewport().get_mouse_position()
		var origin = cam.project_ray_origin(mousepos)
		var end = origin + cam.project_ray_normal(mousepos) * RAY_LENGTH
		var query = PhysicsRayQueryParameters3D.create(origin, end, 1)
		var result = space_state.intersect_ray(query)
		
		

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		buttonIsPressed = true
		if event is InputEventMouseMotion:
			
			pass
	elif event is InputEventMouseButton and event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
		buttonIsPressed = false
