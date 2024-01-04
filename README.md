# biomart-concatenator-ANU
Scripts for processing FASTA sequences and biomart gene annotations

These were used for the bioinformatics arm of a Summer Research Scholarship at ANU in Nov 2023 - Jan 2024. In brief, genes of interest identified in S. viridis through scRNAseq with no annotated function or sequence homology to known proteins were AlphaFolded to find functional clues through sctructural similarity and predicted subcellular localisation using PSI (https://bis.zju.edu.cn/psi/) and TargetP (https://services.healthtech.dtu.dk/services/TargetP-2.0/). 

fasta_lineariser.pl is a Perl script that turns sequences arranged in multiple lines with newline symbols in a multifasta file (i.e., multiple sequences in one file) or a single fasta into linear sequences. This was used to search Uniprot for the sequences downloaded from Phytozome (https://phytozome-next.jgi.doe.gov/) using Biomart, as a multiline fasta was treated as multiple sequences by the Uniprot search. 

asterisk_remover.sh removes all asterisks in a file using sed, used for a multifasta file (i.e., multiple sequences in one file) that contained asterisks for stop codons at the end of every sequence. These had to be removed for the protein sequences to be used in AlphaFold. 

multifasta_separator.sh separated a single multifasta file into multiple separate fasta files, which was required to feed the sequences into AlphaFold. 

concatenator.R processed gene annotation data downloaded from Phytozome. In the output data, peptide namaes (row names) were repeated multiple times with each new annotation. This script concatenates annotations under the same peptide name by columns, allowing for much easier visual inspection of the annotation and deciding which peptides have unknown function. 
