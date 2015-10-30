pub struct Point { x: i32, y: i32 }
pub struct Line { p1: Point, p2: Point }

impl Line {
  pub fn length(&self) -> f64 {
    let xdiff = self.p1.x - self.p2.x;
    let ydiff = self.p1.y - self.p2.y;
    ((xdiff.pow(2) + ydiff.pow(2)) as f64).sqrt()
  }
}

#[no_mangle]
pub extern "C" fn point_new(x: i32, y: i32) -> Box<Point> {
  Box::new(Point { x: x, y: y })
}

#[no_mangle]
pub extern "C" fn point_x(_self: &Point) -> i32 {
  _self.x
}

#[no_mangle]
pub extern "C" fn point_y(_self: &Point) -> i32 {
  _self.y
}

#[no_mangle]
pub extern "C" fn line_new(_: *const u8, p1: &Point, p2: &Point) -> Box<Line> {
  Box::new(Line { p1: Point { x: p1.x, y: p1.y }, p2: Point { x: p2.x, y:p2.y } })
}

#[no_mangle]
pub extern "C" fn line_p1(_self: &Line) -> Box<Point> {
  Box::new(Point { x: _self.p1.x, y: _self.p2.y })
}

#[no_mangle]
pub extern "C" fn line_p2(_self: &Line) -> Box<Point> {
  Box::new(Point { x: _self.p2.x, y: _self.p2.y })
}

#[no_mangle]
pub extern "C" fn line_distance(_self: &Line) -> f64 {
  _self.length()
}
