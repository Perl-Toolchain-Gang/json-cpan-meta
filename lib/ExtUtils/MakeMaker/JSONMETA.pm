use strict;
use warnings;

package ExtUtils::MakeMaker::JSONMETA;
our $VERSION = '6.000';

use ExtUtils::MM_Any;
use JSON 2;

=head1 NAME

ExtUtils::MakeMaker::JSONMETA - write META.json instead of META.yml

=head1 SYNOPSIS

In your Makefile.PL:

  use ExtUtils::MakeMaker;
  eval { require ExtUtils::MakeMaker::JSONMETA; };

  WriteMakefile(...);

If EU::MM::JSONMETA cannot be loaded (for example, because a user who is
installing your module does not have it or JSON installed), things will
continue as usual.  If it can be loaded, a META.json file will be produced,
containing JSON.

=cut

no warnings 'redefine';
my $orig = ExtUtils::MM_Any->can('metafile_target');
*ExtUtils::MM_Any::metafile_target = sub {
  my $self = shift;
  my $output = $self->$orig(@_);
  $output =~ s{META\.yml}{META.json}g;
  return $output;
};

*ExtUtils::MM_Any::metafile_file = sub {
  my ($self, %pairs) = @_;

  $pairs{generated_by} = join ' version ', __PACKAGE__, __PACKAGE__->VERSION;

  return JSON->new->ascii(1)->pretty->encode(\%pairs) . "\n";
};

=head1 SEE ALSO

L<JSON::CPAN::META>

=head1 AUTHOR AND COPYRIGHT

Copyright (C) 2009, Ricardo Signes, C<rjbs@cpan.org>

This is free software, distributed under the same terms as perl5.

=cut

1;
