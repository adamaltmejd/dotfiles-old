# Format of command specifications
#
# %B: Base of filename for current command. E.g., if a postscript file
#     document.ps is being made from the dvi file document.dvi, then the
#     basename is document.
# %D: Destination file (e.g., the name of the postscript file when converting a
#     dvi file to postscript).
# %O: Options.
# %R: Root filename. This is the base name for the main tex file.
# %S: Source file (e.g., the name of the dvi file when converting a dvi file to
#     ps).
# %T: The name of the primary tex file.
# %Y: Name of directory for auxiliary output files (see the configuration
#     variable $aux_dir). A directory separation character ('/') is appended if
#     $aux_dir is non-empty and does not end in a suitable character, with
#     suitable characters being those appropriate to UNIX and MS-Windows, i.e.,
#     ':', '/' and '\'.
# %Z: Name of directory for output files (see the configuration variable
#     $out_dir). A directory separation character ('/') is appended if $out_dir
#     is non-empty and does not end in a suitable character, with suitable
#     characters being those appropriate to UNIX and MS-Windows, i.e., ':', '/'
#     and '\'.

# ENV Variables
$ENV{'TZ'}='Europe/Stockholm'; # Time Zone

# Latex build

# Include command to copy pdf to main folder
#$latex = 'latex -interaction=batchmode -shell-escape -file-line-error %O %S; cp "%D" "%B.pdf"';
#$pdflatex = 'pdflatex -synctex=1 -interaction=batchmode -shell-escape -file-line-error %O %S; cp "%D" "%B.pdf"';

$latex = 'latex -interaction=batchmode -shell-escape -file-line-error %O %S';
$pdflatex = 'pdflatex -synctex=1 -interaction=batchmode -shell-escape -file-line-error %O %S';

@generated_exts = (@generated_exts, 'synctex.gz');

$pdf_mode = 1; # Generate PDF using pdflatex
$dvi_mode = $postscript_mode = 0; # no DVI or PS files

# If nonzero, continue processing past minor latex errors including unrecognized cross references
$force_mode = 0;

$silent = 0; # silent mode (prints way less stuff)

# Bibliography generation
$bibtex_use = 2; # run bibtex or biber whenever it appears necessary to update the bbl files, without testing for the existence of the bib files; always delete .bbl files in a cleanup.

# Out dir puts all output files in separate directory
# Doesn't seem to work very well...
#$out_dir = '.out';
#$aux_dir = '.out'; # aux_dir only works on win (MikTex)
#$do_cd = 1; # cd to working dir before running

# Cleanup
$cleanup_mode = 2; # 2 for cleanup except for .dvi, .ps and .pdf
$cleanup_includes_generated = 1;
$clean_ext = "bbl nav out snm";

# Create file containing a list of the files that these programs have read and written
# For better source file detection
$recorder   = 1;

$preview_mode = 0; # automatically run previewer
$pdf_previewer = 'open -a Skim %O %S';





