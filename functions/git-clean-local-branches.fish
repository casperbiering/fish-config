function git-clean-local-branches -d "Clean local branches in git repo"
	git branch --no-column -q --no-color | \
		awk '{print $1}' | \
		egrep -v '(master|main|custom|upstream|develop|\*)' | \
		xargs -r -n1 git branch -d
end
