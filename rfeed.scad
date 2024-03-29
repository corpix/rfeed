/*translate([0, 0, 13]) rotate([0, 45, 0]) {
    difference() {
        thickness = 3;
        border = 1.5;
        cube(size = [thickness, 20, 26], center = true);
        cube(
            size = [
                thickness,
                20 - border,
                26 - border
            ],
            center = true
        );
    }
}*/

/*
translate([0,0,-50]) {
polyhedron(
    points = [[0,0,0], [0,10,0], [10,0,0], [0,0,10]],
    faces = [[0,1,3], [0,2,1],  [1,2,3],  [0,3,2]]
);
}
*/
/*
function portal(width, height) = {
    linear_extrude(height = width) polygon(
        points=[
            [0,0],[0,height],[height,0]
        ]
    );

    translate([1, 0, 0])
    rotate([0, 0, -90])
    mirror([0,1,0])
    linear_extrude(height=1)
    polygon(
        points=[
            [0,0],[0,1],[1,0]
        ]
    );
};

portal(10, 26);
*/

/*
module portal_complex(width,height,thicknessX,thicknessY,angle=55)
{
    rotate([90,0,0]) {
        difference() {
            linear_extrude(height=width) polygon(
                [[0,0],[thicknessX,0],
                 [thicknessX+height*cos(angle)/sin(angle),height],
                 [height*cos(angle)/sin(angle),height]]
            );
            translate([0,-thicknessY,thicknessY])
            linear_extrude(height=width-thicknessY*2) 
            polygon(
                [[0,thicknessY*2],[thicknessX*2,thicknessY*2],
                 [(thicknessX*2)+(height-thicknessY*2)*cos(angle)/sin(angle),height],
                 [(height-thicknessY*2)*cos(angle)/sin(angle),height]]
            );
        };   
    };
};
  
translate([200,0,0]) portal_complex(20, 26, 2.5, 1);
*/


module rfeed_piramid(width=40) {
    rotate([90,0,0]) linear_extrude(height=width) polygon([[0,0], [15,25], [60,0]]);
};

difference() {
    rfeed_piramid();
    translate([20,-32-(40-32)/2,4]) cube([60,32,40]);
    translate([49,1,-1]) rfeed_piramid(42);
};

translate([30, -40/2, 4]) {
    union() {
        translate([0,-7.5,0])cylinder(5, d=15);
        translate([0,7.5,0]) cylinder(5, d=15);
    };
    translate([9, -(40-4*2)/2]) cube([0.3, 40-4*2, 7]);
};