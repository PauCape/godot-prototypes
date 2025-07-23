extends Camera3D

const RAY_LENGTH = 1000

@onready var camera_3d: Camera3D = $"."

func _physics_process(delta: float) -> void:
	var space_state = get_world_3d().direct_space_state
	var cam = camera_3d
	var mousepos = get_viewport().get_mouse_position()

	var origin = cam.project_ray_origin(mousepos)
	var end = origin + cam.project_ray_normal(mousepos) * RAY_LENGTH
	var query = PhysicsRayQueryParameters3D.create(origin, end, 2)

	var result = space_state.intersect_ray(query)
	print(result)
