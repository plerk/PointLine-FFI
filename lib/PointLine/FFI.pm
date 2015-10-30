use strict;
use warnings;
use FFI::Platypus;

package PointLine::FFI {

  # ABSTRACT: Rust implementation of points and lines
  # VERSION

  my $ffi = FFI::Platypus->new(
    lang => 'Rust',
  );
  $ffi->package;

  package PointLine::FFI::Point {
  
    $ffi->attach( [ point_new => 'new' ] => ['i32', 'i32'] => 'opaque' => sub {
      my($xsub, $class, $x, $y) = @_;
      my $self = $xsub->($x, $y);
      bless \$self, $class;
    });
    
    $ffi->attach( [ point_x => 'x' ] => ['opaque'] => 'i32' => sub {
      my($xsub, $self) = @_;
      $xsub->($$self);
    });
    $ffi->attach( [ point_y => 'y' ] => ['opaque'] => 'i32' => sub {
      my($xsub, $self) = @_;
      $xsub->($$self);
    });
  
  }

}

1;
