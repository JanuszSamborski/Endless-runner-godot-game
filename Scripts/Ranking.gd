extends Node

onready var Score = preload("res://Scripts/Score.gd")

func read_file():
	var file_read = File.new()
	if(file_read.open("res://ranking.txt", File.READ) != 0):
# warning-ignore:unused_variable
		var text = "error opening file"
	else:
		var text = file_read.get_as_text()
		file_read.close()
		return text


func write_to_file(text):
	var file_write = File.new()
	if(!file_write.file_exists("res://ranking.txt")):
		print("no file")
	else:
		file_write.open("res://ranking.txt", File.READ_WRITE)
		file_write.seek_end()
		file_write.store_line(text+"\r")
		file_write.close()
		
func set_date():
	var time = OS.get_datetime()
	var day = time["day"]  
	if str(day).length()==1:
		day="0" + str(day)
			 
	var month= time["month"]
	
	if str(month).length()==1 :
		month="0" + str(month)
				  
	var year= time["year"]             
	var hour= time["hour"] 
	
	if str(hour).length()==1:
		hour="0" + str(hour)
			 
	var minute= time["minute"] 
	 
	if str(minute).length()==1:
		minute="0" + str(minute)
	 
	var second= time["second"] 
	
	if str(second).length()==1:
		second="0" + str(second)
	  
	return str(day)+"."+str(month)+"."+str(year)+ " "+str(hour)+":"+str(minute)+":"+str(second)
	
func initialize_list_of_scores():
	var text = str(read_file())
	var list = text.rsplit("\n")
	
	var list_of_scores = []
	
	for i in range(0, list.size()):
		var tmp=list[i].rsplit(" ")
		if tmp.size() ==3:
			var newScore = Score.new()
			newScore.score = tmp[0]
			newScore.date = tmp[1]
			newScore.hour = tmp[2]
			list_of_scores.append(newScore)
	return list_of_scores

		
func sort_list_of_scores(scores):
	var n = scores.size()
	
	for i in range(n-1): 
		for j in range(0, n-i-1): 
			if int(scores[j].score) > int(scores[j+1].score): 
				var tmp = scores[j]
				scores[j] = scores[j+1]
				scores[j+1] = tmp		
	for i in range(n):
		if i <= n-2 && scores[i].score==scores[i+1].score:
			scores.remove(i)
			n = scores.size()
	return scores
	
