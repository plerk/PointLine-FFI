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

    $ffi->custom_type( Point => {
      perl_to_native => sub {
        ${$_[0]};
      },
      native_to_perl => sub {
        bless \$_[0], __PACKAGE__;
      },
    });
  
    $ffi->attach( [ point_new => 'new' ] => ['string','i32', 'i32'] => 'Point' );
    
    $ffi->attach( [ point_x => 'x' ] => ['Point'] => 'i32' );
    $ffi->attach( [ point_y => 'y' ] => ['Point'] => 'i32' );
  
  }
  
  package PointLine::FFI::Line {
  
    $ffi->custom_type( Line => {
      perl_to_native => sub {
        ${$_[0]};
      },
      native_to_perl => sub {
        bless \$_[0], __PACKAGE__;
      },
    });
    
    $ffi->attach( [ line_new => 'new'           ] => ['string','Point','Point'] => 'Line' );
    $ffi->attach( [ line_p1 => 'p1'             ] => ['Line'] => 'Point' );
    $ffi->attach( [ line_p2 => 'p2'             ] => ['Line'] => 'Point' );
    $ffi->attach( [ line_distance => 'distance' ] => ['Line'] => 'f64' );
  
  }

}

1;
