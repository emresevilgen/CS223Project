/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_310(char*, char *);
extern void execute_311(char*, char *);
extern void execute_312(char*, char *);
extern void execute_1706(char*, char *);
extern void execute_1707(char*, char *);
extern void execute_1708(char*, char *);
extern void execute_1709(char*, char *);
extern void execute_1710(char*, char *);
extern void execute_1711(char*, char *);
extern void execute_1712(char*, char *);
extern void execute_1713(char*, char *);
extern void execute_1714(char*, char *);
extern void execute_1715(char*, char *);
extern void execute_1716(char*, char *);
extern void execute_1717(char*, char *);
extern void execute_1718(char*, char *);
extern void execute_1719(char*, char *);
extern void execute_1720(char*, char *);
extern void execute_1721(char*, char *);
extern void execute_1722(char*, char *);
extern void execute_1723(char*, char *);
extern void execute_1724(char*, char *);
extern void execute_1725(char*, char *);
extern void execute_5(char*, char *);
extern void execute_6(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_9(char*, char *);
extern void execute_806(char*, char *);
extern void execute_807(char*, char *);
extern void execute_808(char*, char *);
extern void execute_809(char*, char *);
extern void execute_805(char*, char *);
extern void execute_11(char*, char *);
extern void execute_12(char*, char *);
extern void execute_13(char*, char *);
extern void execute_810(char*, char *);
extern void execute_811(char*, char *);
extern void execute_812(char*, char *);
extern void execute_15(char*, char *);
extern void execute_16(char*, char *);
extern void execute_17(char*, char *);
extern void execute_813(char*, char *);
extern void execute_814(char*, char *);
extern void execute_815(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_34(char*, char *);
extern void execute_828(char*, char *);
extern void execute_829(char*, char *);
extern void execute_830(char*, char *);
extern void execute_831(char*, char *);
extern void execute_832(char*, char *);
extern void execute_833(char*, char *);
extern void execute_834(char*, char *);
extern void execute_835(char*, char *);
extern void execute_827(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_42(char*, char *);
extern void execute_43(char*, char *);
extern void execute_90(char*, char *);
extern void execute_870(char*, char *);
extern void execute_871(char*, char *);
extern void execute_869(char*, char *);
extern void execute_921(char*, char *);
extern void execute_922(char*, char *);
extern void execute_923(char*, char *);
extern void execute_926(char*, char *);
extern void execute_927(char*, char *);
extern void execute_928(char*, char *);
extern void execute_929(char*, char *);
extern void execute_314(char*, char *);
extern void execute_797(char*, char *);
extern void execute_798(char*, char *);
extern void execute_799(char*, char *);
extern void execute_1704(char*, char *);
extern void execute_801(char*, char *);
extern void execute_802(char*, char *);
extern void execute_803(char*, char *);
extern void execute_1726(char*, char *);
extern void execute_1727(char*, char *);
extern void execute_1728(char*, char *);
extern void execute_1729(char*, char *);
extern void execute_1730(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_50(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_68(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_74(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_75(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_76(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_77(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_78(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_79(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_80(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_81(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_82(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_83(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_84(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_85(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_86(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_87(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_88(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_89(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_90(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_91(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_92(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_93(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_94(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_95(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_96(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_97(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_98(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_99(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_100(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_101(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_102(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_103(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_104(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_105(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_106(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_107(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_119(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_133(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_137(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_141(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_145(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_149(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_180(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_211(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_215(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_219(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_223(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_227(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_289(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_293(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_297(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_301(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_305(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_309(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_313(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_327(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_331(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_335(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_348(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_352(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_356(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_360(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_374(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_378(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_382(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_386(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_399(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_403(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_407(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_411(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_424(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_428(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_437(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_446(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_491(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_515(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_519(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_523(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_527(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_531(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_535(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_539(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_543(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_716(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_720(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_724(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_728(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_732(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_749(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_807(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_811(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_815(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_819(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_823(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_827(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_831(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_835(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_863(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_867(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_871(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1196(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1200(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1204(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1208(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1212(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1216(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1220(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1224(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1228(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1232(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1236(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1240(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1244(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1248(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1252(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1256(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1260(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1264(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1268(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1272(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1276(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1280(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1284(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1288(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1390(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1394(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1398(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1402(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1406(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1410(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1414(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1418(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1422(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1426(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[219] = {(funcp)execute_310, (funcp)execute_311, (funcp)execute_312, (funcp)execute_1706, (funcp)execute_1707, (funcp)execute_1708, (funcp)execute_1709, (funcp)execute_1710, (funcp)execute_1711, (funcp)execute_1712, (funcp)execute_1713, (funcp)execute_1714, (funcp)execute_1715, (funcp)execute_1716, (funcp)execute_1717, (funcp)execute_1718, (funcp)execute_1719, (funcp)execute_1720, (funcp)execute_1721, (funcp)execute_1722, (funcp)execute_1723, (funcp)execute_1724, (funcp)execute_1725, (funcp)execute_5, (funcp)execute_6, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_9, (funcp)execute_806, (funcp)execute_807, (funcp)execute_808, (funcp)execute_809, (funcp)execute_805, (funcp)execute_11, (funcp)execute_12, (funcp)execute_13, (funcp)execute_810, (funcp)execute_811, (funcp)execute_812, (funcp)execute_15, (funcp)execute_16, (funcp)execute_17, (funcp)execute_813, (funcp)execute_814, (funcp)execute_815, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_34, (funcp)execute_828, (funcp)execute_829, (funcp)execute_830, (funcp)execute_831, (funcp)execute_832, (funcp)execute_833, (funcp)execute_834, (funcp)execute_835, (funcp)execute_827, (funcp)execute_37, (funcp)execute_38, (funcp)execute_42, (funcp)execute_43, (funcp)execute_90, (funcp)execute_870, (funcp)execute_871, (funcp)execute_869, (funcp)execute_921, (funcp)execute_922, (funcp)execute_923, (funcp)execute_926, (funcp)execute_927, (funcp)execute_928, (funcp)execute_929, (funcp)execute_314, (funcp)execute_797, (funcp)execute_798, (funcp)execute_799, (funcp)execute_1704, (funcp)execute_801, (funcp)execute_802, (funcp)execute_803, (funcp)execute_1726, (funcp)execute_1727, (funcp)execute_1728, (funcp)execute_1729, (funcp)execute_1730, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_49, (funcp)transaction_50, (funcp)transaction_68, (funcp)transaction_74, (funcp)transaction_75, (funcp)transaction_76, (funcp)transaction_77, (funcp)transaction_78, (funcp)transaction_79, (funcp)transaction_80, (funcp)transaction_81, (funcp)transaction_82, (funcp)transaction_83, (funcp)transaction_84, (funcp)transaction_85, (funcp)transaction_86, (funcp)transaction_87, (funcp)transaction_88, (funcp)transaction_89, (funcp)transaction_90, (funcp)transaction_91, (funcp)transaction_92, (funcp)transaction_93, (funcp)transaction_94, (funcp)transaction_95, (funcp)transaction_96, (funcp)transaction_97, (funcp)transaction_98, (funcp)transaction_99, (funcp)transaction_100, (funcp)transaction_101, (funcp)transaction_102, (funcp)transaction_103, (funcp)transaction_104, (funcp)transaction_105, (funcp)transaction_106, (funcp)transaction_107, (funcp)transaction_119, (funcp)transaction_133, (funcp)transaction_137, (funcp)transaction_141, (funcp)transaction_145, (funcp)transaction_149, (funcp)transaction_180, (funcp)transaction_211, (funcp)transaction_215, (funcp)transaction_219, (funcp)transaction_223, (funcp)transaction_227, (funcp)transaction_289, (funcp)transaction_293, (funcp)transaction_297, (funcp)transaction_301, (funcp)transaction_305, (funcp)transaction_309, (funcp)transaction_313, (funcp)transaction_327, (funcp)transaction_331, (funcp)transaction_335, (funcp)transaction_348, (funcp)transaction_352, (funcp)transaction_356, (funcp)transaction_360, (funcp)transaction_374, (funcp)transaction_378, (funcp)transaction_382, (funcp)transaction_386, (funcp)transaction_399, (funcp)transaction_403, (funcp)transaction_407, (funcp)transaction_411, (funcp)transaction_424, (funcp)transaction_428, (funcp)transaction_437, (funcp)transaction_446, (funcp)transaction_491, (funcp)transaction_515, (funcp)transaction_519, (funcp)transaction_523, (funcp)transaction_527, (funcp)transaction_531, (funcp)transaction_535, (funcp)transaction_539, (funcp)transaction_543, (funcp)transaction_716, (funcp)transaction_720, (funcp)transaction_724, (funcp)transaction_728, (funcp)transaction_732, (funcp)transaction_749, (funcp)transaction_807, (funcp)transaction_811, (funcp)transaction_815, (funcp)transaction_819, (funcp)transaction_823, (funcp)transaction_827, (funcp)transaction_831, (funcp)transaction_835, (funcp)transaction_863, (funcp)transaction_867, (funcp)transaction_871, (funcp)transaction_1196, (funcp)transaction_1200, (funcp)transaction_1204, (funcp)transaction_1208, (funcp)transaction_1212, (funcp)transaction_1216, (funcp)transaction_1220, (funcp)transaction_1224, (funcp)transaction_1228, (funcp)transaction_1232, (funcp)transaction_1236, (funcp)transaction_1240, (funcp)transaction_1244, (funcp)transaction_1248, (funcp)transaction_1252, (funcp)transaction_1256, (funcp)transaction_1260, (funcp)transaction_1264, (funcp)transaction_1268, (funcp)transaction_1272, (funcp)transaction_1276, (funcp)transaction_1280, (funcp)transaction_1284, (funcp)transaction_1288, (funcp)transaction_1390, (funcp)transaction_1394, (funcp)transaction_1398, (funcp)transaction_1402, (funcp)transaction_1406, (funcp)transaction_1410, (funcp)transaction_1414, (funcp)transaction_1418, (funcp)transaction_1422, (funcp)transaction_1426};
const int NumRelocateId= 219;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/project_behav/xsim.reloc",  (void **)funcTab, 219);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/project_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/project_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/project_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/project_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/project_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
