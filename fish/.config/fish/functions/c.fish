function c -d "quickly jump to a new project"
    cd "/Users/max/Code/$argv"
end

complete --command c --arguments '(__fish_complete_directories /Users/max/Code)'
