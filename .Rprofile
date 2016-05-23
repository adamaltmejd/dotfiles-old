# See help(startup) for documentation
# Set default CRAN Mirror
local({
    r <- getOption("repos")
    r["CRAN"] <- "https://cran.rstudio.com/"
    options(repos=r)
})

# Editor
options(editor="subl")

# Error handling
# options(error=traceback)
options(showWarnCalls=T, showErrorCalls=T)
# options(warn=2) # halt on warnings
# options(warning.expression=quote(recover())) # use recover on warnings


# Install packages in user library
.libPaths("~/.R/packages")

options(stringsAsFactors=FALSE)
options(max.print=100)
try(options(width=Sys.getenv("COLUMNS")), silent = TRUE) # dynamic width
# options(width = 80)

# Don't load TK
options(menu.graphics=FALSE)

# [Lines 17-18]: Often, when working in the interactive console I forget a closing brace or paren. When I start a new line, R changes the prompt to "+" to indicate that it is expecting a continuation. Because "+" and ">" are the same width, though, I often don't notice and really screw things up. These two lines make the R REPL mimic the Python REPL by changing the continuation prompt to the wider "...".
options(prompt="> ")
options(continue="... ")

# "q()": quit immediately and not save workspace.
q <- function(save="no", ...) {
  quit(save=save, ...)
}

# Enables the colorized output from R (provided by the colorout package) on appropriate consoles.
if(Sys.getenv("TERM") %in% c("xterm-256color", "screen")) { library("colorout") }

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

# This snippet allows you to tab-complete package names for use in "library()" or "require()" calls. Credit for this one goes to @mikelove.
utils::rc.settings(ipck=TRUE)

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
    #cat("\nSuccessfully loaded .Rprofile at", date(), "\n")
}
# .Last() run at the end of the session
.Last <- function() {
    # cat("\nGoodbye at ", date(), "\n")
}
# Update packages on stratup
# update.packages(ask=FALSE, checkBuilt=TRUE)
