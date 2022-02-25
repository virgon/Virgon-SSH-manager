
REM Panel Virgon

    $CONSOLE:ONLY
        declare sub Path_read(idfile$,path$)

Panel_menu:

    CLS
    LOCATE 1, 1: PRINT "Master panel controll of server VIRGON (R)"
    LOCATE 2, 1: PRINT "Created by Maciej Mirota"
    PRINT "------------------------------------------------------------------------"
    PRINT "|1-------> Network configuration                                      |"
    PRINT "|2-------> Servers configuration                                      |"
    PRINT "|3-------> Add software                                               |"
    PRINT "|4-------> Configuration add software                                 |"
    PRINT "|5-------> Router functions                                           |"
    PRINT "|6-------> Configure path to file or directory                        |"
    PRINT "|0-------> Exit to shell                                              |"
    PRINT "------------------------------------------------------------------------"

    Menu1:
        INPUT "Select function and press ENTER", m1$

            IF m1$ = "1" THEN GOTO Net_menu
            IF m1$ = "2" THEN GOTO Serv_menu
            IF m1$ = "3" THEN GOTO Add_menu
            IF m1$ = "4" THEN GOTO Conf_add_menu
            IF m1$ = "5" THEN GOTO Router_menu
            IF m1$ = "6" THEN GOTO Config_path
            IF m1$ = "0" THEN END
        GOTO Menu1

Net_menu:

CLS

PRINT "----------------------------------------------------------------------"
PRINT "|F1----> Add card to system                                           |"
PRINT "|F2----> Configuration network card                                   |"
PRINT "|F3----> Configuration hamachi VPN network card                       |"
PRINT "|F4----> Configuration DNS server                                     |"
PRINT "|F5----> MAC adress setings for network card                          |"
PRINT "|6-----> Show aktual configuration                                    |"
PRINT "|F10---> Back to master menu                                          |"
PRINT "|---------------------------------------------_-----------------------|"


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
END

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
   END

Conf_add_menu:
CLS
PRINT "----------------------------------------------------------------------"
PRINT "|1----> Traccar configuration                                        |"
PRINT "|2----> Domoticz configuration                                       |"
PRINT "|3----> Hamachi VPN configuration                                    |"
PRINT "|4----> MotionEye configuration                                      |"
PRINT "|0----> Back to master menu                                          |"
PRINT "----------------------------------------------------------------------"
      END

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
         END
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



