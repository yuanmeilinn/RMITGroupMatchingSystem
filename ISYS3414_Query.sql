#Report - Average Formation Time By Team
Select formation_time, team_ID
From Team_metrics
Group by formation_time, team_ID
Order by team_ID;

#Report - Member Information
Select Name, S_ID, Major, GPA, Enrolled_Semester
From member_account
Group by Name, S_ID, Major, GPA, Enrolled_Semester;

#Report - Member GPA
Select Name, GPA
FROM Member_Account
Group by Name, GPA
Order by GPA;

#Report - Earliest Registered Students In Each Majors
SELECT M1.Name, M1.S_ID, M1.major, M1.registration_Date
FROM member_account M1
WHERE M1.registration_date in (select Min(registration_date) from member_account M2 group by M2.major)
group by M1.Name, M1.S_ID, M1.major, M1.registration_Date;

#Report - Top Student
SELECT M.name, M.S_ID, M.GPA
FROM Member_Account M
WHERE M.GPA > (select round(avg(M2.GPA),2) from Member_Account M2)
order by M.GPA;

#Report - Member Major
Select count(*), major
From member_account
Group by major
order by count(*);

#Report - Satisfaction Score
Select satisfaction_score, Survey_Date
From Survey
group by Satisfaction_Score, Survey_Date
Order by Survey_Date;

#View Team Information
Select T.Team_ID, E.Enrollment_ID, C.Course_ID, C.Course_Name, C.School, E.Semester, E.Year, E.E_Location
from Team T
inner join Course C
on T.Course_ID = C.Course_ID
inner join Enrollment E
on C.Course_ID = E.Course_ID
group by T.Team_ID, E.Enrollment_ID, C.Course_ID, C.Course_Name, C.School, E.Semester, E.Year, E.E_Location;

#Report - Scholarship Eligible Candidates
Select M.Name, M.S_ID, M.GPA, M.major
FROM member_account M
WHERE M.Enrolled_Semester > 3 AND M.GPA >= 3.0
group by M.Name, M.S_ID, M.GPA, M.major
order by M.GPA;

#Chart - Member Major
Select GPA, count(GPA) 
FROM Member_Account 
Group by GPA 
Order by GPA;

#Chart - Frequency Of Survey Score
Select satisfaction_score, count(satisfaction_score)
From survey
group by satisfaction_score
order by satisfaction_score;

#Report - Team Average GPA
Select T.Team_ID, round(AVG(member_account.GPA),2) as "TEAM AVERAGE GPA", count(consist.S_ID) as "CURRENT_MEMBERS", 
T.max_member
FROM member_account
INNER JOIN consist 
on member_account.s_ID=consist.S_ID
inner join Team T
on consist.Team_ID = T.Team_ID
group by T.Team_ID, consist.Team_ID, T.max_member
Order by round(AVG(member_account.GPA),2);

#Report - Team Highest GPA
Select T.Team_ID, max(member_account.GPA) as "MAX_GPA", count(consist.S_ID) as "CURRENT_MEMBERS", 
T.max_member
FROM member_account
INNER JOIN consist 
on member_account.s_ID=consist.S_ID
inner join Team T
on consist.Team_ID = T.Team_ID
group by T.Team_ID, consist.Team_ID, T.max_member
Order by max(member_account.GPA);

#Report - Course Information
Select * from Course;

#Report - Team Member Count
Select Team_ID, count(S_ID) as Member_Number
FROM consist
Group by Team_ID
order by Member_Number;

#Available SBM Teams
Select consist.Team_ID, Course.Course_ID, Course.Course_name, count(consist.S_ID) as "CURRENT_MEMBERS", T.max_member
from consist 
inner join Team T
on consist.Team_ID = T.Team_ID
inner join Course 
ON Course.Course_ID = T.Course_ID
where Course.school='SBM'
group by consist.Team_ID, Course.Course_ID, Course.Course_name, T.max_member
having count(consist.S_ID) < T.max_member;

#Available SCD Teams
select consist.Team_ID, Course.Course_ID, Course.Course_name, count(consist.S_ID) as "CURRENT_MEMBERS", T.max_member
from consist 
inner join Team T
on consist.Team_ID = T.Team_ID
inner join Course 
ON Course.Course_ID = T.Course_ID
where Course.school='SCD'
group by consist.Team_ID, Course.Course_ID, Course.Course_name, T.max_member
having count(consist.S_ID) < T.max_member;

#Available SSET Teams
select consist.Team_ID, Course.Course_ID, Course.Course_name, count(consist.S_ID) as "CURRENT_MEMBERS", T.max_member
from consist 
inner join Team T
on consist.Team_ID = T.Team_ID
inner join Course 
ON Course.Course_ID = T.Course_ID
where Course.school='SSET'
group by consist.Team_ID, Course.Course_ID, Course.Course_name, T.max_member
having count(consist.S_ID) < T.max_member;

#Chart - Number of Team Count for each major
Select course.school,  count(team.team_ID) as "Team_Count"
from team inner join course on team.Course_ID = course.Course_ID
group by course.school;


#Chart -  Enrolled Semesters For Students
Select enrolled_semester, count(enrolled_semester)
From member_account
Group by enrolled_semester
Order by enrolled_semester;

#Report - Users’ Major
Select major, name, s_ID
From member_account
Group by major, name, S_ID
order by major;

#Report - Ad Profit
Select Sponsorship.Sponsorship_ID, Ad_Revenue
From Marketing_Statistics
INNER JOIN Sponsorship
ON Marketing_Statistics.Report_ID = Sponsorship.Report_ID
Group by Ad_revenue, Sponsorship.Sponsorship_ID
order by Sponsorship.Sponsorship_ID;

#Report - Most Profit Ad
Select S1.Sponsor_Name, S1.Sponsor_Date, S1.Sponsored_Amount, MS1.Ad_Profit
From Marketing_Statistics MS1, Sponsorship S1
Where MS1.Report_ID = S1.Report_ID
Group by MS1.Ad_Profit, S1.Sponsor_Name, S1.Sponsor_Date, S1.Sponsored_Amount
Order by MS1.Ad_Profit desc
Fetch next 5 rows only;

#Chart - Ad Revenue
Select MS.Ad_Revenue, S.Sponsor_Name
From Marketing_Statistics MS, Sponsorship S
Where MS.Report_ID = S.Report_ID
Group by MS.Ad_Revenue, S.Sponsor_Name
order by MS.Ad_Revenue;

#Chart - Sponsor Profit
Select MS.Ad_profit, S.Sponsor_Name
From Marketing_Statistics MS, Sponsorship S
Where MS.Report_ID = S.Report_ID
Group by MS.Ad_Profit, S.Sponsor_Name
order by MS.Ad_Profit;

#Chart - Sponsored Amount from each Sponsors
Select S.Sponsor_Name, S.Sponsored_amount
From Sponsorship S
Group by S.Sponsor_Name, S.Sponsored_amount
order by S.Sponsored_amount;

#Report - Team registration progress
Select Team_registration, Record_Date
From Progress_Tracking
Group by Team_Registration,  Record_Date;

#Report - Top Productive Month
Select A1.Active_User, A1.Access_Date
From Access_Metrics A1
Group by A1.Active_User, A1.Access_Date
order by A1.Active_User desc
Fetch first 5 rows only;

#Positive Feedbacks Table
Select S.Satisfaction_Score, S.Feedback
From Survey S
Where S.Satisfaction_Score > 7
Group by S.Satisfaction_Score, S.Feedback;

#Chart - Monthly Account Registration 
Select Account_registration, Record_Date
From Progress_Tracking
Group by Account_Registration, Record_Date








