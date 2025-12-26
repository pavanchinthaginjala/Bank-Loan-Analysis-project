create database Finance;
use finance;
select * from finance1;
select * from Finance_2;
select count( *)  from finance_2;
select count(*) from finance1;

---- year wise loan amount
# KPI 1 
select year(issue_d) as year_of_issue_d,sum(loan_amnt) Loanamount from finance1 group by year_of_issue_d order by year_of_issue_d;


# KPI 2
-- Grade - subgrade wise revolution balance.
select grade,sub_grade,sum(revol_bal) as Total from finance1 inner join finance_2 on (finance1.id=finance_2.id)
group by grade,sub_grade order by grade,sub_grade;

# kpi 3
-- Total payment for verified and non verified status
select verification_status,concat("$",format (round(sum(total_pymnt)/1000000,2),2),"M") as Total  from finance1  inner join  finance_2 on (finance1.id=finance_2.id)
 group  by verification_status order by  verification_status;
 
 # KPI 4 
 -- state wise and last _credit_pull_d wise loan status 
 select addr_state,last_pymnt_d,loan_amnt from finance1 inner join finance_2 on (finance1.id=finance_2.id)
 group by addr_state,last_pymnt_d,loan_amnt order by last_pymnt_d;
 
 # KPI 5
 -- home ownership vs last payment date stats
 select home_ownership,last_pymnt_d, concat('$',format (round(sum(last_pymnt_amnt)/10000,2),2),'K') as Total
 from finance1 inner join finance_2 on finance1.id=finance_2.id
 group  by home_ownership,last_pymnt_d  order  by  last_pymnt_d desc, home_ownership desc;
 
 
 
