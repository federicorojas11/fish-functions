

## variables
set fishpath ~/.config/fish/
set now (date)

## funciones

# sudo !!
function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

# find file 
function f
	cd
	find . -name $argv
end

# add to fish config file
function a
	pwd
	cd ~/.config/fish/
	$argv >> config.fish
end

function screenPath 
	gsettings set org.gnome.gnome-screenshot auto-save-directory $argv
end

function pics 
	cd 
	cd Pictures/
	xdg-open .
end

function hdd
	cd
	cd ../../media/pro-user/Nuevo\ vol/
end

function docs
	cd 
	cd Documents
end

function cff
	fp
	git add config.fish
	git diff
	git status
end

function pff
	cff
	git commit -m "$argv $now"
	git log --pretty=oneline 
end

function pffa
	cff
	git commit -m "$argv $now" --amend
	git log --pretty=oneline
end 

## aliases
alias fp "cd $fishpath"
alias cfg "sudo nano ~/.config/fish/config.fish"
alias pcfg "cat ~/.config/fish/config.fish"
alias pnow "printf (date)"

