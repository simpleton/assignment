use "hw1.sml";

is_older((1,2,3),(1,2,3));
number_in_month([(1,2,3), (2,3,4), (3,3,4)], 3);
number_in_months([(1,2,3), (2,3,4), (3,3,4)], [3,2]);
number_in_months([(1,22,3), (2,3,4), (3,3,4),(1,1,1),(2,2,2)], [22,2,3,111]);
dates_in_month([(1,22,3), (2,3,4), (3,3,4),(1,1,1),(2,2,2)], 3);
dates_in_months([(12,1,321),(1,22,3), (2,3,4), (3,3,4),(1,1,1),(2,2,2)], [3,1,2]);

get_nth(["fds","aa","1","2"], 1);
date_to_string(1986,12,31);
number_before_reaching_sum(13,[1,2,1,2,3,4,1,2]);
number_before_reaching_sum(2,[1,2,1,2,3,4,1,2]);
what_month(100);
what_month(10);
month_range(1,200);
month_range(1,2);
month_range(1,365);
month_range(100,365);

oldest([]);
oldest([(1986,12,31),(1999,1,1),(12222,1,1),(2000,1,1)]);
oldest([(1111,1,1),(1,1,1),(222,2,2)]);
