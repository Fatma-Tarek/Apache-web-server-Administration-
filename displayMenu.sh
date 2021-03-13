### script to view Options menu

#source controller.sh

function displayMenu {

PS3='Please enter your choice: '
options=("Install Apache" "Remove Apache" "Start Apache" "Stop Apache" "Add VirtualHosts" "Remove VirtualHosts" "Authentication" "Non authentication" "Add_New_authenticationVirtualHost"  "Display All Local Host" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Apache")
                #read -p "Enter customer name: " Name
                #read -p "Enter invoice date: "  Date
		install_apache
                echo "Install Apache"
            ;;
         "Remove Apache")
                #read -p "Enter item name: " Name
                #read -p "Enter inv_id: "  id
                #read -p "Enter inv_quantity: " q                                                                                                                 read ->                read -p "Enter inv_unit_price: "  up
		unstall_apache
                echo "Remove Apache"
            ;;
	"Start Apache")
		start_apache
		echo "Apache Started"
		;;
	"Stop Apache")
                stop_apache
		echo "Apache Stop"
        	;;
	"Add VirtualHosts")
                echo "write name"
                read  vname
		checkIfVirtualHostExistOrNot ${vname}
                flagExist=${?}
                if [ $flagExist == 0 ];then
                newlocal ${vname}
               echo "Adminstrate VirtualHosts"
               fi
            ;;
        "Remove VirtualHosts")
	   echo "write name"
           read  vname
	   removelocalhost ${vname}
	   ;;
         "Authentication")
           NewUserYN="no"
           echo "website name:"
           read  vname
	   checkIfVirtualHostEnableOrNo ${vname}
	   flagExist=${?}
	   if [ $flagExist == 1 ];then
		echo "Do you want to add new user(yes/no):"
                read  NewUserYN
		#if [ ${NewUserYN} == "yes" ];then
		#echo "username:"
                #read username
		#fi
		# if [ ${NewUserYN} == "yes" ];then
	        authenticationVirtualHost ${vname} ${NewUserYN}

              #echo "Already Authentication enable"
        #   else
		#echo "Already Authentication enable"
      	    	#echo "Do you want to add new user(yes/no):"
           	# read  NewUserYN
            	#	if [ ${NewUserYN} == "yes" ];then 
	    #echo "username:"
            #read username
		#		echo ${NewUserYN}
            	#	fi
		#		echo ${NewUserYN}
	     #authenticationVirtualHost ${vname} ${username}
                #     echo "Configure Authentication"
	     fi
            ;;
	"Non authentication")
	 echo "website name:"
         read  vname
	 Nonauthentication ${vname}
	 ;;
	"Add_New_authenticationVirtualHost")
         echo "website name you want add user to :"
         read  name
         echo "add user name:"
         read  username
         Add_New_authenticationVirtualHost ${name} ${username}
      		;;
	"Display All Local Host")
	   displayAllLocalHost
	 ;;
         "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}


#function disppplayMenu {
#	echo "Main menu"
#	echo "---------"
#	echo "1-Install Apache"
#	echo "2-Remove Apache"
#	echo "3-Start Apache"
#	echo "4-Stop Apache"
#	echo "5-Add VirtualHosts"
#	echo "6-Remove VirtualHosts"
#	echo "7-Configure Authentication"
#	echo "8-Quit"
#}
#function runMenu {
#	local CH
#	echo "Enter your choice"
#	local FLAG=1
#	while [ ${FLAG} -eq 1 ]
#	do
#	read CH
#	case ${CH} in
#         "1")
#		install_apache
#                echo "Install Apache"
#	    ;;
#	  "2")
#		unstall_apache
#                echo "Remove Apache"
#            ;;
#	  "3")
#		start_apache
#                echo "Apache Started"
#            ;;
#	  "4")
#		stop_apache
#                echo "Apache Stop"
#	   ;;
#	  "5")
##		echo "enter website name :"
#                read NAME
#                addNewLocalHost ${NAME}
#	   }
