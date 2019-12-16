# Install packages in user library
.libPaths("~/.R/packages")

# Don't load TK
options(menu.graphics = FALSE)

# Wider continuation prompt
options(prompt = "> ")
options(continue = "... ")

# "q()": quit immediately and not save workspace.
q <- function(save = "no", ...) {
  quit(save = save, ...)
}

# Enables the colorized output from R (provided by the colorout package)
# on appropriate consoles.
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
