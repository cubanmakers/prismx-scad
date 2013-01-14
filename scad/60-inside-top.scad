// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>;

thickness = 6;   // wall and base thickness
slottabs = 2;    // Slot depth (2 is normal) -1 to remove tabs
holes = m4_diameter;  //m3, m4 or m5=5.1
o = 0.1;						// overlap amount for error-free STLs

$fn=30;

for (x = [0])
{
	translate([(x*25),0,0]) prism60inside(thickness,slottabs,holes);
	//translate([20+(x*25),55,0]) mirror() prism60inside(thickness,slottabs,holes);
}

module prism60inside(th,st,hs)
{
	translate([20,(th/cos(15)),0]) rotate([0,0,165]) walls(th,st,hs);
	base(th,hs);
}

module walls(wth,wst,whs)
{
	an=atan((20)/(50-11.55-wth));
	ln=(20/cos(45))-(wth*tan(45));
	echo(ln);
	translate([7.5,wth-o,0]) cube([5,wst+o,12]);

	difference()
	{
		cube([ln,wth,20+wth]);
		translate([10,-0.1,16]) rotate([-90,0,0]) cylinder(r=whs/2,h=7);
	}

	translate([ln,wth,0,]) rotate([0,0,210]) difference()
	{
		cube([wth,(50-11.55),20+wth]);
		translate([-o,(50-11.55),wth]) rotate([-an,0,0]) mirror([0,1,0]) cube([wth+2*o,50,20+wth]);
	}

}


module base(bth,bhs)
{
	trn = 20-((bth/cos(15))*tan(15));
	difference()
		{
			translate([-12.5, 0, 0]) cube([35,50,bth]);
			translate([20,0,-o]) rotate([0,0,-15]) mirror([1,1,0]) cube([10,35,bth+2*o]);
			translate([-2, 5, -o]) rotate([0, 0, -75]) mirror([1,1,0]) cube([10,40,bth+2*o]);
			translate([15, 61, -o]) rotate([0, 0, 15]) mirror([1,1,0]) cube([10,35,bth+2*o]);
			translate([bth,50,-o]) rotate([0,0,-105]) mirror([1,0,0]) cube([10,25,bth+2*o]);

			translate([trn,0,-0.1]) rotate([0,0,-15]) cube([10,15,6.5]);
			translate([10,15+bth,-0.1]) cylinder(r=bhs/2,h=bth+2*o);
			translate([10,35+bth,-0.1]) cylinder(r=bhs/2,h=bth+2*o);
		}
}
