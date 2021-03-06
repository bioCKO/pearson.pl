pearson.pl
==========

Calculate the Pearson correlation between all genes in a given matrix 

* Requires the 'Statistics::LSNoHistory' perl module

Usage
--------
```
pearson.pl <Input File> <Delimiter (optional)>
```
Input
--------

Tab delimited text file that holds gene names and expression values across samples.

Optional:

Delimiter type: tab,space,comma

Defualt is tab, if no value is entered.

Example input:

```
gene	sample1	sample2	sample3	sample4	sample5
a       1       2.1     2.8     4       5.2
b       1       1.9     3.2     4.1     4.9
c       6       2       4       5       8
```

Output
--------

Output is a tab delimited list of the pearson correlation ans slope between all genes in the given matrix
