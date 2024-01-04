perl -pe '$. > 1 and /^>/ ? print "\n" : chomp' sequences_all_biomart.txt > sequences_all_biomart_linearised.txt
#https://www.biostars.org/p/9262/
