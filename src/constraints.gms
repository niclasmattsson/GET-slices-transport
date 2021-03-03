* en_conv.fx(primary, "NH3", type, reg, t) = 0;

*### SCENARIO CONSTRAINTS ###

C_strg_agg.up =
*0;
2000000;
*high 5000000
* 2000000  MtCO2 from IPCC CCS report  at least that much expected
* 1000000 low

*### Carbon constraint ###
*trajec(reg,t)=
*scenario("400",reg,t);
*1000000;
*C_tax(reg,t)=0;
*C_tax(reg,t)$(year(t)> 2010)= 0.05*((1+r)**(ord(t)-1));

Cum_CO2_emis=
905000
*10000000000

*700000
**1.5 degrees 50% probability
*905000
**450ppm
*1255000
**500ppm
*1705000
**550 ppm
**in MtCO2 from IPCC AR5 WG III Chapter 6 page 431
;
Tot_emis.up(t)$(year(t)>2100)=0;

C_capt_air.fx (reg, t)$(year(t)< 2040)=0;

*trsp_energy.fx("H2", engine_type, trsp_mode, reg,t) =0;
*en_conv.fx("H2","air_fuel","0",reg,t)= 0;

*### Technology constraints ###
*capital.fx(ccs_fuel, en_out, C_capt,reg, t)= 0;
*cap_invest.fx(nuclear_fuel,"elec",type,reg,t)= 0;
*capital.fx("solar", "H2", "0",reg, t)= 0;
*en_conv.lo("H2","MeOH","0",reg,t)$(year(t)> 2080)= 0.01;
*en_conv.lo("air","CO2", "0",reg,t)$(year(t)> 2080)= 0.1;

*capital.fx("air", "CO2", "0",reg, t)= 0;
*capital.fx(ccs_fuel, en_out, C_capt,reg, t)= 0;
*C_capt_air.fx(reg,t)=0;
*C_strg_tot.fx(reg,t)=0;
*C_capt_tot.fx(reg,t)=0;

cap_invest.fx("FBF","elec",type,reg,t)= 0;
cap_invest.fx("MOX","elec",type,reg,t)= 0;
*###Calibration constraints###

*peak load
EN_CONV.lo("CH4","elec","0",reg,t)$(year(t)<=2040) = 0.2*dem("elec",reg,t)/effic("CH4","elec","0",reg,t);

*Pulp and paper industry
EN_CONV.lo("bio","solid_heat","0",reg,t) =0.2*dem("solid_heat",reg,t);

capital.fx( "solar","central_heat",type, reg, t)$(year(t)< 2030)=0;
capital.fx( "solar","dist_heat" ,type, reg, t)$(year(t)< 2030)=0;
capital.fx(ccs_fuel, en_out, C_capt,reg, t)$(year(t)<2030)= 0;
cap_invest.fx(storage_tech,"elec","0",reg,t)$(year(t)<2020)=0;


*Max 10 new reactors built 2020 to 2030 per region
cap_invest.up(nuclear_fuel,"elec",type,reg,t)$(year(t)= 2020)= 0.0001;

*cars
engines.FX(trsp_fuel, engine_type, trsp_mode, reg,init_year) = 0;
engines.FX("petro", "0", "p_car", reg,init_year) = num_veh("p_car", reg,init_year);
engines.FX("petro", "0", "f_road", reg,init_year) =  num_veh("f_road", reg,init_year);
engines.FX("petro", "0", "p_bus", reg,init_year) =  num_veh("p_bus", reg,init_year);
engines.FX("petro", "0", "f_container", reg,init_year) = num_veh("f_container", reg,init_year);
engines.FX("petro", "0", "f_coast", reg,init_year) =  num_veh("f_coast", reg,init_year);
engines.FX("petro", "0", "f_ocean", reg,init_year) =  num_veh("f_ocean", reg,init_year);
engines.FX("petro", "0", "p_air_short", reg,init_year) =  num_veh("p_air_short", reg,init_year);
engines.FX("petro", "0", "p_air_medium", reg,init_year) =  num_veh("p_air_medium", reg,init_year);
engines.FX("petro", "0", "p_air_long", reg,init_year) =  num_veh("p_air_long", reg,init_year);
engines.FX("petro", "0", "p_rail", reg,init_year) =  num_veh("p_rail", reg,init_year);
engines.FX("petro", "0", "f_air", reg,init_year) =  num_veh("f_air", reg,init_year);
engines.FX("petro", "0", "f_rail", reg,init_year) =  num_veh("f_rail", reg,init_year);
infra.up(trsp_fuel, reg,init_year)$((not sameas(trsp_fuel,'petro')) and (not sameas(trsp_fuel,'elec')) and(not sameas(trsp_fuel,'air_fuel')) ) = 0.001;
engines.fx(trsp_fuel, "BEV", trsp_mode, reg,t)$(year(t)<2020)=0.0;
engines.fx(trsp_fuel, "PHEV", trsp_mode, reg,t)$(year(t)<2020)=0.0;
engines.fx(trsp_fuel, "FC", trsp_mode, reg,t)$(year(t)<2030)=0;
engines.fx(trsp_fuel, "hyb", trsp_mode, reg,t)$(year(t)<2020)=0.0;
engines.fx("CH4", engine_type, trsp_mode, reg,t)$(year(t)<2020)=0;
engines.fx("MeOH", engine_type, trsp_mode, reg,t)$(year(t)<2020)=0;
engines.fx("H2", engine_type, trsp_mode, reg,t)$(year(t)<2030)=0;
engines.fx("NH3", engine_type, trsp_mode, reg,t)$(year(t)<2030)=0;

EN_CONV.lo("bio","MeOH","0",reg,"2020")=trsp_cal_road_2020(reg, "MeOH")/effic_0("bio","0","MeOH");


*trsp_energy.fx(trsp_fuel, engine_type, trsp_mode, reg,t)$(trsp_conv(trsp_fuel, engine_type, trsp_mode)=0) =  0;
capital.fx(en_in,en_out,type,reg,t) $ (effic_0(en_in,type,en_out) eq 0) = 0;
EN_CONV.fx(en_in,en_out,type,reg,t) $ (effic_0(en_in,type,en_out) eq 0) = 0;


*### Initial energy conversion levels ###
*capital.fx(en_in,"MeOH",type,reg,t)$(year(t)<2020) = 0;
capital.UP(en_in,"ethanol",type,reg,t)$(year(t)<2020) = 0;
capital.UP(en_in,"biogas",type,reg,t)$(year(t)<2020) = 0;
capital.UP(en_in,"biodiesel",type,reg,t)$(year(t)<2020) = 0;

capital.UP("MOX","elec",type,reg,t)$(year(t)< 2020)= 0;
capital.UP("EU4","H2",type,reg,t) $(year(t)< 2030)= 0;
capital.UP("FBF","elec",type,reg,t) $(year(t)< 2030)= 0;
capital.UP("solar","elec","cg",reg,"2010")= 0;
capital.up(en_in, "H2", type,reg, t)$(year(t)< 2020)= 0;
capital.up("H2", en_out, type,reg, t)$(year(t)< 2020)= 0;
capital.UP("pellets",en_out,type,reg,t)$(year(t)< 2020)= 0;
capital.UP("EU1","elec",type,reg,t)= 0;
capital.up("H2", "NH3", type,reg, t)$(year(t)< 2030)= 0;
*en_conv.fx("NH3", "trsp", "0", reg, t) =0;
*engines.fx(trsp_fuel, engine_type, car_truck_ships, reg,t)$(en_conv.l(trsp_fuel, "trsp", "0", reg,t)=0)=0;

C_emission.lo(reg,"2010")=0.95*emissions_2010(reg);
C_emission.lo(reg,"2020")=0.95*emissions_2020(reg);
en_conv.lo(calibration_set, "elec", "0", reg, "2010") = 0.95*el_2010(reg, calibration_set)/(effic(calibration_set, "elec", "0", reg, "2010")+0.000001);
en_conv.up(calibration_set, "elec", "0", reg, "2010") = 1.05*el_2010(reg, calibration_set)/(effic(calibration_set, "elec", "0", reg, "2010")+0.000001);
en_conv.lo("wind", "elec", "0", reg, "2020") = wind_2020(reg)/effic("wind", "elec", "0", reg, "2020");
en_conv.lo("solar", "elec", "0", reg, "2020") = solar_pv_2020(reg)/effic("solar", "elec", "0", reg, "2020");
en_conv.lo("EU4", "elec", "0", reg, "2020") = nuclear_2020(reg)/effic("EU4", "elec", "0", reg, "2020");
en_conv.up("wind", "elec", "0", reg, "2020") = wind_2020(reg)/effic("wind", "elec", "0", reg, "2020")+0.001;
en_conv.up("solar", "elec", "0", reg, "2020") = solar_pv_2020(reg)/effic("solar", "elec", "0", reg, "2020")+0.001;
en_conv.up("EU4", "elec", "0", reg, "2020") = nuclear_2020(reg)/effic("EU4", "elec", "0", reg, "2020")+0.001;
en_conv.up("hydro", "elec", "0", reg, "2020") = hydro_2020(reg)/effic("hydro", "elec", "0", reg, "2020");

EN_CONV.fx("bio","dist_heat","0",reg,t) = min_bio(reg,t);
EN_CONV.fx("H2", "NH3", type,reg, t)$(year(t)< 2030)= 0;


* transportation electricity only for personal trsp w high-speed-train
*trsp_energy.FX("elec", "0", "p_air_short", reg,t) =
*     high_speed_train(t,reg)*trsp_demand("p_air_short",reg, t)/trsp_conv("elec", "0", "p_air_short");

*H2_prod.lo("elec","0",reg,slice,t)$(year(t)> 2050)=0.01;
*en_conv.lo("H2","NH3","0",reg,t)$(year(t)> 2070)=0.1;
