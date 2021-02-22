sets

t     /  2010, 2020, 2030, 2040, 2050, 2060, 2070, 2080,
          2090, 2100, 2110, 2120, 2130, 2140, 2150 /

t_1 (t) / 2010, 2020, 2030, 2040, 2050, 2060, 2070, 2080,
          2090, 2100, 2110, 2120, 2130 /

t_ext (t) / 2140, 2150 /

reg /EUR, NAM, PAO, FSU, LAM, CPA, AFR, SAS, PAS, MEA/

type           /  0, cg, dec, cg_dec /


energy /oil1,oil2,oil3, bio, bio1, bio2, bio3,hydro, wind, solar, gas1, gas2, gas3, oil, coal1,coal2, coal,
          MeOH, H2,  elec, petro, air_fuel,trsp, pellets, CH4 , central_heat, dist_heat, solid_heat
         non_solid_heat, feed-stock,  uranium1, uranium2, uranium3, uranium4, uranium5, biogas, ethanol, biodiesel,
          PuR, EU4, EU1, Pu,FBF, MOX, Rep1, Rep2, Rep3, sLWRf, BrProd, sCANDUf, sMoxf, waste, CANDUw, MOXw, Brwaste,
          windonshoreA, windonshoreB, windoffshore, pvrooftop, pvplantA, pvplantB, cspplantA, cspplantB,
          storage_12h, storage_24h, storage_48h, storage_96h, air, CO2, NH3 /

sector(energy) /elec, central_heat, dist_heat, solid_heat
         non_solid_heat, feed-stock ,h2,  MeOH, biogas, ethanol, biodiesel,oil, NH3   /
         
trsp_fuel (energy)              / elec, MeOH, biogas, ethanol, biodiesel, H2, petro, air_fuel , CH4, NH3/

*new_trsp_fuel (trsp_fuel) / MeOH, biogas, ethanol, biodiesel, H2, CH4 /
road_fuel(trsp_fuel)           / MeOH, biogas, ethanol, biodiesel, H2, CH4, petro, elec, NH3/
road_fuel_liquid(road_fuel)    / MeOH, biogas, ethanol, biodiesel, H2, CH4, petro, NH3 /


engine_type   / 0, FC , hyb, BEV, PHEV/
elec_veh(engine_type) /BEV, PHEV/
non_phev(engine_type) /   0, FC , hyb, BEV/
IC_FC(engine_type) /0, FC/

trsp_mode  /p_car, p_air_short, p_air_medium, p_air_long, p_bus, p_rail, f_road, f_air, f_rail, f_container, f_coast, f_ocean/
car_truck_ships (trsp_mode)    / p_car, f_road, p_bus, f_container, f_coast, f_ocean /
car_or_truck (trsp_mode) / p_car, f_road, p_bus/
heavy_mode (trsp_mode) /  f_container, f_coast, f_ocean /
frgt_mode (trsp_mode)   / f_road, f_air, f_container, f_coast, f_ocean, f_rail /
freight_bus_mode (trsp_mode)  / f_road, p_bus, f_container, f_coast, f_ocean /
air_mode (trsp_mode) / p_air_short, p_air_medium, p_air_long, f_air /

;

parameters

t_step        / 10   /

life_eng(trsp_fuel, engine_type, trsp_mode)        life time
lf_infra(trsp_fuel)                                      loadfactor
vehicle_cost(trsp_mode)                            basic cost for vehicle w gasoline or marin gas oil IC engine
t_tech_eng(road_fuel, engine_type, trsp_mode)      technology developm time

life_infra(trsp_fuel)  life time for infrastructure

elec_frac_PHEV(car_or_truck)
/p_car   0.65
f_road 0.53
p_bus   0.53/;

;

life_infra(trsp_fuel) = 50;

table cost_infra(trsp_fuel, trsp_mode)  infrastr costs (USD per kW)
                 p_car f_road    p_bus  f_container   f_coast  f_ocean   p_air_short     p_air_medium    p_air_long      f_air   p_rail  f_rail
      petro      700    700      700     100          100      100             1              1               1             1       1        1
      MeOH       1200   1200     1200    200          200      200             1              1               1             1       1        1
      ethanol    1200   1200     1200    200          200      200             1              1               1             1       1        1
      H2         2700   2700     2700    2100         2100     2100            1              1               1             1       1        1
      CH4        2200   2200     2200    1600         1600     1600            1              1               1             1       1        1
      biogas     2200   2200     2200    200          200      200             1              1               1             1       1        1
      biodiesel  720    720      720     200          200      200             1              1               1             1       1        1
      NH3        700    700      700     100          100      100             1              1               1             1       1        1
;

table frac_engine(engine_type, car_or_truck)
         p_car   f_road   p_bus
0          1        1        1
FC         1        1        1
hyb        1        1        1
PHEV       1       0.8       0.9
BEV        1       0.8       0.9  ;

* $CALL GDXXRW.EXE indata_B2_stab.xls @import_indata.txt
$CALL GDXXRW.EXE input_SSP2_26.xls @import_SSPdata.txt
parameter dem_base(energy, reg,t)  ;
parameter ptrsp( trsp_mode, reg,t_1) ;
parameter num_veh(trsp_mode,reg,t) ;
parameter frgt( trsp_mode, reg,t_1);
*parameter num_trucks( region, reg,t_1) ;
$GDXIN indata_B2_stab.gdx
$LOAD dem_base
$LOAD ptrsp
$LOAD num_veh
$LOAD frgt
$GDXIN

parameters
trsp_demand_base(trsp_mode, reg,t)
dem(energy, reg,t) demand given in EJ
trsp_demand(trsp_mode, reg,t)   demand given in EJ
freight_demand(car_truck_ships, reg,t) demand given in EJ
trajec(reg,t)
;

dem_base(sector, reg,t_ext) = dem_base(sector,reg, "2130");
num_veh(car_truck_ships,reg,t_ext)=num_veh(car_truck_ships, reg,"2130");
trsp_demand_base(trsp_mode, reg,t_1) = ptrsp( trsp_mode, reg,t_1)  ;
trsp_demand_base(frgt_mode , reg,t_1) = frgt( frgt_mode , reg,t_1)  ;
trsp_demand_base(trsp_mode, reg,t_ext) = trsp_demand_base(trsp_mode, reg,"2130") ;

dem(sector,reg, t) = dem_base(sector,reg,t);
trsp_demand(trsp_mode, reg,t) = trsp_demand_base(trsp_mode, reg,t) ;
*freight_demand("f_road",reg,t)=sum(heavy_mode, trsp_demand(heavy_mode,reg,t));

$CALL GDXXRW.EXE tech-data.xls @import.txt
Parameter cost_eng_base(road_fuel, engine_type, trsp_mode) ;
* parameter effic_0(energy, type, en_out);
parameter emis_fact(energy);
parameter trsp_conv (trsp_fuel, engine_type, trsp_mode);
parameter cost_eng_0(road_fuel, engine_type, trsp_mode)      initial vehicle investment cost (vehicle + engine)
$GDXIN tech-data.gdx
$LOAD cost_eng_base
* $LOAD effic_0
$LOAD trsp_conv
$LOAD emis_fact
$LOAD cost_eng_0
$GDXIN
;

Parameters

cost_infra_mod(trsp_fuel, trsp_mode)  d:o adjusted for different investm and discount rates

cost_eng(road_fuel, engine_type, trsp_mode, t)     time dependent vehicle investment cost (vehicle + engine)
cost_eng_mod(road_fuel, engine_type, trsp_mode, t) d:o adjusted for different investm and discount rates

infra_g_lim    infrastr relative growth limit
    / 0.1 /
*    / 0.10 /
init_infra     initial unrestricted infrastr growth (TW per decade)
    / 0.01 /
eng_g_lim  / 0.2/
*eng_g_lim  / 0.20 /
init_eng /0.01/

marketshare_eng /0.25/ 

emis_fact2(trsp_fuel) shipping emissions
/MeOH   65
H2        0
elec      0
petro     65
air_fuel   65
CH4         52
biogas      0
ethanol     0
biodiesel    0
NH3      0/

Shipping_emis_cons(t) constraint on shipping emissions
/2010       1500
2020        1500
2030        1500
2040        750
2050        580
2060        300
2070        150
2080        100
2090        50
2100        10
2110        0
2120        0
2130        0
2140        0
2150        0 /

r         discount rate
    / 0.05 /
;

vehicle_cost("p_car")  = 10000;
vehicle_cost("f_road") = 80000;
vehicle_cost("p_bus") = 80000;
vehicle_cost("f_container") = 127;
vehicle_cost("f_coast") = 175;
vehicle_cost("f_ocean") = 774;
vehicle_cost("p_air_short") = 127;
vehicle_cost("p_air_medium") = 175;
vehicle_cost("p_air_long") = 774;
vehicle_cost("f_air") = 127;
vehicle_cost("f_rail") = 175;
vehicle_cost("p_rail") = 774;
*vehicle cost for cars in GUSD/ G road vehicles
*17500000 USD/coast vessel   = 175 GUSD/10^4 coast vessels
*127000000 USD/container vessel   = 127 GUSD/k container vessels
*774000000 USD/container vessel   = 774 GUSD/10^4 ocean vessels

*These costs seem low compared to bus and road ???

t_tech_eng(road_fuel, engine_type, trsp_mode) = 40;
cost_eng(road_fuel, engine_type, trsp_mode, t) =
*cost_eng_base(road_fuel, engine_type, car_or_truck)
*             + vehicle_cost(car_or_truck) ;
 max( cost_eng_base(road_fuel, engine_type, trsp_mode),
    cost_eng_0(road_fuel, engine_type, trsp_mode) -
    (cost_eng_0(road_fuel, engine_type, trsp_mode)-cost_eng_base(road_fuel, engine_type, trsp_mode))*
    ((ord(t)-1)*t_step/t_tech_eng(road_fuel, engine_type, trsp_mode)) )
    + vehicle_cost(trsp_mode);

life_eng(trsp_fuel, engine_type, trsp_mode) = 30;
life_eng(trsp_fuel, engine_type, car_or_truck) = 15;

cost_infra_mod(trsp_fuel, car_truck_ships) = cost_infra(trsp_fuel, car_truck_ships)  

positive variables

trsp_useful_energy(trsp_fuel, engine_type, trsp_mode, reg, t)
trsp_energy(trsp_fuel, engine_type, trsp_mode, reg,t) EJ fuel used in the transport sector
engines(trsp_fuel, engine_type, trsp_mode, reg,t)

infra(trsp_fuel,reg, t)
eng_invest(trsp_fuel, engine_type, trsp_mode, reg,t)
infra_invest(trsp_fuel, trsp_mode, reg, t)

cost_cap(reg,t)
ship_emis(reg,t)
annual_cost(t)
;

variables

tot_cost
;

equations

useful_trsp_energy_Q(trsp_fuel, engine_type, trsp_mode, reg, t)
trsp_demand_Q(trsp_mode, reg,t)
vehicle_lim_Q(trsp_fuel, non_phev, car_truck_ships, reg, t)
vehicle_lim_PHEV_Q(road_fuel_liquid, engine_type, car_or_truck,reg, t)
elec_frac_PHEV_Q(car_or_truck,engine_type,reg, t)
lim_elec_veh(car_or_truck,elec_veh,reg, t)
engines_Q(trsp_fuel, engine_type, trsp_mode,reg, t)
infra_Q(trsp_fuel,reg, t)
cost_cap_Q(reg,t)
eng_g_lim_Q4(  engine_type,car_truck_ships,reg, t)
Q_car_balance(car_truck_ships,reg,t)
shipping_emis(reg,t)
shipping_constraint(t)
annual_cost_Q(t)
tot_cost_Q
;

* transp_q(trsp_fuel,reg,t)..
*          sum( (trsp_mode, engine_type), trsp_energy(trsp_fuel, engine_type, trsp_mode, reg,t) )=e=
*          sum(type, en_conv(trsp_fuel, "trsp", type, reg,t)*effic(trsp_fuel, "trsp", type,reg,t));

useful_trsp_energy_Q(trsp_fuel, engine_type, trsp_mode, reg, t)..
    trsp_useful_energy(trsp_fuel, engine_type, trsp_mode, reg, t) =E=
        trsp_energy(trsp_fuel, engine_type, trsp_mode, reg, t) *
            trsp_conv(trsp_fuel, engine_type, trsp_mode);

trsp_demand_Q(trsp_mode, reg,t)..
    sum((trsp_fuel, engine_type),
        trsp_useful_energy(trsp_fuel, engine_type, trsp_mode, reg, t)) =E=
            trsp_demand(trsp_mode, reg, t);

vehicle_lim_Q(trsp_fuel, non_phev, car_truck_ships, reg, t)..
    trsp_useful_energy(trsp_fuel, non_phev, car_truck_ships, reg,t) =l=
    engines(trsp_fuel, non_phev, car_truck_ships, reg, t) *
        trsp_demand(car_truck_ships, reg,t) / num_veh(car_truck_ships,reg, t);

vehicle_lim_PHEV_Q(road_fuel_liquid, engine_type, car_or_truck, reg, t)..
    trsp_useful_energy(road_fuel_liquid, "PHEV", car_or_truck, reg, t) =e=
    engines(road_fuel_liquid, "PHEV", car_or_truck, reg, t) * (1-elec_frac_PHEV(car_or_truck)) *
        trsp_demand(car_or_truck,reg, t) / num_veh(car_or_truck,reg, t);

elec_frac_PHEV_Q(car_or_truck, engine_type, reg, t)..
    trsp_useful_energy("elec", "PHEV", car_or_truck, reg, t) =e=
    elec_frac_PHEV(car_or_truck) *
        sum(road_fuel, trsp_useful_energy(road_fuel, "PHEV", car_or_truck, reg, t));

lim_elec_veh(car_or_truck,elec_veh,reg,t)..
         sum(trsp_fuel, engines(trsp_fuel, elec_veh, car_or_truck, reg,t))=l=
          frac_engine(elec_veh, car_or_truck)*num_veh(car_or_truck, reg,t) ;



engines_Q(trsp_fuel, engine_type, trsp_mode, reg,t+1)..
    engines(trsp_fuel, engine_type, trsp_mode,reg, t+1) =E= t_step * eng_invest(trsp_fuel, engine_type, trsp_mode,reg, t+1)
           + engines(trsp_fuel, engine_type, trsp_mode, reg,t)*
             exp(t_step*log(1-1/life_eng(trsp_fuel, engine_type, trsp_mode)));

infra_Q(trsp_fuel,reg, t+1)..
    infra(trsp_fuel, reg,t+1) =E= t_step * sum(car_truck_ships, infra_invest(trsp_fuel,car_truck_ships,reg, t+1))
           + infra(trsp_fuel,reg, t) * exp(t_step*log(1-1/life_infra(trsp_fuel)));

cost_cap_Q(reg,t)..
    cost_cap(reg,t) =E=
    sum( (road_fuel, engine_type, trsp_mode),
        eng_invest(road_fuel, engine_type, trsp_mode, reg,t)*(cost_eng(road_fuel, engine_type, trsp_mode, t)) )+
    sum( (trsp_fuel,trsp_mode),
        infra_invest(trsp_fuel,trsp_mode, reg, t)*cost_infra_mod(trsp_fuel, trsp_mode) );



eng_g_lim_Q4( engine_type,car_truck_ships,reg, t+1)..
 sum (trsp_fuel, engines(trsp_fuel, engine_type, car_truck_ships,reg, t+1))=L=
 sum(trsp_fuel, engines(trsp_fuel, engine_type, car_truck_ships,reg, t))*(1+eng_g_lim)**t_step+init_eng;

Q_car_balance(car_truck_ships,reg,t)..
*  1 =L= 1;
  sum((engine_type,trsp_fuel),engines(trsp_fuel, engine_type, car_truck_ships,reg, t))=l= num_veh(car_truck_ships,reg,t)+0*0.1;

shipping_emis(reg,t)..
ship_emis(reg,t)=e=sum(engine_type, (sum((trsp_fuel, heavy_mode), trsp_energy(trsp_fuel, engine_type, heavy_mode, reg,t)
         *emis_fact2(trsp_fuel))));

shipping_constraint(t)..
sum(reg,ship_emis(reg,t))=l=
1500;
* Shipping_emis_cons(t);

annual_cost_Q(t)..
    annual_cost(t) =E= sum(reg, cost_cap(reg, t));

tot_cost_Q..
    tot_cost =E= sum(t, t_step * annual_cost(t)/((1+r)**(t_step*(ord(t)-1))));



model GET_7 /all/;

OPTION LIMROW = 0;
OPTION LIMCOL = 0;
OPTION ITERLIM = 999999999;
OPTION reslim = 999999999;
option solveopt=replace;
option sysout = off ;
option solprint = off   ;
$offlisting


* option lp = osigurobi;
option lp = cplex;
GET_7.optfile = 1;
solve GET_7 using LP minimizing tot_cost ;

parameter energy_use_per_vehicle(car_truck_ships, reg,t);
energy_use_per_vehicle(car_truck_ships, reg,t) =
    trsp_demand(car_truck_ships, reg,t) / num_veh(car_truck_ships,reg, t);
display energy_use_per_vehicle;

parameter global_engines(trsp_mode, engine_type, trsp_fuel, t);
global_engines(trsp_mode, engine_type, trsp_fuel, t) = 
    sum(reg, engines.l(trsp_fuel, engine_type, trsp_mode, reg, t));
display global_engines;

parameter global_agg_engines(trsp_mode, t);
global_agg_engines(trsp_mode, t) = sum((engine_type,trsp_fuel), global_engines(trsp_mode, engine_type, trsp_fuel, t));
display global_agg_engines;

parameter global_num_veh(car_truck_ships,t);
global_num_veh(car_truck_ships,t) = sum(reg, num_veh(car_truck_ships,reg,t))
display global_num_veh;
display num_veh;
