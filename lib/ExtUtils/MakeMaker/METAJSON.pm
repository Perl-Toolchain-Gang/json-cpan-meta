use strict;
use warnings;

{
  package ExtUtils::MakeMaker::METAJSON;
  our $VERSION = '1.000';
}

package MY;
use JSON 2;
sub metafile_file {
  my ($self, %pairs) = @_;
  return JSON->new->ascii(1)->pretty->encode(\%pairs);
}

1;
