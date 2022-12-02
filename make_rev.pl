#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper qw(Dumper);

my $filename = 'include/version.h';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

print $fh "#ifndef __VERSION_H__\n";
print $fh "#define __VERSION_H__\n";
print $fh "\n";
print $fh "#define VERSION_MAJOR $ARGV[0]\n";
print $fh "#define VERSION_MINOR $ARGV[1]\n";
print $fh "#define VERSION_PATCH $ARGV[2]\n";
print $fh "#define GIT_HASH \"$ARGV[3]\"\n";
print $fh "\n";
print $fh "#endif /* __VERSION_H__ */\n";

close $fh;
