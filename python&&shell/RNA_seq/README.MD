#### Conclusion


This project explored a processed bulk RNA-seq FPKM matrix from GSE121950. Although the dataset was successfully loaded, cleaned, filtered, and inspected, sample-to-sample correlation analysis showed unexpectedly weak correlations between all samples, including presumed biological replicates. This indicates that the processed matrix may not be ideal for robust biological interpretation in its current form.

Because the available file contains FPKM values rather than raw integer counts, formal DESeq2/PyDESeq2 differential expression analysis was not performed. The results of this project should therefore be interpreted as exploratory quality-control and expression-matrix inspection rather than definitive differential expression analysis.

___
