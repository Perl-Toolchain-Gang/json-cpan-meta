use strict;
use warnings;
use ExtUtils::MakeMaker;

use lib 'lib';
eval { require ExtUtils::MakeMaker::METAJSON; };

WriteMakefile(
  NAME                => 'JSON-CPAN-META',
  AUTHOR              => 'Ricardo Signes <rjbs@cpan.org>',
  VERSION_FROM        => 'lib/JSON/CPAN/META.pm',
  ABSTRACT_FROM       => 'lib/JSON/CPAN/META.pm',
  PREREQ_PM => {
    'ExtUtils::MakeMaker' => 6, # actual minimum unknown
    'JSON'                => 2,
  },
);
