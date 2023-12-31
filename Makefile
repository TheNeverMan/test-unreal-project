# Makefile generated by MakefileGenerator.cs
# *DO NOT EDIT*

UNREALROOTPATH = /home/leopoldkucinski/Dokumenty/Unreal
GAMEPROJECTFILE =/home/leopoldkucinski/Dokumenty/Unreal Projects/Test/Test.uproject

TARGETS = \
	Test-Linux-DebugGame  \
	Test-Linux-Shipping  \
	Test \
	TestEditor-Linux-DebugGame  \
	TestEditor-Linux-Shipping  \
	TestEditor \
	UnrealEditor-Linux-DebugGame  \
	UnrealEditor-Linux-Shipping  \
	UnrealEditor \
	UnrealGame-Linux-DebugGame  \
	UnrealGame-Linux-Shipping  \
	UnrealGame\
	configure

BUILD = bash "$(UNREALROOTPATH)/Engine/Build/BatchFiles/Linux/Build.sh"
PROJECTBUILD = "$(UNREALROOTPATH)/Engine/Binaries/ThirdParty/DotNet/6.0.302/linux/dotnet" "$(UNREALROOTPATH)/Engine/Binaries/DotNET/UnrealBuildTool/UnrealBuildTool.dll"

all: StandardSet

RequiredTools: CrashReportClient-Linux-Shipping CrashReportClientEditor-Linux-Shipping ShaderCompileWorker UnrealLightmass EpicWebHelper-Linux-Shipping

StandardSet: RequiredTools UnrealFrontend TestEditor UnrealInsights

DebugSet: RequiredTools UnrealFrontend-Linux-Debug TestEditor-Linux-Debug


Test-Linux-DebugGame:
	 $(PROJECTBUILD) Test Linux DebugGame  -project="$(GAMEPROJECTFILE)" $(ARGS)

Test-Linux-Shipping:
	 $(PROJECTBUILD) Test Linux Shipping  -project="$(GAMEPROJECTFILE)" $(ARGS)

Test:
	 $(PROJECTBUILD) Test Linux Development  -project="$(GAMEPROJECTFILE)" $(ARGS)

TestEditor-Linux-DebugGame:
	 $(PROJECTBUILD) TestEditor Linux DebugGame  -project="$(GAMEPROJECTFILE)" $(ARGS)

TestEditor-Linux-Shipping:
	 $(PROJECTBUILD) TestEditor Linux Shipping  -project="$(GAMEPROJECTFILE)" $(ARGS)

TestEditor:
	 $(PROJECTBUILD) TestEditor Linux Development  -project="$(GAMEPROJECTFILE)" $(ARGS)

UnrealEditor-Linux-DebugGame:
	 $(BUILD) UnrealEditor Linux DebugGame  -project="$(GAMEPROJECTFILE)" $(ARGS)

UnrealEditor-Linux-Shipping:
	 $(BUILD) UnrealEditor Linux Shipping  -project="$(GAMEPROJECTFILE)" $(ARGS)

UnrealEditor:
	 $(BUILD) UnrealEditor Linux Development  -project="$(GAMEPROJECTFILE)" $(ARGS)

UnrealGame-Linux-DebugGame:
	 $(BUILD) UnrealGame Linux DebugGame  -project="$(GAMEPROJECTFILE)" $(ARGS)

UnrealGame-Linux-Shipping:
	 $(BUILD) UnrealGame Linux Shipping  -project="$(GAMEPROJECTFILE)" $(ARGS)

UnrealGame:
	 $(BUILD) UnrealGame Linux Development  -project="$(GAMEPROJECTFILE)" $(ARGS)

configure:
	xbuild /property:Configuration=Development /verbosity:quiet /nologo "$(UNREALROOTPATH)/Engine/Source/Programs/UnrealBuildTool/UnrealBuildTool.csproj"
	$(PROJECTBUILD) -projectfiles -project="\"$(GAMEPROJECTFILE)\"" -game -engine 

.PHONY: $(TARGETS)
