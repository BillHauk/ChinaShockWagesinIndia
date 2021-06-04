clear
set more off

use 55th_61st_66th_68th_round.dta
replace isicrevision31productcode=int(isicrevision31productcode/10) if year==2009
gen logwage=log(wage_salary_earn_total)
drop if logwage==.
destring state, replace
save nssocombinedmod, replace

keep if year==1999
sort isicrevision31productcode
egen isicgroup=group(isicrevision31productcode)
sum isicgroup
global groupmax=r(max)
regress logwage sex general_education technical_education i.isicgroup i.state
global i=1
generate industrywage=_b[_cons] if isicgroup==$i
global i=2
while $i<=$groupmax {
	replace industrywage=_b[_cons]+_b[$i.isicgroup] if isicgroup==$i
	global i=$i+1
}
sort isicrevision31productcode
collapse (mean) industrywage year (count) isicgroup, by(isicrevision31productcode)
rename isicgroup obsnumber
save wagepremiumestimates3, replace

use nssocombinedmod
keep if year==2004
sort isicrevision31productcode
egen isicgroup=group(isicrevision31productcode)
sum isicgroup
global groupmax=r(max)
regress logwage sex general_education technical_education i.isicgroup i.state
global i=1
generate industrywage=_b[_cons] if isicgroup==$i
global i=2
while $i<=$groupmax {
	replace industrywage=_b[_cons]+_b[$i.isicgroup] if isicgroup==$i
	global i=$i+1
}
sort isicrevision31productcode
collapse (mean) industrywage year (count) isicgroup, by(isicrevision31productcode)
rename isicgroup obsnumber
append using wagepremiumestimates3
save wagepremiumestimates3, replace

use nssocombinedmod
keep if year==2009
sort isicrevision31productcode
egen isicgroup=group(isicrevision31productcode)
sum isicgroup
global groupmax=r(max)
regress logwage sex general_education technical_education i.isicgroup i.state
global i=1
generate industrywage=_b[_cons] if isicgroup==$i
global i=2
while $i<=$groupmax {
	replace industrywage=_b[_cons]+_b[$i.isicgroup] if isicgroup==$i
	global i=$i+1
}
sort isicrevision31productcode
collapse (mean) industrywage year (count) isicgroup, by(isicrevision31productcode)
rename isicgroup obsnumber
append using wagepremiumestimates3
save wagepremiumestimates3, replace

use nssocombinedmod
keep if year==2011
sort isicrevision31productcode
egen isicgroup=group(isicrevision31productcode)
sum isicgroup
global groupmax=r(max)
regress logwage sex general_education technical_education i.isicgroup i.state
global i=1
generate industrywage=_b[_cons] if isicgroup==$i
global i=2
while $i<=$groupmax {
	replace industrywage=_b[_cons]+_b[$i.isicgroup] if isicgroup==$i
	global i=$i+1
}
sort isicrevision31productcode
collapse (mean) industrywage year (count) isicgroup, by(isicrevision31productcode)
rename isicgroup obsnumber
append using wagepremiumestimates3
save wagepremiumestimates3, replace
