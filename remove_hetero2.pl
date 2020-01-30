#!/usr/bin/perl
#

use strict;
use warnings;

while(<STDIN>) {
        if (/^#/) {print;next;}

        # #から始まらない行の評価
	chomp;
        my @row = split(/\t/);

        next if ($row[4] =~ /,/ or $row[3] =~ /,/);
        next if ($row[4] =~ /\./ or $row[3] =~ /\./);
	next if ($row[4] =~ /-/ or $row[3] =~ /-/);
        next unless (length($row[3]) ==1 and length($row[4]) == 1);

	# remove heterozygous genotype
        for (my $i=0; $i < scalar(@row); $i++) {
		if ($i > 8) {
        	        $row[$i] =~ s/^0\/1.*/\.\/\./;
			$row[$i] =~ s/^1\/0.*/\.\/\./;
			$row[$i] =~ s/^0\|1.*/\.\/\./;
			$row[$i] =~ s/^1\|0.*/\.\/\./;
		}	
        }

	# Print out
	print join("\t",@row);
	print "\n";
}
