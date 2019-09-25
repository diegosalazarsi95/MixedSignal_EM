.option PARHIER = LOCAL
.temp 25
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/disalazar/EM_Projects/MixedSignal/Hspice/lpmos/xh018.lib' tm
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/disalazar/EM_Projects/MixedSignal/Hspice/lpmos/param.lib' 3s
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/disalazar/EM_Projects/MixedSignal/Hspice/lpmos/config.lib' default

.GLOBAL gnd!

********************************************************************************
* Folded cascode
********************************************************************************
.subckt folded_cascode avdd avss vout vin_minus vin_plus vnb1 vnb2 vpb1 vpb2
xm6 vout vpb2 net25 avdd pe w=14.4u l=600.0n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*2)' par1='(1*2)'
xm5 net38 vpb2 net21 avdd pe w=14.4u l=600n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*2)' par1='(1*2)'
xm4 net25 net38 avdd avdd pe w=14.4u l=600n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*2)' par1='(1*2)'
xm3 net21 net38 avdd avdd pe w=14.4u l=600n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*2)' par1='(1*2)'
xm2 net33 vin_minus net9 avdd pe w=13.92u l=180.000n as=-1 ad=-1 ps=-1 pd=-1
+ nrs=-1 nrd=-1 m='(1*3)' par1='(1*3)'
xm1 net42 vin_plus net9 avdd pe w=13.92u l=180.0n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1
+  nrd=-1 m='(1*3)' par1='(1*3)'
xm0 net9 vpb1 avdd avdd pe w=10.8u l=180n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+ m='(1*1)' par1='(1*1)'
xm10 net42 vnb1 avss avss ne w=16.66u l=600.0n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1
+ nrd=-1 m='(1*3)' par1='(1*3)' extlay=0 xf_subext=0
xm9 net38 vnb2 net42 avss ne w=16.66u l=600n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*3)' par1='(1*3)' extlay=0 xf_subext=0
xm8 net33 vnb1 avss avss ne w=16.66u l=600n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*3)' par1='(1*3)' extlay=0 xf_subext=0
xm7 vout vnb2 net33 avss ne w=16.66u l=600.000n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1
+ nrd=-1 m='(1*3)' par1='(1*3)' extlay=0 xf_subext=0
.ends folded_cascode

********************************************************************************
* OpAmp with bias circuit
********************************************************************************
.subckt opamp avdd avss vin_minus vin_plus vout
xfolded_cascode0 avdd avss vout vin_minus vin_plus net12 net18 net14 net16
+ folded_cascode
v5 net18 avss dc=0.91 power=0
v4 net16 avss dc=0.35 power=0
v3 net14 avss dc=0.93 power=0
v2 net12 avss dc=0.72 power=0
c10 vout avss c=1p
.ends opamp

********************************************************************************
* Switch circuit
********************************************************************************
.subckt switchc clk vin vout
xmsw1 vout clk vin gnd! nel w=15u l=720.0n as=8.64e-13 ad=8.64e-13 ps=4.56e-06
+ pd=4.56e-06 nrs=0.15 nrd=0.15 m='(1*1)' par1='(1*1)' xf_subext=0
xmsw2 vout net21 vin net20 pel w=7.5u l=720.0n as=4.32e-13 ad=4.32e-13 ps=2.76e-06
+  pd=2.76e-06 nrs=0.3 nrd=0.3 m='(1*1)' par1='(1*1)'
xminv2 net21 clk net20 net20 pe w=1.54u l=180.0n as=7.392e-13 ad=7.392e-13 ps=4.04e-06
+  pd=4.04e-06 nrs=0.175325 nrd=0.175325 m='(1*1)' par1='(1*1)'
ch1 vout gnd! c=15p
v5 net20 gnd! dc=1.8 power=0
xminv1 net21 clk gnd! gnd! ne w=360.0n l=180.0n as=1.728e-13 ad=1.728e-13 ps=1.68e-06
+  pd=1.68e-06 nrs=0.75 nrd=0.75 m='(1*1)' par1='(1*1)' xf_subext=0
.ends switchc

********************************************************************************
* Source
********************************************************************************
.subckt source out1
v0 out1 gnd! dc=0 sin ( 0.25 0.2 1.5MEG 25n 0 0 )
.ends source

********************************************************************************
* Sample and Hold Circuit
********************************************************************************
.subckt sampleandhold clk vin vout
v1 net1 gnd! dc=1.8 power=0
xi0 net1 gnd! vout voutsw vout opamp
xi1 clk vinsw voutsw switchc
xi2 net1 gnd! vinsw vin vinsw opamp
.ends sampleandhold

.endcd

