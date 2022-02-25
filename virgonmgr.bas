REM Panel Virgon

$CONSOLE:ONLY

Panel_menu:
    CLS
    LOCATE 1, 1: PRINT "Master panel controll of server VIRGON (R)"
    LOCATE 2, 1: PRINT "Created by Maciej Mirota"
    PRINT "------------------------------------------------------------------------"
    PRINT "|F1-------> Network configuration                                      |"
    PRINT "|F2-------> Servers configuration                                      |"
    PRINT "|F3-------> Add software                                               |"
    PRINT "|F4-------> Configuration add software                                 |"
    PRINT "|F5-------> Router functions                                           |"
    PRINT "|F6-------> Configure path to file or directory                        |"
    PRINT "|F10------> Exit to shell                                              |"
    PRINT "------------------------------------------------------------------------"

    Menu_key:
        ON KEY(1) GOSUB Net_menu
        ON KEY(2) GOSUB Serv_menu
        ON KEY(3) GOSUB Add_menu
        ON KEY(4) GOSUB Conf_add_menu
        ON KEY(5) GOSUB Router_menu
        ON KEY(6) GOSUB Config_path
        ON KEY(10) End
            GOTO Menu_key

Net_menu:
CLS
PRINT "----------------------------------------------------------------------"
PRINT "|F1----> Add card to system                                           |"
PRINT "|F2----> Configuration network card                                   |"
PRINT "|F3----> Configuration hamachi VPN network card                       |"
PRINT "|F4----> Configuration DNS server                                     |"
PRINT "|F5----> MAC adress setings for network card                          |"
PRINT "|F10---> Back to master menu                                          |"
PRINT "----------------------------------------------------------------------"
PRINT "|Actual configuration system:                                        |"
PRINT "----------------------------------------------------------------------"
PRINT "|NetCard   name :                MAC :                               |"
PRINT "|IP adress :                                                         |"
PRINT "|Network mask :                   Getway :                           |"
PRINT "|DNS master :                     DNS slave :                        |"
PRINT "|--------------------------------------------------------------------|"
PRINT "|to change aktual config press <>                                    |"
PRINT "----------------------------------------------------------------------"


END

Serv_menu:
CLS
PRINT "----------------------------------------------------------------------"
PRINT "|1----> Configure Apache2 - www server                               |"
PRINT "|2----> Configure SSH server                                         |"
PRINT "|3----> Configure ProFTPd server                                     |"
PRINT "|4----> Configure Samba server                                       |"
PRINT "|5----> Configure MySQL server                                       |"
PRINT "|0----> Back to Master menu                                          |"
PRINT "----------------------------------------------------------------------"

GOTO Panel_menu

Add_menu:
CLS
PRINT "----------------------------------------------------------------------"
PRINT "|1----> Add Traccar - GPS tracking system                            |"
PRINT "|2----> Add Domoticz - Home Automation System                        |"
PRINT "|3----> Add MotionEye - CCTV IP network video recorder               |"
PRINT "|4----> Add Zoneminder - CCTV IP network video recorder              |"
PRINT "|5----> Add Hamachi VPN                                              |"
PRINT "|0----> Back to master menu                                          |"
PRINT "----------------------------------------------------------------------"


Conf_add_menu:
CLS
PRINT "----------------------------------------------------------------------"
PRINT "|1----> Traccar configuration                                        |"
PRINT "|2----> Domoticz configuration                                       |"
PRINT "|3----> Hamachi VPN configuration                                    |"
PRINT "|4----> MotionEye configuration                                      |"
PRINT "|0----> Back to master menu                                          |"
PRINT "----------------------------------------------------------------------"


Router_menu:
CLS
PRINT "----------------------------------------------------------------------"
PRINT "|1----> Configure DHCPd server                                       |"
PRINT "|2----> Configure Network adapters                                   |"
PRINT "|3----> Configure DNS server                                         |"
PRINT "|4----> Configure access by IP/MAC                                   |"
PRINT "|5----> Configure bandwith control                                   |"
PRINT "|6----> Configure port forwarding/virtual servers                    |"
PRINT "|7----> Configure droping/access port to external NetCard/VPN        |"
PRINT "|0----> Back to master menu                                          |"
PRINT "----------------------------------------------------------------------"

Config_path:
END

SUB Path_read (idfile$, path$):
    OPEN "pathdata.pth" FOR INPUT AS #1

    Patch_read_from_file:
        INPUT #1, idfiler$, path$
        IF idfile$ = idfiler$ THEN GOTO PR_set
        IF EOF(1) THEN GOTO Error_file
        IF idfile$ <> idfiler$ THEN GOTO Patch_read_from_file

    Error_file:
        CLS
        PRINT "read file path data is end"
        PRINT "not find data file of signature", idfile$
        GOTO end_sub_1

    PR_set:
    LET pather$ = path$

end_sub_1:
END SUB
