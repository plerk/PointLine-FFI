use strict;
use warnings;
use Test::More tests => 3;
use PointLine::FFI;

my $point = PointLine::FFI::Point->new(1,2);

isa_ok $point, 'PointLine::FFI::Point';

is $point->x, 1, 'point.x = 1';
is $point->y, 2, 'point.x = 2';
