compdef _bsky bsky

_bsky() {
	local -a opts
	local cur
	cur=${words[-1]}
	if [[ "$cur" == "-"* ]]; then
		opts=("${(@f)$(${words[@]:0:#words[@]-1} ${cur} --generate-shell-completion)}")
	else
		opts=("${(@f)$(${words[@]:0:#words[@]-1} --generate-shell-completion)}")
	fi

	if [[ "${opts[1]}" != "" ]]; then
		_describe 'values' opts
	else
		_files
	fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_bsky" ]; then
	_bsky
fi