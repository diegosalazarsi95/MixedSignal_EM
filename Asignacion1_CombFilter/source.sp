.option PARHIER = LOCAL
.temp 25
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/disalazar/EM_Projects/MixedSignal/Hspice/lpmos/xh018.lib' tm
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/disalazar/EM_Projects/MixedSignal/Hspice/lpmos/param.lib' 3s
.lib '/mnt/vol_NFS_Zener/WD_ESPEC/disalazar/EM_Projects/MixedSignal/Hspice/lpmos/config.lib' default

.GLOBAL gnd!

.subckt source out1
v0 out1 gnd! dc=0 sin ( 0.2 0.2 150MEG 25n 0 0 )
.ends

.endcd
