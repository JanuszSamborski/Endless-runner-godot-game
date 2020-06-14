extends Label

var tmp = ""
var cnt = 1
var n = 0
var indent=""

func _ready():
	var list = Ranking.initialize_list_of_scores()
	var scores = Ranking.sort_list_of_scores(list)
	if scores.size() <10:
		n = scores.size()
	else:
		n=10
	for i in range(n-1, 0, -1):
		if str(scores[i].score).length()==1:
			indent="   "
		elif str(scores[i].score).length()==2:
			indent="  "
		
		tmp+=str(cnt)+".         "+ indent+str(scores[i].score)+"            "+str(scores[i].date)+"            "+str(scores[i].hour)+"\n"
		cnt = cnt+1
	
	text = tmp
		

