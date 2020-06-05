use <Bajonett_Halterung.scad>;
$fn=30;

//Variablen Bajonett_Halterung

b_a=60;
h_a=40;
d_sp=22;
b_sp=22;
h_sp=32;
ws_sp=2.2;
ws_bj=2;
ang_sp=45;
ws_kr=0.45;   //ws_kr bezeichnet hier die Dicke der einseitigen Abtragung zur Erzeugung des Kragens
b_kr=4.8;

//Variablen Baseplate Motorgehaeuse

l=56;
b=64;
h=50;
ws_mg=4;
ws_trw=5;

//Variablen Baseplate Verfahrgehaeuse

l_v=90;
h_v=40;
ws_vs=7;

//Variablen Modulhalterung

ws_mh=11.2;
h_mhu=31;
h_mho=h_a;

module Motorgehaeuse (l,b,h,ws,ws_trw) {
    
    //translate([ws,ws,0]) cube([b,l,3]);
    difference(){
        translate([ws,0,0])cube([b,ws,h]);
        translate([17.5+37,0,25])rotate([-90,0,0])linear_extrude(ws)circle(d=6.6);
        translate([17.5,0,25])rotate([-90,0,0])linear_extrude(ws)circle(d=6.6);
    }
    cube([ws,l+ws+ws_trw,h]);
    difference(){
        translate([b+ws,0,0])cube([ws,l+ws+ws_trw,h]);
        translate([ws+b,ws+l/2-3,h-8-8.3+1])cube([ws,3,6.3]);
    }
    difference(){
        translate([ws,l+ws,0])cube([b,ws_trw,h]);
        translate([17.5+37,l+ws,25])rotate([-90,0,0])linear_extrude(ws_trw)circle(d=6.1);
        translate([17.5,l+ws,25])rotate([-90,0,0])linear_extrude(ws_trw)circle(d=6.1);
        translate([(2*ws_mg+b)/2,l+ws,25])rotate([-90,0,0])linear_extrude(ws_trw)circle(d=22);
        translate([15.5+(2*ws_mg+b)/2,l+ws,15.5+25])rotate([-90,0,0])linear_extrude(ws_trw)circle(d=3);
        translate([15.5+(2*ws_mg+b)/2,l+ws,-15.5+25])rotate([-90,0,0])linear_extrude(ws_trw)circle(d=3);
        translate([-15.5+(2*ws_mg+b)/2,l+ws,15.5+25])rotate([-90,0,0])linear_extrude(ws_trw)circle(d=3);
        translate([-15.5+(2*ws_mg+b)/2,l+ws,-15.5+25])rotate([-90,0,0])linear_extrude(ws_trw)circle(d=3);
    }
    
// STOPPERHALTERUNG & Extrusionen
    
    difference(){
        translate([2*ws+b-ws_vs-8.3,l+ws+ws_trw,h-8-8.3])cube([8.3,15,9]);
        translate([2*ws+b-ws_vs-8.3+1,l+ws+ws_trw,h-8-8.3+1])cube([6.3,15,7]);
        translate([2*ws_mg+b-ws_vs-3,ws_mg+ws_trw+l,h-8-8.3+1])cube([ws_vs,3,6.3]);
    }
    translate([2*ws+b-ws_vs,l+ws+ws_trw,h-8-8.3-20])rotate([-90,0,0])linear_extrude(15)polygon([[0,0],[0,-20],[-8.3,-20]]);
}

module Verfahrgehaeuse (l,b,l_v,h_v,h,ws_mg,ws_trw,ws_vs) {
    
    union(){
        translate([0,l+ws_trw+ws_mg,0])cube([ws_vs,l_v,h]);
    }    
    translate([ws_vs,0,0])rotate([0,-90,0])linear_extrude(ws_vs)polygon([[h,l+ws_mg+ws_trw],[h,l+ws_mg+ws_trw+l_v],[h_mhu+h_mho,l+ws_mg+ws_trw+l_v]]);
    
    translate([b+2*ws_mg-ws_vs,0,0])
        union(){
        difference(){
        translate([0,l+ws_trw+ws_mg,0])cube([ws_vs,l_v,h]);
        translate([0,ws_mg+ws_trw+l,h-8-8.3+1])cube([ws_vs,3,6.3]);
        translate([0,ws_mg+ws_trw+l+l_v-1.5,h-8-8.3+1])cube([ws_vs,3,6.3]);
        }
        translate([ws_vs,0,0])rotate([0,-90,0])linear_extrude(ws_vs)polygon([[h,l+ws_mg+ws_trw],[h,l+ws_mg+ws_trw+l_v],[h_mhu+h_mho,l+ws_mg+ws_trw+l_v]]);
    }
    
//STOPPERHALTERUNG
    
    difference(){
        translate([2*ws_mg+b-ws_vs-8.3,l+ws_mg+ws_trw+l_v-6,h-8-8.3])cube([8.3,6,9]);
        translate([2*ws_mg+b-ws_vs-8.3+1,l+ws_mg+ws_trw+l_v-6,h-8-8.3+1])cube([6.3,6,7]);
        translate([2*ws_mg+b-ws_vs-3,ws_mg+ws_trw+l+l_v-1.5,h-8-8.3+1])cube([ws_vs,3,6.3]);
    }
    translate([2*ws_mg+b-ws_vs,l+ws_mg+ws_trw+l_v-6,h-8-8.3-20])rotate([-90,0,0])linear_extrude(6)polygon([[0,0],[0,-20],[-8.3,-20]]);
    
// KABELKANAL    
    
    translate([2*ws_mg+b,ws_mg+l/2-5,h-8-8.3-1])difference(){
        cube([5,l_v+ws_trw+8.5+l/2,10.3]);
        translate([0,0,2])cube([3,l/2+l_v+8.5+ws_trw,6.3]);
        translate([0,l/2+ws_mg+ws_trw-1,8.3])cube([5,7,2]);
    }
    translate([2*ws_mg+b,5*(ws_mg+l/2)-1.5,h-8-8.3-1-20])rotate([-90,0,180])linear_extrude(l/2+l_v+ws_trw+8.5)polygon([[0,0],[0,-20],[-5,-20]]);
}
   
module Modulhalterung () {
    //Basis
    difference(){
        cube([b+2*ws_mg,ws_mh,h_mhu]);
        translate([(2*ws_mg+b)/2,0,25])rotate([-90,0,0])linear_extrude(5)circle(d=8);
        translate([17.5+37,0,25])rotate([-90,0,0])linear_extrude(5)circle(d=6.1);
        translate([17.5,0,25])rotate([-90,0,0])linear_extrude(5)circle(d=6.1);
        translate([15,0,3])cube([6.2,2,4.8]);
        translate([50,0,3])cube([6.2,2,4.8]);
        translate([15,0,7.8])cube([6.2,4.1,3]);
        translate([50,0,7.8])cube([6.2,4.1,3]);
        translate([15,0,0])cube([6.2,ws_mh,3]);
        translate([50,0,0])cube([6.2,ws_mh,3]);
    }
    //Seitenhalterung
    difference(){
        translate([0,0,h_mhu])cube([((b+2*ws_mg)-b_a)/2+b_kr,ws_mh,h_mho]);
        translate([((b+2*ws_mg)-b_a)/2,(ws_mh-2*ws_bj-ws_sp+2*ws_kr)/2,h_mhu]) cube([b_kr,2*ws_bj+ws_sp-2*ws_kr,h_mho]);
    }
    difference(){
    translate([b+2*ws_mg,ws_mh,0])rotate([0,0,180]) difference(){
        translate([0,0,h_mhu])cube([((b+2*ws_mg)-b_a)/2+b_kr,ws_mh,h_mho]);
        translate([((b+2*ws_mg)-b_a)/2,(ws_mh-2*ws_bj-ws_sp+2*ws_kr)/2,h_mhu]) cube([b_kr,2*ws_bj+ws_sp-2*ws_kr,h_mho]);
    }
    translate([2*ws_mg+b-ws_vs-3,-1.5,h-8-8.3+1])cube([ws_vs+3,3,6.3]);
    }
}

module Zusammenbau_BP (){

    Motorgehaeuse(l,b,h,ws_mg,ws_trw);
    Verfahrgehaeuse(l,b,l_v,h_v,h,ws_mg,ws_trw,ws_vs);
    translate([0,ws_trw+ws_mg+l+l_v,0]) Modulhalterung();
}

Zusammenbau_BP();
translate([6,ws_trw+ws_mg+l+l_v+(ws_mh-(2*ws_bj+ws_sp))/2+ws_kr,h_mhu]) Zusammenbau_BH();
translate([0,152,0])rotate([90,0,-90])linear_extrude(1)scale(0.8)text("Paris Lodron Universität SBG");
translate([2*ws_mg+b,80,43])rotate([90,0,90])linear_extrude(1)scale(0.6)text("#PIMPYOURPRINT");
    
    
    
    