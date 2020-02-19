function casperbiering-fish-config -d "My package"
	# Package entry-point
end

function casperbiering-add-path -d "Add paths without duplicates"
	if test -d $1
		contains -- $1 $PATH
			or set -p -gx PATH $1
	end
end

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
