*### PARAMETERS ###

scalars

Msec_per_year / 31.6 /
t_step        / 10   /

parameters
supply_pot(primary, reg,t)                               max supply potential
effic(energy, en_out, type,reg, t)                       energy conv effic
life_plant(en_in, en_out, type)                          life time
life_eng(trsp_fuel, engine_type, trsp_mode)        life time
lf_infra(trsp_fuel)                                      loadfactor
vehicle_cost(trsp_mode)                            basic cost for vehicle w gasoline or marin gas oil IC engine
t_tech_plant(en_in, en_out, type)                        technology developm time
t_tech_eng(road_fuel, engine_type, trsp_mode)      technology developm time
t_tech_effic(en_in, type, en_out)
effic_current(en_in, type, en_out)
max_beccs
Cum_CO2_emis

OM_cost_fr(en_in, en_out)  operation & maintanance cost as fraction of capital cost

year(t)  ;
year(t)=2010+(ord(t)-1)*10;



table price(fuels, reg)               basic fuel prices USD per GJ (GUSD per EJ)
          AFR        CPA        EUR        FSU        LAM        MEA        NAM        PAO        PAS        SAS
bio1      1.6        2.2        2.4        2.1        2.4        2.5        2.7        2.7        1.9        1.5
bio2      2.7        3.7        3.0        2.3        2.0        12.7        3.1       3.5        2.9        3.1
bio3      3.9        6.5        4.2        3.6        3.1        13.9        5.4       4.5        3.7        4.8
coal1     1.5        1.5        1.5        1.5        1.5        1.5        1.5        1.5        1.5        1.5
coal2     3          3          3          3          3          3          3          3          3          3
oil1      4          4          4          4          4          4          4          4          4          4
oil2      6          6          6          6          6          6          6          6          6          6
oil3      10         10         10         10         10         10         10         10         10         10
gas1      2.5        2.5        2.5        2.5        2.5        2.5        2.5        2.5        2.5        2.5
gas2      5          5          5          5          5          5          5          5          5          5
gas3      7          7          7          7          7          7          7          7          7          7
uranium1  0.07       0.07       0.07       0.07       0.07       0.07       0.07       0.07       0.07       0.07
uranium2  0.14       0.14       0.14       0.14       0.14       0.14       0.14       0.14       0.14       0.14
uranium3  0.23       0.23       0.23       0.23       0.23       0.23       0.23       0.23       0.23       0.23
uranium4  0.4        0.4        0.4        0.4        0.4        0.4        0.4        0.4        0.4        0.4
uranium5  1.3        1.3        1.3        1.3        1.3        1.3        1.3        1.3        1.3        1.3

;
table supply_pot_0 (primary, reg)     max supply potential (EJ) - annual for renewables and aggregated for fossils
            AFR        CPA        EUR        FSU        LAM        MEA        NAM        PAO        PAS        SAS
*bio1        1.5        2.5        2          0.5        2          0.5        2          0.5        0.5        2
*bio2        9          1          1.5        2.5        5.5        0          4          2          2.5        0.5
*bio3        8          1          1.5        2.5        4.5        0          2.5        2          2          0.5
bio1        3          5          4          1          4          1          4          1          1          4
bio2        18         2          3          5          11         0          8          4          5          1
bio3        16         2          3          5          9          0          5          4          4          1
coal1       744        3795       408        2952       240        48         5520       1080       360        2325
coal2       1080       18305      1680       13920      600        240        14280      2880       960        8614
oil1        677        188        153        927        903        4203       628        37         140        44
oil2        1708       904        671        2257       2196       6405       1525       183        458        246
oil3        427        649        183        2196       2745       61         7869       793        31         123
gas1        507        73         234        2379       351        296        351        156        351        123
gas2        1755       176        975        3705       1170       4095       1170       390        975        214
gas3        1365       714        122        1170       2145       780        2535       780        585        846
uranium1    140        21         0          29         82         0          214        0          0          0
uranium2    314        72         4          452        143        65         284        0          942        0
uranium3    606        82         50         789        176        76         404        7          977        47
uranium4    612        86         78         1014       178        79         594        7          981        47
uranium5    10000      10000      10000      10000      10000      10000      10000      10000      10000      10000
wind        100        100        100        100        100        100        100        100        100        100
*not really used for wind and solar
hydro       2.6        3.8        2.8        8.0        7.7        0.4        3.0        0.6        2.7        1.6
solar       200        200        200        200        200        200        200        200        200        200
;

supply_pot(primary, reg,t) = supply_pot_0(primary,reg);

table min_bio(reg, t)
           2010        2020        2030        2040        2050        2060        2070        2080        2090        2100
AFR        1.09        1.12        0.80        0.56        0.40        0.37        0.35        0.32        0.30        0.28
CPA        0.80        0.44        0.37        0.32        0.27        0.25        0.22        0.20        0.19        0.17
EUR        0.00        0.00        0.00        0.00        0.00        0.00        0.00        0.00        0.00        0.00
FSU        0.02        0.00        0.00        0.00        0.00        0.00        0.00        0.00        0.00        0.00
LAM        0.22        0.32        0.10        0.06        0.05        0.03        0.03        0.02        0.02        0.02
MEA        0.05        0.05        0.04        0.03        0.02        0.02        0.02        0.01        0.01        0.01
NAM        0.00        0.00        0.00        0.00        0.00        0.00        0.00        0.00        0.00        0.00
PAO        0.01        0.00        0.00        0.00        0.00        0.00        0.00        0.00        0.00        0.00
PAS        0.28        0.17        0.11        0.07        0.03        0.00        0.00        0.00        0.00        0.00
SAS        1.17        1.10        0.85        0.65        0.50        0.46        0.42        0.39        0.36        0.33
;

table el_2010(reg, calibration_set)
           bio         coal           EU4         CH4        hydro        oil         wind           solar
AFR        0.00        1.13251        0.04        0.13        0.30        0.04        0.00553        0.005
CPA        0.00        10.19588       0.24        0.21        2.47        0.16        0.13962        0.000
EUR        0.26        3.55821        3.62        2.82        2.16        0.29        0.59749        0.000
FSU        0.01        0.93831        0.83        2.39        0.77        0.09        0              0.000
LAM        0.01        0.12           0.10        0.51        2.44        0.72        0              0.000
MEA        0.00        0.24045        0.00        2.25        0.19        1.14        0.01122        0.003
NAM        0.34        8.17594        3.30        2.56        2.34        0.11        0.33385        0.020
PAO        0.13        1.83545        1.17        0.86        0.49        0.32        0.03784        0.020
PAS        0.00        2.07964        0.67        1.27        0.18        0.31        0              0.003
SAS        0.01        2.49357        0.08        0.44        0.66        0.18        0.0812         0.000

;
PARAMETERS
*calibrations for 2020 based on BP statistics for 2016
solar_pv_2020(reg)/
AFR        0.03250472
CPA        0.6488388
EUR        0.467549551
FSU        0.007804057
LAM        0.052827577
MEA        0.050442652
NAM        0.362391958
PAO        0.301923645
PAS        0.060961028
SAS        0.119357762
/

wind_2020(reg) /
AFR        0.052869382
CPA        1.32364584
EUR        1.380298979
FSU        0.007576139
LAM        0.282570741
MEA        0.075189899
NAM        1.115636967
PAO        0.090367704
PAS        0.020333391
SAS        0.223321827
/
nuclear_2020(reg) /
AFR        0.04
CPA        1.06
EUR        3.07
FSU        1.05
LAM        0.13
MEA        0.03
NAM        3.42
PAO        0.18
PAS        0.58
SAS        0.18
/
hydro_2020(reg) /
AFR        0.48
CPA        4.34
EUR        2.06
FSU        0.92
LAM        2.75
MEA        0.27
NAM        2.43
PAO        0.45
PAS        0.76
SAS        0.64
/

emissions_2010(reg)/
AFR        800
CPA        8330
EUR        4206
FSU        2456
LAM        1670
MEA        2110
NAM        6299
PAO        1612
PAS        2163
SAS        1883

/

emissions_2020(reg)/
AFR        1235
CPA        9814
EUR        3672
FSU        2287
LAM        1749
MEA        2509
NAM        5695
PAO        1601
PAS        2564
SAS        2765
/

table primary_cal_2020(reg, calibration_set)
        oil       CH4      coal
AFR      5         2         4
CPA      31       12         81
EUR      34       36         17
FSU      40        32       14
LAM      52        35       15
MEA       2        2         0
NAM       8        7         1
PAO      10        6         7
PAS      18        7         11
SAS      11        5         20
;
table    trsp_cal_road_2020(reg, trsp_fuel)
           CH4        petro        elec        MeOH
AFR        0.02        4.24        0.00        0.02
CPA        1.44        11.11        0.03        0.34
EUR        0.11        12.57        0.01        0.04
FSU        0.04        4.18        0.00        0.63
LAM        0.22        9.37        0.00        1.55
MEA        0.29        6.83        0.00        0.00
NAM        0.17        23.31        0.00        0.01
PAO        0.16        5.52        0.00        0.15
PAS        0.25        7.32        0.00        0.14
SAS        0.08        4.05        0.00        0.15
;
Parameters
r         discount rate
    / 0.05 /
r_invest  interest rate applied to investments
    / 0.05 /
C_tax(reg,t)  (kUSD per ton C)

Pu_start/
AFR   0
CPA   0
EUR   0
FSU   0
LAM   0
MEA   0
NAM   0
PAO   0
PAS   0
SAS   0
 /

*### CCUS parameters ###

CO2aircapt_cost  cost for capturing CO2 from air  (GUSD per MtCO2)
/0.5/

heat_CO2aircapture heat demand for capturing CO2 from air (EJ per Mt CO2 capture)
/0.0091/

cost_strg    carbon transport and storage cost(GUSD per MtCO2)
/ 0.010 /

*-Rubin et al. (2015)
*--Large scale transport cost for 250 km pipeline 1.7-3.7 USD2013/MtCO2 (should be divided with 1.030 to get USD2010)
*--Small scale transport cost for 250 km pipeline 4.3-10.93 USD2013/MtCO2 (should be divided with 1.030 to get USD2010)
*--If separating cost for large scale and small scale CO2 transport and storage i suggest /SB
*cost_strg carbon storage cost and transport 250 km with pipline (kUSD per ton CO2) / 0.010 /
*cost_strg_bio   carbon transport 250 km in small scale and 250km from bio energy and air capture (kUSD per ton CO2) / 0.005 /


*--old code /SB
*cost_strg_fos   carbon storage cost from fossils (kUSD per ton CO2) / 0.010 /
*For co-firing with coal

*cost_strg_bio   carbon storage cost from bio energy (kUSD per ton CO2) / 0.010 /

*max_beccs
* /1/

dec_elec(en_in)   electricity requirements for heat generation with C capture
/     bio   0.04
      coal  0.04
      oil   0.03
      CH4   0.025  /;

*### Technology and sector paramaters ###
parameters

district_cost  cost to distribute wasteheat to central_heat
         /5/
cogen_fr_h   max fraction of urban heat from cogeneration
    / 0.6 /

C_capt_heat(dec_heat)  max fraction of sector that can use C_capt
/central_heat     0.7
solid_heat      0.5
non_solid_heat  0.5  /

max_feed(feed)  Feedstock fractions
/CH4     0.1
biogas   0.1
ethanol   1
biodiesel 1
coal      0.1
oil       0.1
petro     1
MeOH      1/

$ontext
max_emis(t) maximum emissions
/2010        31029
2020        34286
2030        24552
2040        10276
2050        3138
2060        -431
2070        -2215
2080        -3108
2090        -3554
2100        -3473
2110        -3210
2120        -2815
2130        -2222
2140        -1333
2150        0/
$offtext
emis_fact2 shipping emissions
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
$ontext
2060        400
2070        300
2080        200
2090        100
2100        0
2110        0
2120        0
2130        0
2140        0
2150        0/
$offtext

max_chip maximum wood chips in industry
   /0.67/   ;

table max_solar(heat,reg) maximum solar
                    AFR        CPA        EUR        FSU        LAM        MEA        NAM        PAO        PAS        SAS
central_heat        0.2        0.2        0.2        0.2        0.2        0.2        0.2        0.2        0.2        0.2
dist_heat           0.4        0.4        0.4        0.4        0.4        0.4        0.4        0.4        0.4        0.4
 ;

table max_pump(heat,reg)   maximum heat pumps
                 AFR        CPA        EUR        FSU        LAM        MEA        NAM        PAO        PAS        SAS
central_heat     0.2        0.2        0.2        0.2        0.2        0.2        0.2        0.2        0.2        0.2
dist_heat        0.6        0.6        0.6        0.6        0.6        0.6        0.6        0.6        0.6        0.6
;

table ramp_lim(thermalelec,type)
        0    cg   dec   cg_dec
bio     0.5  0.5  0.5   0.5
oil     0.2  0.2  0.2   0.2
CH4     0.2  0.2  0.2   0.2
coal    0.5  0.5  0.5   0.5
EU4     0.7  0.7  0.7   0.7
EU1     0.7  0.7  0.7   0.7
FBF     0.7  0.7  0.7   0.7
MOX     0.7  0.7  0.7   0.7
hydro   0.2  0.2  0.2   0.2;

$ontext
        0    cg   dec   cg_dec
bio     0.35 0.35 0.35  0.35
oil     0.1  0.1  0.1   0.1
CH4     0.1  0.1  0.1   0.1
coal    0.35 0.35 0.35  0.35
EU4     0.7  0.7  0.7   0.7
EU1     0.7  0.7  0.7   0.7
FBF     0.7  0.7  0.7   0.7
MOX     0.7  0.7  0.7   0.7
hydro   0.1  0.1  0.1   0.1;
$offtext

*### Transportation parameters ###
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

parameters
life_infra(trsp_fuel)  life time for infrastructure
    / petro   50
      MeOH    50
      H2      50
      CH4     50
      biogas  50
      ethanol 50
      biodiesel 50
      NH3       50/

elec_frac_PHEV(car_or_truck)
/p_car   0.65
f_road 0.53
p_bus   0.53/;

parameter sliced_demand_baseline(allslices);
sliced_demand_baseline(allslices) = 1.15;

table frac_engine(engine_type, car_or_truck)
         p_car   f_road   p_bus
0          1        1        1
FC         1        1        1
hyb        1        1        1
PHEV       1       0.8       0.9
BEV        1       0.8       0.9  ;
*BEV        0.8      0.2      0.3  ;


table high_speed_train(t,reg)  fraction of hsp mode using electricity
             AFR        CPA         EUR        FSU          LAM        MEA          NAM        PAO          PAS        SAS
2010        0.04        0.04        0.04        0.04        0.04        0.04        0.04        0.04        0.04        0.04
2020        0.04        0.04        0.04        0.04        0.04        0.04        0.04        0.04        0.04        0.04
2030        0.04        0.04        0.06        0.04        0.04        0.04        0.06        0.06        0.04        0.04
2040        0.04        0.04        0.1         0.04        0.04        0.04        0.1         0.1         0.04        0.04
2050        0.04        0.04        0.14        0.04        0.04        0.04        0.14        0.14        0.04        0.04
2060        0.04        0.04        0.2         0.04        0.04        0.04        0.2         0.2         0.04        0.04
2070        0.04        0.04        0.24        0.04        0.04        0.04        0.24        0.24        0.04        0.04
2080        0.04        0.04        0.26        0.04        0.04        0.04        0.26        0.26        0.04        0.04
2090        0.04        0.04        0.28        0.04        0.04        0.04        0.28        0.28        0.04        0.04
2100        0.04        0.04        0.3         0.04        0.04        0.04        0.3         0.3         0.04        0.04
2110        0.04        0.04        0.3         0.04        0.04        0.04        0.3         0.3         0.04        0.04
2120        0.04        0.04        0.3         0.04        0.04        0.04        0.3         0.3         0.04        0.04
2130        0.04        0.04        0.3         0.04        0.04        0.04        0.3         0.3         0.04        0.04
   ;

*### Expansion constraints parameters ###

Parameters

cap_g_lim    /0.25/
*  / 0.20 /
init_plant   /0.0002/
*/ 0.0001 /

supply_lim /0.1/
init_supply /4/

infra_g_lim    infrastr relative growth limit
    / 0.1 /
*    / 0.10 /
init_infra     initial unrestricted infrastr growth (TW per decade)
    / 0.01 /
eng_g_lim  / 0.2/
*eng_g_lim  / 0.20 /
init_eng /0.01/

marketshare_eng /0.25/ ;
*marketshare_eng /0.25/ ;

*############################################################
$ include "indata.gms";
*############################################################

lf_infra(trsp_fuel)=0.7;
life_infra(trsp_fuel) = 50;
life_plant(en_in, en_out, type) = 25;
life_plant("hydro", "elec", "0") = 40;
life_plant("EU4", "elec", "0") = 40;
life_plant("EU1", "elec", "0") = 40;
life_plant("MOX", "elec", "0") = 40;
life_plant("FBF", "elec", "0") = 40;
life_plant("EU4", "H2", "cg") = 40;
life_eng(trsp_fuel, engine_type, trsp_mode) = 30;
life_eng(trsp_fuel, engine_type, car_or_truck) = 15;


C_tax(reg,t) = 0;
OM_cost_fr(en_in, en_out) = 0.04;
OM_cost_fr("EU1", "elec") = 0.015;
OM_cost_fr("EU4", "elec") = 0.015;
OM_cost_fr("MOX", "elec") = 0.015;
OM_cost_fr("FBF", "elec") = 0.015;
OM_cost_fr("storage_12h", "elec") = 0.015;
OM_cost_fr("storage_24h", "elec") = 0.015;
OM_cost_fr("storage_48h", "elec") = 0.015;
OM_cost_fr("storage_96h", "elec") = 0.015;

*### time dependent technology costs and efficiencies ###

effic_current(en_in, type, en_out)=effic_0(en_in, type, en_out);
t_tech_effic(en_in, type, en_out) = 40;

* time depend costs now disabled
*cost_inv_0(en_in, en_out, type) = cost_inv_base(en_in, type, en_out);
*$ontext
* time and region dependent efficiency
effic(en_in, en_out, type, reg,t) = effic_0(en_in, type, en_out);

*$ontext
effic(en_in, en_out, type, ROW,t)$(effic_0(en_in, type, en_out)>0.11 and effic_0(en_in, type, en_out)<0.95 ) = min(effic_0(en_in, type, en_out),
   (effic_0(en_in, type, en_out)-(effic_current(en_in, type, en_out)*0.7))/
      t_tech_effic(en_in, type, en_out)*((ord(t)-1)*t_step)+
        effic_current(en_in, type, en_out)*0.7 );

effic(en_in, en_out, type, ROW,t)$(effic_0(en_in, type, en_out)>=0.95 and effic(en_in, en_out, type, ROW,t)=0  )=effic_0(en_in, type, en_out);

effic(en_in, en_out, type, MIC,t)$(effic_0(en_in, type, en_out)>0.11 and effic_0(en_in, type, en_out)<0.95 ) = min(effic_0(en_in, type, en_out),
   (effic_0(en_in, type, en_out)-(effic_current(en_in, type, en_out)*0.8))/
      t_tech_effic(en_in, type, en_out)*((ord(t)-1)*t_step)+ effic_current(en_in, type, en_out)*0.8 );

effic(en_in, en_out, type, MIC,t)$(effic_0(en_in, type, en_out)>=0.95 and effic(en_in, en_out, type, MIC,t)=0  )=effic_0(en_in, type, en_out);

effic(en_in, en_out, type, OECD,t)$(effic_0(en_in, type, en_out)>0.11 and effic_0(en_in, type, en_out)<0.95  ) = min(effic_0(en_in, type, en_out),
   (effic_0(en_in, type, en_out)-(effic_current(en_in, type, en_out)*0.9))/
      t_tech_effic(en_in, type, en_out)*((ord(t)-1)*t_step)+
        effic_current(en_in, type, en_out)*0.9 );

effic(en_in, en_out, type, OECD,t)$(effic_0(en_in, type, en_out)>=0.95 and effic(en_in, en_out, type, OECD,t)=0  )=effic_0(en_in, type, en_out);
*$offtext

effic(nuclear_fuel, en_out , type, reg,t)= effic_0(nuclear_fuel, type, en_out);
*$offtext

Parameters
cost_infra_mod(trsp_fuel, trsp_mode)  d:o adjusted for different investm and discount rates

cost_inv(en_in, en_out, type, t)      time dependent plant investment cost
cost_inv_mod(en_in, en_out, type, t)  d:o adjusted for different investm and discount rates

cost_eng(road_fuel, engine_type, trsp_mode, t)     time dependent vehicle investment cost (vehicle + engine)
cost_eng_mod(road_fuel, engine_type, trsp_mode, t) d:o adjusted for different investm and discount rates;


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

*cost_eng_0(road_fuel, engine_type, trsp_mode) = cost_eng_base(road_fuel, engine_type, trsp_mode)*1.5;
*Why times 1.5????

t_tech_plant(en_in, en_out, type) = 40;
t_tech_eng(road_fuel, engine_type, trsp_mode) = 40;


cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) < 1) =
    cost_inv_0(en_in, type, en_out)-((cost_inv_0(en_in, type, en_out)-cost_inv_base(en_in, type, en_out))* (ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) ;

cost_inv(en_in, en_out, type, t) $ (((ord(t)-1)*t_step/t_tech_plant(en_in, en_out, type)) >= 1) =
 cost_inv_base(en_in, type, en_out);

* D:o, and basic vehicle cost added
cost_eng(road_fuel, engine_type, trsp_mode, t) =

*cost_eng_base(road_fuel, engine_type, car_truck_ships)
*             + vehicle_cost(car_truck_ships) ;

 max( cost_eng_base(road_fuel, engine_type, trsp_mode),
    cost_eng_0(road_fuel, engine_type, trsp_mode) -
    (cost_eng_0(road_fuel, engine_type, trsp_mode)-cost_eng_base(road_fuel, engine_type, trsp_mode))*
    ((ord(t)-1)*t_step/t_tech_eng(road_fuel, engine_type, trsp_mode)) )
    + vehicle_cost(trsp_mode);

cost_inv_mod(en_in, en_out, type, t) = cost_inv(en_in, en_out, type, t);
*    (r_invest + 1/life_plant(en_in, en_out, type))/(r+1/life_plant(en_in, en_out, type));

cost_eng_mod(road_fuel, engine_type, trsp_mode, t) = cost_eng(road_fuel, engine_type, trsp_mode, t)          ;
*    (r_invest + 1/life_eng(road_fuel, engine_type, car_or_truck))/(r+1/life_eng(road_fuel, engine_type, car_or_truck));

cost_infra_mod(trsp_fuel, trsp_mode) = cost_infra(trsp_fuel, trsp_mode)         ;
*    (r_invest + 1/life_infra(new_trsp_fuel)) / (r + 1/life_infra(new_trsp_fuel))
