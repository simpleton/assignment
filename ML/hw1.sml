fun is_older (d1:int*int*int, d2:int*int*int) = 
    if ((#1 d1) * 10000 + (#2 d1) * 100 + (#3 d1)) < ((#1 d2) * 10000 + (#2 d2) * 100 + (#3 d2)) then
	true
    else
	false

fun number_in_month (dlist:(int*int*int) list, month: int) = 	    
    if null dlist then
	0
    else if ((#2 (hd dlist)) = month) then
	number_in_month(tl(dlist), month) + 1
    else
	number_in_month(tl(dlist), month)
		       
fun number_in_months (dlist:(int*int*int) list, mlist: int list) =
    if null mlist then
	0
    else
	number_in_month(dlist, (hd mlist)) + number_in_months(dlist, (tl mlist))

fun dates_in_month (dlist: (int*int*int) list, month: int) = 
    if (null dlist) then
	[]
    else if (#2 (hd dlist)) = month then
	(hd dlist)::dates_in_month(tl(dlist), month)
    else
	dates_in_month(tl(dlist), month)

fun dates_in_months (dlist: (int*int*int) list, mlist: int list) = 
    if (null mlist) then
	[]
    else
	dates_in_month(dlist, hd(mlist)) @ dates_in_months(dlist, tl(mlist))

fun get_nth (slist: string list, index: int) = 
    if (index = 1) then
	hd slist
    else
	get_nth(tl(slist), index-1)

fun date_to_string (date:int*int*int) =
    let val monthl = [
	    "January",
	    "February",
	    "March",
	    "April",
	    "May",
	    "June",
	    "July",
	    "August",
	    "September",
	    "October",
	    "November",
	    "December"
	]
    in
	get_nth(monthl, (#2 date)) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end

fun number_before_reaching_sum (sum:int, ilist:int list) =
    if sum <= hd(ilist) then
	0
    else
	number_before_reaching_sum(sum - hd(ilist), tl(ilist)) + 1

fun what_month (day: int) =
    let val days = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
	number_before_reaching_sum(day, days) + 1
    end

fun month_range (day1:int, day2: int) =
    let fun range(from:int, to:int) =
	    if from > to then
		nil
	    else
		what_month(from)::range(from+1, to)
    in
	range(day1, day2)
    end

fun oldest (dates:(int*int*int) list) =
    if (null dates) then 
	NONE
    else
	let val voldest = oldest(tl dates)
	in
	    if isSome voldest andalso not(is_older(hd(dates), valOf voldest)) then
		voldest
	    else
		SOME(hd dates)
	end
