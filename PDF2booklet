#!/bin/bash
#-----------------------------------------------------------------------------------------------------------------
# Imposition ang printing of PDF files
# from “19 steps to do a booklet” -- Open Source Publishing
# Licence Art Libre 1.3
# 
# TODO:
#   create many booklets if there is two many pages. (5 sheets/booklet max: 20pages pdf)
#-----------------------------------------------------------------------------------------------------------------

# collect info about the file
echo -n "→ file path : "
read file
nom=${file%.pdf}
    echo "Processing $nom ..."
    nb=$(pdfinfo $file | grep 'Pages:' | grep -Eo '[0-9]*$')
    format=$(pdfinfo $file | grep 'Page size:' | grep -Eo '[A-Z][0-9]')
    echo "nb: $nb / format: $format"
nb=$((nb+$((4-((nb%4))))))  # add missing pages (a multiple of 4 is needed)
tmppath="/tmp/tmp_"$nom"_"

# if $(($nb>20)) do
#    # find the optimal division of the pages. Sometimes not all booklets can have the same number of sheets !
#    nbBooklets=$((nb/?))
#    for i in (( i=1 ; i<$nbBooklets ; i++ ))
#       pdfseparate  -f $((i*6-5)) -l $((i*6))  $file  $file_$i        #pdfseparate -f FIRST -l LAST  INPUT  OUTPUT
#

pdftops -paper match $file $tmppath"convert.ps"                # convert to PS
# acroread -toPostScript $nom.pdf $tmppath"convertir.ps        # il paraît qu'acrobat marche mieux
psbook -s$nb $tmppath"convert.ps" $tmppath"impose.ps"          # impose the pages (changes the order)
psnup -2 -P$format $tmppath"impose.ps" $tmppath"dispose.ps"    # puts two pages on one
                                                                                        
ps2pdf $tmppath"disposer.ps" $file'_print'.pdf                 # convert again to .pdf 
rm $tmppath"*"                                                 # delete tmp files

echo -n  "→ do you want to print it now? (o/n) : "
read print

if [ "$print" = "o" ]; then
	#echo -n  "Printer name? "
	#read myprinter
	myprinter=psc2500
	
	echo ">>> Printing odd pages <<<"
	lpr -P $myprinter -o page-set=odd -o outputorder=reverse -#1 $file'_print'.pdf
	echo -n "…Once finished, but the pages back in the printer drawer, without turning or rotating them. \nready ?"
	read waiting

	# impression ds pages paires, ordre normal
	lpr -P $myprinter -o page-set=even -o outputorder=normal -#1 $file'_print'.pdf
	echo ">>> Printing even pages <<<"
else
	echo "Your file is here: "$file"_print.pdf"
fi

