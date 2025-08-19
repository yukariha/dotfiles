function record --description 'Record screen + microphone and save to output file.'
    if test (count $argv) -eq 0
        echo "Usage: record <output_file>"
        return 1
    end
    
    set out $argv[1]
    set v (string replace -r '\.[^.]+$' '' $out)_v.mkv
    set a (string replace -r '\.[^.]+$' '' $out)_a.wav
    
    ffmpeg -f avfoundation -framerate 120 -i "1:none" $v &
    set pid_v $last_pid
    
    sox -t coreaudio "MacBook Pro Microphone" -r 48000 -c 2 $a &
    set pid_a $last_pid
    
    function cleanup --on-signal SIGINT
        echo "Stopping recording..."
        kill $pid_v $pid_a
        wait $pid_v $pid_a
        ffmpeg -i $v -i $a -c:v copy -c:a aac $out
        rm $v $a
        exit 0
    end
    
    wait
end
