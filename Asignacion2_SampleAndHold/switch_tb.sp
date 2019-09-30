*Test
*---------------------------------------------------
*Parametrso y modelos
*---------------------------------------------------
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/diegosalazar/analogico_maestriatec/Hspice/lpmos/xh018.lib' tm
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/diegosalazar/analogico_maestriatec/Hspice/lpmos/param.lib' 3s
*.param VDD=1.8
.option measform=3
.temp 25
.option post
.op

.GLOBAL gnd!
.tran 0.5ns 500u 

*Vclk	vclk	gnd!	pulse 0 1.8 0 0 0 5u 10u
Vclk	vclk	gnd!	dc=1 power=0
Vsin 	vin	gnd! 	dc=1.8 power=0
Vmeas	vout	vr	dc=0 power=0

r1 vr gnd! r=4k

xmsw1 vout vclk vin gnd! nel w=450n l=180.0n as=8.64e-13 ad=8.64e-13 ps=4.56e-06
+ pd=4.56e-06 nrs=0.15 nrd=0.15 m='(1*1)' par1='(1*1)' xf_subext=0
xmsw2 vout net21 vin net20 pel w=900n l=180.0n as=4.32e-13 ad=4.32e-13 ps=2.76e-06
+  pd=2.76e-06 nrs=0.3 nrd=0.3 m='(1*1)' par1='(1*1)'
xminv2 net21 vclk vdd vdd pe w=1.54u l=180.0n as=7.392e-13 ad=7.392e-13 ps=4.04e-06
+  pd=4.04e-06 nrs=0.175325 nrd=0.175325 m='(1*1)' par1='(1*1)'
v5 net20 gnd! dc=1.8 power=0
xminv1 net21 vclk gnd! gnd! ne w=360.0n l=180.0n as=1.728e-13 ad=1.728e-13 ps=1.68e-06
+  pd=1.68e-06 nrs=0.75 nrd=0.75 m='(1*1)' par1='(1*1)' xf_subext=0


.end
