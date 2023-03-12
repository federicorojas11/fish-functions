

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

# cd paths
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

function projects
	docs
	cd projects
end

# fish functions git commit comands
function aff
	fp
	git diff
	git add config.fish
	git add README.md
	git status
end

function cff
	aff
	git commit -m "$argv $now"
	git log --pretty=oneline 
end

function cffa
	aff
	git commit -m "$argv $now" --amend
	git log --pretty=oneline
end 

function pff
	fp
	git push origin main
end

# git commands
function gc
	git commit -m "$argv"
end

function gca 
	git commit -m "$argv" --amend
end

function gr
	git rebase origin/$argv
end

## aliases
alias fp "cd $fishpath"
alias cfg "sudo nano -c ~/.config/fish/config.fish"
alias pcfg "cat ~/.config/fish/config.fish"
alias pnow "printf (date)"
alias gf "git fetch"
alias gs "git status"
alias gl "git log --oneline"
alias ga "git add ."
