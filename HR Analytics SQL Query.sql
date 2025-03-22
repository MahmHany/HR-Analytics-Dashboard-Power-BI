-- create join table
select * from Absenteeism_at_work AS a
left join compensation as c
on a.ID= c.ID
left join Reasons as r 
on a.Reason_for_absence = r.Number

-- find the heathier employees for the bonus
select * from Absenteeism_at_work 
where Social_drinker = 0 and Social_smoker = 0 and 
Body_mass_index<25 and 
Absenteeism_time_in_hours <(select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)

-- compensate rate for non-smokers/ budget $983,221 so $.68 incrase per hour / %1,414.4 increase per year
select COUNT(*) as nonsmokers from Absenteeism_at_work
where Social_smoker = 0

-- Optmize the query
select a.ID,r.Reason,
Month_of_absence,Body_mass_index,
case when Body_mass_index<18.5 then 'Underweight'
	when Body_mass_index between 18.5 and 25 then 'Healthy Weight'
	when Body_mass_index between 25 and 30 then 'Overweight'
	when Body_mass_index >18.5 then 'Obese'
	else 'Unknown' end as BMI_Caregory,
case when Month_of_absence in (12,1,2) then 'Winter'
	when Month_of_absence in (3,4,5) then 'Spring'
	when Month_of_absence in (6,7,8) then 'Summer'
	when Month_of_absence in (9,10,11) then 'Fall'
	else 'Unkowns' end as Season_Names,
Seasons,
Month_of_absence,
Day_of_the_week,Transportation_expense,Education,
Son,Social_drinker,Social_smoker,Pet,Disciplinary_failure,
Age,Work_load_Average_day,Absenteeism_time_in_hours
	



from Absenteeism_at_work AS a
left join compensation as c
on a.ID= c.ID
left join Reasons as r 
on a.Reason_for_absence = r.Number