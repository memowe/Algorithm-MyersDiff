#!/usr/bin/env perl

use strict;
use warnings;
use Test::More 'no_plan';
use_ok 'Algorithm::MyersDiff::EditGrid';

subtest 'Reachability' => sub {

    # Prepare dummy grid
    my $grid = Algorithm::MyersDiff::EditGrid->new(
        first   => 'foobar',
        second  => 'bazquux',
    );

    subtest 'Illegal lengths' => sub {
        eval {$grid->reachable([-1,3], [2,5]); fail "Still alive"};
        is $@ => "Illegal lengths\n", 'Detected';
        eval {$grid->reachable([1,13], [2,5]); fail "Still alive"};
        is $@ => "Illegal lengths\n", 'Detected';
        eval {$grid->reachable([1,3], [-2,5]); fail "Still alive"};
        is $@ => "Illegal lengths\n", 'Detected';
        eval {$grid->reachable([1,3], [2,8]); fail "Still alive"};
        is $@ => "Illegal lengths\n", 'Detected';
    };

    subtest 'Direction not monotone' => sub {
        eval {$grid->reachable([1,3], [0,5]); fail "Still alive"};
        is $@ => "Direction not monotone: (1,3) -> (0,5)\n", 'Detected';
        eval {$grid->reachable([1,3], [2,2]); fail "Still alive"};
        is $@ => "Direction not monotone: (1,3) -> (2,2)\n", 'Detected';
    };

    subtest 'Rectangular neighbour' => sub {
        ok $grid->reachable([2,5], [3,5]), 'Reachable';
        ok $grid->reachable([2,5], [2,6]), 'Reachable';
    };

    subtest 'Diagonal neighbour' => sub {
        ok not($grid->reachable([2,3], [3,4])), 'Not reachable';
        ok $grid->reachable([3,0], [4,1]), 'Reachable';
        ok $grid->reachable([4,1], [5,2]), 'Reachable';
    };
};

done_testing;
