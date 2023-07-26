package App::Prove::Plugin::SetEnv;

# ABSTRACT: a prove plugin to set environment variables

use strict;
use warnings;

use String::Expand qw( expand_string );

sub load {
  my ( $class, $p ) = @_;
  foreach my $arg ( @{ $p->{ args } } ) {
    my ( $var, $val ) = split '=', $arg, 2;
    $ENV{ $var } = expand_string( $val, \%ENV );
  }
}

=head1 SYNOPSIS

    # command-line usage
    prove -PSetEnv=TZ=UTC,PATH="./bin:$PATH"

=head1 DESCRIPTION

This L<prove> plugin lets you set environment variables for your test
scripts.  It is particularly handy in C<.proverc>.

=head1 BUGS

Due to the way L<App::Prove> splits arguments to plugins, it is not
possible to set values containing commas.

=head1 SEE ALSO

L<prove>, L<App::Prove/PLUGINS>.


=cut

1;
