extends "res://character/Character.gd"

func _ready():
	can_move = false
	facing = moves.keys()[randi() % 4]
	yield(get_tree().create_timer(0.5), 'timeout')
	can_move = true
	
func _process(delta):
	_on_Player_moved()

# 턴제 게임을 만들고 싶다면 _process에서 _on_Player_moved 함수를 지우고
# 아래 함수를 Player의 moved 시그널에 연결시킨다.
func _on_Player_moved():
	if can_move:
		if not move(facing) or randi() % 10 > 5:
			facing = moves.keys()[randi() % 4]