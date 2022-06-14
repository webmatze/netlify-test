build: html pdf

html: create_public generate_html
pdf: create_offline generate_pdf

create_public:
	mkdir -p public

create_offline:
	mkdir -p offline

generate_html:
	pandoc *.md -o public/index.html

generate_pdf:
	pandoc *.md -o offline/README.pdf
