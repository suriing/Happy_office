#2:: ;견적시 노즐 두께 입력 도우미
inputbox pipeod,Enter Pipe OD
if pipeod=609.6
	pipeodp=660.4
else if pipeod=558.8
	pipeodp=609.6
else if pipeod=508
	pipeodp=558.8
else if pipeod=457.2
	pipeodp=508
else if pipeod=406.4
	pipeodp=457.2
else if pipeod=355.6
	pipeodp=406.4
else if pipeod=323.9
	pipeodp=355.6
else if pipeod=323.8
	pipeodp=355.6
else if pipeod=273
	pipeodp=323.9
else if pipeod=273.1
	pipeodp=323.9
else if pipeod=219.1
	pipeodp=273
else if pipeod=168.3
	pipeodp=219.1
else if pipeod=141.3
	pipeodp=168.3
else if pipeod=114.3
	pipeodp=141.3
else if pipeod=101.6
	pipeodp=114.3
else if pipeod=88.9
	pipeodp=101.6
inputbox pipethk,Enter Pipe Tickness
sleep 500
send {vkBBsc00D}(%pipeodp%-%pipeod%)/2{vk6Bsc04E}%pipethk%{LEFT}%pipeodp%
return

#3:: ;견적시 노즐 길이 입력 도우미
inputbox pipeod,Enter Pipe OD
inputbox nozod,Enter Nozzle OD
inputbox nozthk,Enter Nozzle Tickness
inputbox lctoe,Enter L
nozid:=nozod-2*nozthk
nozlen:=lctoe-sqrt((pipeod/2)**2-(nozid/2)**2)
sleep 500
send {vkBBsc00D}%nozlen%{enter}
return
