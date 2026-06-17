$Path = "C:\PSConfEU2026\SpecKit"
Set-location -path $path

# dummy demo to see what happens if you don't define anything
specify init dummydemo

# remove-item -path "$path\dummydemo" -recurse -force

# demo project with predefined integration and script
specify init psconfeu26demo --integration claude --script ps
