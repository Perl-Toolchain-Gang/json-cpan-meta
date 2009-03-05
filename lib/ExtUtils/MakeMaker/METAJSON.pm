use strict;
use warnings;

package ExtUtils::MakeMaker::METAJSON;
our $VERSION = '1.000';

use ExtUtils::MM_Any;
use JSON 2;

=head1 NAME

ExtUtils::MakeMaker::METAJSON - put JSON in your META.yml (with EU::MM)

=head1 SYNOPSIS

In your Makefile.PL:

  use ExtUtils::MakeMaker;
  eval { require ExtUtils::MakeMaker::METAJSON; };

  WriteMakefile(...);

If EU::MM::METAJSON cannot be loaded (for example, because a user who is
installing your module does not have it or JSON installed), things will
continue as usual.  If it can be loaded, any META.yml file produced will
contain JSON.

=cut

no warnings 'redefine';
*ExtUtils::MM_Any::metafile_file = sub {
  my ($self, %pairs) = @_;

  return JSON->new->ascii(1)->pretty->encode(\%pairs);
};

=head1 SEE ALSO

L<JSON::CPAN::META>

=head1 AUTHOR AND COPYRIGHT

Copyright (C) 2009, Ricardo Signes, C<rjbs@cpan.org>

This is free software, distributed under the same terms as perl5.

=cut

1;
