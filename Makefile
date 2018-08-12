bib = static/bib/inSilecoRef.bib
nodoi = static/bib/noDOIRef.bib
doi = static/bib/DOIRef.bib

biblio:
	Rscript static/Rscript/bibSetUp.R
	bibtool -d $(doi) $(nodoi) -o $(bib)
