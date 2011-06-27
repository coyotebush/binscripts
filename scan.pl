#!/usr/bin/perl

use warnings;
use strict;
use autodie;

my $fping='/usr/local/homebrew/sbin/fping';

die unless $#ARGV == 1;
my ($address, $block) = @ARGV;

my $fpinger;
open ($fpinger, "sudo $fping -a -g $address/$block|");
while (<$fpinger>) {
	chomp;
	my $ip = $_;
	my $name = `host $ip`;
	chomp $name;
	if ($? == 0) {
		$name =~ s/^.*\s(\S+)$/$1/;
	} else {
		$name = '';
	}
	printf "%-16s%s\n", $ip, $name;
}
#close $fpinger;
