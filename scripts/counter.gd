extends Label

var coin = 0

func _ready():
	text = String(coin) 


func _on_coin_colected():
	coin = coin + 1
	_ready()
	if coin == 5:
		get_tree().change_scene("res://Asest/win_game.tscn")
