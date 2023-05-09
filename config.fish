

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
	sudo find . -name $argv
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

# keyboard
function rgb
	xset led 3
end

function rgboff
	xset led off
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

# projects
function projects
	docs
	cd projects
	if count $argv > /dev/null
         cd $argv
	end
end

function tokenizador
	projects
	cd tokenizador
end

function code-verifier
	nohup postman & disown #abrir postman desde cmd y liberar terminal 
	projects
	cd code-verifier-backend
	code .; clear;
end

function katas-code-verifier-react
	projects
	cd code-verifier-react
	code .; clear;
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

function grm 
	git remote -v
end

function grb 
	git rebase origin/$argv
end

function gp
	git push
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
rvm default
rvm default
