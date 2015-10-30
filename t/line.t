use strict;
use warnings;
use Test::More tests => 3;
use PointLine::FFI;

my $line = PointLine::FFI::Line->new(PointLine::FFI::Point->new(1,2), PointLine::FFI::Point->new(3,4));

isa_ok $line, 'PointLine::FFI::Line';

subtest coords => sub {
  plan tests => 4;
  
  is $line->p1->x, 1, 'line.p1.x = 1';
  is $line->p1->y, 2, 'line.p1.y = 2';
  is $line->p2->x, 3, 'line.p2.x = 3';
  is $line->p2->y, 4, 'line.p2.y = 4';
};

subtest distnace => sub {
  plan tests => 2;
  
  cmp_ok $line->distance, '>', 2.82, 'larger than 2.82';
  cmp_ok $line->distance, '<', 2.83, 'smaller than 2.83';
};
