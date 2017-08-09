set PATH=%PATH%;C:\Program Files\RStudio\bin\pandoc

:: build appendix
pandoc -f markdown -t latex survey/appendix.md -o survey/appendix/appendix.tex 

pandoc -S --bibliography=survey/paper.bib --template="survey/default_custom.latex" --include-after-body=survey/appendix/appendix.tex --csl=survey/harvard-university-of-technology-Sydney.csl --from=markdown+multiline_tables -o lit-review.pdf ^
    title.txt ^
    survey/abstract.md ^
    survey/introduction.md ^
    survey/body.md ^
    survey/conclusion.md ^
    survey/references.md

pandoc -S --bibliography=survey/paper.bib --template="survey/default_custom_draft.latex" --include-after-body=survey/appendix/appendix.tex --csl=survey/harvard-university-of-technology-Sydney.csl --from=markdown+multiline_tables -o lit-review_draft.pdf ^
    title.txt ^
    survey/abstract.md ^
    survey/introduction.md ^
    survey/body.md ^
    survey/conclusion.md ^
    survey/references.md

:: make docx file

pandoc -S --bibliography=survey/paper.bib --template="survey/default_custom.latex" --include-after-body=survey/appendix/appendix.tex --csl=survey/harvard-university-of-technology-Sydney.csl --from=markdown+multiline_tables -o lit-review.tex ^
    title.txt ^
    survey/abstract.md ^
    survey/introduction.md ^
    survey/body.md ^
    survey/conclusion.md ^
    survey/references.md

pandoc lit-review.tex -o lit-review.docx

