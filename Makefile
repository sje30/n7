n7-eglen.html: n7-eglen.Rmd
	Rscript -e 'rmarkdown::render("n7-eglen.Rmd")'


n7-eglen.pdf: n7-eglen.html
	Rscript -e "pagedown::chrome_print('$^',timeout=60)"

# n7-eglen.pdf: n7-eglen.qmd
# 	quarto render $^

n7-eglen-4up.pdf: n7-eglen.pdf

%-4up.pdf: %.pdf
	pdfjam -q --nup 2x2 --frame false --landscape --noautoscale false --delta "0.2cm 0.3cm" --scale 0.95 --suffix '4up' $<	
