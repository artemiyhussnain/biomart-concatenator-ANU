input <- read.csv('/Users/u1153143/Desktop/E038_local/gsad_genesets_GOI.csv')
concat_col <- as.vector(input$FeatureID)

rows <- c(1:(length(rownames(input))-1))
output <- data.frame(matrix(ncol = ncol(input), nrow = 0))
low = 1

combiner <- function(df) {
  unique(as.vector(df))
}

for (i in rows) {
  if (concat_col[i+1] != concat_col[i]) {
    combo <- apply(input[low:i, ], 2, combiner)
    concat <- c()
    for (name in names(combo)) {
      concat <- c(concat, stri_flatten(unlist(combo[name], use.names = FALSE), collapse = '//'))
      }
    low = i+1
    output <- rbind(output, t(concat))
    
  }
}

combo <- apply(input[low:i+1, ], 2, combiner)
concat <- c()
for (name in names(combo)) {
  concat <- c(concat, stri_flatten(unlist(combo[name], use.names = FALSE), collapse = '//'))
}
output <- rbind(output, t(concat))

colnames(output) <- as.vector(colnames(input))
write.csv(output, 'output.csv', row.names = FALSE)
