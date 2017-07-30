; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Firebird Replication Engine"
#define MyAppVersion "4.0.5"
#define MyAppPublisher "SieraDelta"
#define MyAppURL "http://www.sieradelta.com"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{42B87568-8A4B-4CCB-A65E-15BEECFBB129}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppPublisher}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile=T:\SieraDelta\Replication\Install\ReplicationLicence.txt
OutputDir=T:\SieraDelta\Replication\Install
OutputBaseFilename=ReplicationEngineSetup_v_{#MyAppVersion}
SetupIconFile=T:\VS2012 Modern Image Library\Objects\ico\Server_5720.ico
Compression=lzma
SolidCompression=yes
AppCopyright=Copyright (c) 2012 - 2017.  SieraDelta.com
ShowLanguageDialog=no
InternalCompressLevel=ultra

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]

[Files]
Source: "T:\SieraDelta\Replication\Replication.Service\bin\Debug\ErrorManager.ErrorClient.dll"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: Service
Source: "T:\SieraDelta\Replication\Replication.Service\bin\Debug\FirebirdSql.Data.FirebirdClient.dll"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: Service
Source: "T:\SieraDelta\Replication\Replication.Service\bin\Debug\ICSharpCode.SharpZipLib.dll"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: Service
Source: "T:\SieraDelta\Replication\Replication.Service\bin\Debug\Replication.Engine.dll"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: Service
Source: "T:\SieraDelta\Replication\Replication.Console\bin\Debug\Replication.Service.Console.exe"; DestDir: "{app}"; Flags: ignoreversion restartreplace uninsrestartdelete; Components: Service
Source: "T:\SieraDelta\Replication\Replication.Service\bin\Debug\Replication.Service.exe"; DestDir: "{app}"; Flags: ignoreversion restartreplace uninsrestartdelete; Components: Service
Source: "T:\SieraDelta\Replication\Replication.Service\bin\Debug\SieraDelta.Cloud.dll"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: Service
Source: "T:\SieraDelta\Replication\Replication.Service\bin\Debug\SieraDelta.Controls.dll"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: Service
Source: "T:\SieraDelta\Replication\Replication.Service\bin\Debug\SieraDelta.Languages.dll"; DestDir: "{app}"; Flags: ignoreversion; Components: Service
Source: "T:\SieraDelta\Replication\Replication.Service\bin\Debug\SieraDelta.Library.dll"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: Service
Source: "T:\SieraDelta\Replication\Replication.Service\bin\Debug\SieraDelta.Shared.dll"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: Service
Source: "T:\SieraDelta\Replication\Replication.Service\bin\Debug\WebDefender.dll"; DestDir: "{app}"; Flags: ignoreversion; Components: Service
Source: "T:\SieraDelta\Replication\Manual\Replication Manual.pdf"; DestDir: "{app}\Docs"; Flags: ignoreversion; Components: Service
Source: "T:\SieraDelta\Replication\Install\ReplicationLicence.txt"; DestDir: "{app}"; Flags: ignoreversion; Components: Service
Source: "T:\SieraDelta\Replication\Install\SieraDelta Home Page.url"; DestDir: "{app}"; Flags: ignoreversion; Components: Service

[Run]
Filename: "{app}\Replication.Service.exe"; Parameters: "/i"; WorkingDir: "{app}"; Flags: runascurrentuser shellexec; Description: "Install Service Application"; StatusMsg: "Install Service Application"
Filename: "{app}\Docs\Replication Manual.pdf"; Flags: postinstall shellexec skipifdoesntexist nowait
Filename: "{app}\ReplicationLicence.txt"; Flags: postinstall shellexec skipifdoesntexist nowait; Description: "View Licence"

[UninstallRun]
Filename: "{app}\Replication.Service.exe"; Parameters: "/u"; WorkingDir: "{app}"; Flags: waituntilterminated runhidden

[Components]
Name: "Service"; Description: "Firebird Replication Engine"; Types: full custom compact; Check: InitializeSetup

[Dirs]
Name: "{app}"; Flags: uninsalwaysuninstall; Components: Service; Permissions: everyone-full
Name: "{app}\Docs"; Flags: uninsalwaysuninstall; Components: Service; Permissions: everyone-full
Name: "{app}\Logs"; Flags: uninsalwaysuninstall; Components: Service; Permissions: everyone-full
Name: "{app}\Errors"; Flags: uninsalwaysuninstall; Components: Service; Permissions: everyone-full
Name: "{app}\Config"; Flags: uninsalwaysuninstall; Components: Service; Permissions: everyone-full

[Icons]
Name: "{app}\Configure Databases"; Filename: "{app}\Replication.Service.exe"; WorkingDir: "{app}"; IconFilename: "{app}\Replication.Service.exe"; IconIndex: 0; Parameters: "/c"; Components: Service

[Code]
const
  SERVICE_NAME = 'Firebird Replication Engine';

type
	SERVICE_STATUS = record
    	dwServiceType				: cardinal;
    	dwCurrentState				: cardinal;
    	dwControlsAccepted			: cardinal;
    	dwWin32ExitCode				: cardinal;
    	dwServiceSpecificExitCode	: cardinal;
    	dwCheckPoint				: cardinal;
    	dwWaitHint					: cardinal;
	end;
	HANDLE = cardinal;

const
	SERVICE_QUERY_CONFIG		= $1;
	SERVICE_CHANGE_CONFIG		= $2;
	SERVICE_QUERY_STATUS		= $4;
	SERVICE_START				= $10;
	SERVICE_STOP				= $20;
	SERVICE_ALL_ACCESS			= $f01ff;
	SC_MANAGER_ALL_ACCESS		= $f003f;
	SERVICE_WIN32_OWN_PROCESS	= $10;
	SERVICE_WIN32_SHARE_PROCESS	= $20;
	SERVICE_WIN32				= $30;
	SERVICE_INTERACTIVE_PROCESS = $100;
	SERVICE_BOOT_START          = $0;
	SERVICE_SYSTEM_START        = $1;
	SERVICE_AUTO_START          = $2;
	SERVICE_DEMAND_START        = $3;
	SERVICE_DISABLED            = $4;
	SERVICE_DELETE              = $10000;
	SERVICE_CONTROL_STOP		= $1;
	SERVICE_CONTROL_PAUSE		= $2;
	SERVICE_CONTROL_CONTINUE	= $3;
	SERVICE_CONTROL_INTERROGATE = $4;
	SERVICE_STOPPED				= $1;
	SERVICE_START_PENDING       = $2;
	SERVICE_STOP_PENDING        = $3;
	SERVICE_RUNNING             = $4;
	SERVICE_CONTINUE_PENDING    = $5;
	SERVICE_PAUSE_PENDING       = $6;
	SERVICE_PAUSED              = $7;

type
  //
  // Enumeration used to specify a .NET framework version 
  //
  TDotNetFramework = (
    DotNet_v11_4322,  // .NET Framework 1.1
    DotNet_v20_50727, // .NET Framework 2.0
    DotNet_v30,       // .NET Framework 3.0
    DotNet_v35,       // .NET Framework 3.5
    DotNet_v4_Client, // .NET Framework 4.0 Client Profile
    DotNet_v4_Full,   // .NET Framework 4.0 Full Installation
    DotNet_v45);      // .NET Framework 4.5


var
  PageInstallType: TInputOptionWizardPage;
  PageSelectServer: TInputOptionWizardPage;
  installType: Integer;
  serverName: String;
  svcContents: string;
  posContents: string;
  posXML: string;
  svcXML: string;
  bCanContinue: boolean;

const 
  crlf = #13#10;

//
// Checks whether the specified .NET Framework version and service pack
// is installed (See: http://www.kynosarges.de/DotNetVersion.html)
//
// Parameters:
//   Version     - Required .NET Framework version
//   ServicePack - Required service pack level (0: None, 1: SP1, 2: SP2 etc.)
//
function IsDotNetInstalled(Version: TDotNetFramework; ServicePack: cardinal): boolean;
var
    KeyName      : string;
    Check45      : boolean;
    Success      : boolean;
    InstallFlag  : cardinal; 
    ReleaseVer   : cardinal;
    ServiceCount : cardinal;
begin
    // Registry path for the requested .NET Version
    KeyName := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\';

    case Version of
      DotNet_v11_4322:  KeyName := KeyName + 'v1.1.4322';
      DotNet_v20_50727: KeyName := KeyName + 'v2.0.50727';
      DotNet_v30:       KeyName := KeyName + 'v3.0';
      DotNet_v35:       KeyName := KeyName + 'v3.5';
      DotNet_v4_Client: KeyName := KeyName + 'v4\Client';
      DotNet_v4_Full:   KeyName := KeyName + 'v4\Full';
      DotNet_v45:       KeyName := KeyName + 'v4\Full';
    end;

    // .NET 3.0 uses "InstallSuccess" key in subkey Setup
    if (Version = DotNet_v30) then
      Success := RegQueryDWordValue(HKLM, KeyName + '\Setup', 'InstallSuccess', InstallFlag) else
      Success := RegQueryDWordValue(HKLM, KeyName, 'Install', InstallFlag);

    // .NET 4.0/4.5 uses "Servicing" key instead of "SP"
    if (Version = DotNet_v4_Client) or
       (Version = DotNet_v4_Full) or
       (Version = DotNet_v45) then
      Success := Success and RegQueryDWordValue(HKLM, KeyName, 'Servicing', ServiceCount) else
      Success := Success and RegQueryDWordValue(HKLM, KeyName, 'SP', ServiceCount);

    // .NET 4.5 is distinguished from .NET 4.0 by the Release key
    if (Version = DotNet_v45) then
      begin
        Success := Success and RegQueryDWordValue(HKLM, KeyName, 'Release', ReleaseVer);
        Success := Success and (ReleaseVer >= 378389);
      end;

    Result := Success and (InstallFlag = 1) and (ServiceCount >= ServicePack);
end;

function BoolToStr(b: Boolean): string;
begin
  if (b) then
  begin
    Result := 'true';
  end else
  begin
    Result := 'false';
  end
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if (PageID = wpSelectComponents) then
    Result := (PageID = wpSelectComponents);
end;

// #######################################################################################
// nt based service utilities
// #######################################################################################
function OpenSCManager(lpMachineName, lpDatabaseName: string; dwDesiredAccess :cardinal): HANDLE;
external 'OpenSCManagerA@advapi32.dll stdcall';

function OpenService(hSCManager :HANDLE;lpServiceName: string; dwDesiredAccess :cardinal): HANDLE;
external 'OpenServiceA@advapi32.dll stdcall';

function CloseServiceHandle(hSCObject :HANDLE): boolean;
external 'CloseServiceHandle@advapi32.dll stdcall';

function CreateService(hSCManager :HANDLE;lpServiceName, lpDisplayName: string;dwDesiredAccess,dwServiceType,dwStartType,dwErrorControl: cardinal;lpBinaryPathName,lpLoadOrderGroup: String; lpdwTagId : cardinal;lpDependencies,lpServiceStartName,lpPassword :string): cardinal;
external 'CreateServiceA@advapi32.dll stdcall';

function DeleteService(hService :HANDLE): boolean;
external 'DeleteService@advapi32.dll stdcall';

function StartNTService(hService :HANDLE;dwNumServiceArgs : cardinal;lpServiceArgVectors : cardinal) : boolean;
external 'StartServiceA@advapi32.dll stdcall';

function ControlService(hService :HANDLE; dwControl :cardinal;var ServiceStatus :SERVICE_STATUS) : boolean;
external 'ControlService@advapi32.dll stdcall';

function QueryServiceStatus(hService :HANDLE;var ServiceStatus :SERVICE_STATUS) : boolean;
external 'QueryServiceStatus@advapi32.dll stdcall';

function QueryServiceStatusEx(hService :HANDLE;ServiceStatus :SERVICE_STATUS) : boolean;
external 'QueryServiceStatus@advapi32.dll stdcall';

function OpenServiceManager() : HANDLE;
begin
	if UsingWinNT() = true then begin
		Result := OpenSCManager('','ServicesActive',SC_MANAGER_ALL_ACCESS);
		if Result = 0 then
			MsgBox('the servicemanager is not available', mbError, MB_OK)
	end
	else begin
			MsgBox('only nt based systems support services', mbError, MB_OK)
			Result := 0;
	end
end;

function IsServiceInstalled(ServiceName: string) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := OpenService(hSCM,ServiceName,SERVICE_QUERY_CONFIG);
        if hService <> 0 then begin
            Result := true;
            CloseServiceHandle(hService)
		end;
        CloseServiceHandle(hSCM)
	end
end;

function InstallService(FileName, ServiceName, DisplayName, Description : string;ServiceType,StartType :cardinal) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := CreateService(hSCM,ServiceName,DisplayName,SERVICE_ALL_ACCESS,ServiceType,StartType,0,FileName,'',0,'','','');
		if hService <> 0 then begin
			Result := true;
			// Win2K & WinXP supports aditional description text for services
			if Description<> '' then
				RegWriteStringValue(HKLM,'System\CurrentControlSet\Services' + ServiceName,'Description',Description);
			CloseServiceHandle(hService)
		end;
        CloseServiceHandle(hSCM)
	end
end;

function RemoveService(ServiceName: string) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := OpenService(hSCM,ServiceName,SERVICE_DELETE);
        if hService <> 0 then begin
            Result := DeleteService(hService);
            CloseServiceHandle(hService)
		end;
        CloseServiceHandle(hSCM)
	end
end;

function StartService(ServiceName: string) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := OpenService(hSCM,ServiceName,SERVICE_START);
        if hService <> 0 then begin
        	Result := StartNTService(hService,0,0);
            CloseServiceHandle(hService)
		end;
        CloseServiceHandle(hSCM)
	end;
end;

function StopService(ServiceName: string) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
	Status	: SERVICE_STATUS;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := OpenService(hSCM,ServiceName,SERVICE_STOP);
        if hService <> 0 then begin
        	Result := ControlService(hService,SERVICE_CONTROL_STOP,Status);
            CloseServiceHandle(hService)
		end;
        CloseServiceHandle(hSCM)
	end;
end;

function IsServiceRunning(ServiceName: string) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
	Status	: SERVICE_STATUS;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := OpenService(hSCM,ServiceName,SERVICE_QUERY_STATUS);
    	if hService <> 0 then begin
			if QueryServiceStatus(hService,Status) then begin
				Result :=(Status.dwCurrentState = SERVICE_RUNNING)
        	end;
            CloseServiceHandle(hService)
		    end;
        CloseServiceHandle(hSCM)
	end
end;


// #######################################################################################
// create an entry in the services file
// #######################################################################################
function SetupService(service, port, comment: string) : boolean;
var
	filename	: string;
	s			: string;
	lines		: TArrayOfString;
	n			: longint;
	i			: longint;
	errcode		: integer;
	servnamlen	: integer;
	error		: boolean;
begin
	if UsingWinNT() = true then
		filename := ExpandConstant('{sys}\drivers\etc\services')
	else
		filename := ExpandConstant('{win}\services');

	if LoadStringsFromFile(filename,lines) = true then 
  begin
		Result		:= true;
		n			:= GetArrayLength(lines) - 1;
		servnamlen	:= Length(service);
		error		:= false;

		for i:=0 to n do begin
			if Copy(lines[i],1,1) <> '#' then 
      begin
				s := Copy(lines[i],1,servnamlen);
				if CompareText(s,service) = 0 then
					exit; // found service-entry

				if Pos(port,lines[i]) > 0 then 
        begin
					error := true;
					lines[i] := '#' + lines[i] + '   # disabled because collision with  ' + service + ' service';
				end;
			end
			else if CompareText(Copy(lines[i],2,servnamlen),service) = 0 then begin
				// service-entry was disabled
				Delete(lines[i],1,1);
				Result := SaveStringsToFile(filename,lines,false);
				exit;
			end;
		end;

		if error = true then 
    begin
			// save disabled entries
			if SaveStringsToFile(filename,lines,false) = false then 
      begin
				Result := false;
				exit;
			end;
		end;

		// create new service entry
		s := service + '       ' + port + '           # ' + comment + #13#10;
		if SaveStringToFile(filename,s,true) = false then begin
			Result := false;
			exit;
		end;

		if (error) then 
    begin
			MsgBox('the ' + service + ' port was already used. The old service is disabled now. You should check the services file manually now.',mbInformation,MB_OK);
		end;
	end
	else
		Result := false;
end;



function GetCustomSetupExitCode: Integer;
begin
  if (not IsServiceRunning(SERVICE_NAME)) then
  begin
    if (not StartService(SERVICE_NAME)) then
    begin
      MsgBox('Failed to start ' + SERVICE_NAME + 
        ' service.#13#13Please start the service named ' + SERVICE_NAME +
        ' manually.', mbInformation, MB_OK);
    end;
  end;

  Result := 0;
end;

function InitializeSetup(): Boolean;
begin
    if not IsDotNetInstalled(DotNet_v4_Client, 0) then begin
        MsgBox('SieraDelta Firebird Replication Engine requires Microsoft .NET Framework 4.0 Client Profile.'#13#13
            'Please use Windows Update to install this version,'#13
            'and then re-run the SieraDelta Firebird Replication Engine setup program.', mbInformation, MB_OK);
        result := false;
    end else
        result := true;


    if (result) then
    begin

    end
end;