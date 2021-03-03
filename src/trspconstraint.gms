elec_frac_PHEV_Q(car_or_truck, engine_type, reg, t)..
    sum(road_fuel_liquid, trsp_energy(road_fuel_liquid, "PHEV", car_or_truck, reg, t)*
        trsp_conv(road_fuel_liquid, "PHEV", car_or_truck))/(1-elec_frac_PHEV(car_or_truck)) =e=
            trsp_energy("elec", "PHEV", car_or_truck, reg, t)*
                trsp_conv("elec", "PHEV", car_or_truck)/(elec_frac_PHEV(car_or_truck));

elec_frac_PHEV_Q(car_or_truck, engine_type, reg, t)..
    elec_frac_PHEV(car_or_truck) *
    sum(road_fuel_liquid, trsp_energy(road_fuel_liquid, "PHEV", car_or_truck, reg, t) *
        trsp_conv(road_fuel_liquid, "PHEV", car_or_truck)) =e=
    trsp_energy("elec", "PHEV", car_or_truck, reg, t) *
        trsp_conv("elec", "PHEV", car_or_truck) * (1-elec_frac_PHEV(car_or_truck));

elec_frac_PHEV_Q(car_or_truck, engine_type, reg, t)..
    elec_frac_PHEV(car_or_truck) * (
        sum(road_fuel_liquid, trsp_energy(road_fuel_liquid, "PHEV", car_or_truck, reg, t) *
            trsp_conv(road_fuel_liquid, "PHEV", car_or_truck))
        + trsp_energy("elec", "PHEV", car_or_truck, reg, t) *
            trsp_conv("elec", "PHEV", car_or_truck)
    ) =e=
    trsp_energy("elec", "PHEV", car_or_truck, reg, t) *
        trsp_conv("elec", "PHEV", car_or_truck);

elec_frac_PHEV_Q(car_or_truck, engine_type, reg, t)..
    elec_frac_PHEV(car_or_truck) *
        sum(road_fuel, trsp_energy(road_fuel, "PHEV", car_or_truck, reg, t) *
            trsp_conv(road_fuel, "PHEV", car_or_truck)) =e=
    trsp_energy("elec", "PHEV", car_or_truck, reg, t) *
        trsp_conv("elec", "PHEV", car_or_truck);

elec_frac_PHEV_Q(car_or_truck, reg, t)..
    elec_frac_PHEV(car_or_truck) *
        sum(road_fuel, trsp_energy(road_fuel, "PHEV", car_or_truck, reg, t) *
            trsp_conv(road_fuel, "PHEV", car_or_truck)) =e=
    trsp_energy("elec", "PHEV", car_or_truck, reg, t) *
        trsp_conv("elec", "PHEV", car_or_truck);
