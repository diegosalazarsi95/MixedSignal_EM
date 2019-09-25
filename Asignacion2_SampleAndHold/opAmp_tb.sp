*Test
*---------------------------------------------------
*Parametrso y modelos
*---------------------------------------------------
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/diegosalazar/analogico_maestriatec/Hspice/lpmos/xh018.lib' tm
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/diegosalazar/analogico_maestriatec/Hspice/lpmos/param.lib' 3s
*.param VDD=1.8
.option measform=3
.temp 70
.option post
.op

.GLOBAL gnd!
.tran 0.5ns 150m 

VDD 	avdd	 gnd!	DC	1.8
Vsin 	vin_plus gnd! 	sin ( 0 0.00005 10 2n 0 0 )



xm6 vout vpb2 net25 avdd pe w=14.4u l=600.0n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*2)' par1='(1*2)'
xm5 net38 vpb2 net21 avdd pe w=14.4u l=600n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*2)' par1='(1*2)'
xm4 net25 net38 avdd avdd pe w=14.4u l=600n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*2)' par1='(1*2)'
xm3 net21 net38 avdd avdd pe w=14.4u l=600n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*2)' par1='(1*2)'
xm2 net33 gnd! net9 avdd pe w=13.92u l=180.000n as=-1 ad=-1 ps=-1 pd=-1
+ nrs=-1 nrd=-1 m='(1*3)' par1='(1*3)'
xm1 net42 vin_plus net9 avdd pe w=13.92u l=180.0n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1
+  nrd=-1 m='(1*3)' par1='(1*3)'
xm0 net9 vpb1 avdd avdd pe w=10.8u l=180n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+ m='(1*1)' par1='(1*1)'
xm10 net42 vnb1 gnd! gnd! ne w=16.66u l=600.0n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1
+ nrd=-1 m='(1*3)' par1='(1*3)' extlay=0 xf_subext=0
xm9 net38 vnb2 net42 gnd! ne w=16.66u l=600n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*3)' par1='(1*3)' extlay=0 xf_subext=0
xm8 net33 vnb1 gnd! gnd! ne w=16.66u l=600n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1 nrd=-1
+  m='(1*3)' par1='(1*3)' extlay=0 xf_subext=0
xm7 vout vnb2 net33 gnd! ne w=16.66u l=600.000n as=-1 ad=-1 ps=-1 pd=-1 nrs=-1
+ nrd=-1 m='(1*3)' par1='(1*3)' extlay=0 xf_subext=0


v5 vnb2 gnd! dc=0.91 power=0
v4 vpb2 gnd! dc=0.35 power=0
v3 vpb1 gnd! dc=0.93 power=0
v2 vnb1 gnd! dc=0.72 power=0
c10 vout gnd! c=1p


.end
