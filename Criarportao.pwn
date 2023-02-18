//by: BraM
#define FILTERSCRIPT 
#include                "a_samp.inc"
#include                "streamer.inc"
#include                "zcmd.inc"
#include                "sscanf2.inc"
#include                "DOF2.inc"
#include                "foreach.inc"
#if defined FILTERSCRIPT

#pragma disablerecursion

#define DIALOG_SENHAPORTAO 132
#define MAX_PORTAO 50
#define   Portoes     "Portoes/%d.ini"
#define  SCM SendClientMessage

new Float:velocidadeportao[MAX_PLAYERS] = 0.3;
new iddportao[MAX_PLAYERS];

#define  Vermelho 0xFF0000FF 
#define  Verde 0x33AA33AA 
#define Amarelo 0xFFFF00AA

#define varGet(%0)      getproperty(0,%0)
#define varSet(%0,%1)   setproperty(0, %0, %1)
#define new_strcmp(%0,%1) \
                (varSet(%0, 1), varGet(%1) == varSet(%0, 0))
                
new PlayerText:TextPortao[MAX_PLAYERS][9];

main()
{
	print("\n----------------------------------");
	print("-------- carregado com sucesso --------");
	print("----------------------------------\n");
}

enum Portaoplayers {

    idportao,
	Objetoportao,
	Portaoaberto,
	Float:PortaoX,
	Float:PortaoY,
	Float:PortaoZ,
	Float:PortaoA,
	Text3D:TextoPortao,
};

new Playerrportao[MAX_PORTAO][Portaoplayers];

public OnGameModeInit()
{
    printf("%d PORTOES CARREGADOS", carregarportoes());
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_SENHAPORTAO)
	{
	    if(response)
		{
		    for(new i; i < MAX_PORTAO; i++)
			{
			    if(IsPlayerInRangeOfPoint(playerid, 5.0, Playerrportao[i][PortaoX], Playerrportao[i][PortaoY], Playerrportao[i][PortaoZ]))
                {
                     new string[300];
                     format(string,sizeof(string),Portoes, i);
				     if(DOF2_FileExists(string))
				     {
					        if(new_strcmp(DOF2_GetString(string, "senhaportao"), inputtext))
					        {
					           if(Playerrportao[i][Portaoaberto] == 1)
					           {
					              carregarportao(i);
					              MoveDynamicObject(Playerrportao[i][Objetoportao], Playerrportao[i][PortaoX], Playerrportao[i][PortaoY], Playerrportao[i][PortaoZ]- 6.8172, 4.0);
					              Playerrportao[i][Portaoaberto] = 0;
					           }
					           else 
					           {  
					              if(Playerrportao[i][Portaoaberto] == 0)
					              {                 
					                 carregarportao(i);
					                 MoveDynamicObject(Playerrportao[i][Objetoportao], Playerrportao[i][PortaoX], Playerrportao[i][PortaoY], Playerrportao[i][PortaoZ], 4.0);
					                 Playerrportao[i][Portaoaberto] = 1;
					              }
					           }
					        }
					        else
					        {
					            SCM(playerid,Vermelho,"ERRO: senha errada.");
					        }
				      }
                }
			}
        }
        else 
        {
           return true;
        }
    }
    return 1;
}

public OnFilterScriptExit()
{
    DOF2_Exit();
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{   
    if(playertextid != PlayerText:INVALID_TEXT_DRAW)
    {
        new Float:Pos[6];
	    if(playertextid == TextPortao[playerid][0])
	    {
			GetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			GetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]);
			SetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] -velocidadeportao[playerid],Pos[2]);
			SetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			return 1;
		}
		if(playertextid == TextPortao[playerid][1])
	    {
			GetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			GetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]);
			SetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] +velocidadeportao[playerid],Pos[2]);
			SetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			return 1;
		}
		if(playertextid == TextPortao[playerid][2])
	    {
			GetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			GetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]);
			SetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]+velocidadeportao[playerid]);
			SetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			return 1;
		}
		if(playertextid == TextPortao[playerid][3])
	    {
			GetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			GetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]);
			SetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]-velocidadeportao[playerid]);
			SetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			return 1;
		}
	    if(playertextid == TextPortao[playerid][4])
	    {
			GetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			GetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]);
			SetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0]+velocidadeportao[playerid], Pos[1] ,Pos[2]);
			SetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			return 1;
		}
		if(playertextid == TextPortao[playerid][5])
	    {
			GetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			GetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]);
			SetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0]-velocidadeportao[playerid], Pos[1] ,Pos[2]);
			SetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			return 1;
		}
		if(playertextid == TextPortao[playerid][6])
	    {
			GetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			GetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]);
			SetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]);
			SetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4],Pos[5]-velocidadeportao[playerid]);
			return 1;
		}
		if(playertextid == TextPortao[playerid][7])
	    {
			GetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			GetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]);
			SetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]);
			SetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4],Pos[5]+velocidadeportao[playerid]);
			return 1;
		}
	    if(playertextid == TextPortao[playerid][8])
	    {
	        new string[300];
	        format(string,sizeof(string),Portoes,iddportao[playerid]);
		    if(DOF2_FileExists(string))
		    {
			    GetDynamicObjectRot(Playerrportao[iddportao[playerid]][Objetoportao], Pos[3], Pos[4] ,Pos[5]);
			    GetDynamicObjectPos(Playerrportao[iddportao[playerid]][Objetoportao], Pos[0], Pos[1] ,Pos[2]);    
			    Playerrportao[iddportao[playerid]][PortaoX] = Pos[0];
                Playerrportao[iddportao[playerid]][PortaoY] = Pos[1];
                Playerrportao[iddportao[playerid]][PortaoZ] = Pos[2];
                Playerrportao[iddportao[playerid]][PortaoA] = Pos[5];
			    DOF2_SetFloat(string, "Xportao", Playerrportao[iddportao[playerid]][PortaoX]);
				DOF2_SetFloat(string, "Yportao", Playerrportao[iddportao[playerid]][PortaoY]);
				DOF2_SetFloat(string, "Zportao", Playerrportao[iddportao[playerid]][PortaoZ]);  
				DOF2_SetFloat(string, "Aportao", Playerrportao[iddportao[playerid]][PortaoA]);  
				DOF2_SaveFile();
                
				DestroyDynamic3DTextLabel(Playerrportao[iddportao[playerid]][TextoPortao]);
				format(string, sizeof(string), "[PORTAO ID: %d]\nUse:/senhaportao para abrir ou para fechar", Playerrportao[iddportao[playerid]][idportao]);
				Playerrportao[iddportao[playerid]][TextoPortao] = CreateDynamic3DTextLabel(string, -1, Playerrportao[iddportao[playerid]][PortaoX], Playerrportao[iddportao[playerid]][PortaoY], Playerrportao[iddportao[playerid]][PortaoZ]+ 1.1828, 30.0);
				iddportao[playerid] = -1;
				CancelSelectTextDraw(playerid);
				PlayerTextDrawDestroy(playerid,TextPortao[playerid][0]);
				PlayerTextDrawDestroy(playerid,TextPortao[playerid][1]);
				PlayerTextDrawDestroy(playerid,TextPortao[playerid][2]);
				PlayerTextDrawDestroy(playerid,TextPortao[playerid][3]);
				PlayerTextDrawDestroy(playerid,TextPortao[playerid][4]);
				PlayerTextDrawDestroy(playerid,TextPortao[playerid][5]);
				PlayerTextDrawDestroy(playerid,TextPortao[playerid][6]);
				PlayerTextDrawDestroy(playerid,TextPortao[playerid][7]);
				PlayerTextDrawDestroy(playerid,TextPortao[playerid][8]);
				SCM(playerid,Verde,"Portao salvo com sucesso.");
				return 1;
		    }
		}
	}
    return 0;
} 
stock carregarportoes()
{
    for(new i; i < MAX_PORTAO; i++)
    {
        new string[300];
    	format(string, sizeof(string),Portoes, i);
        if(DOF2_FileExists(string))
        {
            Playerrportao[i][PortaoX] = DOF2_GetFloat(string, "Xportao");
            Playerrportao[i][PortaoY] = DOF2_GetFloat(string, "Yportao");
            Playerrportao[i][PortaoZ] = DOF2_GetFloat(string, "Zportao");
            Playerrportao[i][PortaoA] = DOF2_GetFloat(string, "Aportao");
			Playerrportao[i][idportao] = DOF2_GetInt(string, "idportao");
	        //
			Playerrportao[i][Objetoportao] = CreateDynamicObject(980, Playerrportao[i][PortaoX], Playerrportao[i][PortaoY], Playerrportao[i][PortaoZ], 0.0, 0.0, Playerrportao[i][PortaoA]);
		    new textportao[300];
			format(textportao, sizeof(textportao), "[PORTAO ID: %d]\nUse:/senhaportao para abrir ou para fechar", Playerrportao[i][idportao]);
			Playerrportao[i][TextoPortao] = CreateDynamic3DTextLabel(textportao, -1, Playerrportao[i][PortaoX], Playerrportao[i][PortaoY], Playerrportao[i][PortaoZ]+ 1.1828, 30.0);
			Playerrportao[i][Portaoaberto] = 1;
        }
    }
    return 1;
}

stock carregarportao(id)
{  
    new string[300];
	format(string, sizeof(string),Portoes, id);
    if(DOF2_FileExists(string))
    {
        Playerrportao[id][PortaoX] = DOF2_GetFloat(string, "Xportao");
        Playerrportao[id][PortaoY] = DOF2_GetFloat(string, "Yportao");
        Playerrportao[id][PortaoZ] = DOF2_GetFloat(string, "Zportao");
        Playerrportao[id][PortaoA] = DOF2_GetFloat(string, "Aportao");
		Playerrportao[id][idportao] = DOF2_GetInt(string, "idportao");       
    }    
    return 1;
}

Carregartextportao(playerid)
{
	TextPortao[playerid][0] = CreatePlayerTextDraw(playerid,412.000000, 314.000000, "LD_BEAT:left");
	PlayerTextDrawBackgroundColor(playerid,TextPortao[playerid][0], 255);
	PlayerTextDrawFont(playerid,TextPortao[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid,TextPortao[playerid][0], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,TextPortao[playerid][0], -1);
	PlayerTextDrawSetOutline(playerid,TextPortao[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid,TextPortao[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid,TextPortao[playerid][0], 1);
	PlayerTextDrawUseBox(playerid,TextPortao[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid,TextPortao[playerid][0], 255);
	PlayerTextDrawTextSize(playerid,TextPortao[playerid][0], 38.000000, 49.000000);
	PlayerTextDrawSetSelectable(playerid,TextPortao[playerid][0], 1);
	
	TextPortao[playerid][1] = CreatePlayerTextDraw(playerid,477.000000, 314.000000, "LD_BEAT:right");
	PlayerTextDrawBackgroundColor(playerid,TextPortao[playerid][1], 255);
	PlayerTextDrawFont(playerid,TextPortao[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid,TextPortao[playerid][1], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,TextPortao[playerid][1], -1);
	PlayerTextDrawSetOutline(playerid,TextPortao[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid,TextPortao[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid,TextPortao[playerid][1], 1);
	PlayerTextDrawUseBox(playerid,TextPortao[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid,TextPortao[playerid][1], 255);
	PlayerTextDrawTextSize(playerid,TextPortao[playerid][1], 38.000000, 49.000000);
	PlayerTextDrawSetSelectable(playerid,TextPortao[playerid][1], 1);
	
	TextPortao[playerid][2] = CreatePlayerTextDraw(playerid,445.000000, 269.000000, "LD_BEAT:up");
	PlayerTextDrawBackgroundColor(playerid,TextPortao[playerid][2], 255);
	PlayerTextDrawFont(playerid,TextPortao[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid,TextPortao[playerid][2], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,TextPortao[playerid][2], -1);
	PlayerTextDrawSetOutline(playerid,TextPortao[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid,TextPortao[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid,TextPortao[playerid][2], 1);
	PlayerTextDrawUseBox(playerid,TextPortao[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid,TextPortao[playerid][2], 255);
	PlayerTextDrawTextSize(playerid,TextPortao[playerid][2], 38.000000, 49.000000);
	PlayerTextDrawSetSelectable(playerid,TextPortao[playerid][2], 1);
	
	TextPortao[playerid][3] = CreatePlayerTextDraw(playerid,445.000000, 355.000000, "LD_BEAT:down");
	PlayerTextDrawBackgroundColor(playerid,TextPortao[playerid][3], 255);
	PlayerTextDrawFont(playerid,TextPortao[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid,TextPortao[playerid][3], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,TextPortao[playerid][3], -1);
	PlayerTextDrawSetOutline(playerid,TextPortao[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid,TextPortao[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid,TextPortao[playerid][3], 1);
	PlayerTextDrawUseBox(playerid,TextPortao[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid,TextPortao[playerid][3], 255);
	PlayerTextDrawTextSize(playerid,TextPortao[playerid][3], 38.000000, 49.000000);
	PlayerTextDrawSetSelectable(playerid,TextPortao[playerid][3], 1);
	
	TextPortao[playerid][4] = CreatePlayerTextDraw(playerid,492.000000, 373.000000, "LD_BEAT:downr");
	PlayerTextDrawBackgroundColor(playerid,TextPortao[playerid][4], 255);
	PlayerTextDrawFont(playerid,TextPortao[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid,TextPortao[playerid][4], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,TextPortao[playerid][4], -1);
	PlayerTextDrawSetOutline(playerid,TextPortao[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid,TextPortao[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid,TextPortao[playerid][4], 1);
	PlayerTextDrawUseBox(playerid,TextPortao[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid,TextPortao[playerid][4], 255);
	PlayerTextDrawTextSize(playerid,TextPortao[playerid][4], 38.000000, 49.000000);
	PlayerTextDrawSetSelectable(playerid,TextPortao[playerid][4], 1);
	
	TextPortao[playerid][5] = CreatePlayerTextDraw(playerid,401.000000, 372.000000, "LD_BEAT:downl");
	PlayerTextDrawBackgroundColor(playerid,TextPortao[playerid][5], 255);
	PlayerTextDrawFont(playerid,TextPortao[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid,TextPortao[playerid][5], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,TextPortao[playerid][5], -1);
	PlayerTextDrawSetOutline(playerid,TextPortao[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid,TextPortao[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid,TextPortao[playerid][5], 1);
	PlayerTextDrawUseBox(playerid,TextPortao[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid,TextPortao[playerid][5], -1);
	PlayerTextDrawTextSize(playerid,TextPortao[playerid][5], 38.000000, 49.000000);
	PlayerTextDrawSetSelectable(playerid,TextPortao[playerid][5], 1);
	
	TextPortao[playerid][6] = CreatePlayerTextDraw(playerid,509.000000, 228.000000, "LD_BEAT:left");
	PlayerTextDrawBackgroundColor(playerid,TextPortao[playerid][6], 255);
	PlayerTextDrawFont(playerid,TextPortao[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid,TextPortao[playerid][6], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,TextPortao[playerid][6], -1);
	PlayerTextDrawSetOutline(playerid,TextPortao[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid,TextPortao[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid,TextPortao[playerid][6], 1);
	PlayerTextDrawUseBox(playerid,TextPortao[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid,TextPortao[playerid][6], 255);
	PlayerTextDrawTextSize(playerid,TextPortao[playerid][6], 38.000000, 49.000000);
	PlayerTextDrawSetSelectable(playerid,TextPortao[playerid][6], 1);
	
	TextPortao[playerid][7] = CreatePlayerTextDraw(playerid,562.000000, 227.000000, "LD_BEAT:right");
	PlayerTextDrawBackgroundColor(playerid,TextPortao[playerid][7], 255);
	PlayerTextDrawFont(playerid,TextPortao[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid,TextPortao[playerid][7], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,TextPortao[playerid][7], -1);
	PlayerTextDrawSetOutline(playerid,TextPortao[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid,TextPortao[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid,TextPortao[playerid][7], 1);
	PlayerTextDrawUseBox(playerid,TextPortao[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid,TextPortao[playerid][7], 255);
	PlayerTextDrawTextSize(playerid,TextPortao[playerid][7], 38.000000, 49.000000);
	PlayerTextDrawSetSelectable(playerid,TextPortao[playerid][7], 1);
	
	TextPortao[playerid][8] = CreatePlayerTextDraw(playerid,564.000000, 155.000000, "LD_CHAT:thumbup");

	PlayerTextDrawBackgroundColor(playerid,TextPortao[playerid][8], 255);

	PlayerTextDrawFont(playerid,TextPortao[playerid][8], 4);

	PlayerTextDrawLetterSize(playerid,TextPortao[playerid][8], 0.500000, 1.000000);

	PlayerTextDrawColor(playerid,TextPortao[playerid][8], 16711935);

	PlayerTextDrawSetOutline(playerid,TextPortao[playerid][8], 0);

	PlayerTextDrawSetProportional(playerid,TextPortao[playerid][8], 1);

	PlayerTextDrawSetShadow(playerid,TextPortao[playerid][8], 1);

	PlayerTextDrawUseBox(playerid,TextPortao[playerid][8], 1);

	PlayerTextDrawBoxColor(playerid,TextPortao[playerid][8], 65535);

	PlayerTextDrawTextSize(playerid,TextPortao[playerid][8], 38.000000, 49.000000);

	PlayerTextDrawSetSelectable(playerid,TextPortao[playerid][8], 1);
	
	PlayerTextDrawShow(playerid,TextPortao[playerid][0]);
	PlayerTextDrawShow(playerid,TextPortao[playerid][1]);
	PlayerTextDrawShow(playerid,TextPortao[playerid][2]);
	PlayerTextDrawShow(playerid,TextPortao[playerid][3]);
	PlayerTextDrawShow(playerid,TextPortao[playerid][4]);
	PlayerTextDrawShow(playerid,TextPortao[playerid][5]);
	PlayerTextDrawShow(playerid,TextPortao[playerid][6]);
	PlayerTextDrawShow(playerid,TextPortao[playerid][7]);
	PlayerTextDrawShow(playerid,TextPortao[playerid][8]);
	SelectTextDraw(playerid, Vermelho);
	return 1;
}

CMD:criarportao(playerid, params[])
{
	new string[128], Float:Pos[4],senha[40];
	if(sscanf(params, "s[40]", senha)) return SCM(playerid, Vermelho, "Use: /criarportao [senha]");
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	GetPlayerFacingAngle(playerid, Pos[3]);
	for(new i; i < MAX_PORTAO; i++)
	{
		format(string,sizeof(string),Portoes, i);
		if(!DOF2_FileExists(string))
		{
		    DOF2_CreateFile(string);
		    DOF2_SetInt(string, "idportao", i);    
		    DOF2_SetString(string, "senhaportao", senha);    
			DOF2_SetFloat(string, "Xportao", Pos[0]);
			DOF2_SetFloat(string, "Yportao", Pos[1]);
			DOF2_SetFloat(string, "Zportao", Pos[2]);
			DOF2_SetString(string, "Aportao","90.0");
			//
		    Playerrportao[i][PortaoX] = DOF2_GetFloat(string, "Xportao");
            Playerrportao[i][PortaoY] = DOF2_GetFloat(string, "Yportao");
            Playerrportao[i][PortaoZ] = DOF2_GetFloat(string, "Zportao");
            Playerrportao[i][PortaoA] = DOF2_GetFloat(string, "Aportao");
			Playerrportao[i][idportao] = DOF2_GetInt(string, "idportao");
			//
			Playerrportao[i][Objetoportao] = CreateDynamicObject(980, Playerrportao[i][PortaoX], Playerrportao[i][PortaoY], Playerrportao[i][PortaoZ], 0.0, 0.0, Playerrportao[i][PortaoA]);
		    new textportao[300];
			format(textportao, sizeof(textportao), "[PORTAO ID: %d]\nUse:/senhaportao para abrir ou para fechar", Playerrportao[i][idportao]);
			Playerrportao[i][TextoPortao] = CreateDynamic3DTextLabel(textportao, -1, Playerrportao[i][PortaoX], Playerrportao[i][PortaoY], Playerrportao[i][PortaoZ]+ 1.1828, 30.0);
			Playerrportao[i][Portaoaberto] = 1;
			DOF2_SaveFile();
			SCM(playerid,Verde,"Portao criado com sucesso.");
			break;
		}
	}
	return 1;
}

CMD:senhaportao(playerid, params[])
{
    for(new i; i < MAX_PORTAO; i++)
    {
       if(IsPlayerInRangeOfPoint(playerid, 5.0, Playerrportao[i][PortaoX], Playerrportao[i][PortaoY], Playerrportao[i][PortaoZ]))
       {
           ShowPlayerDialog(playerid, DIALOG_SENHAPORTAO, DIALOG_STYLE_PASSWORD, "Portao", "Digite a senha do portao", "Pronto","Sair");
	   }
	}
    return 1;
}

CMD:destruirportao(playerid, params[])
{
    for( new i; i < MAX_PORTAO; i++)
    {
	    if(IsPlayerInRangeOfPoint(playerid, 5.0, Playerrportao[i][PortaoX], Playerrportao[i][PortaoY], Playerrportao[i][PortaoZ]))
		{
			   new id,Strin[128];
		       if(sscanf(params, "i", id)) return SCM(playerid,Vermelho, "Use: /destruirportao [ID]");
			   format(Strin, sizeof(Strin),Portoes, id);
			   if(DOF2_FileExists(Strin))
			   {
				    DOF2_RemoveFile(Strin);
				    DestroyDynamicObject(Playerrportao[i][Objetoportao]);
				    DestroyDynamic3DTextLabel(Text3D:Playerrportao[i][TextoPortao]);
				    UpdateDynamic3DTextLabelText(Playerrportao[i][TextoPortao], -1, Strin);
				    Playerrportao[i][PortaoX] = 0;
			        Playerrportao[i][PortaoY] = 0;
			        Playerrportao[i][PortaoZ] = 0;
			        Playerrportao[i][PortaoA] = 0;
			        SCM(playerid,Verde,"Portao destruido com sucesso.");
			   }
		}
	}
	return 1;
}

CMD:trocarsenhaportao(playerid, params[])
{
    new id, novasenha[40],Strin[128];
    if(sscanf(params, "is[40]", id, novasenha)) return SCM(playerid,Vermelho, "Use: /trocarsenhaportao [id] [nova senha]");
    format(Strin, sizeof(Strin),Portoes, id);
    if(DOF2_FileExists(Strin))
    {
	    DOF2_SetString(Strin, "senhaportao", novasenha); 
	    SCM(playerid,Verde,"Senha registrada no portao com sucesso!");   
	}
	else
	{
	   SCM(playerid,Vermelho,"ERRO: esse portao nao existe.");
	}
	return 1;
}

CMD:editarportao(playerid, params[])
{
    new Float:velocidade;
    new id,Strin[300];
    if(sscanf(params, "df", id, velocidade)) return SCM(playerid,Vermelho, "Use: /editarportao [ID] [VELOCIDADE]");
    format(Strin, sizeof(Strin),Portoes, id);
    if(DOF2_FileExists(Strin))
    {
        CancelSelectTextDraw(playerid);
		PlayerTextDrawDestroy(playerid,TextPortao[playerid][0]);
		PlayerTextDrawDestroy(playerid,TextPortao[playerid][1]);
		PlayerTextDrawDestroy(playerid,TextPortao[playerid][2]);
		PlayerTextDrawDestroy(playerid,TextPortao[playerid][3]);
		PlayerTextDrawDestroy(playerid,TextPortao[playerid][4]);
		PlayerTextDrawDestroy(playerid,TextPortao[playerid][5]);
		PlayerTextDrawDestroy(playerid,TextPortao[playerid][6]);
		PlayerTextDrawDestroy(playerid,TextPortao[playerid][7]);
		PlayerTextDrawDestroy(playerid,TextPortao[playerid][8]);
	    Carregartextportao(playerid);
	    velocidadeportao[playerid] = velocidade;
	    iddportao[playerid] = id;
	}
	else
	{
	    SCM(playerid,Vermelho,"ERRO: esse portao nao existe.");
	}
    return 1;
}
#endif
