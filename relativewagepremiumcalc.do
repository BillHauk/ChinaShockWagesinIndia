use "wagepremiumestimates3v13.dta", clear

gen Employment=31423600
replace Employment=35139700 if year==2004
replace Employment=40159200 if year==2009
replace Employment=47926100 if year==2011

sort year isicrevision31productcode
by year: egen avgwagepremium=mean(industrywage)
gen relwagepremium=industrywage/avgwagepremium
save "relativewagepremiumest.dta"
