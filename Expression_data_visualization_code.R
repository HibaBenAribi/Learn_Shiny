library(readr)
library(dplyr) 
library(ggplot2) 
library(readxl)

expression<- "expression.csv"
expression <- read.csv(expression) %>%
  distinct(gene, .keep_all = TRUE) %>%
  na.omit() %>%
  as_tibble() %>%
  as.data.frame() %>%
  select(-1)

expression$diffexpressed <- "Not Significant"
expression$diffexpressed[expression$log2FoldChange  > 2  & expression$pvalue < 0.05 ] <- "Upregulated genes"
expression$diffexpressed[expression$log2FoldChange  < -(2)  & expression$pvalue < 0.05] <- "Downregulated genes"
ggplot(data=expression, aes(x=log2FoldChange, y=-log10(pvalue), col=diffexpressed)) +
  geom_point() + theme_minimal() + theme(text = element_text(size = 15))  
