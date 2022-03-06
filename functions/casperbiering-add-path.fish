function casperbiering-add-path -d "Add paths without duplicates"
	if test -d $1
		contains -- $1 $PATH
			or set -p -gx PATH $1
	end
end
