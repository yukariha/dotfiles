function fish_prompt
    # Capture last exit code
    set last_status $status

    # Add a newline for proper spacing, just like Bash
    echo ""

    # Error code (only shown if non-zero, before the prompt)
    if test $last_status -ne 0
        set_color red
        echo -n "$last_status "
    end

    # Username, hostname, and working directory in bold green
    set_color green
    echo -n "["(whoami)"@"(hostname)":"(prompt_pwd)

    # Git branch (if inside a Git repo)
    set git_branch (git branch --show-current 2>/dev/null)
    if test -n "$git_branch"
        set_color blue
        echo -n " ($git_branch)"
    end

    # Close the bracket
    set_color green
    echo -n "]"

    # Reset color, but keep it bold for the `$`
    echo -n "\$ "

    # Reset to normal text
    set_color normal
end
