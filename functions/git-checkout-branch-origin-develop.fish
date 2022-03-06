function git-checkout-branch-origin-develop -d "Checkout new branch from origin/develop"
	git checkout -b "$argv[1]" origin/develop
	git branch --unset-upstream
end
