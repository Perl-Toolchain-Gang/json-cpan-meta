use strict;
use warnings;
package JSON::CPAN::Meta;
our $VERSION = '5.000';

=head1 NAME

JSON::CPAN::Meta - JSON is YAML; emit JSON into META.yml

=head1 DESCRIPTION

CPAN distributions contain a file, F<META.yml>, which contains a description of
the distribution and its contents.  This document is notionally written in
YAML, a powerful data serialization format.  Perl has long lacked any reliable,
full implementation of YAML.  Instead, it has numerous incompatible and partial
implementations.

One of the least complete implementations, YAML::Tiny has been advanced to be
the standard mechanism for parsing these documents.  This defeats the purpose
of using a powerful serialization language without the benefit of a very simple
and easily understood data format.

JSON, unlike YAML, is lacking in features but is extremely easy to parse and
generate correctly.  Further, JSON documents are almost always valid YAML
documents.  Thus, a META.yml file may contain JSON without violating the spec
or introducing the sort of problems you'd expect from a poorly implemented YAML
emitter.  The next revision of YAML will, hopefully, correct any remaining
issues.

JSON-CPAN-Meta contains plugins to allow distribution-building tools to produce
META.yml files that contain JSON content.

=head1 SEE ALSO

L<ExtUtils::MakeMaker::JSONMETA>

L<Module::Install::JSONMETA>

L<Module::Build::JSONMETA>

=head1 AUTHOR AND COPYRIGHT

Copyright (C) 2009, Ricardo Signes, C<rjbs@cpan.org>

This is free software, distributed under the same terms as perl5.

=cut

1;
