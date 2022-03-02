
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

PRINT "-----------------------------------------------------------------------"
PRINT "|1----> Add card to system                                            |"
PRINT "|2----> Configuration network card                                    |"
PRINT "|3----> Configuration hamachi VPN network card                        |"
PRINT "|4----> Configuration DNS adress                                      |"
PRINT "|5----> MAC adress setings for network card                           |"
PRINT "|6----> Show aktual configuration                                     |"
PRINT "|0----> Back to master menu                                           |"
PRINT "|---------------------------------------------------------------------|"

    Menu2:
        INPUT "Select function and press ENTER", m2$

            IF m2$ = "1" THEN GOTO Add_card
            IF m2$ = "2" THEN GOTO Conf_card
            IF m2$ = "3" THEN GOTO Hamachi_vpn
            IF m2$ = "4" THEN GOTO Conf_DNS
            IF m2$ = "5" THEN GOTO Conf_MAC
            IF m2$ = "6" THEN GOTO Actual_config
            IF m2$ = "0" THEN GOTO Menu1
        GOTO Menu2

                Add_card:
                    CLS
                        Add_menu_list:
                            PRINT "-----------------------------------------------------------------------------"
                            PRINT "|1---->Add new network card                                                 |"
                            PRINT "|2---->Remove network card                                                  |"
                            PRINT "|0---->Back to Network Menu                                                 |"
                            PRINT "-----------------------------------------------------------------------------"
                                Menu21:
                                        INPUT "Select functionand press ENTER", m21$
                                            IF m21$ = "1" THEN GOTO Add_card_sys
                                            IF m21$ = "2" THEN GOTO Remove_card_sys
                                            IF m21$ = "0" THEN GOTO Menu1
                                                    GOTO Menu21

                            Add_card_sys:
                            CLS
                            PRINT "--------------------------------------------------------"
                            PRINT "|Enter card name (mynet, WAN, LAN, etc):               |"
                            PRINT "--------------------------------------------------------"
                                INPUT ">", card_name$
                            PRINT "--------------------------------------------------------"
                            PRINT "|Enter card alias (card0, card1, etc):                 |"
                            PRINT "--------------------------------------------------------"
                                INPUT ">", card_alias$
                            PRINT "--------------------------------------------------------"
                            PRINT "|Enter card system name (eth0,wlan0,enp1s0, etc):      |"
                            PRINT "--------------------------------------------------------"
                                INPUT ">", card_sys_id$
                    
                Add_process_read:
                                    idfile$ = "card_file"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR INPUT AS #1
                                    ON ERROR GOTO Add_process_first_save
                                    idfile$ = "card_file_tmp"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR OUTPUT AS #2
                                    
                                        Add_read_data_card:
                                            INPUT #1, card_name$, card_alias$, card_sys_id$
                                            IF EOF(1) THEN GOTO Add_process_first_save
                                            PRINT #2, card_name$, card_alias$, card_sys_id$
                                                GOTO Add_read_data_card
                               Add_process_save:
                                    CLOSE #1
                                    CLOSE #2
                                    idfile$ = "card_file"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR OUTPUT AS #1
                                    idfile$ = "card_file_tmp"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR INPUT AS #2
                                    
                                        Add_save_data_card:
                                            INPUT #1, card_name$, card_alias$, card_sys_id$
                                            IF EOF(1) THEN GOTO Add_process_end
                                            PRINT #2, card_name$, card_alias$, card_sys_id$
                                                GOTO Add_save_data_card
                                                
                                Add_process_first_save:
                                    idfile$ = "card_file"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR OUTPUT AS #1
                                    PRINT #1, card_name$, card_alias$, card_sys_id$
                                
                                Add_process_end:
                                    CLS
                                    PRINT "-------------------------------------------"
                                    PRINT "|Save data on system is successful        |"
                                    PRINT "-------------------------------------------"
                                    CLOSE #1
                                    CLOSE #2
                                        GOTO Add_menu_list




                            Remove_card_sys:

                Conf_card:
                Hamachi_vpn:
                Conf_DNS:
                Conf_MAC:
                Actual_config:

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



