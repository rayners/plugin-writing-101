use lib qw( t/lib lib extlib );
use strict;
use warnings;

use MT::Test qw( :db :data );
use Test::More tests => 4;

# verify that the tag output is the expected one
tmpl_out_like(
    '<mt:helloworld>', {}, {},
    qr/^Hello World!$/,
    "mt:helloworld produces 'Hello World!'"
);

# test with the greeted argument
tmpl_out_like(
    '<mt:helloworld greeted="William">',
    {}, {},
    qr/^Hello William!$/,
    "mt:helloworld with greeted='William' produces 'Hello William!'"
);

# load up entry #2, from MT::Test
# which is authored by the Dylan test user

require MT::Entry;
my $e = MT::Entry->load(2);

# test with a stashed entry
tmpl_out_like(
    '<mt:helloworld>', {},
    { entry => $e },
    qr/^Hello Dylan!$/,
    "mt:helloworld with stashed entry produces 'Hello Dylan!'"
);

# test with the greeted argument and a stashed entry
tmpl_out_like(
    '<mt:helloworld greeted="Nicholas">',
    {},
    { entry => $e },
    qr/^Hello Nicholas!$/,
"mt:helloworld with stashed entry and greeted arg produces 'Hello Nicholas!'"
);

1;
