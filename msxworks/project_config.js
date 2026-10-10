//*****************************************************************************
// MSX-Works - build configuration (MSXgl build tool)
//*****************************************************************************

//-- Project name. Output: MSXWORKS.COM (8.3 file name)
ProjName = "msxworks";

//-- Project source modules
ProjModules = [ ProjName, "screen", "document", "editor" ];

//-- MSXgl library modules
LibModules = [ "system", "bios", "vdp", "dos", "dos_mapper", "input" ];

//-- Target machine: MSX2+
Machine = "2P";

//-- Target program format: MSX-DOS 2 .COM (starting at 0100h)
Target = "DOS2";

//-- Version check is done by the program itself (crt0 check is ROM/BIOS oriented)
CheckVersion = false;

//-- No command-line arguments for now (main has no parameters)
DOSParseArg = false;

//-- Application signature
AppSignature = true;
AppCompany = "MW";
AppID = "MW";

//-- Code optimization
Optim = "Size";
CompileComplexity = "Default";

//-- Build tool output
Verbose = false;
