use 61st round mod
gen year=2004
drop curr_nic_1998
drop  curr_wkly_act_nic1998
drop curr_wkly_act_nco1968
drop isicrevision3productcode
destring wage_salary_earn_total, replace
save 61st_round_mod

use 66th round
gen year=2009
drop curr_nic_2004
drop curr_wkly_act_nco2004
rename curr_wkly_act_nic2004 isicrevision31productcode
drop _merge
tostring state_region, replace
tostring district, replace
tostring tot_no_days_each_act, replace
save 66th_round_mod

use 61st_round_mod
append using 66th_round_mod
save 61st_66th_round

use 68th round mod
gen year=2011
drop nic2008_code
drop  current_wkly_act_nic2008
drop current_wkly_act_nco2004
drop isicrevision4productcode
rename total_no_days_each_act tot_no_days_each_act
rename current_wkly_act_status curr_wkly_act_status
tostring state_region, replace
tostring district, replace
tostring tot_no_days_each_act, replace
save 68th_round_mod

use 61st_66th_round
append using 68th_round_mod
save 61st_66th_68th_round

use 55th round mod
gen year=1999
drop nic1998_code
drop  curr_wkly_act_nic1998
drop curr_wkly_act_nco1968
drop isicrevision3productcode
rename education general_education
rename education_technical technical_education
tostring state_region, replace
tostring district, replace
tostring tot_no_days_each_act, replace
save 55th_round_mod

use 55th_round_mod
append using 61st_66th_68th_round
save 55th_61st_66th_68th_round
