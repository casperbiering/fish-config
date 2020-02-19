# casperbiering-fish-config initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies


# Expand user path
function casperbiering-add-path -d "Add paths without duplicates"
	if test -d $argv[1]
		contains -- $argv[1] $PATH
			or set -p -gx PATH $argv[1]
	end
end
casperbiering-add-path ~/.local/bin
casperbiering-add-path ~/bin
casperbiering-add-path ~/go/bin

# Configure bobthefish theme
set -g theme_display_git_master_branch yes
set -g theme_display_vagrant no
set -g theme_title_display_process yes
set -g theme_display_k8s_context yes
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
abbr -a -g -- - 'cd -'
abbr -a -g l 'less --shift 1'
abbr -a -g d 'diff -Naurw'
abbr -a -g g 'grep'
abbr -a -g gi 'grep -i'
abbr -a -g chx 'chmod +x'
abbr -a -g ssh-itops 'ssh -i ~/.ssh/id_rsa.tgtg-itops -l ec2-user'
abbr -a -g ssh-data-ops 'ssh -i ~/.ssh/id_rsa.tgtg-data-ops -l ec2-user'

# Git abbr
abbr -a -g ga 'git add'
abbr -a -g gap 'git add -p'
abbr -a -g gb 'git branch'
abbr -a -g gba 'git branch -a'
abbr -a -g gbc 'git checkout -b'
abbr -a -g gbcod 'git-checkout-branch-origin-develop'
abbr -a -g gc 'git checkout'
abbr -a -g gcb 'git checkout -b'
abbr -a -g gcbod 'git-checkout-branch-origin-develop'
abbr -a -g gcd 'git checkout develop'
abbr -a -g gcf 'git clean -d -f'
abbr -a -g gci 'git commit'
abbr -a -g gcia 'git commit --amend'
abbr -a -g gclb 'git-clean-local-branches'
abbr -a -g gcm 'git checkout master'
abbr -a -g gcn 'git clean -d -n'
abbr -a -g gcp 'git checkout -p'
abbr -a -g gd 'git diff'
abbr -a -g gdc 'git diff --cached'
abbr -a -g gf 'git fetch'
abbr -a -g gfp 'git fetch -p'
abbr -a -g gg 'git grep -i'
abbr -a -g ggc 'git grep'
abbr -a -g gl 'git log --name-status'
abbr -a -g glp 'git log -p'
abbr -a -g gm 'git merge --ff-only'
abbr -a -g gmd 'git merge --ff-only develop'
abbr -a -g gmmc 'git merge --no-ff'
abbr -a -g gmt 'git mergetool'
abbr -a -g gph 'git push'
abbr -a -g gphf 'git push -f'
abbr -a -g gphod 'git push origin HEAD:develop'
abbr -a -g gphu 'git push -u'
abbr -a -g gpl 'git pull'
abbr -a -g gr 'git reset'
abbr -a -g grb 'git rebase -i'
abbr -a -g grh 'git reset HEAD'
abbr -a -g grm 'git rm'
abbr -a -g grod 'git rebase -i origin/develop'
abbr -a -g grom 'git rebase -i origin/master'
abbr -a -g gs 'git status'
abbr -a -g gsh 'git show'
abbr -a -g gst 'git stash'
abbr -a -g gstp 'git stash pop'

# Docker abbr
abbr -a -g dl 'docker-compose logs -f --tail=10'

abbr -a -g kn kubens
abbr -a -g kc kubectx

# Kubectl
abbr -a -g k 'kubectl'

abbr -a -g ke 'kubectl edit'
abbr -a -g ked 'kubectl get deployment'
abbr -a -g kep 'kubectl get pod'
abbr -a -g kei 'kubectl get ingress'
abbr -a -g kes 'kubectl get service'
abbr -a -g kese 'kubectl get secret'
abbr -a -g kec 'kubectl get configmap'
abbr -a -g ken 'kubectl get namespace'
abbr -a -g keno 'kubectl get node'

abbr -a -g kg 'kubectl get'
abbr -a -g kgd 'kubectl get deployment'
abbr -a -g kgp 'kubectl get pod'
abbr -a -g kgi 'kubectl get ingress'
abbr -a -g kgs 'kubectl get service'
abbr -a -g kgse 'kubectl get secret'
abbr -a -g kgc 'kubectl get configmap'
abbr -a -g kgn 'kubectl get namespace'
abbr -a -g kgno 'kubectl get node'

abbr -a -g kd 'kubectl describe'
abbr -a -g kdd 'kubectl describe deployment'
abbr -a -g kdp 'kubectl describe pod'
abbr -a -g kdi 'kubectl describe ingress'
abbr -a -g kds 'kubectl describe service'
abbr -a -g kdse 'kubectl describe secret'
abbr -a -g kdc 'kubectl describe configmap'
abbr -a -g kdn 'kubectl describe namespace'
abbr -a -g kdno 'kubectl describe node'

abbr -a -g krm 'kubectl delete'
abbr -a -g krmd 'kubectl delete deployment'
abbr -a -g krmp 'kubectl delete pod'
abbr -a -g krmi 'kubectl delete ingress'
abbr -a -g krms 'kubectl delete service'
abbr -a -g krmse 'kubectl delete secret'
abbr -a -g krmc 'kubectl delete configmap'
abbr -a -g krmn 'kubectl delete namespace'
abbr -a -g krmno 'kubectl delete node'

abbr -a -g ka 'kubectl apply'
abbr -a -g kaf 'kubectl apply -R -f'
abbr -a -g kan 'kubectl apply -n'
abbr -a -g kga 'kubectl get all'
abbr -a -g kgaa 'kubectl get all -A'
abbr -a -g kl 'kubectl logs -f --tail=10'
abbr -a -g kla 'kubectl logs --all-containers=true -f --tail=10'
abbr -a -g kapp 'kubectl apply'
abbr -a -g kex 'kubectl exec -t -i'
abbr -a -g kp 'kubectl proxy'
