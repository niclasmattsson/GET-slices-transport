sets
*storage     /1, 2, 3, 4/
wind        /1, 2, 3, 4/
solarPV     /1, 2, 3, 4/
nuclear     /1, 2, 3, 4/
;

$include GET_7.gms
parameters
tot_cost_full(c_storage, CCS, CSP, nuclear)
tot_cost_lim(c_storage, CCS, CSP, nuclear)
tot_cost_no(c_storage, CCS, CSP, nuclear)
tot_cost_full_0(c_storage, CCS, CSP, nuclear)
tot_cost_lim_0(c_storage, CCS, CSP, nuclear)
tot_cost_no_0(c_storage, CCS, CSP, nuclear)
;
scalar solvestatus;
loop ( ( wind, solarPV, nuclearset),

if (sameas(wind,"1"),

   cost_inv_base("wind", "0", "elec")=2100;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);


elseif sameas(wind,"2"),

   cost_inv_base("wind", "0", "elec")=1800;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);

elseif sameas(wind,"3"),

   cost_inv_base("wind", "0", "elec")=1500;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);

elseif sameas(wind,"4"),

   cost_inv_base("wind", "0", "elec")=1200;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);

);
$ontext

if (sameas(storage,"1"),
   ccs_max=0;
   C_capt_agg.up=ccs_max;

elseif sameas(c_storage,"2"),
   ccs_max=1000000;
   C_capt_agg.up=ccs_max;

elseif sameas(c_storage,"3"),
   ccs_max=2000000;
   C_capt_agg.up=ccs_max;

elseif sameas(c_storage,"4"),
   ccs_max=3000000;
   C_capt_agg.up=ccs_max;

elseif sameas(c_storage,"5"),
   ccs_max=4000000;
   C_capt_agg.up=ccs_max;

);
$offtext

if (sameas(solarPV,"1"),
   cost_inv_base("solar", "0", "elec")=1500;
cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);

elseif sameas(solarPV,"2"),
   cost_inv_base("solar", "0", "elec")=1200;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);

elseif sameas(solarPV,"3"),
   cost_inv_base("solar", "0", "elec")=850;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);

elseif sameas(solarPV,"4"),
   cost_inv_base("solar", "0", "elec")=500;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);


);

if (sameas(nuclear,"4"),
   cost_inv_base("EU4", "0", "elec")=2500;
   cost_inv_base("EU4", "cg", "H2")=3500*cost_inv_base("EU4", "0", "elec")/5000;
   cost_inv_base("MOX", "0", "elec")=cost_inv_base("EU4", "0", "elec");
   cost_inv_base("FBF", "0", "elec")=3000;
cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);

elseif sameas(nuclear,"3"),
   cost_inv_base("EU4", "0", "elec")=3750;
   cost_inv_base("EU4", "cg", "H2")=3500*cost_inv_base("EU4", "0", "elec")/5000;
   cost_inv_base("MOX", "0", "elec")=cost_inv_base("EU4", "0", "elec");
   cost_inv_base("FBF", "0", "elec")=4500;
cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);

elseif sameas(nuclear,"2"),
   cost_inv_base("EU4", "0", "elec")=5000;
   cost_inv_base("EU4", "cg", "H2")=3500*cost_inv_base("EU4", "0", "elec")/5000;
   cost_inv_base("MOX", "0", "elec")=cost_inv_base("EU4", "0", "elec");
   cost_inv_base("FBF", "0", "elec")=6000;
cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);

elseif sameas(nuclear,"1"),
   cost_inv_base("EU4", "0", "elec")=6250;
   cost_inv_base("EU4", "cg", "H2")=3500*cost_inv_base("EU4", "0", "elec")/5000;
   cost_inv_base("MOX", "0", "elec")=cost_inv_base("EU4", "0", "elec");
   cost_inv_base("FBF", "0", "elec")=7500;
cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);

$ontext
elseif sameas(nuclear,"5"),
   cost_inv_base("EU4", "0", "elec")=7000;
   cost_inv_base("EU4", "cg", "H2")=3500*cost_inv_base("EU4", "0", "elec")/5000;
   cost_inv_base("MOX", "0", "elec")=cost_inv_base("EU4", "0", "elec");
   cost_inv_base("FBF", "0", "elec")=9000;
cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-
    (cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))*
    ((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);
$offtext

);

*scenario constraints
$ontext
cap_invest.up(nuclear_fuel,en_out,type,reg,t)$(year(t)>2020) = 1000;
en_conv.up(nuclear_fuel,en_out,type,reg,t)$(year(t)>2030) = 1000;

*$ontext
trajec(reg,t)=1000000;
    OPTION bratio=0;
    SOLVE GET_7 USING LP MINIMIZING TOT_COST ;

solvestatus = GET_7.modelstat;

tot_cost_full_0(c_storage, CCS, CSP, nuclear)  = tot_cost.l+eps;

trajec(reg,t)=scenario("400",reg,t);
*$offtext
    OPTION bratio=0;
    SOLVE GET_7 USING LP MINIMIZING TOT_COST ;

solvestatus = GET_7.modelstat;

tot_cost_full(c_storage, CCS, CSP, nuclear) = tot_cost.l+eps;


*scenario constraints
cap_invest.up("uranium5",en_out,type,reg,t)$(year(t)>2000) = 0;
cap_invest.up("FBF",en_out,type,reg,t)$(year(t)>2030) = 0;
*$ontext
trajec(reg,t)=1000000;
    OPTION bratio=0;
    SOLVE GET_7 USING LP MINIMIZING TOT_COST ;

solvestatus = GET_7.modelstat;

tot_cost_lim_0(c_storage, CCS, CSP, nuclear) = tot_cost.l+eps;

trajec(reg,t)=scenario("400",reg,t);
*$offtext
    OPTION bratio=0;
    SOLVE GET_7 USING LP MINIMIZING TOT_COST ;

solvestatus = GET_7.modelstat;

tot_cost_lim(c_storage, CCS, CSP, nuclear) = tot_cost.l+eps;

*scenario constraints
cap_invest.up("uranium5",en_out,type,reg,t)$(year(t)>2000) = 1000;
cap_invest.up("FBF",en_out,type,reg,t)$(year(t)>2030) = 1000;
cap_invest.up(nuclear_fuel,en_out,type,reg,t)$(year(t)>2020) = 0;
en_conv.up(nuclear_fuel,en_out,type,reg,t)$(year(t)>2040) = 0.0001;

*$ontext
trajec(reg,t)=1000000;
    OPTION bratio=0;
    SOLVE GET_7 USING LP MINIMIZING TOT_COST ;

solvestatus = GET_7.modelstat;

tot_cost_no_0(c_storage, CCS, CSP, nuclear) = tot_cost.l+eps;

trajec(reg,t)=scenario("400",reg,t);
$offtext
    OPTION bratio=0;
    SOLVE GET_7 USING LP MINIMIZING TOT_COST ;

solvestatus = GET_7.modelstat;

tot_cost_no(c_storage, CCS, CSP, nuclear) = tot_cost.l+eps;

);

execute_unload "excost.gdx" tot_cost_full, tot_cost_lim, tot_cost_no, tot_cost_full_0, tot_cost_lim_0, tot_cost_no_0

execute 'gdxxrw.exe excost.gdx epsout=0 par=tot_cost_full rng=tot_cost_full! Rdim=4 Cdim=0'
execute 'gdxxrw.exe excost.gdx epsout=0 par=tot_cost_lim rng=tot_cost_lim! Rdim=4 Cdim=0'
execute 'gdxxrw.exe excost.gdx epsout=0 par=tot_cost_no rng=tot_cost_no! Rdim=4 Cdim=0'
execute 'gdxxrw.exe excost.gdx epsout=0 par=tot_cost_full_0 rng=tot_cost_full_0! Rdim=4 Cdim=0'
execute 'gdxxrw.exe excost.gdx epsout=0 par=tot_cost_lim_0 rng=tot_cost_lim_0! Rdim=4 Cdim=0'
execute 'gdxxrw.exe excost.gdx epsout=0 par=tot_cost_no_0 rng=tot_cost_no_0! Rdim=4 Cdim=0'

