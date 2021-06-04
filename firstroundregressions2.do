clear

gen wagepremium=1
gen isicrevision31productcode=1 
gen year=1
save wagepremiumestimates2, replace

use 55th_61st_66th_68th_round.dta
replace isicrevision31productcode=int(isicrevision31productcode/10) if year==2009
gen logwage=log(wage_salary_earn_total)
drop if logwage==.
sort isicrevision31productcode year
egen isicgroup=group(isicrevision31productcode year)
sum isicgroup
global numgroups=r(max)
save nssocombinedmod, replace

global i=1
quietly while $i<=$numgroups {
	use nssocombinedmod, clear
	keep if isicgroup==$i
	sum logwage
	if r(N)>5 {
		regress logwage general_education age sex
		gen wagepremium=_b[general_education]
		keep isicrevision31productcode year wagepremium
		keep if _n==1
		append using wagepremiumestimates2
		save wagepremiumestimates2, replace
	}
	noisily disp $i
	global i=$i+1
}
