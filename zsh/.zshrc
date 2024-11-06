# Turn on colors.
export CLICOLOR=1
# Set vi mode.
bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

# Sync Jeopardy.
function jsync()
{
    set -x
    mkdir -p ~/Movies/TV/Jeopardy/
    rsync -azP asoubki@submit.ai.stonybrook.edu:"/home/asoubki/dev/jarchiver/jarchive/*" ~/Movies/TV/Jeopardy/
}
