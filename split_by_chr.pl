#! /usr/bin/perl

#LSS August 17, 2011
#Last Modified April 21, 2014

#this program splits genome files into separate files per chromosome
#it skips over entries matching 'Unknown_'

$input=$ARGV[0];

open(INPUT, $input);

while (<INPUT>) {
    chomp;

    if ($_=~/>/) {
        $chr=substr($_,1);
        if ($chr=~/Unknown_/) {
            $keep_chr=0;
            next;
        } # end if
	@name=split(/\s+/,$chr);
        $output = $name[0] . ".fa";
        open(CHROMO_FILE, ">$output");
        $keep_chr=1;
    } #end if

    if ($keep_chr==1) {
        print CHROMO_FILE"$_\n";
    } #end if

} #end while
