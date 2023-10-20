extends Node

var readyTimer
# Called when the node enters the scene tree for the first time.
func _ready():
	readyTimer = get_parent().get_node("ReadyTimer")
	readyTimer.timeout.connect(Callable(self, "unpause_game"))
	child_entered_tree.connect(Callable(self, "on_child_entered_tree"))

func unpause_game():
	get_tree().paused = false
	
func on_child_entered_tree(node):
	var players = node.get_node_or_null("Players")
	var mainPlayers = get_node_or_null("/root/Main/Players")
	
	var boobles = node.get_node_or_null("Boobles")
	var mainBoobles = get_node_or_null("/root/Main/Boobles")
	
	var blocks = node.get_node_or_null("Blocks")
	var mainBlocks = get_node_or_null("/root/Main/Blocks")

#	delete_children(mainPlayers)
	delete_children(mainBoobles)
	delete_children(mainBlocks)
	
	if players: move_children(players, mainPlayers)
	if boobles: move_children(boobles, mainBoobles)
	if blocks: move_children(blocks, mainBlocks)
	
	if "isLevel" in node:
		get_tree().paused = true
		readyTimer.start()

func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

func move_children(nodeFrom, nodeTo):
	print(nodeFrom.get_child_count())
	for n in nodeFrom.get_children():
		nodeFrom.remove_child(n)
		nodeTo.add_child(n)
