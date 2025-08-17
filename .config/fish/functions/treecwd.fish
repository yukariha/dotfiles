function treecwd
    set dir_name (basename $PWD)
    tree -I "node_modules" -F . | sed "1s|^\./|$dir_name|"
end
