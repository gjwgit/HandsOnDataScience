########################################################################
# Makefile for local management for handson data science
#
# Deal with Knitr and bookdown


help:
	@echo "\n\tManage Hands On Data Science Modules\n\
        =====================================\n\n\
        Targets:\n\n\
          html   \tCompile a html document and view on browser.\n\
          pdf    \tCompile a pdf document and view.\n\
          md     \tCompile a md document and view.\n\
        \n\
          clean    \tRemove all bookdown files.\n\
          realclean\tRemove all generated files.\n\
          cacheclean\tClear cache.\n\
        "
html:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook")'
	open _book/index.html
pdf:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book")'
	open _book/_main.pdf

md:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book",clean=FALSE)'

clean:
	Rscript -e "bookdown::clean_book(TRUE)"
	rm -fvr *.log Rplots.pdf _bookdown_files

realclean:
	make clean && rm -fvr rsconnect
	rm -rf _book/* *.pdf *.html

cacheclean:
	rm -rf cache


