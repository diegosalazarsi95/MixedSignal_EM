*Test
*---------------------------------------------------
*Parametrso y modelos
*---------------------------------------------------
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/diegosalazar/analogico_maestriatec/Hspice/lpmos/xh018.lib' tm
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/diegosalazar/analogico_maestriatec/Hspice/lpmos/param.lib' 3s
.option measform=3
.temp 70
.option post
.op
.GLOBAL gnd!

*Test the OL frequency response
.AC DEC 100 10MEG 10000G
Vp vinp 0 DC 0.5 AC 1
Rbig vout vinm 100MEG
Cbig vinm gnd! 10u


**Test OL gain
*.tran 0.5ns 450u 
*Vsin 	vinp 	gnd! 	sin ( 0 0.00005 10k 2n 0 0 )
*Vgnd	vinm	gnd!	dc=0 power=0
*Cp vout gnd! 1p

xmb1 vnb1 vnb1 gnd! gnd! ne w=4200n l=360.0n as=1.9872e-12 ad=1.9872e-12 ps=9.24e-06
+  pd=9.24e-06 nrs=0.0652174 nrd=0.0652174 m='(1*1)' par1='(1*1)' xf_subext=0
xmb2 vpb1 vnb1 net80 gnd! ne w=15300n l=360.0n as=1.9872e-12 ad=1.9872e-12 ps=9.24e-06
+  pd=9.24e-06 nrs=0.0652174 nrd=0.0652174 m='(1*1)' par1='(1*1)' xf_subext=0
xmb3 vnb1 vpb1 avdd avdd pe w=4200n l=360.0n as=9.6e-11 ad=9.6e-11 ps=0.00040096
+  pd=0.00040096 nrs=0.00135 nrd=0.00135 m='(1*1)' par1='(1*1)'
xmb4 vpb1 vpb1 avdd avdd pe w=4200n l=360.0n as=4.03536e-11 ad=4.03536e-11 ps=0.0001691
+  pd=0.0001691 nrs=0.00321161 nrd=0.00321161 m='(1*1)' par1='(1*1)'
xmb5 vpb2 vnb1 gnd! gnd! ne w=4200n l=360.0n as=1.9872e-12 ad=1.9872e-12 ps=9.24e-06
+  pd=9.24e-06 nrs=0.0652174 nrd=0.0652174 m='(1*1)' par1='(1*1)' xf_subext=0
xmb6 vpb2 vpb2 avdd avdd pe w=1080n l=360.0n as=8.64e-13 ad=8.64e-13 ps=4.56e-06
+ pd=4.56e-06 nrs=0.15 nrd=0.15 m='(1*1)' par1='(1*1)'
xmb7 vnb2 vpb1 avdd avdd pe w=4200n l=360.0n as=8.64e-13 ad=8.64e-13 ps=4.56e-06
+ pd=4.56e-06 nrs=0.15 nrd=0.15 m='(1*1)' par1='(1*1)'
xmb8 vnb2 vnb2 gnd! gnd! ne w=1440n l=360.0n as=8.64e-13 ad=8.64e-13 ps=4.56e-06
+ pd=4.56e-06 nrs=0.15 nrd=0.15 m='(1*1)' par1='(1*1)' xf_subext=0
rc net80 gnd! r=4k

xm1 net41 vinp net25 avdd pe w=15187n l=180.0n as=4.04352e-11 ad=4.04352e-11 ps=0.00016944
+  pd=0.00016944 nrs=0.00320513 nrd=0.00320513 m='(1*1)' par1='(1*1)'
xm2 net37 vinm net25 avdd pe w=15187n l=180.0n as=4.04352e-11 ad=4.04352e-11 ps=0.00016944
+  pd=0.00016944 nrs=0.00320513 nrd=0.00320513 m='(1*1)' par1='(1*1)'
xm3 net25 vpb1 avdd avdd pe w=7750n l=180.0n as=8.64e-12 ad=8.64e-12 ps=3.696e-05
+  pd=3.696e-05 nrs=0.015 nrd=0.015 m='(1*1)' par1='(1*1)'

xm4 net41 vnb1 gnd! gnd! ne w=33914n l=240.0n as=3.93984e-11 ad=3.93984e-11 ps=0.00016512
+  pd=0.00016512 nrs=0.00328947 nrd=0.00328947 m='(1*1)' par1='(1*1)' xf_subext=0
xm5 net37 vnb1 gnd! gnd! ne w=33914n l=240.0n as=3.93984e-11 ad=3.93984e-11 ps=0.00016512
+  pd=0.00016512 nrs=0.00328947 nrd=0.00328947 m='(1*1)' par1='(1*1)' xf_subext=0

xm6 net29 vnb2 net41 gnd! ne w=90438n l=640.0n as=3.93984e-11 ad=3.93984e-11 ps=0.00016512
+  pd=0.00016512 nrs=0.00328947 nrd=0.00328947 m='(1*1)' par1='(1*1)' xf_subext=0
xm7 vout vnb2 net37 gnd! ne w=90438n l=640.0n as=3.93984e-11 ad=3.93984e-11 ps=0.00016512
+  pd=0.00016512 nrs=0.00328947 nrd=0.00328947 m='(1*1)' par1='(1*1)' xf_subext=0

xm8 net29 vpb2 net9 avdd pe w=75520n l=640.0n as=3.26592e-11 ad=3.26592e-11 ps=0.00013704
+  pd=0.00013704 nrs=0.00396825 nrd=0.00396825 m='(1*1)' par1='(1*1)'
xm9 vout vpb2 net13 avdd pe w=75520n l=640.0n as=3.26592e-11 ad=3.26592e-11 ps=0.00013704
+  pd=0.00013704 nrs=0.00396825 nrd=0.00396825 m='(1*1)' par1='(1*1)'

xm10 net9 net29 avdd avdd pe w=55480n l=360.0n as=3.26592e-11 ad=3.26592e-11 ps=0.00013704
+  pd=0.00013704 nrs=0.00396825 nrd=0.00396825 m='(1*1)' par1='(1*1)'
xm11 net13 net29 avdd avdd pe w=55480n l=360.0n as=3.26592e-11 ad=3.26592e-11
+ ps=0.00013704 pd=0.00013704 nrs=0.00396825 nrd=0.00396825 m='(1*1)' par1='(1*1)'

vdd avdd gnd! dc=1.8 power=0

.end
