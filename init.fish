# casperbiering-fish-config initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies

# Configure bobthefish theme
set -g theme_display_git_master_branch yes
set -g theme_display_vagrant no
set -g theme_title_display_process yes
set -g theme_display_k8s_context no
set -g theme_display_virtualenv no
set -g theme_display_hg no
set -g theme_display_ruby no
set -g theme_display_vi no
set -g theme_show_exit_status yes
#set -g theme_title_display_user yes
set -g fish_prompt_pwd_dir_length 0
set -g theme_color_scheme dark
set -g theme_display_git_ahead_verbose yes
#set -g theme_display_git_dirty_verbose yes
#set -g theme_powerline_fonts no

# Misc abbr
abbr -a -- - 'cd -'
abbr -a l1 'less --shift 1'

# Git abbr
abbr -a ga 'git add'
abbr -a gap 'git add -p'
abbr -a gb 'git branch'
abbr -a gba 'git branch -a'
abbr -a gbc 'git checkout -b'
abbr -a gc 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a gcd 'git checkout develop'
abbr -a gci 'git commit'
abbr -a gcia 'git commit --amend'
abbr -a gcm 'git checkout master'
abbr -a gcp 'git checkout -p'
abbr -a gd 'git diff'
abbr -a gdc 'git diff --cached'
abbr -a gf 'git fetch'
abbr -a gfp 'git fetch -p'
abbr -a gg 'git grep -i'
abbr -a ggc 'git grep'
abbr -a gl 'git log --name-status'
abbr -a gm 'git merge --ff-only'
abbr -a gmd 'git merge --ff-only develop'
abbr -a gmmc 'git merge --no-ff'
abbr -a gph 'git push'
abbr -a gphf 'git push -f'
abbr -a gphod 'git push origin HEAD:develop'
abbr -a gphu 'git push -u'
abbr -a gpl 'git pull'
abbr -a gr 'git reset'
abbr -a grb 'git rebase -i'
abbr -a grh 'git reset HEAD'
abbr -a grod 'git rebase -i origin/develop'
abbr -a gs 'git status'
abbr -a gsh 'git show'
abbr -a gst 'git stash'
abbr -a gstp 'git stash pop'

function gclb -d "Clean local branch in git"
	git branch --no-column -q --no-color | \
		awk '{print $1}' | \
		egrep -v '(master|develop|\*)' | \
		xargs git branch -d
end

function gcbod -d "Checkout new branch from origin/develop"
	gcb "$1" origin/develop
	gb --unset-upstream
end
