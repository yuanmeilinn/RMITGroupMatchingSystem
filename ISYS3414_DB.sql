# Create Database and Table
CREATE DATABASE Workspace_Database;
use Workspace_Database;
CREATE TABLE Admin(
    Admin_ID VARCHAR(50),
    Admin_Name VARCHAR(50),
    CONSTRAINT Admin_pk PRIMARY KEY(Admin_ID)
);
CREATE TABLE Marketing_Statistics(
    Report_ID VARCHAR(50),
    Ad_Cost INT NOT NULL,
    Ad_Revenue INT NOT NULL,
    Ad_Profit INT,
    CONSTRAINT Marketing_Statistics_pk PRIMARY KEY(Report_ID)
);
CREATE TABLE Sponsorship(
    Sponsorship_ID VARCHAR(50),
    Admin_ID VARCHAR(50),
    Report_ID VARCHAR(50),
    Sponsor_Name VARCHAR(50),
    Sponsored_Amount INTEGER,
    Sponsor_Date VARCHAR(50),
    CONSTRAINT Sponsorship_pk PRIMARY KEY(Sponsorship_ID),
    CONSTRAINT Sponsorship_Report_ID_fk Foreign KEY(Report_ID) REFERENCES Marketing_Statistics(Report_ID),
    CONSTRAINT Sponsorship_Admin_ID_fk Foreign KEY(Admin_ID) REFERENCES Admin(Admin_ID)
);
CREATE TABLE Progress_Tracking(
    Record_Date VARCHAR(50),
    Admin_ID VARCHAR(50),
    Account_Registration INT,
    Total_Users INT,
    Team_Registration INT,
    CONSTRAINT Progress_Tracking_pk PRIMARY KEY(Record_Date),
    CONSTRAINT Progress_Tracking_Admin_ID_fk FOREIGN KEY(Admin_ID) REFERENCES Admin(Admin_ID)
);
CREATE TABLE Member_Account(
    S_ID VARCHAR(50),
    Admin_ID VARCHAR(50),
    Name VARCHAR(50),
    GPA INT NOT NULL,
    Registration_Date VARCHAR(50),
    Enrolled_Semester INT,
    Major VARCHAR(50) NOT NULL,
    CONSTRAINT Member_Account_pk PRIMARY KEY (S_ID),
    CONSTRAINT Member_Account_Admin_ID_fk FOREIGN KEY(Admin_ID) REFERENCES Admin(Admin_ID)
);
CREATE TABLE Access_Metrics(
    Access_Date VARCHAR(50),
    Admin_ID VARCHAR(50),
    Active_User INT,
    Dominant_Major VARCHAR(50),
    CONSTRAINT Access_Metrics_pk PRIMARY KEY(Access_Date),
    CONSTRAINT Access_Metrics_Admin_ID_fk FOREIGN KEY(Admin_ID) REFERENCES Admin(Admin_ID)
);
CREATE TABLE Survey(
    S_ID VARCHAR(50),
    Survey_ID VARCHAR(50),
    Admin_ID VARCHAR(50),
    User_Name VARCHAR(50),
    Satisfaction_Score INT,
    Feedback VARCHAR(255),
    Survey_Date VARCHAR(50),
    CONSTRAINT Survey_pk PRIMARY KEY(S_ID, Survey_ID),
    CONSTRAINT Survey_S_ID_fk FOREIGN KEY(S_ID) REFERENCES Member_Account(S_ID),
    CONSTRAINT Survey_Admin_ID_fk FOREIGN KEY(Admin_ID) REFERENCES Admin(Admin_ID)
);
CREATE TABLE Team(
    Team_ID VARCHAR(50),
    Course_ID VARCHAR(50),
    Max_Member INT NOT NULL,
    CONSTRAINT Team_Team_ID_pk PRIMARY KEY(Team_ID),
    CONSTRAINT Team_Course_ID_fk FOREIGN KEY(Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Course(
    Course_ID VARCHAR(50),
    Course_Name VARCHAR(50) NOT NULL,
    School VARCHAR(50) NOT NULL,
    CONSTRAINT Course_pk PRIMARY KEY(Course_ID)
);

CREATE TABLE Tutorial(
    Course_ID VARCHAR(50),
    Enrollment_ID VARCHAR(50),
    Tutorial_Lecturer VARCHAR(50) NOT NULL,
    Tutorial_Time VARCHAR(50) NOT NULL,
    Tutorial_Date VARCHAR(50) NOT NULL,
    CONSTRAINT Tutorial_pk PRIMARY KEY(Course_ID, Enrollment_ID),
    CONSTRAINT Tutorial_Course_ID_fk FOREIGN KEY(Course_ID) REFERENCES Course(Course_ID), FOREIGN KEY(Enrollment_ID) REFERENCES Enrollment(Enrollment_ID)
);

CREATE TABLE consist(
    S_ID VARCHAR(50),
    Team_ID VARCHAR(50),
    CONSTRAINT consist_pk PRIMARY KEY(S_ID, Team_ID),
    CONSTRAINT consist_S_ID_fk FOREIGN KEY(S_ID) REFERENCES Member_Account(S_ID),
    CONSTRAINT consist_Team_ID_fk FOREIGN KEY(Team_ID) REFERENCES Team(Team_ID)
);
CREATE TABLE Enrollment(
    Course_ID VARCHAR(50),
    Semester VARCHAR(50) NOT NULL,
    E_Location VARCHAR(50) NOT NULL,
    Year INT,
    Enrollment_ID VARCHAR(50),
    CONSTRAINT Enrollment_pk PRIMARY KEY (Enrollment_ID),
    CONSTRAINT Enrollment_Course_ID_fk FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);
CREATE TABLE Lecture(
    Enrollment_ID VARCHAR(50), 
    Course_ID VARCHAR(50), 
    Lecturer_Name VARCHAR(50) NOT NULL, 
    Lecture_Time VARCHAR(50) NOT NULL, 
    Lecture_Date VARCHAR(50) NOT NULL, 
    CONSTRAINT Lecture_pk PRIMARY KEY (Enrollment_ID, Course_ID, Lecture_Name),
    CONSTRAINT Lecture_Course_ID_fk FOREIGN KEY (Course_ID) REFERENCES  Course (Course_ID),
    CONSTRAINT Lecture_Enrollment_ID_fk FOREIGN KEY (Enrollment_ID) REFERENCES  Enrollment (Enrollment_ID)
);

# Insert value
insert
into Member_account values('s3927026', 'ad981274', 'Le Man Nhi', 2.4, '2021-08', 1, 'Digital Media')
into Member_account values('s3787492', 'ad981274', 'Trieu Thanh Tu', 3.5, '2021-03', 2, 'Software Engineering')
into Member_account values('s3289183', 'ad981274', 'Kieu Minh Tuan', 4, '2020-03', 1, 'Digital Marketing')
into Member_account values('s3982910', 'ad981274', 'Kieu My Ngoc', 1.5, '2020-05', 4, 'Information Technology')
into Member_account values('s3876419', 'ad981274', 'Trieu Thi Dang', 2.5, '2021-04', 2, 'Professional Communication')
into Member_account values('s3291840', 'ad981274', 'Nguyen Ba Thanh', 3.2, '2021-12', 4, 'Psychology')
into Member_account values('s3184920', 'ad981274', 'Tran Diem My', 3.8, '2021-08', 5, 'Design Studies')
into Member_account values('s3912839', 'ad981274', 'Nguyen Quoc Phong', 2.8, '2020-11', 6, 'Digital Marketing')
into Member_account values('s3851832', 'ad981274', 'Tran Quynh Tram', 3.3, '2021-01', 3, 'Information Technology')
into Member_account values('s3345791', 'ad981274', 'Hoang Anh Thai', 3.3, '2020-03', 4, 'Fashion Enterprise')
into Member_account values('s3569130', 'ad981274', 'Chung Thanh Doanh', 1.6, '2021-06', 3, 'Digital Media')
into Member_account values('s3854995', 'ad981274', 'Nguyen Ngoc Tho', 2.3, '2021-05', 5, 'Information Technology')
into Member_account values('s3964749', 'ad981274', 'Nguyen Huu Thanh', 3.9, '2021-08', 4, 'Psychology')
into Member_account values('s3230588', 'ad981274', 'Hoang Thuy Linh', 3.6, '2021-03', 5, 'Fashion Enterprise')
into Member_account values('s3202265', 'ad981274', 'Van Hoai Nam', 2.7, '2021-10', 4, 'Design Studies')
into Member_account values('s3160469', 'ad981274', 'Dang Ngoc Ninh', 3.2, '2021-05', 6, 'Fashion Enterprise')
into Member_account values('s3270915', 'ad981274', 'Duu Binh Minh', 2.8, '2021-01', 1, 'Digital Media')
into Member_account values('s3150769', 'ad981274', 'Tran Thanh Nga', 3, '2021-06', 4, 'Professional Communication')
into Member_account values('s3794333', 'ad981274', 'Thi Thanh Minh', 2.9, '2021-12', 2, 'Information Technology')
into Member_account values('s3181015', 'ad981274', 'Dang Thai Ha', 4, '2021-01', 1, 'Digital Marketing')
into Member_account values('s3934720', 'ad981274', 'Chu Minh Triet', 3, '2021-08', 6, 'Psychology')
into Member_account values('s3130573', 'ad981274', 'Nguyen Thu Lan', 3.4, '2021-04', 2, 'Software Engineering')
into Member_account values('s3235331', 'ad981274', 'Thao Trong Hieu', 2.2, '2021-01', 6, 'Design Studies')
into Member_account values('s3151080', 'ad981274', 'Pham Bich Lan', 3.8, '2021-02', 3, 'Digital Marketing')
into Member_account values('s3882492', 'ad981274', 'Chu Bao Hoang', 2.9, '2021-04', 2, 'Digital Media')
select * from dual;

insert all
into Survey values('s3927026', 'v7026', 'ad981274', 'Le Man Nhi', 8, 'Difficulty seeing teammates` contact method', '2021-05-03')
into Survey values('s3787492', 'v7492', 'ad981274', 'Trieu Thanh Tu', 8, 'The search bar is sometimes incorrect', '2021-07-03')
into Survey values('s3289183', 'v9183', 'ad981274', 'Kieu Minh Tuan' , 7, 'There should be increased amount of users', '2021-04-23')
into Survey values('s3982910', 'v2910', 'ad981274', 'Kieu My Ngoc', 9, 'The tool is quite handy, would recommend to others', '2021-06-02')
into Survey values('s3876419', 'v6419', 'ad981274', 'Trieu Thi Dang', 6, 'Hard to see a current courses', '2021-09-23')
into Survey values('s3291840', 'v1840', 'ad981274', 'Nguyen Ba Thanh', 7, 'The developers should link accounts on here to the school`s accounts for better coverage of students', '2021-07-04')
into Survey values('s3184920', 'v4920', 'ad981274', 'Tran Diem My', 7, 'There should be a rating feature for past teammates', '2021-10-19')
into Survey values('s3912839', 'v2839', 'ad981274', 'Nguyen Quoc Phong', 8, 'Should have a listing of past teammates', '2021-12-23')
into Survey values('s3851832', 'v1832', 'ad981274', 'Tran Quynh Tram', 8, 'It would be great if the app could sync with RMIT Database to automatically fill in class time and lecturer data', '2021-02-04')
into Survey values('s3345791', 'v5791', 'ad981274', 'Hoang Anh Thai', 6, 'Search bar needs improvement in accuracy', '2021-02-05')
into Survey values('s3569130', 'v3703', 'ad981274', 'Chung Thanh Doanh', 9, 'Very easy to use', '2021-01-03')
into Survey values('s3854995', 'v6178', 'ad981274', 'Nguyen Ngoc Tho', 6, 'Can be glitchy at some points', '2021-01-05')
into Survey values('s3964749', 'v9410', 'ad981274', 'Nguyen Huu Thanh', 5, 'I do not really see the usefulness of this app', '2021-02-15')
into Survey values('s3230588', 'v1234', 'ad981274', 'Hoang Thuy Linh', 6, 'Needs bigger buttons', '2021-05-17')
into Survey values('s3202265', 'v7110', 'ad981274', 'Van Hoai Nam', 9, 'Solves the problem effectively', '2021-06-23')
into Survey values('s3160469', 'v3812', 'ad981274', 'Dang Ngoc Ninh', 5, 'Response time is too slow', '2021-09-01')
into Survey values('s3270915', 'v1313', 'ad981274', 'Duu Binh Minh', 8, 'More contact info of students would be great', '2021-12-11')
into Survey values('s3150769', 'v1432', 'ad981274', 'Tran Thanh Nga', 7, 'I would love a rating system where similarly rated students are suggested to each other', '2021-12-27')
into Survey values('s3794333', 'v4618', 'ad981274', 'Thi Thanh Minh', 7, 'Fully accented names can make it easier to distinguish people with similar names', '2021-12-12')
into Survey values('s3181015', 'v1437', 'ad981274', 'Dang Thai Ha', 10, 'Perfect, no complaints', '2021-12-01')
into Survey values('s3934720', 'v1442', 'ad981274', 'Chu Minh Triet', 7, 'Some students don`t have their information shown in their profile, I think there should be some mandatory information input', '2021-07-05')
into Survey values('s3130573', 'v4221', 'ad981274', 'Nguyen Thu Lan', 9, 'Definitely very useful, would be using', '2021-06-10')
into Survey values('s3235331', 'v7009', 'ad981274', 'Thao Trong Hieu', 8, 'Search bar can be clunky sometimes', '2021-03-08')
into Survey values('s3151080', 'v3456', 'ad981274', 'Pham Bich Lan', 8, 'Good user satisfaction overall, needs more refined UI', '2021-02-12')
into Survey values('s3882492', 'v9715', 'ad981274', 'Chu Bao Hoang', 7, 'Should show scores for previous semesters of students', '2021-01-04')
select * from dual;

insert all
into consist values('s3927026', 't2790')
into consist values('s3876419', 't2790')
into consist values('s3184920', 't2790')
into consist values('s3345791', 't2790')
into consist values('s3569130', 't1479')
into consist values('s3230588', 't1479')
into consist values('s3202265', 't1479')
into consist values('s3160469', 't1479')
into consist values('s3270915', 't5876')
into consist values('s3150769', 't5876')
into consist values('s3235331', 't5876')
into consist values('s3882492', 't5876')
into consist values('s3787492', 't3232')
into consist values('s3982910', 't3232')
into consist values('s3291840', 't3232')
into consist values('s3851832', 't3232')
into consist values('s3854995', 't6477')
into consist values('s3964749', 't6477')
into consist values('s3794333', 't6477')
into consist values('s3934720', 't4390')
into consist values('s3130573', 't4390')
into consist values('s3289183', 't2234')
into consist values('s3912839', 't2234')
into consist values('s3181015', 't1437')
into consist values('s3151080', 't1437')
select * from dual;

insert all
into Team values('t2662', 'COSC2500', 7)
into Team values('t0006', 'COSC2429', 4)
into Team values('t2790', 'BUSM4185', 5)
into Team values('t1479', 'BUSM4185', 4)
into Team values('t5876', 'BUSM4185', 4)
into Team values('t3232', 'GRAP2173A', 4)
into Team values('t6477', 'BUSM4185', 2)
into Team values('t4390', 'BUSM4185', 4)
into Team values('t2234', 'BUSM4185', 3)
into Team values('t1437', 'BUSM4185', 3)
into Team values('t3923', 'BUSM4185', 5)
into Team values('t0001', 'BUSM4185', 4)
into Team values('t1234', 'BUSM4185', 4)
into Team values('t3002', 'GRAP2173A', 6)
into Team values('t0084', 'BUSM4185', 4)
select * from dual;

insert all
into Course values('GRAP2173A', 'Design Studio', 'SCD')
into Course values('OENG1207', 'Digital Fundamentals', 'SSET')
into Course values('BUSM4185', 'Introduction to Management', 'SBM') 
into Course values('COSC2500', 'Introduction to Computer Systems', 'SSET')
into Course values('COSC2429', 'Intro to Programming', 'SSET')
into Course values('COSC2426', 'Web Programming', 'SSET')
select * from dual;

insert all
into Enrollment values('BUSM4185', 'C', 'SG', '2022', 'DF2BB36C4A5D445CE053ED3F7264B0F1')
into Enrollment values('BUSM4185', 'A', 'SG', '2022', 'DF30D6892BB21FBCE053E73F72645093')
into Enrollment values('OENG1207', 'C', 'SG', '2023', 'DF3198D4A7D7135CE053E73F72647410')
into Enrollment values('COSC2500', 'C', 'SG', '2022', 'DF29F205B65734D2E053E73F7264BBF7')
into Enrollment values('GRAP2173A', 'C', 'SG', '2022', 'DF2BACB9CE13F5DAE053E73F72648D30')
into Enrollment values('BUSM4185', 'C', 'SG', '2022', 'DF2BB1DAB25195E8E053E73F726489A2')
into Enrollment values('BUSM4185', 'C', 'SG', '2022', 'DF2BF0D8FCDD5FBBE053E73F72643264')
into Enrollment values('COSC2426', 'B', 'SG', '2022', 'DF348EA4118EA62BE053ED3F7264E669')
into Enrollment values('BUSM4185', 'A', 'SG', '2022', 'DF30D4BC90AF1415E053E73F7264B286')
into Enrollment values('COSC2429', 'C', 'SG', '2022', 'DF31F7A90A58C1E7E053E73F726405DF')
into Enrollment values('BUSM4185', 'C', 'HN', '2022', 'DF2A11D7A8952472E053ED3F72640026')
into Enrollment values('BUSM4185', 'C', 'SG', '2022', 'DF2A09A08DD8FF97E053ED3F7264D0D2')
into Enrollment values('BUSM4185', 'B', 'SG', '2022', 'DF2BC4EBBCDFBE92E053ED3F72642AA1')
into Enrollment values('OENG1207', 'B', 'SG', '2022', 'DF2C48FEE5EB8FA3E053ED3F7264C7E5')
into Enrollment values('OENG1207', 'C', 'SG', '2022', 'DF31894FE75B9712E053ED3F7264AE6E')
into Enrollment values('BUSM4185', 'C', 'HN', '2021', 'DF318F8A67D3C4C9E053E73F72648325')
select * from dual;


insert all
into Tutorial values('COSC2500', 'DF3362AD1B5A65F8E053ED3F72649403', 'Lai Minh Tri', '15:30-16:00', 'Monday')
into Tutorial values('COSC2500','DF3362AD1B5A65F8E053ED3F72649403', 'Lai Minh Tri', '15:30-16:00', 'Monday')
into Tutorial values('GRAP2173A','DF336637304F94F4E053ED3F72645513', 'GRAP2173A', 'Nguyen The Anh', '15:30-16:00', 'Monday')
into Tutorial values('COSC2500','DF335EC22699DEFFE053E73F7264C518', 'Lai Minh Tri', '15:30-16:00', 'Monday')
into Tutorial values('GRAP2173A','DF3330ACD95E1484E053ED3F7264CE55',  'Nguyen The Anh', '15:30-16:00', 'Monday')
into Tutorial values( 'COSC2500','DF3358018C242300E053ED3F7264962F', 'Lai Minh Tri', '15:30-16:00', 'Monday')
into Tutorial values( 'OENG1207','DF335A5CBFBD42CBE053ED3F7264933F', 'Luong Thao My', '15:30-16:00', 'Monday')
into Tutorial values('COSC2500','DF33B96E5FB5BB62E053E73F726405C8',, 'Lai Minh Tri', '15:30-16:00', 'Monday')


insert all
into Marketing_Statistics values('r092184', 1875000, 2000000, 125000)
into Marketing_Statistics values('r728940', 1425000, 1800000, 375000)
into Marketing_Statistics values('r182373', 1200000, 1500000, 300000)
into Marketing_Statistics values('r658320', 1750000, 2300000, 550000)
into Marketing_Statistics values('r124052', 1250000, 1600000, 350000)
into Marketing_Statistics values('r863290', 1500000, 1200000, 300000)
into Marketing_Statistics values('r174915', 950000, 1000000, 50000)
into Marketing_Statistics values('r178401', 1000000, 1400000, 400000)
into Marketing_Statistics values('r319841', 1300000, 1600000, 300000)
into Marketing_Statistics values('r853791', 2000000, 2500000, 500000)
select * from dual;

insert all
into Sponsorship values('sp891240', 'ad981274', 'r092184', 'Instakilogram', 1000000, '2020-12')
into Sponsorship values('sp190481', 'ad981274', 'r728940', 'Bestbook', 500000, '2021-05')
into Sponsorship values('sp189598', 'ad981274', 'r182373', 'Mytube', 200000, '2020-11')
into Sponsorship values('sp583911', 'ad981274', 'r658320', 'Fancas', 700000, '2020-02')
into Sponsorship values('sp193589', 'ad981274', 'r124052', 'Bitter', 250000, '2021-08')
into Sponsorship values('sp139850', 'ad981274', 'r853290', 'Grenddit', 400000, '2021-07')
into Sponsorship values('sp765190', 'ad981274', 'r174915', 'Tmail', 850000, '2021-08')
into Sponsorship values('sp190350', 'ad981274', 'r178401', 'Inlook', 1250000, '2020-09')
into Sponsorship values('sp901240', 'ad981274', 'r319841', 'TriAugust', 1500000, '2021-03')
into Sponsorship values('sp190284', 'ad981274', 'r853791', 'MyJuly', 600000, '2021-02')
select * from dual;

insert all
into Admin values ('ad981274', 'Tri Lai') select * from dual;

insert all
into Progress_Tracking values('2021-01', 'ad981274', 142, 142, 23)
into Progress_Tracking values('2021-02', 'ad981274', 123, 265, 28)
into Progress_Tracking values('2021-03', 'ad981274', 344, 609, 12)
into Progress_Tracking values('2021-04', 'ad981274', 76, 685, 31)
into Progress_Tracking values('2021-05', 'ad981274', 56, 741, 33)
into Progress_Tracking values('2021-06', 'ad981274', 134, 875, 29)
into Progress_Tracking values('2021-07', 'ad981274', 221, 1096, 17)
into Progress_Tracking values('2021-08', 'ad981274', 34, 1130, 27)
into Progress_Tracking values('2021-09', 'ad981274', 128, 1258, 32)
into Progress_Tracking values('2021-10', 'ad981274', 19, 1277, 45) select * from dual;

insert all
into Access_Metrics values('2021-01',  'ad981274', 123, 'Software Engineering')
into Access_Metrics values('2021-02',  'ad981274', 240, 'Professional Communication')
into Access_Metrics values('2021-03',  'ad981274', 413, 'Design Studies')
into Access_Metrics values('2021-04',  'ad981274', 408, 'Information Technology')
into Access_Metrics values('2021-05',  'ad981274', 543, 'Professional Communication')
into Access_Metrics values('2021-06',  'ad981274', 354, 'Fashion Enterprise')
into Access_Metrics values('2021-07',  'ad981274', 478, 'Information Technology')
into Access_Metrics values('2021-08',  'ad981274', 984, 'Digital Marketing')
into Access_Metrics values('2021-09',  'ad981274', 1003, 'Information Technology')
into Access_Metrics values('2021-10',  'ad981274', 812, 'Information Technology') select * from dual;

insert all
into Lecture values('DF30D6892BB21FBCE053E73F72645093', 'BUSM4185', 'Nguyen Ngoc Binh', '15:30-16:00', 'Monday')
into Lecture values('DF3330ACD95E1484E053ED3F7264CE55', 'GRAP2173A', 'Nguyen The Anh', '15:30-16:00', 'Monday')
into Lecture values('DF3358018C242300E053ED3F7264962F', 'COSC2500', 'Lai Minh Tri', '15:30-16:00', 'Monday')
into Lecture values('DF335A5CBFBD42CBE053ED3F7264933F', 'OENG1207', 'Luong Thao My', '15:30-16:00', 'Monday')
into Lecture values('DF335EC22699DEFFE053E73F7264C518', 'COSC2500', 'Lai Minh Tri', '15:30-16:00', 'Monday')
into Lecture values('DF3361AFE2FE76D4E053ED3F726458F0', 'BUSM4185', 'Nguyen Ngoc Binh', '15:30-16:00', 'Monday')
into Lecture values('DF3362AD1B5A65F8E053ED3F72649403', 'COSC2500', 'Lai Minh Tri', '15:30-16:00', 'Monday')
into Lecture values('DF33B96E5FB5BB62E053E73F726405C8', 'COSC2500', 'Lai Minh Tri', '15:30-16:00', 'Monday')
into Lecture values('DF335FF55B27BEBCE053E73F72649DFA', 'BUSM4185', 'Nguyen Ngoc Binh', '15:30-16:00', 'Monday')
into Lecture values('DF336637304F94F4E053ED3F72645513', 'GRAP2173A', 'Nguyen The Anh', '15:30-16:00', 'Monday')
select * from dual;



