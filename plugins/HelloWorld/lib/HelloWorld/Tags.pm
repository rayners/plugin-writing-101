package HelloWorld::Tags;

use strict;
use warnings;

sub _hdlr_hello_world {

    # context, argument, and existing conditions
    my ( $ctx, $args, $cond ) = @_;

    # grab the greeted argument
    my $to_greet = $args->{greeted};

    # if there was no greeted argument
    # and there is an entry in the stash
    # use the entry author's nickname or name
    if ( !$to_greet && ( my $e = $ctx->stash('entry') ) ) {
        my $author = $e->author;
        $to_greet = $author->nickname || $author->name;
    }

    # default to 'World' if nothing else was given
    $to_greet ||= 'World';

    return "Hello $to_greet!";
}

1;
