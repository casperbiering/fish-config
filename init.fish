# casperbiering-fish-config initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies

# Expand user path
if test -d ~/.local/bin
	set -xg PATH $PATH ~/.local/bin
end
if test -d ~/bin
	set -xg PATH $PATH ~/bin
end

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
set -g fish_prompt_pwd_dir_length 4
set -g theme_project_dir_length 4
set -g theme_color_scheme dark
set -g theme_display_git_ahead_verbose yes
#set -g theme_display_git_dirty_verbose yes
#set -g theme_powerline_fonts no

# Misc abbr
abbr -a -- - 'cd -'
abbr -a l1 'less --shift 1'
abbr -a g 'grep'
abbr -a gi 'grep -i'

# Git abbr
abbr -a ga 'git add'
abbr -a gap 'git add -p'
abbr -a gb 'git branch'
abbr -a gba 'git branch -a'
abbr -a gbc 'git checkout -b'
abbr -a gbcod 'git-checkout-branch-origin-develop'
abbr -a gc 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a gcbod 'git-checkout-branch-origin-develop'
abbr -a gcd 'git checkout develop'
abbr -a gcf 'git clean -d -f'
abbr -a gci 'git commit'
abbr -a gcia 'git commit --amend'
abbr -a gclb 'git-clean-local-branches'
abbr -a gcm 'git checkout master'
abbr -a gcn 'git clean -d -n'
abbr -a gcp 'git checkout -p'
abbr -a gd 'git diff'
abbr -a gdc 'git diff --cached'
abbr -a gf 'git fetch'
abbr -a gfp 'git fetch -p'
abbr -a gg 'git grep -i'
abbr -a ggc 'git grep'
abbr -a gl 'git log --name-status'
abbr -a glp 'git log -p'
abbr -a gm 'git merge --ff-only'
abbr -a gmd 'git merge --ff-only develop'
abbr -a gmmc 'git merge --no-ff'
abbr -a gmt 'git mergetool'
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

# Docker abbr
abbr -a dl 'docker-compose logs -f --tail=10'

# Kubectl
abbr -a k 'kubectl'

abbr -a kg 'kubectl get'
abbr -a kgd 'kubectl get deployment'
abbr -a kgp 'kubectl get pods'
abbr -a kgi 'kubectl get ingress'
abbr -a kgs 'kubectl get service'
abbr -a kgse 'kubectl get secret'
abbr -a kgc 'kubectl get configmap'
abbr -a kgn 'kubectl get namespaces'
abbr -a kgno 'kubectl get nodes'

abbr -a kd 'kubectl describe'
abbr -a kdd 'kubectl describe deployment'
abbr -a kdp 'kubectl describe pods'
abbr -a kdi 'kubectl describe ingress'
abbr -a kds 'kubectl describe service'
abbr -a kdse 'kubectl describe secret'
abbr -a kdc 'kubectl describe configmap'
abbr -a kdn 'kubectl describe namespaces'
abbr -a kdno 'kubectl describe nodes'

abbr -a kl 'kubectl logs -f --tail=10'
abbr -a kdel 'kubectl delete'
abbr -a kapp 'kubectl apply'
abbr -a kex 'kubectl exec -t -i'
abbr -a kp 'kubectl proxy'

# functions
function git-clean-local-branches -d "Clean local branches in git repo"
	git branch --no-column -q --no-color | \
		awk '{print $1}' | \
		egrep -v '(master|develop|\*)' | \
		xargs --no-run-if-empty git branch -d
end

function git-checkout-branch-origin-develop -d "Checkout new branch from origin/develop"
	git checkout -b "$argv[1]" origin/develop
	git branch --unset-upstream
end
