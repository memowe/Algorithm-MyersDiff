use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    VERSION         => '0.01',
    NAME            => 'TagNotes',
    AUTHOR          => 'Mirko Westermeier <mirko@westermeier.de>',
    LICENSE         => 'mit',
    META_MERGE      => {resources => {
        repository  => 'https://github.com/memowe/Algorithm-MyersDiff',
        bugtracker  => 'https://github.com/memowe/Algorithm-MyersDiff/issues',
    }},
    PREREQ_PM       => {
        'Class::Tiny' => '1.006',
    },
    test => {TESTS => 't/*.t'},
);
