menu(){
  	printf "\n\n"
	echo "-----Tmux Editor Launchpad-----"
	echo "(l)ist Projects"
	echo "(o)pen Project"
	echo "(c)reate Project  (r)ename Project  (d)elete Project" 
	echo -n "(q)uit  : "
	read ans
	if [[ $ans == "l" ]]; then 
	  print_sessions
	elif [[ $ans == "o" ]]; then
	  attach_session
	elif [[ $ans == "c" ]]; then
	  create_project
	elif [[ $ans == "r" ]]; then 
	  rename_project
	elif [[ $ans == "d" ]]; then 
	  delete_project
	fi
}
attach_session(){
	echo -n "Open Project: "
   	read prj 
	$(tmux a -t ${prj})
	menu
}
print_sessions() {
	echo "Your projects: "
  	tmux ls	
	menu
}
create_project(){
	echo -n "Name of new project: "
	read ans 
	$(tmux new -s ${ans})
	menu 
}
rename_project(){
  	echo -n "Project to rename: "
	read prj 
	echo -n "New name: "
	read name 
	$(tmux rename-session -t ${prj} ${name})
	echo "${prj} renamed ${name}" 
	menu 
}
delete_project(){
	echo -n "Project to delete: "
	read todel 
	$(tmux kill-session -t ${todel})
	echo "${todel} deleted." 
	menu
}
menu 
