use v5.20.0;
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    VERSION         => '0.01',
    NAME            => 'TagNotes',
    AUTHOR          => 'Mirko Westermeier <mirko@westermeier.de>',
    LICENSE         => 'mit',
    PREREQ_PM       => {'Class::Tiny' => '1.006'},
    TEST_REQUIRES   => {'Test::Exception' => '0.43'},
    META_MERGE      => {resources => {
        repository  => 'https://github.com/memowe/Algorithm-MyersDiff',
        bugtracker  => 'https://github.com/memowe/Algorithm-MyersDiff/issues',
    }},
    test => {TESTS => 't/*.t'},
);
