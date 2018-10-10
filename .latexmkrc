# My changes
$pdf_mode = 1; # Generate PDF using pdflatex
$dvi_mode = $postscript_mode = 0;
$cleanup_mode = 2;
$cleanup_includes_generated = 1;
$clean_ext = "out thm";

# Shell escape so that one can run shell scripts from .tex file
# Also make sure we use synctex and nonstopmode
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode --shell-escape %O %S';
@generated_exts = (@generated_exts, 'synctex.gz');

