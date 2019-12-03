#!/usr/bin/env perl

use strict;
use warnings;

use Test::More 'no_plan';
use Test::Exception;

use_ok 'Algorithm::MyersDiff::EditGrid';

subtest 'Reachability' => sub {

    # Prepare dummy grid
    my $grid = Algorithm::MyersDiff::EditGrid->new(
        first   => 'foobar',
        second  => 'bazquux',
    );

    subtest 'Illegal lengths' => sub {

        # Prepare illegal index pairs
        my @illegal_pairs = (
            [[-1,3], [2,5]],
            [[1,13], [2,5]],
            [[1,3], [-2,5]],
            [[1,3], [2,8]],
        );

        # Check exceptions for reachability
        for my $pair (@illegal_pairs) {
            throws_ok { $grid->reachable(@$pair) }
                qr/Illegal length/, 'Died of an illegal length';
        }
    };

    subtest 'Direction not monotone' => sub {
        throws_ok { $grid->reachable([1,3], [0,5]) }
            qr/Direction not monotone: \(1,3\) -> \(0,5\)/, 'Died correctly';
        throws_ok { $grid->reachable([1,3], [2,2]) }
            qr/Direction not monotone: \(1,3\) -> \(2,2\)/, 'Died correctly';
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
