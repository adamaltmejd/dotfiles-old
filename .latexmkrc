# My changes
$pdf_mode = 1;
$dvi_mode = $postscript_mode = 0;
$cleanup_mode = 2;
$cleanup_includes_generated = 1;
# $out_dir = "output";
$clean_ext = "out thm";

# Shell escape so that one can run shell scripts from .tex file
$pdflatex = 'pdflatex --shell-escape %O %S';
