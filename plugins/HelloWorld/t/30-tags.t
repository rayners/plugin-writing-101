use lib qw( t/lib lib extlib );
use strict;
use warnings;

use MT::Test qw( :db :data );
use Test::More tests => 1;

# verify that the tag output is the expected one
tmpl_out_like(
    '<mt:helloworld>', {}, {}, qr/^Hello World!$/,
    "mt:helloworld produces 'Hello World!'");

1;
