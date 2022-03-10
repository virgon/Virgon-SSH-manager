
REM Panel Virgon

    $CONSOLE:ONLY
        declare sub Path_read(idfile$,path$)

Panel_menu:
    CLS
    PRINT "Master panel controll of server VIRGON (R)"
    PRINT "Created by Maciej Mirota"
    PRINT "------------------------------------------------------------------------"
    PRINT "|1-------> Network configuration                                      |"
    PRINT "|2-------> Servers configuration                                      |"
    PRINT "|3-------> Add software                                               |"
    PRINT "|4-------> Configuration add software                                 |"
    PRINT "|5-------> Router functions                                           |"
    PRINT "|6-------> Configure path to file or directory                        |"
    PRINT "|0-------> Exit to shell                                              |"
    PRINT "------------------------------------------------------------------------"
        INPUT "Select function and press ENTER", m1$
                IF m1$ = "1" THEN GOTO Net_menu
                IF m1$ = "2" THEN GOTO Serv_menu
                IF m1$ = "3" THEN GOTO Add_menu
                IF m1$ = "4" THEN GOTO Conf_add_menu
                IF m1$ = "5" THEN GOTO Router_menu
                IF m1$ = "6" THEN GOTO Config_path
                IF m1$ = "0" THEN END
            GOTO Panel_menu
Net_menu:
    CLS
    PRINT "-----------------------------------------------------------------------"
    PRINT "|                 Network configuration menu                          |"
    PRINT "-----------------------------------------------------------------------"
    PRINT "|1----> Add/Remove card to system                                     |"
    PRINT "|2----> Configuration network card                                    |"
    PRINT "|3----> Configuration hamachi VPN network card                        |"
    PRINT "|4----> Configuration DNS adress                                      |"
    PRINT "|5----> MAC adress setings for network card                           |"
    PRINT "|6----> Show aktual configuration                                     |"
    PRINT "|0----> Back to master menu                                           |"
    PRINT "|---------------------------------------------------------------------|"
        INPUT "Select function and press ENTER", m2$
                IF m2$ = "1" THEN GOTO Add_card
                IF m2$ = "2" THEN GOTO Conf_card
                IF m2$ = "3" THEN GOTO Hamachi_vpn
                IF m2$ = "4" THEN GOTO Conf_DNS
                IF m2$ = "5" THEN GOTO Conf_MAC
                IF m2$ = "6" THEN GOTO Actual_config
                IF m2$ = "0" THEN GOTO Panel_menu
                    GOTO Net_menu

                Add_card:
                    CLS
                    PRINT "-----------------------------------------------------------------------------"
                    PRINT "|                Add/Remove network interfaces to system                    |"
                    PRINT "-----------------------------------------------------------------------------"
                    PRINT "|1---->Add new network card                                                 |"
                    PRINT "|2---->Remove network card                                                  |"
                    PRINT "|0---->Back to Network Menu                                                 |"
                    PRINT "-----------------------------------------------------------------------------"
                        INPUT "Select functionand press ENTER", m21$
                                IF m21$ = "1" THEN GOTO Add_card_sys
                                IF m21$ = "2" THEN GOTO Remove_card_sys
                                IF m21$ = "0" THEN GOTO Net_menu
                    GOTO Add_card

                    Add_card_sys:
                            CLS
                            PRINT "--------------------------------------------------------"
                            PRINT "|Enter card name (mynet, WAN, LAN, etc):               |"
                            PRINT "--------------------------------------------------------"
                                INPUT ">", card_name$
                            PRINT "--------------------------------------------------------"
                            PRINT "|Enter card system id   (eth0,wlan0,enp1s0, etc):      |"
                            PRINT "--------------------------------------------------------"
                                INPUT ">", card_sys_id$
                    
                        Add_process_read:
                                    idfile$ = "card_data"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR INPUT AS #1
                                    ON ERROR GOTO Add_process_first_save
                                    idfile$ = "card_data_tmp"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR OUTPUT AS #2
                                    
                                        Add_read_data_card:
                                            INPUT #1, card_name$, card_sys_id$
                                            IF EOF(1) THEN GOTO Add_process_save
                                            PRINT #2, card_name$, card_sys_id$
                                                GOTO Add_read_data_card
                               Add_process_save:
                                    CLOSE #1
                                    CLOSE #2
                                    idfile$ = "card_data_tmp"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR OUTPUT AS #1
                                    idfile$ = "card_file"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR INPUT AS #2
                                    
                                        Add_save_data_card:
                                            INPUT #1, card_name$, card_sys_id$
                                            IF EOF(1) THEN GOTO Add_process_end
                                            PRINT #2, card_name$, card_sys_id$
                                                GOTO Add_save_data_card
                                                
                                Add_process_first_save:
                                    CLOSE #1
                                    CLOSE #2
                                    idfile$ = "card_data"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR OUTPUT AS #1
                                    PRINT #1, card_name$, card_sys_id$
                                
                                Add_process_end:
                                    CLS
                                    PRINT "-------------------------------------------"
                                    PRINT "|Save data on system is successful        |"
                                    PRINT "-------------------------------------------"
                                    CLOSE #1
                                    CLOSE #2
                                    idfile$ = "card_data_tmp"
                                    CALL Path_read(idfile$, path$)
                                    KILL path$
                                    SLEEP
                                        GOTO Add_card


                            Remove_card_sys:
                                CLS
                                PRINT "----------------------------------------------"
                                PRINT "|Enter name card to remove                   |"
                                PRINT "----------------------------------------------"
                                INPUT ">", name_remove_card$
                                PRINT "----------------------------------------------"
                                PRINT "|Enter system id card to remove              |"
                                PRINT "----------------------------------------------"
                                INPUT ">", id_remove_card$
                                COLOR 7
                                PRINT "-----------------------------------------------"
                                PRINT "|Are you sure to remove this card from system |"
                                PRINT "|               (yes/no)                      |"
                                PRINT "-----------------------------------------------"
                                INPUT ">", remove_card_decision$
                
                                Remove_card_decision:
                                    IF remove_card_decision$ = "no" OR remove_card_decision$ = "n" THEN GOTO Menu1
                                    IF remove_card_decision$ = "yes" OR remove_card_decision$ = "y" THEN GOTO Remove_card
                                    IF remove_card_decision$ <> "no" OR remove_card_decision$ <> "yes" THEN GOTO Menu1
                                    IF remove_card_decision$ <> "n" OR remove_card_decision$ <> "y" THEN GOTO Menu1
                                        GOTO Remove_card_decision
                            
                    Remove_card:
                        CLS
                        COLOR 7
                        PRINT "----------------------------------------------------"
                        PRINT "|Network card removed from system                  |"
                        PRINT "----------------------------------------------------"
                    
                        Removed_card_read:
                            idfile$ = "card_data"
                            CALL Path_read(idfile$, path$)
                            OPEN path$ FOR INPUT AS #1
                            idfile$ = "card_data_tmp"
                            CALL Path_read(idfile$, path$)
                            OPEN path$ FOR OUTPUT AS #2
                            
                                Remove_procedure_read:
                                    INPUT #1, card_name$, card_sys_id$
                                    IF EOF(1) THEN GOTO Remove_save_data_file
                                    IF card_name$ = name_remove_card$ AND card_sys_id$ = id_remove_card$ THEN GOTO Remove_procedure_read
                                    IF card_name$ <> name_remove_card$ AND card_sys_id$ = card_sys_id$ THEN GOTO Remove_card_save_tmp
                                    IF card_name$ = name_remove_card$ AND card_sys_id$ <> card_sys_id$ THEN GOTO Remove_card_save_tmp
                                    IF card_name$ <> name_remove_card$ AND card_sys_id$ <> card_sys_id$ THEN GOTO Remove_card_save_tmp
                                        GOTO Remove_procedure_read
                                        
                                Remove_card_save_tmp:
                                    PRINT #2, card_name$, card_sys_id$
                                        GOTO Remove_procedure_read
                                        
                                Remove_save_data_file:
                                    CLOSE #1
                                    CLOSE #2
                                    idfile$ = "card_data"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR OUTPUT AS #1
                                    idfile$ = "card_data_tmp"
                                    CALL Path_read(idfile$, path$)
                                    OPEN path$ FOR INPUT AS #2
                                    
                                    Remove_procedure_save:
                                        INPUT #2, card_name$, card_sys_id$
                                        IF EOF(2) THEN GOTO Remove_card_complite
                                        PRINT #1, card_name$, card_sys_id$
                                            GOTO Remove_procedure_save
                                            
                                Remove_card_complite:
                                      CLS
                                    PRINT "------------------------------------------------------"
                                    PRINT "|Remove data complete                                 "
                                    PRINT "------------------------------------------------------"
                                    PRINT "|Press any key to continue                           |"
                                    PRINT "------------------------------------------------------"
                                    CLOSE #1
                                    CLOSE #2
                                    idfile$ = "card_data_tmp"
                                    CALL Path_read(idfile$, path$)
                                    KILL path$
                                    SLEEP
                                        GOTO Net_menu_list


                Conf_card:
                    CLS
                    PRINT "----------------------------------------------------------------------------"
                    PRINT "|1----->Configuration type of connection (static IP, DHCP ip)              |"
            	    PRINT "|2----->Configuratio IP adress for network card                            |"
                    PRINT "|3----->Configuration network mask for network card                        |"
                    PRINT "|4----->Configuration gatway for network card                              |"
            	    PRINT "|5----->Actual configuration card                                          |"
                    PRINT "|0----->Back to Network Menu                                               |"
                    PRINT "----------------------------------------------------------------------------"
                        INPUT ">", m22$
                            IF m22$ = "1" THEN GOTO Net_conf_conn
                            IF m22$ = "2" THEN GOTO Net_conf_ip
                            IF m22$ = "3" THEN GOTO Net_conf_mask
                            IF m22$ = "4" THEN GOTO Net_conf_gateway
                            IF m22$ = "5" THEN GOTO Net_conf_actual
                            IF m22$ = "0" THEN GOTO Net_menu
                                GOTO Conf_card
                            
                        Net_conf_conn:
                            CLS
                            PRINT "-----------------------------------------------------------------------"
                            PRINT "|                Network card configuration                           |"
                            PRINT "-----------------------------------------------------------------------"
                            PRINT "|1------> Select card to settings                                     |"
                            PRINT "|2------> Config connections                                          |"
                            PRINT "|0------> Back to Network Menu                                        |"
                            PRINT "-----------------------------------------------------------------------"
                                INPUT ">", m221$
                                    IF m221$ = "1" THEN GOTO Net_conf_select_card
                                    IF m221$ = "2" THEN GOTO Net_conf_seting_connect
                                    IF m221$ = "0" THEN GOTO Conf_card
                                        GOTO Net_conf_conn

                                        Net_conf_select_card:
                                            cls
                                            print "----------------------------------------------------------"
                                            print "|Select a network card to settings                       |"
                                            print "----------------------------------------------------------"
                                            print "|        Alias           |        Card Id sys            |"
                                            print "----------------------------------------------------------"
                                                idfile$ ="card_data"
                                                call Path_read (idfile$,path$)
                                                open path$ for input as #1
                                                posx1 = 3
                                                posx2 = 30
                                                
                                                    Net_conf_list_card:
                                                        input #1, card_name$$, card_sys_id$
                                                        if EOF(1) then goto End_list
                                                         print "|                        |                               |"
                                                            Net_list_on_screen:
                                                                locate 6,posx1 : print card_name$
                                                                locate 30,posx2 : print card_sys_id$
                                                                posx1 = posx1+1
                                                                posx2 = posx2+1
                                                            goto Net_conf_list_card

                                                                End_list:
                                                                    print "----------------------------------------------------------"
                                                                        goto Net_conf_card_select

                                                            Net_conf_card_select:
                                                                input ">",card_name_select$
                                                                    goto Net_conf_conn
                                        
                                        Net_conf_setting_connect:
                                            if card_name_select$ = "" then goto Net_conf_empty_select                                        
                                            cls
                                            print "----------------------------------------------------------"
                                            print "|Select a network connecting settings                    |"
                                            print "----------------------------------------------------------"
                                            print "|You configure connect to card :                         |"
                                            print "----------------------------------------------------------"
                                            print "|1----> Configure to DHCP connect                        |"
                                            print "|2----> Configure to static IP connect                   |"
                                            print "|0----> Back to Network connection configuration         |"
                                            print "----------------------------------------------------------"
                                            locate 4,34 : print card_name_select$    
                                                input ">", m222$
                                                    if m222$ = "1" then goto Net_conf_conn_DHCP
                                                    if m222$ = "2" then goto Net_conf_conn_static_IP
                                                    if m222$ = "0" then goto Net_conf_conn
                                                        goto Net_conf_setting_connect

                                                Net_conf_conn_DHCP:
                                                    idfile$ = "net_connect_setings"
                                                    call Readpath (idfile$, path$)
                                                    open path$ for output as #2
                                                        connecting_setup$ = "dhcpd"
                                                        print #2 ,card_name_select$, connecting_setup$
                                                        close #2
                                                            goto Conf_card

                                                Net_conf_conn_static_IP:
                                                        Net_conf_add_path:
                                                            DODAWANIE PATH DO PLIKU CONFIGURACYJENGO DOPISAC JAKO SUBPROC
                                                    idfile$ = "net_connect_setings"
                                                    call Readpath (idfile$, path$)
                                                    open path$ for output as #2
                                                        connecting_setup$ = "static_ip"
                                                        print #2 ,card_name_select$, connecting_setup$
                                                        close #2
                                                    idfile$ = card_name_select$
                                                    call Readpath (idfile$, path$)
                                                    open path$ for output as #3
                                                        ip_addr$ ="0.0.0.0"
                                                        gateway_ip$ ="0.0.0.0"
                                                        net_mask$ = "0.0.0.0"
                                                        dns1$ = "0.0.0.0"
                                                        dns2$ = "0.0.0.0"
                                                        print #3, ip_addr$, gateway_ip$, net_mask$, dns1$, dns2$
                                                        close #3
                                                            goto Conf_card







                                        Net_conf_setting_connect:
                                                                            
                        Net_conf_actual:
                            CLS
                            PRINT "-------------------------------------------------------------------------------------"
                            PRINT "|Actual config card                                                                 |"
                            PRINT "------------------------------------------------------------------------------------|"
                            PRINT "|  Card name :                                                                      |"
                            PRINT "|  Card alias:                                                                      |"
                            PRINT "|  Card system ID:                                                                  |"
                            PRINT "|  Type of connect:                                                                 |"
                            PRINT "|  Actual IP adress:                                                                |"
                            PRINT "|  Actual network mask                                                              |"
                            PRINT "|  Aktual gateway:                                                                  |"
                            PRINT "|  Aktual DNS master:                                                               |"
                            PRINT "|  Aktual DNS slave:                                                                |"
                            PRINT "|  Aktual MAC adress:                                                               |"
                            PRINT "-------------------------------------------------------------------------------------"
                            PRINT "|     Enter name of card or alias or system ID card and press ENTER                 |"
                            PRINT "-------------------------------------------------------------------------------------"
                            INPUT ">", net_conf_aktual$
                                                             
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
    CLOSE #5
    OPEN "pathdata.pth" FOR INPUT AS #5

    Patch_read_from_file:
        INPUT #5, idfiler$, path$
        IF idfile$ = idfiler$ THEN GOTO PR_set
        IF EOF(5) THEN GOTO Error_file
        IF idfile$ <> idfiler$ THEN GOTO Patch_read_from_file

    Error_file:
        CLS
        PRINT "read file path data is end"
        PRINT "not find data file of signature", idfile$
        GOTO end_sub_1

    PR_set:
        LET pather$ = path$
        CLOSE #5
            GOTO end_sub_1
    
end_sub_1:
END SUB
