state("KINGDOM HEARTS II FINAL MIX", "GLOBAL")
{
	bool load : "KINGDOM HEARTS II FINAL MIX.exe", 0x8E9DA3;
	byte black: "KINGDOM HEARTS II FINAL MIX.exe", 0xAB8BC7;
	bool saveload: "KINGDOM HEARTS II FINAL MIX.exe", 0xBEBD34;
	bool fightend: "KINGDOM HEARTS II FINAL MIX.exe", 0xAD6BC0;
	byte titlescreen: "KINGDOM HEARTS II FINAL MIX.exe", 0x711438;
	byte soraHP: "KINGDOM HEARTS II FINAL MIX.exe", 0x2A20C98;
	short storyHP: "KINGDOM HEARTS II FINAL MIX.exe", 0x2A20A20;
	byte cloneCount: "KINGDOM HEARTS II FINAL MIX.exe", 0x2A0D148;
	short soraGauge: "KINGDOM HEARTS II FINAL MIX.exe", 0x2A0D23A;
	short medalTimer: "KINGDOM HEARTS II FINAL MIX.exe", 0x25B71F4;
	byte worldID: "KINGDOM HEARTS II FINAL MIX.exe", 0x714DB8;
	byte roomID: "KINGDOM HEARTS II FINAL MIX.exe", 0x714DB9;
	byte newgame: "KINGDOM HEARTS II FINAL MIX.exe", 0xBEBE08;
	byte eventID1: "KINGDOM HEARTS II FINAL MIX.exe", 0x714DBC;
	byte eventID2: "KINGDOM HEARTS II FINAL MIX.exe", 0x714DBE;
	byte eventID3: "KINGDOM HEARTS II FINAL MIX.exe", 0x714DC0;
	int tempMemBank: "KINGDOM HEARTS II FINAL MIX.exe", 0xBEBE10;
}

state("KINGDOM HEARTS II FINAL MIX", "JP")
{
	bool load : "KINGDOM HEARTS II FINAL MIX.exe", 0x8E8DA3;
	byte black: "KINGDOM HEARTS II FINAL MIX.exe", 0xAB7BC7;
	bool saveload: "KINGDOM HEARTS II FINAL MIX.exe", 0xBEAD34;
	bool fightend: "KINGDOM HEARTS II FINAL MIX.exe", 0xAD5BC0;
	byte titlescreen: "KINGDOM HEARTS II FINAL MIX.exe", 0x710438;
	byte soraHP: "KINGDOM HEARTS II FINAL MIX.exe", 0x2A1FC98;
	short storyHP: "KINGDOM HEARTS II FINAL MIX.exe", 0x2A1FA20;
	byte cloneCount: "KINGDOM HEARTS II FINAL MIX.exe", 0x2A0C148;
	short soraGauge: "KINGDOM HEARTS II FINAL MIX.exe", 0x2A0C23A;
	short medalTimer: "KINGDOM HEARTS II FINAL MIX.exe", 0x25B61F4;
	byte worldID: "KINGDOM HEARTS II FINAL MIX.exe", 0x713DB8;
	byte roomID: "KINGDOM HEARTS II FINAL MIX.exe", 0x713DB9;
	byte newgame: "KINGDOM HEARTS II FINAL MIX.exe", 0xBECE08;
	byte eventID1: "KINGDOM HEARTS II FINAL MIX.exe", 0x713DBC;
	byte eventID2: "KINGDOM HEARTS II FINAL MIX.exe", 0x713DBE;
	byte eventID3: "KINGDOM HEARTS II FINAL MIX.exe", 0x713DC0;
	int tempMemBank: "KINGDOM HEARTS II FINAL MIX.exe", 0xBECE10;
	//To-do: Test Memory Pointers for JP. Coverted from: [Global - 0x1000 = JP]
}

init
{
	timer.IsGameTimePaused = false;
	vars.splitTimer = 0;
	vars.startCounter = 0;
	if(modules.First().ModuleMemorySize == 46301184){
		version = "JP";
	}
	else{
		version = "GLOBAL";
		//46305280
	}
	print(modules.First().ModuleMemorySize.ToString());
}

startup
{
	vars.booting = false;
		settings.Add("startREADME", false, "README: Auto-Start (Hover Over)");
		settings.SetToolTip("startREADME", "To Enable: Click the button ABOVE called 'Start'."+
						"\nOnly works when starting from the main menu."+
						"\nMake sure to reset before selecting New Game."+
						"\nSet timer to start at 0.31 for Any%.");
		settings.Add("splitREADME", false, "README: Auto-Split (Hover Over)");
		settings.SetToolTip("splitREADME", "To Enable: Click the button ABOVE called 'Split'."+
			"\nSelect the category you wish to run, the desired worlds, as well as the world's ending split.");
		settings.Add("Instructions 4", false, "--------------------------------");
		settings.Add("any", false, "Any%");
			settings.Add("STT", true, "Roxas Section", "any");
				settings.Add("02-04-4E", false, "Seifer 2", "STT");
				settings.Add("02-0E-80", false, "Mansion Dusk", "STT");
				settings.Add("02-06-5B", false, "Mail Delivery", "STT");
				settings.Add("02-20-9A", false, "Triple Dusk", "STT");
				settings.Add("02-22-9D", false, "Twilight Thorn", "STT");
				settings.Add("02-05-54", false, "Hayner Struggle", "STT");
				settings.Add("02-05-55", false, "Vivi Struggle", "STT");
				settings.Add("02-05-57", false, "Axel 1", "STT");
				settings.Add("02-0C-7D", false, "7 Wonders: Bag", "STT");
				settings.Add("02-14-89", true , "Axel 2", "STT");

			settings.Add("TT1", true, "Twilight Town 1 [Hover Over]", "any");
			settings.SetToolTip("TT1", "Edit the file and change all instances of '02-1C-04' to '02-1B-04' if you want to split on the cutscene leaving Tower and not the Door.");
				settings.Add("02-08-6C", false, "Station Plaza fight","TT1");
				settings.Add("02-19-95", false, "Tower: Entryway Heartless","TT1");
				settings.Add("02-1D-98", false, "Tower: Star Chamber Heartless","TT1");
				settings.Add("02-1E-99", false, "Tower: Moon Chamber Heartless","TT1");
				settings.Add("02-1C-04", true , "Leaving Tower (TT1)","TT1");
	

			settings.Add("HB1", true, "Hollow Bastion 1", "any");	
				settings.Add("04-09-33", false, "Nobody Battle", "HB1");
				settings.Add("04-08-34", true , "Bailey","HB1");

			settings.Add("LoD1", true, "Land of Dragons 1", "any");
				settings.Add("Missions", false, "Missions", "LoD1");
					settings.Add("08-01-44", false, "Pre-mission Fight", "Missions");
					settings.Add("08-02-45", false, "Mission 1: The Surprise Attack", "Missions");
					settings.Add("08-02-50", false, "Mission 2: The Ambush", "Missions");
					settings.Add("08-01-46", false, "Mission 3: The Search", "Missions");
				settings.Add("08-03-47", false, "Mountain Climb", "LoD1");
				settings.Add("08-05-48", false, "Cave Fight", "LoD1");
				settings.Add("08-07-49", false, "Summit Timed Fight", "LoD1");
				settings.Add("08-08-4A", false, "Imperial Square Fight", "LoD1");
				settings.Add("08-09-4B", true , "Shan-Yu","LoD1");

			settings.Add("OC1", true,  "Olympus Coliseum","any");
				settings.Add("06-05-6F", false, "Hades Escape","OC1");
				settings.Add("06-07-72", false, "Cerberus","OC1");
				settings.Add("06-00-8C", false, "Urns 1","OC1");
				settings.Add("06-00-8D", false, "Urns 2","OC1");
				settings.Add("06-11-7B", false, "Water clones","OC1");
				settings.Add("06-08-74", false, "Pete","OC1");			
				settings.Add("06-12-AB", true , "Hydra","OC1");

			settings.Add("04-0D-08", false, "Acquire Chicken Little (HB2)","any");

			settings.Add("BC1", true, "Beast Castle 1","any");
				settings.Add("05-0B-48", false, "Thresholder","BC1");
				settings.Add("05-03-45", false, "Wake up, Beast !", "BC1");
				settings.Add("05-05-4E", false, "Shadow Stalker","BC1");
				settings.Add("05-05-4F", true , "Dark Thorn","BC1");

			settings.Add("0C-00-33", false, "Minnie Escort","any");
			settings.Add("TR", true, "Timeless River", "any");
				settings.Add("0D-05-37", false, "Construction Site Window","TR");
				settings.Add("0D-04-36", false, "Tiny Town (Lilliput) Window","TR");
				settings.Add("0D-06-38", false, "Scene of the Fire Window","TR");
				settings.Add("0D-07-39", false, "Mickey's House window","TR");
				settings.Add("0D-03-35", true , "Timeless River Pete","TR");

			settings.Add("PR1", true, "Port Royal 1", "any");
				settings.Add("10-02-37", false, "Town Heartless battle", "PR1");
				settings.Add("10-09-3B", false, "Minute Pirate Fight", "PR1");
				settings.Add("10-07-3A", false, "Boat Fight", "PR1");
				settings.Add("10-0A-3C", true , "Barbossa","PR1");

			settings.Add("AG1", true, "Agrabah 1", "any");
				settings.Add("07-09-02", false, "Abu's crystal", "AG1");
				settings.Add("07-0D-4F", false, "Chasm of Challenges", "AG1");
				settings.Add("07-0A-3A", false, "Treasure room fight", "AG1");
				settings.Add("07-03-3B", true , "Twin Lords","AG1");

			settings.Add("HT1", true, "Halloween Town 1","any"); 
				settings.Add("0E-06-35", false, "Candy Cane Lane Battle","HT1");
				settings.Add("0E-03-34", false, "Prison Keeper","HT1");
				settings.Add("0E-09-37", true , "Oogie Boogie","HT1");

			settings.Add("TT2", true, "Twilight Town 2", "any");
				settings.Add("02-04-50", false, "Berserker Fight","TT2");
				settings.Add("02-02-48", false, "Acquire Limit Form","TT2");

			settings.Add("SP1", true,  "Space Paranoids 1","any");
				settings.Add("11-02-3E", false, "Light Cycle","SP1");
				settings.Add("11-03-36", false, "Screen Minigame","SP1");
				settings.Add("11-04-37", true , "Hostile Program","SP1");

			settings.Add("HB3", true, "Hollow Bastion 3","any");
				settings.Add("04-14-56", false, "Corridor fight", "HB3");
				settings.Add("04-12-49", false, "Dancers fight", "HB3");
				settings.Add("04-04-37", false, "Demyx","HB3");
				settings.Add("04-10-41", false, "Final Fantasy Fights","HB3");
				settings.Add("04-11-42", true , "1K Heartless","HB3");

			settings.Add("BC2", true, "Beast's castle 2", "any");
				settings.Add("05-03-0B", false, "Rumbling Rose", "BC2");
				settings.Add("05-03-14-W", false, "Leaving BC after Rumbling Rose", "BC2");
				settings.Add("05-00-4B", false, "Entrance hall Nobody fight","BC2");
				settings.Add("05-0F-52", true , "Xaldin","BC2");

			settings.Add("PR2", true, "Port Royal 2","any");
				settings.Add("10-12-55", false, "Grim Reaper 1","PR2");
				settings.Add("10-01-36", true , "Grim Reaper 2","PR2");

			settings.Add("HT2", true, "Halloween Town 2", "any");
				settings.Add("0E-0A-3E", false, "Trap Lock, Shock & barrel", "HT2");
				settings.Add("0E-00-3C", false, "Collect the 4 presents", "HT2");
				settings.Add("0E-0A-3F", false, "Gift Wrapping", "HT2");
				settings.Add("0E-07-40", true , "The Experiment","HT2");

			settings.Add("AG2", true, "Agrabah 2", "any");
				settings.Add("07-0E-56", false, "Carpet Battle 1", "AG2");
				settings.Add("07-0E-57", false, "Carpet Battle 2", "AG2");
				settings.Add("07-0E-11", false, "Magic Switches", "AG2");
				settings.Add("07-0E-3D", false, "Escape from the Ruins (Carpet autoscroller)", "AG2");
				settings.Add("07-05-3E", true , "Genie Jafar","AG2");

			settings.Add("LoD2", true, "Land of Dragons 2", "any");
				settings.Add("08-07-4C", false, "Riku", "LoD2");
				settings.Add("08-08-51", false, "Imperial Square Heartless", "LoD2");
				settings.Add("08-0A-4E", false, "Antechamber Battle", "LoD2");
				settings.Add("08-08-4F", true , "Storm Rider","LoD2");

			settings.Add("TT3", true , "Twilight Town 3","any");
				settings.Add("02-29-BA", false, "Mansion Nobody Waves", "TT3");
				settings.Add("02-28-A0", false, "Betwixt and Between (without Axel)","TT3");
				settings.Add("02-28-A1", true , "Betwixt and Between","TT3");	

			settings.Add("TWTNW",true, "The World that Never Was", "any");
				settings.Add("12-15-41", false, "Roxas","TWTNW");
				settings.Add("12-0A-39", false, "Xigbar","TWTNW");
				settings.Add("12-0E-3A", false, "Luxord","TWTNW");
				settings.Add("12-0F-38", false, "Saix","TWTNW");
				settings.Add("12-13-3B", true , "Xemnas 1","TWTNW");

			settings.Add("KH", true, "Final Fights","any");
				settings.Add("12-19-46", false, "Core","KH");
				settings.Add("12-18-47", false, "Armored Xemnas 1","KH");
				settings.Add("12-16-48", false, "Dragon Xemnas","KH");
				settings.Add("12-17-49", false, "Armored Xemnas 2","KH");
				settings.Add("12-14-4A", true , "Final Xemnas","KH");
				
		settings.Add("AW", false, "All Remainder Optional Worlds");
			settings.Add("PL", false, "Pride Lands","AW");
				settings.Add("0A-02-33", false, "Hyena Battle (Protect Timon/Pumbaa)","PL");
				settings.Add("0A-0E-37", true , "Scar","PL");
				settings.Add("0A-05-39", false, "Graveyard: Three Hyena Fight","PL");
				settings.Add("0A-0F-3B", true , "Ground Shaker","PL");
			settings.Add("SP2", false, "Space Paranoids 2","AW");
				settings.Add("11-02-35", false, "Light Cycle Battle","SP2");
				settings.Add("11-04-38", false, "I/O Tower: Hallway battle","SP2");
				settings.Add("11-07-39", false, "Solar Sailor Simulation","SP2");
				settings.Add("11-09-3A", false, "Sark","SP2");
				settings.Add("11-09-3B", true , "MCP (with Sark)","SP2");
			settings.Add("100AW", false, "100 Acre Woods","AW");
				settings.Add("100AWNS", false, "Not Supported at the Moment.","100AW");
			settings.Add("OC2", false, "Olympus Coliseum 2","AW");
				settings.Add("06-06-7E", false, "Nobodies Fight","OC2");
				settings.Add("06-13-CA", true, "Hades","OC2");
			settings.Add("ATL", false, "Atlantica","AW");
				settings.Add("ATLNS", false, "Not Supported at the Moment.","ATL");		
				
		settings.Add("Super", false, "All Super Bosses, and Absent Silhouettes");
			settings.Add("Silh", false, "Absent Silhouettes", "Super");
				settings.Add("04-20-73", false, "AS Vexen","Silh");
				settings.Add("04-21-8E", false, "AS Lexaeus","Silh");
				settings.Add("04-21-8F", false, "AS Larxene","Silh");
				settings.Add("04-22-97", false, "AS Zexion","Silh");
				settings.Add("04-26-91", false, "AS Marluxia","Silh");
			settings.Add("0C-07-44", true, "Terra","Super");
			settings.Add("04-01-4B", true, "Sephiroth","Super");
		settings.Add("Data", false, "Data Org");
			settings.Add("02-14-D5", true, "Data Axel","Data");
			settings.Add("04-04-72", true, "Data Demyx","Data");
			settings.Add("04-20-92", true, "Data Vexen","Data");
			settings.Add("04-21-93", true, "Data Lexaeus","Data");
			settings.Add("04-21-94", true, "Data Larxene","Data");
			settings.Add("04-22-98", true, "Data Zexion","Data");
			settings.Add("04-26-96", true, "Data Marluxia","Data");
			settings.Add("05-0F-61", true, "Data Xaldin","Data");
			settings.Add("12-0A-64", true, "Data Xigbar","Data");
			settings.Add("12-0E-65", true, "Data Luxord","Data");
			settings.Add("12-0F-66", true, "Data Saix","Data");
			settings.Add("12-13-61", true, "Data Xemnas","Data");
			settings.Add("12-14-62", true, "Data Final Xemnas","Data");
			settings.Add("12-15-63", true, "Data Roxas","Data");
			
		settings.Add("GC", false, "(Experimental) Gold Crown / Jimminy's Journal 100%");
			settings.Add("GCNote", false, "There's a lot that goes into a GC/JJ run. "+
						"Bear with us as we find ways to create them.","GC");
}

reset
{
	if (current.titlescreen != 1)return;
	
	if(vars.startCounter==0 && current.newgame==4){
		vars.startCounter = 1;
	}
	if(vars.startCounter==1){	
		if(current.tempMemBank == 0){
			vars.startCounter = 0;
		}
		else if(current.newgame == 2){
			vars.startCounter = 2;
			return true;
		}
	}
}

start
{
	if (current.titlescreen != 1)return;
	
	if(vars.startCounter==0 && current.newgame==4)vars.startCounter = 1;
	
	if(vars.startCounter==1){	
		if(current.tempMemBank == 0)vars.startCounter = 0;
		else if(current.newgame == 2)vars.startCounter = 2;
	}
	
	if(vars.startCounter==2){
		if(current.newgame == 4)vars.startCounter = 1;
		else if(current.tempMemBank == 0){
			vars.startCounter = 0;
			return true;
		}
	}
}

split
{	
	if(vars.startCounter != 0 && current.titlescreen == 0)vars.startCounter = 0;
	
	string currentLocation = string.Format("{0:X2}-{1:X2}-{2:X2}", current.worldID, current.roomID, current.eventID3);
	string oldLocation     = string.Format("{0:X2}-{1:X2}-{2:X2}", old.worldID, old.roomID, old.eventID3);
	
	//Conditional cases if Sora or specific things need to survive
	switch (currentLocation) {
		case "12-14-4A": 
		case "12-14-69":
		case "10-0A-3C":
			if(current.storyHP == 0 || current.soraHP == 0)vars.splitTimer = 10;
			break;
		case "04-04-37":
		case "04-04-72":
			if(current.cloneCount > 0 || current.soraHP == 0)vars.splitTimer = 10;
			break;
		case "08-07-4C":
			if(current.storyHP == 228 && old.storyHP > 228)return settings[currentLocation];
			break;
		case "04-08-34":
		case "08-01-44":
		case "08-01-46":
		case "08-02-45":
		case "08-02-50":
		case "08-03-47":
		case "08-09-4B":
		case "12-0E-3A":
		case "12-0E-65":
			if (current.soraGauge == 0 || current.soraHP == 0)vars.splitTimer = 10;
			break;
		case "0A-02-33":
		case "0C-02-01":
		case "0C-00-33":
		case "0D-04-36":
		case "0D-06-38":
		case "0D-05-37":
		case "0D-07-39":
		case "11-07-39":
			if (current.soraGauge == 17096 || current.soraHP == 0)vars.splitTimer = 20;
			break;
		case "10-07-3A":
			if ((current.medalTimer!=old.medalTimer && current.medalTimer == 0) || current.soraHP == 0)vars.splitTimer = 20;
			break;
		/*case "AS Marluxia & Data Marluxia":
			-> Get 'hitCount' variable 
			if (hitCount == 0 || current.soraHP == 0)vars.splitTimer = 10;
			break;
		*/
		default:
			if(current.soraHP == 0)vars.splitTimer = 10;
			break;
	}
	if(current.fightend == false && vars.splitTimer > 0){
		vars.splitTimer = --vars.splitTimer;
		//print(vars.splitTimer.ToString());
		return;
	}
	if (currentLocation!=oldLocation){
		//print("C:"+currentLocation+" O:"+oldLocation);
		switch(oldLocation) {
			case "02-02-48":
			case "02-08-6C":
			case "02-1C-04":
			case "04-0D-08":
			case "06-05-6F":
			case "08-03-47":
			case "12-19-46":
				return settings[oldLocation];
				break;
			case "02-0E-05":
				vars.splitTimer = 100;
			break;
			case "05-03-14":
				if (current.worldID == 0x0F){
					vars.splitTimer = 1800;
					return settings[oldLocation+"-W"];
				}
				break;	
			default:
				break;
		}
	}
	if(current.fightend!=old.fightend){
		//print("Fight ended! Loc: "+currentLocation);
		vars.splitTimer = 10;
		return settings[currentLocation];
	}
}

exit
{
	vars.booting = true;
	timer.IsGameTimePaused = true;
}

update
{
	if(vars.booting && current.titlescreen == 1)vars.booting = false;
}

isLoading
{
	return current.load || current.saveload || current.black==128;
}
