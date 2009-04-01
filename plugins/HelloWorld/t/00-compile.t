use lib qw( t/lib lib extlib );
use strict;
use warnings;

use MT::Test;
use Test::More tests => 2;

require MT;
ok(MT->component ('helloworld'), "HelloWorld plugin loaded correctly");
require_ok('HelloWorld::Tags');

1;
