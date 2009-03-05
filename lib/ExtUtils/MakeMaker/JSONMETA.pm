use strict;
use warnings;

package ExtUtils::MakeMaker::JSONMETA;
our $VERSION = '1.000';

use ExtUtils::MM_Any;
use JSON 2;

=head1 NAME

ExtUtils::MakeMaker::JSONMETA - put JSON in your META.yml (with EU::MM)

=head1 SYNOPSIS

In your Makefile.PL:

  use ExtUtils::MakeMaker;
  eval { require ExtUtils::MakeMaker::JSONMETA; };

  WriteMakefile(...);

If EU::MM::JSONMETA cannot be loaded (for example, because a user who is
installing your module does not have it or JSON installed), things will
continue as usual.  If it can be loaded, any META.yml file produced will
contain JSON.

=cut

no warnings 'redefine';
*ExtUtils::MM_Any::metafile_file = sub {
  my ($self, %pairs) = @_;

  $pairs{generated_by} = join ' version ', __PACKAGE__, __PACKAGE__->VERSION;

  return JSON->new->ascii(1)->pretty->encode(\%pairs);
};

=head1 SEE ALSO

L<JSON::CPAN::META>

=head1 AUTHOR AND COPYRIGHT

Copyright (C) 2009, Ricardo Signes, C<rjbs@cpan.org>

This is free software, distributed under the same terms as perl5.

=cut

1;
