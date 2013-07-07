The PrismX 3D Printer - fast, reliable, precise, and affordable.

This repository contains the CAD design files for the PrismX 3D Printer.

See src/README.txt for more details on printing PrismX parts.  Please read LICENSE and NOTICE.TXT for licensing details.

Directory Contents
------------------
dist/ - contains STL versions of the OpenSCAD files in scad/, scad/plates

moreparts/ - submodules used by PrismX such as 00str00der and others; original extras from the Prism Mendel

scad/ - OpenSCAD design files including terawatt-prism.scad

tools/ - java-based ANT build tools - not used yet

molding/ - non-public repository

build.xml - Java-based ANT build = automated compilation of SCAD files

*.settings.properties - properties file used by ANT build

Compile PrismX SCAD -> STL
--------------------------
The PrismX comes with an automated ANT build system.  ANT is based on Java and runs on multiple OS platforms.  You will need Java 6+ and ANT to run the build from the command line.  If you cannot install this software, you can still compile SCAD files from within OpenSCAD or using your own command-line tools.

To see a list of available ANT targets with description type "ant -p" from the command line.

NOTE:  References to the phrase "default configuration" mean the PrismX for M4 hardware and LM8UU bearings.  Additional configurations are planned.