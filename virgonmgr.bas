
Rem Panel Virgon
$Console:Only
Panel_menu:
Cls
Locate 1, 1: Print "Master panel controll of server VIRGON (R)"
Locate 2, 1: Print "Created by Maciej Mirota"
Print "-----------------------------------------------------------------------"
Print "|1-------> Network configuration                                      |"
Print "|2-------> Servers configuration                                      |"
Print "|3-------> Add software                                               |"
Print "|4-------> Configuration add software                                 |"
Print "|5-------> Router functions                                           |"
print "|6-------> Configure path to file or directory                        |"
Print "-----------------------------------------------------------------------"

Procedure_menu:
keymenu$=InKey$
If keymenu$ = "1" Then GoTo Net_menu
If keymenu$ = "2" Then GoTo Serv_menu
If keymenu$ = "3" Then GoTo Add_menu
If keymenu$ = "4" Then GoTo Conf_add_menu
If keymenu$ = "5" Then GoTo Router_menu
If keymenu$ = "6" Then GoTo Smb_menu
GoTo Procedure_menu

Net_menu:
cls
print "----------------------------------------------------------------------"
print "|1----> Add card to system                                           |"
print "|2----> Configuration network card                                   |"
print "|3----> Configuration hamachi VPN network card                       |"
print "|4----> Configuration DNS server                                     |"
print "|5----> MAC adress setings for network card                          |"
print "|0----> Back to master menu                                          |"
print "----------------------------------------------------------------------"
print "|Actual configuration system:                                        |"
print "----------------------------------------------------------------------"
print "|NetCard   name :                MAC :                               |"
print "|IP adress :                                                         |"
print "|Network mask :                   Getway :                           |"
print "|DNS master :                     DNS slave :                        |"
print "|--------------------------------------------------------------------|"   
print "|to change aktual config press <>                                    |"
print "----------------------------------------------------------------------"


End

Serv_menu:
cls
print "----------------------------------------------------------------------"
print "|1----> Configure Apache2 - www server                               |"
print "|2----> Configure SSH server                                         |"
print "|3----> Configure ProFTPd server                                     |"
print "|4----> Configure Samba server                                       |"
print "|5----> Configure MySQL server                                       |"
print "|0----> Back to Master menu                                          |"
print "----------------------------------------------------------------------"

goto Panel_menu

Add_menu:
cls
print "----------------------------------------------------------------------"
print "|1----> Add Traccar - GPS tracking system                            |"
print "|2----> Add Domoticz - Home Automation System                        |"
print "|3----> Add MotionEye - CCTV IP network video recorder               |"
print "|4----> Add Zoneminder - CCTV IP network video recorder              |"
print "|5----> Add Hamachi VPN                                              |"
print "|0----> Back to master menu                                          |"
print "----------------------------------------------------------------------"


Conf_add_menu:
cls
print "----------------------------------------------------------------------"
print "|1----> Traccar configuration                                        |"
print "|2----> Domoticz configuration                                       |"
print "|3----> Hamachi VPN configuration                                    |"
print "|4----> MotionEye configuration                                      |"
print "|0----> Back to master menu                                          |"
print "----------------------------------------------------------------------"


Router_menu:
cls
print "----------------------------------------------------------------------"
print "|1----> Configure DHCPd server                                       |"
print "|2----> Configure Network adapters                                   |"
print "|3----> Configure DNS server                                         |"
print "|4----> Configure access by IP/MAC                                   |"
print "|5----> Configure bandwith control                                   |"
print "|6----> Configure port forwarding/virtual servers                    |"
print "|7----> Configure droping/access port to external NetCard/VPN        |"        
print "|0----> Back to master menu                                          |"
print "----------------------------------------------------------------------"

File_manager:


