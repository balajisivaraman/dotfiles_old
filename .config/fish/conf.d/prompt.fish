function fish_prompt
    set_prompt_colors
    set -l user_host_name $colgreen(echo $USER)$colnormal@$colred(hostname | cut -d'.' -f 1)
    set -l cwd $colcyan(prompt_pwd)
    set -l prompt_string $colnormal"\$ "
    set -l git_prompt $colblue(githud_prompt)$colnormal
    echo $user_host_name $cwd $git_prompt $prompt_string
end

function githud_prompt
  echo -n (gitHUD)
end

function set_prompt_colors
    set -g colcyan   (set_color cyan)
    set -g colbcyan  (set_color -o cyan)
    set -g colgreen  (set_color green)
    set -g colbgreen (set_color -o green)
    set -g colnormal (set_color normal)
    set -g colred    (set_color red)
    set -g colbred   (set_color -o red)
    set -g colwhite  (set_color white)
    set -g colbwhite  (set_color -o white)
    set -g colyellow (set_color yellow)
    set -g colbyellow (set_color -o yellow)
    set -g colblue (set_color blue)
    set -g colbblue (set_color -b blue)
end
