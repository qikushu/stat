#!/usr/bin/perl

#################################
# Running in a Bash shell on a Linux system.
# Usage: less [in.hmp.txt] | perl hmp2structure.pl > data.str

# Parameters:
# - in.vcf.gz: Path to the hapmap file.

# Assuming the total length of the rice (Oryza sativa) genome (IRGSP1) is 373,245,519 base pairs (bp),
# and that the entire RFLP map constructed in the rice F2 population spans a total length of 1521.6 centimorgans (cM),
# we estimate a conversion factor of 245,298 bp per cM.
# This value can be approximated as 250,000 bp per cM or 0.000004 cM per bp for simplicity.
# In this script, we set the ratio as $ratio = 0.000004;.
# Feel free to adjust this value as needed.
#################################

use warnings;
use strict;

# parameters cM / bp
my $ratio = 0.000004;
my $missing_code = -9;

my $last_position=0;
my $last_chr = 0;

while (my $row = <STDIN>) {
	chomp $row;
	my @data = split(/\t/,$row);

	# header
	if ($row =~ /^rs/) {
		my @output;
		for (my $i=11;$i<scalar(@data);$i++) {
			push(@output,$data[$i]);
		};

		print "\t\t";
		my $output = join("\t",@output);
		print "$output\n";
	# genotype data		
	} else {
		my $chr = $data[2];
		my $position = $data[3];
		my $interval;
		my $r;
		if ($last_chr == $chr) {
			$interval = $position - $last_position;
			$r = sprintf("%.5f", $interval * $ratio);
		} else {
			$interval = 0;
			$r = -9;
		}

	#	$r = $missing_code if ($interval = 0);
			if ($data[1] =~ /\//) {
				my $count = (() = $data[1] =~ m/\//g);
				next if ($count > 1);
				my($nuc1, $nuc2) = split(/\//,$data[1]);
				my @output2;
				for (my $i=11;$i<scalar(@data);$i++) {
					my $geno = $data[$i];
					$geno =~ s/$nuc1/0/mi;
					$geno =~ s/$nuc2/1/mi;
					$geno =~ s/n/$missing_code/i;
					push(@output2,$geno);
				};
				my $output2 = join("\t",@output2);
				print "$data[0]\t$r\t$output2\n";
			}

		$last_chr = $chr;
		$last_position = $position;
		
	}
}

