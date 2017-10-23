#!/bin/bash
# Main program for installing DiskUsage
# Available here: https://goo.gl/jFBwts

# STATIC VARIABLES:
RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'

# PROGRAM FUNCTIONS
check_su () {
	if [[ $EUID -ne 0 ]]; then
		echo -e "You ${RED} MUST EXECUTE THIS PROGRAM ${NC} as ${CYAN}root${NC}"
		echo -e "Please, visit this web-page to know ${YELLOW}HOW TO MANUALLY INSTALL DiskUsage${NC}: https://goo.gl/BgrVND"
		exit 1
	else
		isOK=true
	fi
}

wget_function () {
	if $nInstall; then
		wget https://goo.gl/V1SsQj && mv V1SsQj DiskUsage_INSTALLATION/dusage
	else
		wget https://goo.gl/V1SsQj && mv V1SsQj DiskUsage/dusage && chmod +x DiskUsage/dusage
	fi
}

makeBin () {
	cp DiskUsage_INSTALLATION/dusage /bin/
}

setPermissions () {
	chmod +x /bin/dusage
}

createFolder () {
	if $nInstall; then
		mkdir DiskUsage_INSTALLATION
	else
		mkdir DiskUsage
	fi
}

cleanFolders () {
	rm -rf DiskUsage_INSTALLATION
}

helpFunction () {
	echo -e "${CYAN}DiskUsage command for listing files, folders and more and get how much space they are using${NC}"
	echo ""
	echo -e "Use this command with ${YELLOW}no arguments ${NC}and installation will start (make sure to run it as ${CYAN}root${NC})"
	echo -e "Add option ${RED} -c ${NC} for getting only the installation file (for manual installation)"
	echo ""
	echo "For more information, please visit this web-page: https://goo.gl/jFBwts"
	exit 0
}

# MAIN PROGRAM

isOK=false
nInstall=false

case "$1" in
	"")	check_su
		if $isOK; then
			nInstall=true
			createFolder
			wget_function
			makeBin
			setPermissions
			echo -e "Apparently ${YELLOW} everything has gone well${NC}. For checking, just run ${CYAN}which dusage${NC} and \"/bin/dusage\" should appear. If not, try ${RED}reinstalling or doing it manually${NC}"
			cleanFolders
			exit 0
		else
			echo "Please, run this program as root"
			exit 1
		fi
		;;
	-c)	createFolder
		wget_function
		echo -e "${BLUE}Your file is located at: DiskUsage/ folder${NC}"
		exit 0
		;;
	-h)	helpFunction
		;;
	*)	echo -e "${RED}INVALID ARGUMENT${NC}. Please, run ${YELLOW}./autorun.sh -h${NC} for getting help"
		exit 1
		;;
esac

