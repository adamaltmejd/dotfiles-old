# See help(startup) for documentation
# Set default CRAN Mirror
local({
    r <- getOption("repos")
    r["CRAN"] <- "https://cran.rstudio.com/"
    options(repos = r)
})

# Editor
# options(editor="subl")

# Error handling
# options(error=traceback)
options(showWarnCalls = T, showErrorCalls = T)
# options(warn=2) # halt on warnings
# options(warning.expression=quote(recover())) # use recover on warnings

# Install packages in user library
.libPaths("~/.R/packages")

# Set timezone manually, for some reason using ENV variable throws errors
Sys.setenv(TZ = "Europe/Stockholm")

options(stringsAsFactors = FALSE)
options(max.print = 100)

tryCatch(
    options(width = Sys.getenv("COLUMNS")),
    error = function(e) options(width = 80)
    # finally = print("Hello")
)

# Don't load TK
options(menu.graphics = FALSE)

# Wider continuation prompt
options(prompt = "> ")
options(continue = "... ")

# "q()": quit immediately and not save workspace.
q <- function(save = "no", ...) {
    quit(save = save, ...)
}

# Enables the colorized output from R (provided by the colorout package) on appropriate consoles.
# Needs to be downloaded manually from here:
# https://github.com/jalvesaq/colorout
if (Sys.getenv("TERM") %in% c("xterm-256color", "screen")) {
    suppressMessages(require("colorout"))
}

# Redefine print data frame to only print first 5 and last 5 rows of long datasets.
print.data.frame <- function(df) {
    if (nrow(df) > 10) {
        base::print.data.frame(head(df, 5))
        cat("----\n")
        base::print.data.frame(tail(df, 5))
    } else {
        base::print.data.frame(df)
    }
}

# This snippet allows you to tab-complete package names for use in "library()"
# or "require()" calls. Credit for this one goes to @mikelove.
utils::rc.settings(ipck = TRUE)

# Code to autoload packages in interactive console
# auto.loads <- c("dplyr", "ggplot2")
# sshhh <- function(a.package){
#   suppressWarnings(suppressPackageStartupMessages(
#     library(a.package, character.only=TRUE)))
# }
# if(interactive()){
#   invisible(sapply(auto.loads, sshhh))
# }

# .First() run at the start of every R session.
.First <- function() {
    # cat("\nSuccessfully loaded .Rprofile at", date(), "\n")
}
# .Last() run at the end of the session
.Last <- function() {
    # cat("\nGoodbye at ", date(), "\n")
}

# Radian options
# see https://help.farbox.com/pygments.html
# for a list of supported color schemes, default scheme is "native"
options(radian.color_scheme = "native")

# either  `"emacs"` (default) or `"vi"`.
options(radian.editing_mode = "emacs")

# indent continuation lines
# turn this off if you want to copy code without the extra indentation;
# but it leads to less elegent layout
options(radian.indent_lines = TRUE)

# auto match brackets and quotes
options(radian.auto_match = TRUE)

# auto indentation for new line and curly braces
options(radian.auto_indentation = TRUE)
options(radian.tab_size = 4)

# pop up completion while typing
options(radian.complete_while_typing = FALSE)
# timeout in seconds to cancel completion if it takes too long
# set it to 0 to disable it
options(radian.completion_timeout = 0.05)

# automatically adjust R buffer size based on terminal width
options(radian.auto_width = TRUE)

# insert new line between prompts
options(radian.insert_new_line = TRUE)

# when using history search (ctrl-r/ctrl-s in emacs mode), do not show duplicate results
options(radian.history_search_no_duplicates = FALSE)

# custom prompt for different modes
options(radian.prompt = "\033[0;34m>\033[0m ")
options(radian.shell_prompt = "\033[0;31m#\033[0m ")
options(radian.browse_prompt = "\033[0;33mBrowse[{}]>\033[0m ")

# supress the loading message for reticulate
options(radian.suppress_reticulate_message = FALSE)
# enable reticulate prompt and trigger `~`
options(radian.enable_reticulate_prompt = TRUE)
