use strict;
use warnings;

package Mojolicious::Plugin::Web::Auth::Site::Suunto;
use Mojo::Base qw/Mojolicious::Plugin::Web::Auth::OAuth2/;

has access_token_url => 'https://cloudapi-oauth.suunto.com/oauth/confirm_access';
has authorize_url    => 'https://cloudapi-oauth.suunto.com/oauth/authorize';
has response_type    => 'code';
has scope            => 'public';
has grant_type       => 'authorization_code'; # authorization_code or refresh_token;

sub moniker { 'suunto' }

1;
__END__

# ABSTRACT: Suunto OAuth2 Plugin for Mojolicious::Plugin::Web::Auth

=pod

=head1 SYNOPSIS

    my $client_id     = '9999';
    my $client_secret = 'seekrit';

    # Mojolicious
    $self->plugin(
        'Web::Auth',
        module           => 'Suunto',
        key              => $client_id,
        secret           => $client_secret,
        scope       => 'view_private,write',
        on_finished => sub {
            my ( $c, $access_token, $access_secret ) = @_;
            ...;
        },
    );

    # Mojolicious::Lite
    plugin 'Web::Auth',
        module      => 'Suunto',
        key         => $client_id,
        secret      => $client_secret,
        scope       => 'view_private,write',
        on_finished => sub {
        my ( $c, $access_token, $access_secret ) = @_;
        ...;
        };

=head1 DESCRIPTION

This module adds L<Suunto|https://www.surveygizmo.eu/s3/90115093/PARTNER-Become-a-Suunto-Partner>
support to L<Mojolicious::Plugin::Web::Auth>.

=cut
