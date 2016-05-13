/*
Author:Sreyas
Version:1.0
*/
#include <a_samp>
#include <YSI\y_ini>
#define DIALOGID 1337
#define wPacks "Weapons/%s.ini"
#define COLOR_YELLOW 0xFFFF00FF
#define COLOR_RED 0xFF0000FF
#define COLOR_GREEN 0x00FF00FF
#define COLOR_BLUE 0x0080FFFF
#define COLOR_LIGHTBLUE 0x00FFFFFF


enum WeaponData
{
    Meele,
    Ammo1,
    Pistol,
    Ammo2,
    Sub,
    Ammo3,
    Rifle,
    Ammo4,
    Assault,
    Ammo5,
    Shotgun,
    Ammo6,
    Heavy,
    Ammo7,
    Thrown,
    Ammo8,
    Other,
    Ammo9,
    }

new wData[MAX_PLAYERS][WeaponData];


stock WeaponPath(playerid)
{
	new string[128],playername[MAX_PLAYER_NAME];
 	GetPlayerName(playerid,playername,sizeof(playername));
  	format(string,sizeof(string),wPacks,playername);
   	return string;
}

public OnPlayerDisconnect(playerid,reason)
{
	GetPlayerWeaponData(playerid, 1, wData[playerid][Meele], wData[playerid][Ammo1]);
 	GetPlayerWeaponData(playerid, 2, wData[playerid][Pistol], wData[playerid][Ammo2]);
  	GetPlayerWeaponData(playerid, 3, wData[playerid][Sub], wData[playerid][Ammo3]);
   	GetPlayerWeaponData(playerid, 4, wData[playerid][Rifle], wData[playerid][Ammo4]);
        GetPlayerWeaponData(playerid, 5, wData[playerid][Assault], wData[playerid][Ammo5]);
        GetPlayerWeaponData(playerid, 6, wData[playerid][Shotgun], wData[playerid][Ammo6]);
        GetPlayerWeaponData(playerid, 7, wData[playerid][Heavy], wData[playerid][Ammo7]);
   	GetPlayerWeaponData(playerid, 8, wData[playerid][Thrown], wData[playerid][Ammo8]);
   	GetPlayerWeaponData(playerid, 9, wData[playerid][Other], wData[playerid][Ammo9]);
   

	

	

	if(fexist(WeaponPath(playerid)))
 	{
  	new INI:file = INI_Open(WeaponPath(playerid));
    	INI_WriteInt(file, "Meele", wData[playerid][Meele]);
     	INI_WriteInt(file, "Pistol", wData[playerid][Pistol]);
      	INI_WriteInt(file, "Sub", wData[playerid][Sub]);
   	INI_WriteInt(file, "Rifle", wData[playerid][Rifle]);
     	INI_WriteInt(file, "Assault", wData[playerid][Assault]);
      	INI_WriteInt(file, "Shotgun", wData[playerid][Shotgun]);
       	INI_WriteInt(file, "Heavy", wData[playerid][Heavy]);
        INI_WriteInt(file, "Thrown", wData[playerid][Thrown]);
        INI_WriteInt(file, "Other", wData[playerid][Other]);
        

	INI_WriteInt(file, "Ammo1", wData[playerid][Ammo1]);
  	INI_WriteInt(file, "Ammo2", wData[playerid][Ammo2]);
  	INI_WriteInt(file, "Ammo3", wData[playerid][Ammo3]);
    	INI_WriteInt(file, "Ammo4", wData[playerid][Ammo4]);
     	INI_WriteInt(file, "Ammo5", wData[playerid][Ammo5]);
      	INI_WriteInt(file, "Ammo6", wData[playerid][Ammo6]);
       	INI_WriteInt(file, "Ammo7", wData[playerid][Ammo7]);
        INI_WriteInt(file, "Ammo8", wData[playerid][Ammo8]);
        INI_WriteInt(file, "Ammo9", wData[playerid][Ammo9]);
      

		

		
	INI_Close(file);
	}
 	return 1;
}


public OnPlayerConnect(playerid)
{
	if(fexist(WeaponPath(playerid)))
 	{
  		INI_ParseFile(WeaponPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
    }
    else
    {
    	new INI:file = INI_Open(WeaponPath(playerid));
   	INI_WriteInt(file, "Meele", wData[playerid][Meele]);
     	INI_WriteInt(file, "Pistol", wData[playerid][Pistol]);
      	INI_WriteInt(file, "Sub", wData[playerid][Sub]);
   	INI_WriteInt(file, "Rifle", wData[playerid][Rifle]);
     	INI_WriteInt(file, "Assault", wData[playerid][Assault]);
      	INI_WriteInt(file, "Shotgun", wData[playerid][Shotgun]);
       	INI_WriteInt(file, "Heavy", wData[playerid][Heavy]);
        INI_WriteInt(file, "Thrown", wData[playerid][Thrown]);
        INI_WriteInt(file, "Other", wData[playerid][Other]);


	INI_WriteInt(file, "Ammo1", wData[playerid][Ammo1]);
  	INI_WriteInt(file, "Ammo2", wData[playerid][Ammo2]);
  	INI_WriteInt(file, "Ammo3", wData[playerid][Ammo3]);
    	INI_WriteInt(file, "Ammo4", wData[playerid][Ammo4]);
     	INI_WriteInt(file, "Ammo5", wData[playerid][Ammo5]);
      	INI_WriteInt(file, "Ammo6", wData[playerid][Ammo6]);
       	INI_WriteInt(file, "Ammo7", wData[playerid][Ammo7]);
        INI_WriteInt(file, "Ammo8", wData[playerid][Ammo8]);
        INI_WriteInt(file, "Ammo9", wData[playerid][Ammo9]);
       

        
	INI_ParseFile(WeaponPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
	INI_Close(file);
	}
	return 1;
}


public OnPlayerSpawn(playerid)
{
        SendClientMessage(playerid,COLOR_BLUE, "This server using  Weapon System v1.0 by Sreyas");
        GivePlayerWeapon(playerid,wData[playerid][Meele],wData[playerid][Ammo1]);
        GivePlayerWeapon(playerid,wData[playerid][Pistol],wData[playerid][Ammo2]);
        GivePlayerWeapon(playerid,wData[playerid][Sub],wData[playerid][Ammo3]);
        GivePlayerWeapon(playerid,wData[playerid][Rifle],wData[playerid][Ammo4]);
        GivePlayerWeapon(playerid,wData[playerid][Assault],wData[playerid][Ammo5]);
        GivePlayerWeapon(playerid,wData[playerid][Shotgun],wData[playerid][Ammo6]);
        GivePlayerWeapon(playerid,wData[playerid][Heavy],wData[playerid][Ammo7]);
        GivePlayerWeapon(playerid,wData[playerid][Thrown],wData[playerid][Ammo8]);
        GivePlayerWeapon(playerid,wData[playerid][Other],wData[playerid][Ammo9]);

	return 1;
}

forward LoadUser_data(playerid, name[], value[]);
public LoadUser_data(playerid, name[], value[])
{
	INI_Int("Meele", wData[playerid][Meele]);
 	INI_Int("Pistol", wData[playerid][Pistol]);
  	INI_Int("Sub", wData[playerid][Sub]);
   	INI_Int("Rifle", wData[playerid][Rifle]);
        INI_Int("Assault", wData[playerid][Assault]);
        INI_Int("Shotgun", wData[playerid][Shotgun]);
    	INI_Int("Heavy", wData[playerid][Heavy]);
    	INI_Int("Thrown", wData[playerid][Thrown]);
    	INI_Int("Other", wData[playerid][Other]);
        

	INI_Int("Ammo1", wData[playerid][Ammo1]);
	INI_Int("Ammo2", wData[playerid][Ammo2]);
	INI_Int("Ammo3", wData[playerid][Ammo3]);
    	INI_Int("Ammo4", wData[playerid][Ammo4]);
    	INI_Int("Ammo5", wData[playerid][Ammo5]);
    	INI_Int("Ammo6", wData[playerid][Ammo6]);
    	INI_Int("Ammo7", wData[playerid][Ammo7]);
    	INI_Int("Ammo8", wData[playerid][Ammo8]);
    	INI_Int("Ammo9", wData[playerid][Ammo9]);
        
	return 1;
}

public OnFilterScriptInit()
{
    print("\n--------------------------------------");
    print(" Unloaded Weapon Spawner with Save system by Sreyas");
    print("-----------------PLS Dont Remove credits-------------------\n");

    return 1;
}

public OnFilterScriptExit()
{
    print("\n--------------------------------------");
    print("Unloaded Weapon Spawner with Save system by Sreyas   ");
    print("-----------------PLS Dont Remove credits ---------------------\n");

    return 1;

}



public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp("/w", cmdtext, true, 10) == 0)
    {
        ShowPlayerDialog(playerid, DIALOGID, DIALOG_STYLE_LIST, "Weapon Lists", "{00FF00}Melees\n{8000FF}Pistols\n{FF8000}Sub-Machine Guns\n{FF00FF}Rifle's\n{FF0080}Assault Rifle\n{DFFF00}Shotgun\n{800040}Heavy Weapon\n{8080FF}Thrown\n{1340F2}Other Melees", "Select", "Cancel");
        return 1;
    }
    return 0;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOGID)
    {
        if(response)
        {
            if(listitem == 0)
            {
                ShowPlayerDialog(playerid, DIALOGID+1, DIALOG_STYLE_LIST, "Weapon Menu", "Knuckle Dusters\nGolf Club\nNite Stick\nKnife\nBat\nShovel\nPool Cue\nKatana\nDildo\nSpray Can\n", "Select", "Cancel");
            }
            if(listitem == 1)
            {
                ShowPlayerDialog(playerid, DIALOGID+2, DIALOG_STYLE_LIST, "Weapon Menu", "9mm\nSilenced 9mm\nDesert Eagle", "Get", "Cancel");
            }
            if(listitem == 2)
            {
                ShowPlayerDialog(playerid, DIALOGID+3, DIALOG_STYLE_LIST, "Weapon Menu", "Uzi\nSMG\nTec9", "Get", "Cancel");
            }
            if(listitem == 3)
            {
                ShowPlayerDialog(playerid, DIALOGID+4, DIALOG_STYLE_LIST, "Weapon Menu", "Country Rifle\nSniper Rifle", "Get", "Cancel");
            }
            if(listitem == 4)
            {
                ShowPlayerDialog(playerid, DIALOGID+5, DIALOG_STYLE_LIST, "Weapon Menu", "AK-47\nM4", "Get", "Cancel");
            }
            if(listitem == 5)
            {
                ShowPlayerDialog(playerid, DIALOGID+6, DIALOG_STYLE_LIST, "Weapon Menu", "Standard Shotgun\nSawnoff Shotgun\nCombat Shotgun", "Get", "Cancel");
            }
            if(listitem == 6)
            {
                ShowPlayerDialog(playerid, DIALOGID+7, DIALOG_STYLE_LIST, "Weapon Menu", "Rocket Laucher\nHeat Seaker\nMinigun\nChain Saw", "Get", "Cancel");
            }
            if(listitem == 7)
            {
                ShowPlayerDialog(playerid, DIALOGID+8, DIALOG_STYLE_LIST, "Weapon Menu", "Granade\nTear Gas", "Get", "Cancel");
            }
            if(listitem == 8)
            {
                ShowPlayerDialog(playerid, DIALOGID+9, DIALOG_STYLE_LIST, "Weapon Menu", "Fire Extinguisher\nSatchel Charge\nParachute\nNightvision Goggles\nFlowers", "Get", "Cancel");
            }
        }
        return 1;
    }

    if(dialogid == DIALOGID+1)
    {
        if(response)
        {
            if(listitem == 0)
            {
                GivePlayerWeapon(playerid, 1, 1);
                GivePlayerMoney(playerid,-500);
                wData[playerid][Meele]=1;
		wData[playerid][Ammo1]=1;
			}
            if(listitem == 1)
            {
                GivePlayerWeapon(playerid, 2, 1);
                GivePlayerMoney(playerid,-500);
                wData[playerid][Meele]=2;
		wData[playerid][Ammo1]=1;

		}
            if(listitem == 2)
            {
                GivePlayerMoney(playerid,-500);
                GivePlayerWeapon(playerid, 3, 1);
                wData[playerid][Meele]=3;
		wData[playerid][Ammo1]=1;

		}
            if(listitem == 3)
            {
                GivePlayerMoney(playerid,-500);
                GivePlayerWeapon(playerid, 4, 1);
              	wData[playerid][Meele]=4;
		wData[playerid][Ammo1]=1;
			}
            if(listitem == 4)
            {
                GivePlayerMoney(playerid,-500);
                GivePlayerWeapon(playerid, 5, 1);
                wData[playerid][Meele]=5;
		wData[playerid][Ammo1]=1;
		}

            if(listitem == 5)
            {
                GivePlayerMoney(playerid,-500);
                GivePlayerWeapon(playerid, 6, 1);
                wData[playerid][Meele]=6;
		wData[playerid][Ammo1]=1;
			}
            if(listitem == 6)
            {
                GivePlayerMoney(playerid,-500);
                GivePlayerWeapon(playerid, 7, 1);
              	wData[playerid][Meele]=7;
		wData[playerid][Ammo1]=1;
			}
            if(listitem == 7)
            {
                GivePlayerMoney(playerid,-500);
                GivePlayerWeapon(playerid, 8, 1);
                wData[playerid][Meele]=8;
		wData[playerid][Ammo1]=1;

		}
            if(listitem == 8)
            {
                GivePlayerMoney(playerid,-500);
                GivePlayerWeapon(playerid, 10, 1);
                wData[playerid][Meele]=10;
		wData[playerid][Ammo1]=1;

		}
            if(listitem == 9)
            {
                GivePlayerMoney(playerid,-500);
                GivePlayerWeapon(playerid, 41, 9999);
                wData[playerid][Meele]=1;
		wData[playerid][Ammo1]=9999;
			}
            if(listitem == 10)
            {
                GivePlayerMoney(playerid,-500);
                GivePlayerWeapon(playerid, 15, 1);
                wData[playerid][Meele]=1;
		wData[playerid][Ammo1]=1;
		}
        }
        return 1;
    }

    if(dialogid == DIALOGID+2)
    {
        if(response)
        {
            if(listitem == 0)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 22, 9999);
                wData[playerid][Pistol]=22;
		wData[playerid][Ammo2]=9999;
		}
            if(listitem == 1)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 23, 9999);
                wData[playerid][Pistol]=23;
		wData[playerid][Ammo2]=9999;
		}
            if(listitem == 2)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 24, 9999);
                wData[playerid][Pistol]=24;
		wData[playerid][Ammo2]=9999;
		}
        }
        return 1;
    }

    if(dialogid == DIALOGID+3)
    {
        if(response)
        {
            if(listitem == 0)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 28, 9999);
                wData[playerid][Sub]=28;
		wData[playerid][Ammo3]=9999;

		}
            if(listitem == 1)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 29, 9999);
                wData[playerid][Sub]=29;
		wData[playerid][Ammo3]=9999;
		}
            if(listitem == 2)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 32, 9999);
                wData[playerid][Sub]=32;
		wData[playerid][Ammo3]=9999;
		}
        }
        return 1;
    }

    if(dialogid == DIALOGID+4)
    {
        if(response)
        {
            if(listitem == 0)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 33, 9999);
                wData[playerid][Rifle]=33;
		wData[playerid][Ammo4]=9999;

		}
            if(listitem == 1)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 34, 9999);
                wData[playerid][Rifle]=34;
		wData[playerid][Ammo4]=9999;
		}
        }
        return 1;
    }

    if(dialogid == DIALOGID+5)
    {
        if(response)
        {
            if(listitem == 0)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 30, 9999);
                wData[playerid][Assault]=30;
		wData[playerid][Ammo5]=9999;

		}
            if(listitem == 1)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 31, 9999);
                wData[playerid][Assault]=31;
		wData[playerid][Ammo5]=9999;
		}
        }
        return 1;
    }

    if(dialogid == DIALOGID+6)
    {
        if(response)
        {
            if(listitem == 0)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 25, 9999);
                wData[playerid][Shotgun]=25;
		wData[playerid][Ammo6]=9999;

		}
            if(listitem == 1)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 26, 9999);
                wData[playerid][Shotgun]=26;
		wData[playerid][Ammo6]=9999;
		}
            if(listitem == 2)
            {
                  GivePlayerMoney(playerid,-5000);
                  GivePlayerWeapon(playerid, 27, 9999);
                  wData[playerid][Shotgun]=27;
                  wData[playerid][Ammo6]=9999;
		}
        }
        return 1;
    }

    if(dialogid == DIALOGID+7)
    {
        if(response)
        {
            if(listitem == 0)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 35, 9999);
                wData[playerid][Heavy]=35;
		wData[playerid][Ammo7]=9999;
		}
            if(listitem == 1)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 36, 9999);
                wData[playerid][Heavy]=36;
		wData[playerid][Ammo7]=9999;
		}
            if(listitem == 2)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 38, 9999);
                wData[playerid][Heavy]=38;
		wData[playerid][Ammo7]=9999;
		}
            if(listitem == 3)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 9, 9999);
                wData[playerid][Heavy]=9;
		wData[playerid][Ammo7]=9999;
		}
        }
        return 1;
    }

    if(dialogid == DIALOGID+8)
    {
        if(response)
        {
            if(listitem == 0)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 16, 9999);
                wData[playerid][Thrown]=16;
		wData[playerid][Ammo8]=9999;
		}
            if(listitem == 1)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 17, 9999);
                wData[playerid][Thrown]=17;
		wData[playerid][Ammo8]=9999;
		}
        }
        return 1;
    }

    if(dialogid == DIALOGID+9)
    {
        if(response)
        {
            if(listitem == 0)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 42, 9999);
                wData[playerid][Other]=42;
		wData[playerid][Ammo9]=9999;
		}
            if(listitem == 1)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 39, 1);
                GivePlayerWeapon(playerid, 40, 1);
                wData[playerid][Other]=40;
		wData[playerid][Ammo9]=1; 
		}
            if(listitem == 2)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 46, 1);
                wData[playerid][Other]=46;
		wData[playerid][Ammo9]=1;
		}
            if(listitem == 3)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 44, 1);
                wData[playerid][Other]=44;
		wData[playerid][Ammo9]=1;
		}
            if(listitem == 4)
            {
                GivePlayerMoney(playerid,-5000);
                GivePlayerWeapon(playerid, 14, 1);
               	wData[playerid][Other]=14;
		wData[playerid][Ammo9]=1;
		}
        }
        return 1;
    }

    return 0;
 }
