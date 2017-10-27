#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use FindBin;
    use lib "$FindBin::Bin/../lib";
    use_ok( 'Algorithm::MyersDiff' ) || print "Bail out!\n";
}

diag( "Testing Algorithm::MyersDiff $Algorithm::MyersDiff::VERSION, Perl $], $^X" );
