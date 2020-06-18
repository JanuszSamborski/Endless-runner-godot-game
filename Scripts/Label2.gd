extends Label

var tmp = ""
var n = 0
var indent=""

func _ready():
	var list = Ranking.initialize_list_of_scores()
	var scores = Ranking.sort_list_of_scores(list)
	var cnt = scores.size()
	if scores.size() <10:
		n = scores.size()
	else:
		n=9
	for i in range(n):
		if str(scores[i].score).length()==1:
			indent="    "
		elif str(scores[i].score).length()==2:
			indent="   "
		elif str(scores[i].score).length()==3:
			indent="  "
		else:
			indent=""
		
		
		tmp+=str(i+1)+".         "+ indent+str(scores[cnt-1].score)+"            "+str(scores[cnt-1].date)+"            "+str(scores[cnt-1].hour)+"\n"
		cnt=cnt-1
	
	text = tmp
		

