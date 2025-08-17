function killport
    if test (count $argv) -eq 0
        echo "Usage: killport <port>"
        return 1
    end

    set port $argv[1]
    set pid (lsof -ti :$port)

    if test -z "$pid"
        echo "No process found on port $port"
        return 1
    end

    echo "Killing process $pid on port $port"
    kill $pid
end
