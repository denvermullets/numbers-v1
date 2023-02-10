extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var mouse_inside = false
var dragging = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
  if Input.is_action_just_released("left_click"):
    print("Left mouse button released.")

  if dragging:
    set_position(get_viewport().get_mouse_position())

func _physics_process(delta):
  # Add the gravity.
  if not is_on_floor() && dragging == false:
    velocity.y += gravity * delta

  move_and_slide()

func _on_mouse_entered():
  print("mouse inside")
  mouse_inside = true
#
#func _on_mouse_exited():
#  print("mouse leaves")
#  mouse_inside = false


func _on_input_event(viewport, event, shape_idx):
  if event is InputEventMouseButton:
    if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
      print("Left button was clicked at ", event.position)
      if mouse_inside:
        print('we drag')
        dragging = true
    if event.is_action_released("left_click"):
      print('released the mouse')
      dragging = false
      mouse_inside = false
    if event.pressed == false:
      print('released the mouse')
      dragging = false
      mouse_inside = false
    else:
      print(event)
