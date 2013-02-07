; ripper.ahk
; Entwickelt von moolder / Guido Schuh (moolder@gmx.net, dirtyhack.de)
; Lizenz: Creative Commons Namensnennung-NichtKommerziell-Weitergabe unter gleichen Bedingungen 3.0
; Siehe http://creativecommons.org/licenses/by-nc-sa/3.0/de/

datafileDefault := "ripperdata.ini"
laufwerksliste := "|C:|D:|E:|F:|G:|H:|I:|J:|K:|L:|M:|N:|O:|P:|Q:|R:|S:|T:|U:|V:|W:|X:|Y:|Z:"

Gui, Add, Button, x6 y180 w60 h20 gAddEpisodes, Add
Gui, Add, Button, x86 y180 w60 h20 gDoRip vDoRip, Rip
Gui, Add, Button, x166 y180 w60 h20 gClearEpisodes, Clear

Gui, Add, ListView, r20 x6 y210 w790 h210 gMyListView, Status|Laufwerk|Titel|Sprache|Zieldatei|Encoding-Optionen|Zielpfad
LV_ModifyCol()  ; Auto-size each column to fit its contents.
; LV_ModifyCol(2, "Integer")  ; For sorting purposes, indicate that column 2 is an integer.

Gui, Add, CheckBox, x6 y425 w180 h20 vSHUTDOWNAFTERRIP , Nach letztem Rip herunterfahren
Gui, Add, CheckBox, x206 y425 w150 h20 vBREAKAFTERCURRENT , Nach aktuellem Rip stoppen

Gui, Add, StatusBar

Gui, Add, Tab, x6 y10 w790 h160 , Quelle|Titel|Ziel|Encoder

Gui, Tab, Quelle
Gui, Add, Text, x16 y43 w80 h30 , Quellaufwerk
Gui, Add, ComboBox, x106 y40 w100 h20 R5 vQUELLLAUFWERK , %laufwerksliste%
; Gui, Add, Text, x16 y73 w80 h30 , DVD-Titel
; Gui, Add, CheckBox, x106 y70 w30 h20 vDVDTITEL1 Checked1 , 1
; Gui, Add, CheckBox, x146 y70 w30 h20 vDVDTITEL2 Checked1 , 2
; Gui, Add, CheckBox, x186 y70 w30 h20 vDVDTITEL3 Checked1 , 3
; Gui, Add, CheckBox, x226 y70 w30 h20 vDVDTITEL4 Checked1 , 4
; Gui, Add, CheckBox, x266 y70 w30 h20 vDVDTITEL5 , 5
; Gui, Add, CheckBox, x306 y70 w30 h20 vDVDTITEL6 , 6
; Gui, Add, CheckBox, x346 y70 w30 h20 vDVDTITEL7 , 7
; Gui, Add, CheckBox, x386 y70 w30 h20 vDVDTITEL8 , 8
; Gui, Add, CheckBox, x426 y70 w30 h20 vDVDTITEL9 , 9
; Gui, Add, CheckBox, x466 y70 w30 h20 vDVDTITEL10, 10
; Gui, Add, CheckBox, x506 y70 w30 h20 vDVDTITEL11, 11
; Gui, Add, CheckBox, x546 y70 w30 h20 vDVDTITEL12, 12
Gui, Add, Text, x16 y103 w60 h20 , Sprachen

Gui, Add, Edit, x106 y100 w30 h20 vSPRACHEDVD1 , 1
Gui, Add, Text, x146 y103 w20 h20 , =>
Gui, Add, Edit, x171 y100 w80 h20 vSPRACHEZIEL1 , de

Gui, Add, Edit, x106 y130 w30 h20 vSPRACHEDVD2 , 2
Gui, Add, Text, x146 y133 w20 h20 , =>
Gui, Add, Edit, x171 y130 w80 h20 vSPRACHEZIEL2 , en

Gui, Add, Edit, x306 y100 w30 h20 vSPRACHEDVD3 ,
Gui, Add, Text, x346 y103 w20 h20 , =>
Gui, Add, Edit, x371 y100 w80 h20 vSPRACHEZIEL3 ,

Gui, Add, Edit, x306 y130 w30 h20 vSPRACHEDVD4 ,
Gui, Add, Text, x346 y133 w20 h20 , =>
Gui, Add, Edit, x371 y130 w80 h20 vSPRACHEZIEL4 ,


Gui, Tab, Titel
Gui, Add, Text, x16 y43 w60 h20 , Titel
Gui, Add, Text, x386 y43 w200 h80 , DVD-Titel => Episodennr.

Gui, Add, Edit, x106 y40 w30 h20 vDVDTITEL1   , 1
Gui, Add, Text, x146 y43 w20 h20 , =>
Gui, Add, Edit, x171 y40 w30 h20 vEPISODE1     , 1

Gui, Add, Edit, x106 y70 w30 h20 vDVDTITEL2   , 2
Gui, Add, Text, x146 y73 w20 h20 , =>         
Gui, Add, Edit, x171 y70 w30 h20 vEPISODE2     , 2

Gui, Add, Edit, x106 y100 w30 h20 vDVDTITEL3   , 3
Gui, Add, Text, x146 y103 w20 h20 , =>         
Gui, Add, Edit, x171 y100 w30 h20 vEPISODE3     , 3
                     
Gui, Add, Edit, x106 y130 w30 h20 vDVDTITEL4   , 4
Gui, Add, Text, x146 y133 w20 h20 , =>         
Gui, Add, Edit, x171 y130 w30 h20 vEPISODE4     , 4

Gui, Add, Edit, x256 y40 w30 h20 vDVDTITEL5   , 
Gui, Add, Text, x296 y43 w20 h20 , =>
Gui, Add, Edit, x321 y40 w30 h20 vEPISODE5     , 

Gui, Add, Edit, x256 y70 w30 h20 vDVDTITEL6   , 
Gui, Add, Text, x296 y73 w20 h20 , =>         
Gui, Add, Edit, x321 y70 w30 h20 vEPISODE6     , 

Gui, Add, Edit, x256 y100 w30 h20 vDVDTITEL7   , 
Gui, Add, Text, x296 y103 w20 h20 , =>         
Gui, Add, Edit, x321 y100 w30 h20 vEPISODE7     , 
                     
Gui, Add, Edit, x256 y130 w30 h20 vDVDTITEL8   , 
Gui, Add, Text, x296 y133 w20 h20 , =>         
Gui, Add, Edit, x321 y130 w30 h20 vEPISODE8     , 


Gui, Tab, Ziel
Gui, Add, Text, x16 y43 w60 h20 , Zielpfad
Gui, Add, Edit, x86 y40 w630 h20 vZIELPFAD, 
Gui, Add, Button, x726 y40 w60 h20 gSelectZielpfad, Auswählen
Gui, Add, Text, x16 y73 w60 h20 , Serienname
Gui, Add, Edit, x86 y70 w230 h20 vSERIENNAME, SERIE
Gui, Add, Text, x16 y103 w60 h20 , Staffel
Gui, Add, Edit, x86 y100 w30 h20 vSTAFFEL, 1
Gui, Add, Text, x16 y133 w60 h20 , Startepisode
Gui, Add, Edit, x86 y130 w30 h20 vSTARTEPISODE, 1
Gui, Add, Text, x186 y133 w80 h20 , Dateiendung
Gui, Add, Edit, x266 y130 w50 h20 vDATEIENDUNG, .mp4
Gui, Add, Text, x416 y73 w50 h20 , Breite (px)
Gui, Add, Edit, x486 y70 w40 h20 vBREITE, 288
Gui, Add, Text, x536 y73 w50 h20 , Höhe (px)
Gui, Add, Edit, x596 y70 w40 h20 vHOEHE, 208
Gui, Add, Text, x416 y103 w60 h20 , Video-Bitrate
Gui, Add, Edit, x486 y100 w40 h20 vVIDEOBITRATE, 500
Gui, Add, Text, x416 y133 w60 h20 , Audio-Bitrate
Gui, Add, Edit, x486 y130 w40 h20 vAUDIOBITRATE, 128

Gui, Tab, Encoder
Gui, Add, Text, x16 y43 w60 h20 , Encoder
Gui, Add, Edit, x86 y40 w630 h20 vENCODEREXE, C:\Programme\Handbrake\handbrakecli.exe
Gui, Add, Button, x726 y40 w60 h20 gSelectEncoderExe, Auswählen
Gui, Add, Text, x16 y73 w60 h20 , Optionen
Gui, Add, Edit, x86 y70 w630 h20 vENCODINGOPTIONS, -e ffmpeg -E faac --crop 0:0:0:0 -R 44.1

Menu, FileMenu, Add, &Exportieren, MenuFileExport
Menu, FileMenu, Add, &Importieren, MenuFileImport
Menu, FileMenu, Add, &Beenden, GuiClose
; Menu, HelpMenu, Add, &Hilfe, MenuHelpHelp
; Menu, HelpMenu, Add, &About, MenuHelpAbout
Menu, MyMenuBar, Add, &Datei, :FileMenu  ; Attach the two sub-menus that were created above.
; Menu, MyMenuBar, Add, &Help, :HelpMenu
Gui, Menu, MyMenuBar

datafile := datafileDefault
IfExist, %datafile%
	Gosub LoadData

Gui, Show, x131 y91 h474 w808, Serienencoder
Return

MenuFileExport:
FileSelectFile, datafile, S 16,,, INI-Dateien (*.ini)
if (ErrorLevel = 0) 
{ 
	Gosub SaveData 
}
Return

MenuFileImport:
FileSelectFile, datafile, 1,,, INI-Dateien (*.ini)
if (ErrorLevel = 0) 
{ 
	Gosub LoadData 
}
Return

MenuHelpAbout:
MenuHelpHelp:
Return

SelectZielpfad:
FileSelectFolder, ZIELPFAD
if (ErrorLevel = 0) 
{ 
	GuiControl,, ZIELPFAD     , %ZIELPFAD%
}
Return

SelectEncoderExe:
FileSelectFile, ENCODEREXE, 1,,, EXE-Dateien (*.exe)
if (ErrorLevel = 0) 
{ 
	GuiControl,, ENCODEREXE    , %ENCODEREXE%
}
Return

AddEpisodes:
Gui, Submit, NoHide

titelnum = 0
countepisoden = 0
Loop 8
{
	titelnum := titelnum + 1
	if (DVDTITEL%titelnum% > 0)
	{
		currepisode := EPISODE%titelnum% + STARTEPISODE - 1
		sprachenum = 0
		Loop 4
		{
			sprachenum := sprachenum + 1
			if (SPRACHEDVD%sprachenum% > 0)
			{
				dateiname := SERIENNAME . "_s" . STAFFEL . "_e" . currepisode . "_" . SPRACHEZIEL%sprachenum% . DATEIENDUNG
				encoding := ENCODINGOPTIONS . " -w " . BREITE . " -l " . HOEHE . " -b " . VIDEOBITRATE . " -B " . AUDIOBITRATE . " "
				LV_Add("", "", QUELLLAUFWERK, DVDTITEL%titelnum%, SPRACHEDVD%sprachenum%, dateiname, encoding, ZIELPFAD)
				LV_ModifyCol()  ; Auto-size each column to fit its contents.
			}
		}
		countepisoden++
	}
}
STARTEPISODE := STARTEPISODE + countepisoden
GuiControl, , STARTEPISODE, %STARTEPISODE%
Return

DoRip:

GuiControl, Disable, DoRip
rownumberRip = 1
rowmax := LV_GetCount()

Loop %rowmax%
{
	LV_GetText(status, rownumberRip)  ; Get the text from the row's first field.

	if (status != "DONE" && status != "IGNORE")
	{
		; Status|Laufwerk|Titel|Sprache|Zieldatei|Zielpfad
		LV_GetText(Cdvdlaufwerk, rownumberRip, 2) 
		LV_GetText(Cdvdtitel, rownumberRip, 3)
		LV_GetText(Cdvdsprache, rownumberRip, 4)
		LV_GetText(Czieldatei, rownumberRip, 5)
		LV_GetText(Cencoding, rownumberRip, 6)
		LV_GetText(Czielpfad, rownumberRip, 7)

		TrayTip, Ripper, Konvertiere %Czieldatei%, 4, 1
		SB_SetText("Konvertiere" . Czieldatei)

		LV_Modify(rownumberRip, Col1 Select, "CONVERTING...") 
		LV_ModifyCol()  ; Auto-size each column to fit its contents.

		; aufruf := "pausecmd.bat"

		aufruf := "C:\Programme\Handbrake\hbcli.exe"
		aufruf := aufruf . " -i """ . Cdvdlaufwerk . "\VIDEO_TS"""
		aufruf := aufruf . " -t " . Cdvdtitel . " -c 1-99"
		aufruf := aufruf . " -o """ . Czielpfad . Czieldatei . """ " . Cencoding 
		aufruf := aufruf . " -a " . Cdvdsprache . " -v "

		; MsgBox, %aufruf%
		
		RunWait %aufruf%,, Min ,
		
		LV_Modify(rownumberRip, Col1 -Select, "DONE") 
		
		Gui, Submit, NoHide
		if (BREAKAFTERCURRENT > 0)
		{
			Break
		}
	}
	rownumberRip++
}
GuiControl, Enable, DoRip
SB_SetText("Konvertierung abgeschlossen")

if (SHUTDOWNAFTERRIP > 0)
{
	MsgBox,4 ,Herunterfahren, Wirklich herunterfahren? (Timeout 60 Sekunden), 60
	IfMsgBox Yes
		Shutdown, 5
	IfMsgBox Timeout
		Shutdown, 5
}

Return


ClearEpisodes:
MsgBox,4 ,Sicherheitsabfrage, Konvertierliste wirklich leeren?
IfMsgBox Yes
	Gosub ClearEpisodesNoAsk
Return

ClearEpisodesNoAsk:
rowmax := LV_GetCount()
Loop %rowmax%
{
	LV_Delete(1)
}
Return


MyListView:

if A_GuiEvent = DoubleClick
{
	; LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
	; ToolTip You double-clicked row number %A_EventInfo%. Text: "%RowText%"

	rownumberList := A_EventInfo
	LV_GetText(status, rownumberList)  ; Get the text from the row's first field.

	if (status != "DONE" && status != "IGNORE")
	{
		LV_Modify(rownumberList, Col1, "IGNORE") 
	} 
	else 
	{
		LV_Modify(rownumberList, Col1, "")
	}
	LV_ModifyCol()  ; Auto-size each column to fit its contents.
}

Return

SaveData:
Gui, Submit, NoHide

SB_SetText(datafile . " wird gespeichert...")

IniWrite, 2, %datafile%, VERSION, DATEIFORMAT 

IniWrite, %QUELLLAUFWERK%, %datafile%, QUELLE, QUELLLAUFWERK 
IniWrite, %DVDTITEL1%    , %datafile%, QUELLE, DVDTITEL1     
IniWrite, %DVDTITEL2%    , %datafile%, QUELLE, DVDTITEL2     
IniWrite, %DVDTITEL3%    , %datafile%, QUELLE, DVDTITEL3     
IniWrite, %DVDTITEL4%    , %datafile%, QUELLE, DVDTITEL4     
IniWrite, %DVDTITEL5%    , %datafile%, QUELLE, DVDTITEL5     
IniWrite, %DVDTITEL6%    , %datafile%, QUELLE, DVDTITEL6     
IniWrite, %DVDTITEL7%    , %datafile%, QUELLE, DVDTITEL7     
IniWrite, %DVDTITEL8%    , %datafile%, QUELLE, DVDTITEL8
IniWrite, %EPISODE1%     , %datafile%, QUELLE, EPISODE1     
IniWrite, %EPISODE2%     , %datafile%, QUELLE, EPISODE2    
IniWrite, %EPISODE3%     , %datafile%, QUELLE, EPISODE3    
IniWrite, %EPISODE4%     , %datafile%, QUELLE, EPISODE4    
IniWrite, %EPISODE5%     , %datafile%, QUELLE, EPISODE5    
IniWrite, %EPISODE6%     , %datafile%, QUELLE, EPISODE6    
IniWrite, %EPISODE7%     , %datafile%, QUELLE, EPISODE7    
IniWrite, %EPISODE8%     , %datafile%, QUELLE, EPISODE8
IniWrite, %SPRACHEDVD1%  , %datafile%, QUELLE, SPRACHEDVD1   
IniWrite, %SPRACHEZIEL1% , %datafile%, QUELLE, SPRACHEZIEL1  
IniWrite, %SPRACHEDVD2%  , %datafile%, QUELLE, SPRACHEDVD2   
IniWrite, %SPRACHEZIEL2% , %datafile%, QUELLE, SPRACHEZIEL2  
IniWrite, %SPRACHEDVD3%  , %datafile%, QUELLE, SPRACHEDVD3   
IniWrite, %SPRACHEZIEL3% , %datafile%, QUELLE, SPRACHEZIEL3  
IniWrite, %SPRACHEDVD4%  , %datafile%, QUELLE, SPRACHEDVD4   
IniWrite, %SPRACHEZIEL4% , %datafile%, QUELLE, SPRACHEZIEL4  

IniWrite, %ZIELPFAD%     , %datafile%, ZIEL, ZIELPFAD     
IniWrite, %SERIENNAME%   , %datafile%, ZIEL, SERIENNAME    
IniWrite, %STAFFEL%      , %datafile%, ZIEL, STAFFEL   
IniWrite, %STARTEPISODE% , %datafile%, ZIEL, STARTEPISODE  
IniWrite, %BREITE%       , %datafile%, ZIEL, BREITE        
IniWrite, %HOEHE%        , %datafile%, ZIEL, HOEHE   
IniWrite, %VIDEOBITRATE% , %datafile%, ZIEL, VIDEOBITRATE  
IniWrite, %AUDIOBITRATE% , %datafile%, ZIEL, AUDIOBITRATE  
IniWrite, %DATEIENDUNG%  , %datafile%, ZIEL, DATEIENDUNG  

IniWrite, %ENCODEREXE%     , %datafile%, ENCODER, ENCODEREXE  
IniWrite, %ENCODINGOPTIONS%, %datafile%, ENCODER, ENCODINGOPTIONS  

rownumberSave = 1
rowmax := LV_GetCount()
IniWrite, %rowmax% , %datafile%, LISTE, ROWMAX  

Loop %rowmax%
{
	; Status|Laufwerk|Titel|Sprache|Zieldatei|Zielpfad
	LV_GetText(Cstatus,      rownumberSave, 1) 
	LV_GetText(Cdvdlaufwerk, rownumberSave, 2) 
	LV_GetText(Cdvdtitel,    rownumberSave, 3)
	LV_GetText(Cdvdsprache,  rownumberSave, 4)
	LV_GetText(Czieldatei,   rownumberSave, 5)
	LV_GetText(Cencoding,    rownumberSave, 6)
	LV_GetText(Czielpfad,    rownumberSave, 7)
	
	IniWrite, %Cstatus%,       %datafile%, LISTE, CSTATUS%rownumberSave%  
	IniWrite, %Cdvdlaufwerk%,  %datafile%, LISTE, CDVDLAUFWERK%rownumberSave%  
	IniWrite, %Cdvdtitel%,     %datafile%, LISTE, CDVDTITEL%rownumberSave%  
	IniWrite, %Cdvdsprache%,   %datafile%, LISTE, CDVDSPRACHE%rownumberSave%  
	IniWrite, %Czieldatei%,    %datafile%, LISTE, CZIELDATEI%rownumberSave%  
	IniWrite, %Cencoding%,     %datafile%, LISTE, CENCODING%rownumberSave%  
	IniWrite, %Czielpfad%,     %datafile%, LISTE, CZIELPFAD%rownumberSave%  
	
	rownumberSave++
}	


SB_SetText(datafile . " gespeichert")

Return


LoadData:

IniRead, QUELLLAUFWERK, %datafile%, QUELLE, QUELLLAUFWERK 
IniRead, DVDTITEL1    , %datafile%, QUELLE, DVDTITEL1     
IniRead, DVDTITEL2    , %datafile%, QUELLE, DVDTITEL2     
IniRead, DVDTITEL3    , %datafile%, QUELLE, DVDTITEL3     
IniRead, DVDTITEL4    , %datafile%, QUELLE, DVDTITEL4     
IniRead, DVDTITEL5    , %datafile%, QUELLE, DVDTITEL5     
IniRead, DVDTITEL6    , %datafile%, QUELLE, DVDTITEL6     
IniRead, EPISODE1     , %datafile%, QUELLE, EPISODE1
IniRead, EPISODE2     , %datafile%, QUELLE, EPISODE2
IniRead, EPISODE3     , %datafile%, QUELLE, EPISODE3
IniRead, EPISODE4     , %datafile%, QUELLE, EPISODE4
IniRead, EPISODE5     , %datafile%, QUELLE, EPISODE5
IniRead, EPISODE6     , %datafile%, QUELLE, EPISODE6
IniRead, SPRACHEDVD1  , %datafile%, QUELLE, SPRACHEDVD1   
IniRead, SPRACHEZIEL1 , %datafile%, QUELLE, SPRACHEZIEL1  
IniRead, SPRACHEDVD2  , %datafile%, QUELLE, SPRACHEDVD2   
IniRead, SPRACHEZIEL2 , %datafile%, QUELLE, SPRACHEZIEL2  
IniRead, SPRACHEDVD3  , %datafile%, QUELLE, SPRACHEDVD3   
IniRead, SPRACHEZIEL3 , %datafile%, QUELLE, SPRACHEZIEL3  
IniRead, SPRACHEDVD4  , %datafile%, QUELLE, SPRACHEDVD4   
IniRead, SPRACHEZIEL4 , %datafile%, QUELLE, SPRACHEZIEL4  

StringReplace, laufwerksliste2, laufwerksliste, %QUELLLAUFWERK%, %QUELLLAUFWERK%|

GuiControl,, QUELLLAUFWERK, %laufwerksliste2%
GuiControl,, DVDTITEL1    , %DVDTITEL1%    
GuiControl,, DVDTITEL2    , %DVDTITEL2%    
GuiControl,, DVDTITEL3    , %DVDTITEL3%    
GuiControl,, DVDTITEL4    , %DVDTITEL4%    
GuiControl,, DVDTITEL5    , %DVDTITEL5%    
GuiControl,, DVDTITEL6    , %DVDTITEL6%    
GuiControl,, DVDTITEL7    , %DVDTITEL7%    
GuiControl,, DVDTITEL8    , %DVDTITEL8%    
GuiControl,, DVDTITEL9    , %DVDTITEL9%    
GuiControl,, DVDTITEL10   , %DVDTITEL10%   
GuiControl,, DVDTITEL11   , %DVDTITEL11%   
GuiControl,, DVDTITEL12   , %DVDTITEL12%   
GuiControl,, SPRACHEDVD1  , %SPRACHEDVD1%  
GuiControl,, SPRACHEZIEL1 , %SPRACHEZIEL1% 
GuiControl,, SPRACHEDVD2  , %SPRACHEDVD2%  
GuiControl,, SPRACHEZIEL2 , %SPRACHEZIEL2% 
GuiControl,, SPRACHEDVD3  , %SPRACHEDVD3%  
GuiControl,, SPRACHEZIEL3 , %SPRACHEZIEL3% 
GuiControl,, SPRACHEDVD4  , %SPRACHEDVD4%  
GuiControl,, SPRACHEZIEL4 , %SPRACHEZIEL4% 


IniRead, ZIELPFAD     , %datafile%, ZIEL, ZIELPFAD     
IniRead, SERIENNAME   , %datafile%, ZIEL, SERIENNAME    
IniRead, STAFFEL      , %datafile%, ZIEL, STAFFEL      
IniRead, STARTEPISODE , %datafile%, ZIEL, STARTEPISODE  
IniRead, BREITE       , %datafile%, ZIEL, BREITE        
IniRead, HOEHE        , %datafile%, ZIEL, HOEHE        
IniRead, VIDEOBITRATE , %datafile%, ZIEL, VIDEOBITRATE  
IniRead, AUDIOBITRATE , %datafile%, ZIEL, AUDIOBITRATE  
IniRead, DATEIENDUNG  , %datafile%, ZIEL, DATEIENDUNG  

GuiControl,, ZIELPFAD     , %ZIELPFAD%
GuiControl,, SERIENNAME   , %SERIENNAME%   
GuiControl,, STAFFEL      , %STAFFEL%      
GuiControl,, STARTEPISODE , %STARTEPISODE% 
GuiControl,, BREITE       , %BREITE%       
GuiControl,, HOEHE        , %HOEHE%        
GuiControl,, VIDEOBITRATE , %VIDEOBITRATE% 
GuiControl,, AUDIOBITRATE , %AUDIOBITRATE% 
GuiControl,, DATEIENDUNG  , %DATEIENDUNG% 


IniRead, ENCODEREXE     , %datafile%, ENCODER, ENCODEREXE  
IniRead, ENCODINGOPTIONS, %datafile%, ENCODER, ENCODINGOPTIONS

GuiControl,, ENCODEREXE      , %ENCODEREXE% 
GuiControl,, ENCODINGOPTIONS , %ENCODINGOPTIONS% 


Gosub ClearEpisodesNoAsk
rownumberLoad = 1
IniRead, rowmax , %datafile%, LISTE, ROWMAX  

Loop %rowmax%
{

	IniRead, Cstatus,       %datafile%, LISTE, CSTATUS%rownumberLoad%  
	IniRead, Cdvdlaufwerk,  %datafile%, LISTE, CDVDLAUFWERK%rownumberLoad%  
	IniRead, Cdvdtitel,     %datafile%, LISTE, CDVDTITEL%rownumberLoad%  
	IniRead, Cdvdsprache,   %datafile%, LISTE, CDVDSPRACHE%rownumberLoad%  
	IniRead, Czieldatei,    %datafile%, LISTE, CZIELDATEI%rownumberLoad%  
	IniRead, Cencoding,     %datafile%, LISTE, CENCODING%rownumberLoad%  
	IniRead, Czielpfad,     %datafile%, LISTE, CZIELPFAD%rownumberLoad%  

	; Status|Laufwerk|Titel|Sprache|Zieldatei|Zielpfad
	LV_Add("", Cstatus, Cdvdlaufwerk, Cdvdtitel, Cdvdsprache, Czieldatei, Cencoding, Czielpfad)
	
	
	rownumberLoad++
}	
LV_ModifyCol()  ; Auto-size each column to fit its contents.

SB_SetText(datafile . " geladen")

Return

GuiClose:
datafile := datafileDefault
Gosub SaveData
ExitApp