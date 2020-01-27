#!/usr/bin/perl

use strict;
use warnings;


while(<STDIN>) {
        if (/^##/) {
                print;
                next;
        }

        if (=~ /^#/) {
                print;
                next;
        }


        my @row = split(/\t/);

        my $len = scalar(@row);
        my $flag = 0;

        for (my $i=9; $i < $len; $i++) {
                my @geno = split(/:/,$row[$i]);
                $flag = 1 if ($geno[0] eq ".");
        }

        print if ($flag == 0);
}
