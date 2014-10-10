#! /usr/bin/perl -w 
#Written by Roy Granit 

use strict;
use Statistics::LSNoHistory; #module for pearson correlation

if (@ARGV!=1){
  die print "usage: pearson.pl <File>\n";
}
my @genes; # Holds the genes found
my %genesHash; # Holds arrays with the data of each gene
my $lineCount=0;
#Read file
open(DATA,$ARGV[0]) or die "couldn't open file\n";

while (<DATA>){
	chomp($_);
 	s/\r//g;
  	if ($lineCount > 0){
		push(my @line, (split "\t"));
  		chomp @line;


		push (@genes, (shift @line)); #Enter gene names to array
		$genesHash{ $genes[ $lineCount -1 ]} = [@line];			
	}

$lineCount++;	
}

close(DATA);

my $reg = Statistics::LSNoHistory->new;


my @array1;
my @array2;

printf("gene1\tgene2\tslope\tCorrelation\n");
for (my $i=0;$i<=$#genes;$i++){
	@array1 = @{ $genesHash{$genes[$i]} };
		
		for (my $j=0;$j<=$#genes;$j++){
	
	 		@array2 = @{ $genesHash{ $genes[$j] } };
		        
			$reg->append_arrays( [@array1],[@array2]);
			printf("$genes[$i]\t$genes[$j]\t");
			printf("%.2f\t", $reg->slope);
			printf("%.3f\n", $reg->pearson_r);
			$reg = Statistics::LSNoHistory->new;
		
		}
}  



