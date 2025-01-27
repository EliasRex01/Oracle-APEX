create or replace procedure eba_demo_chart_data
as
  l_open   number;
  l_close  number;
  l_high   number;
  l_low    number;
  l_volume number;
begin

    delete from eba_demo_chart_projects;
    delete from eba_demo_chart_tasks;
    delete from eba_demo_chart_population;
    delete from eba_demo_chart_emp;
    delete from eba_demo_chart_dept;
    delete from eba_demo_chart_bball;
    delete from eba_demo_chart_orders;
    delete from eba_demo_chart_products;
    delete from eba_demo_chart_stats;
    delete from eba_demo_chart_stocks;
    delete from eba_demo_chart_grades;
    delete from eba_demo_chart_samples;
    delete from eba_demo_chart_sample_data;
    delete from eba_demo_chart_sample_names;

/* Charts Projects Table Data */
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (1,'Maintain Support Systems',to_date('01-11-2011','DD-MM-YYYY'), to_date('30-12-2011','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (2,'Load Software',to_date('03-12-2011','DD-MM-YYYY'), to_date('10-12-2011','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (3,'Email Integration',to_date('12-01-2012','DD-MM-YYYY'), to_date('17-02-2012','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (4,'Documentation',to_date('19-11-2011','DD-MM-YYYY'), to_date('25-11-2011','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (5,'Training',to_date('01-12-2011','DD-MM-YYYY'), to_date('08-12-2011','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (6,'Bug Tracker',to_date('16-12-2011','DD-MM-YYYY'), to_date('19-01-2012','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (7,'Migrate Old Systems',to_date('28-12-2011','DD-MM-YYYY'), to_date('22-02-2012','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (8,'Software Projects Tracking',to_date('15-12-2012','DD-MM-YYYY'), to_date('20-01-2012','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (9,'Public Website',to_date('06-12-2011','DD-MM-YYYY'), to_date('09-12-2011','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (10,'Early Adopter Release',to_date('05-12-2011','DD-MM-YYYY'), to_date('06-02-2012','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (11,'Environment Configuration',to_date('01-11-2011','DD-MM-YYYY'), to_date('22-11-2011','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (12,'Customer Satisfaction Survey',to_date('18-12-2011','DD-MM-YYYY'), to_date('01-01-2011','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (13,'Convert Excel Spreadsheet',to_date('15-12-2011','DD-MM-YYYY'), to_date('15-03-2012','DD-MM-YYYY'));
    insert into eba_demo_chart_projects (ID,PROJECT,CREATED,CREATED_BY) values (14,'Upgrade Equipment',to_date('01-02-2012','DD-MM-YYYY'), to_date('30-05-2012','DD-MM-YYYY'));
    

/* Charts Tasks Table Data */
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (74,14,'Decommission servers',to_date('01-02-12','DD-MM-RR'),to_date('30-04-12','DD-MM-RR'),'Pending','Al Bines',0,500,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (75,6,'Measure effectiveness of improved QA',to_date('01-02-12','DD-MM-RR'),to_date('02-03-12','DD-MM-RR'),'Pending','Myra Sutcliff',0,1500,18);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (76,10,'Response to Customer Feedback',to_date('01-02-12','DD-MM-RR'),to_date('25-05-12','DD-MM-RR'),'Pending','Russ Saunders',0,6000,33);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (77,10,'User acceptance testing',to_date('16-02-12','DD-MM-RR'),to_date('20-05-12','DD-MM-RR'),'Pending','Russ Saunders',0,2500,33);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (78,10,'End-user Training',to_date('20-03-12','DD-MM-RR'),to_date('01-06-12','DD-MM-RR'),'Pending','Myra Sutcliff',0,2500,79);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (79,10,'Rollout sample applications',to_date('23-05-12','DD-MM-RR'),to_date('03-06-12','DD-MM-RR'),'Pending','Pam King',0,500,32);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (72,14,'Installation',to_date('03-02-12','DD-MM-RR'),to_date('04-03-12','DD-MM-RR'),'Pending','Mark Nile',0,1500,67);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (73,14,'Notify users',to_date('06-03-12','DD-MM-RR'),to_date('09-03-12','DD-MM-RR'),'Pending','Mark Nile',0,200,67);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (34,10,'Plan production release schedule',to_date('22-12-11','DD-MM-RR'),to_date('22-12-11','DD-MM-RR'),'Closed','Pam King',100,100,32);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (37,12,'Complete questionnaire',to_date('18-12-11','DD-MM-RR'),to_date('01-01-11','DD-MM-RR'),'On-Hold','Irene Jones',1200,800,38);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (59,11,'Select servers for Development, Test, Production',to_date('03-11-11','DD-MM-RR'),to_date('08-11-11','DD-MM-RR'),'Closed','James Cassidy',200,600,61);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (3,1,'HR Support Systems',to_date('01-11-11','DD-MM-RR'),to_date('12-03-12','DD-MM-RR'),'Closed','Al Bines',300,500,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (1,1,'HR software upgrades',to_date('01-11-11','DD-MM-RR'),to_date('27-02-12','DD-MM-RR'),'On-Hold','Pam King',8000,7000,3);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (2,1,'Arrange for vacation coverage',to_date('01-11-11','DD-MM-RR'),to_date('31-12-11','DD-MM-RR'),'On-Hold','Russ Sanders',9500,7000,3);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (4,3,'Complete plan',to_date('08-11-11','DD-MM-RR'),to_date('14-12-11','DD-MM-RR'),'Closed','Mark Nile',3000,1500,44);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (5,3,'Check software licenses',to_date('12-12-11','DD-MM-RR'),to_date('13-12-11','DD-MM-RR'),'Closed','Mark Nile',200,200,44);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (6,5,'Create training workspace',to_date('01-12-11','DD-MM-RR'),to_date('08-12-11','DD-MM-RR'),'Closed','James Cassidy',500,700,36);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (7,5,'Publish links to self-study courses',to_date('01-12-11','DD-MM-RR'),to_date('01-12-11','DD-MM-RR'),'Closed','John Watson',100,100,36);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (8,2,'Identify point solutions required',to_date('03-12-11','DD-MM-RR'),to_date('05-12-11','DD-MM-RR'),'Closed','John Watson',200,300,49);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (9,2,'Install in development',to_date('07-12-11','DD-MM-RR'),to_date('07-12-11','DD-MM-RR'),'Closed','John Watson',100,100,49);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (15,4,'Identify owners',to_date('19-11-11','DD-MM-RR'),to_date('22-11-11','DD-MM-RR'),'Closed','Hank Davis',250,300,17);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (16,4,'Initial Draft Review',to_date('23-11-11','DD-MM-RR'),to_date('23-11-11','DD-MM-RR'),'Closed','Hank Davis',100,100,17);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (17,4,'Monitor Review Comments',to_date('23-11-11','DD-MM-RR'),to_date('31-12-11','DD-MM-RR'),'Closed','Hank Davis',450,500,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (18,6,'Implement bug tracking software',to_date('15-11-11','DD-MM-RR'),to_date('15-11-11','DD-MM-RR'),'Closed','Myra Sutcliff',100,100,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (19,6,'Review automated testing tools',to_date('16-11-11','DD-MM-RR'),to_date('15-12-11','DD-MM-RR'),'Closed','Myra Sutcliff',2750,1500,18);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (20,7,'Identify pilot applications',to_date('10-11-11','DD-MM-RR'),to_date('15-11-11','DD-MM-RR'),'Closed','Mark Nile',300,500,53);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (21,7,'Migrate pilot applications to ',to_date('20-11-11','DD-MM-RR'),to_date('25-11-11','DD-MM-RR'),'Closed','Mark Nile',500,500,53);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (22,8,'Customize Software Projects software',to_date('15-12-11','DD-MM-RR'),to_date('20-01-12','DD-MM-RR'),'Open','Tom Suess',600,1000,28);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (23,7,'Post-migration review',to_date('01-12-11','DD-MM-RR'),to_date('01-12-11','DD-MM-RR'),'Closed','Mark Nile',100,100,53);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (24,7,'User acceptance testing',to_date('03-12-11','DD-MM-RR'),to_date('04-12-11','DD-MM-RR'),'Closed','Mark Nile',600,200,23);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (25,8,'Enter base data (Projects, Milestones, etc.)',to_date('10-12-11','DD-MM-RR'),to_date('11-12-11','DD-MM-RR'),'Closed','Tom Suess',200,200,28);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (26,8,'Load current tasks and enhancements',to_date('12-12-11','DD-MM-RR'),to_date('16-12-11','DD-MM-RR'),'Closed','Tom Suess',400,500,28);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (27,6,'Document quality assurance procedures',to_date('16-12-11','DD-MM-RR'),to_date('19-01-12','DD-MM-RR'),'On-Hold','Myra Sutcliff',3500,4000,18);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (28,8,'Conduct project kickoff meeting',to_date('05-12-11','DD-MM-RR'),to_date('05-12-11','DD-MM-RR'),'Closed','Pam King',100,100,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (29,9,'Determine host server',to_date('06-12-11','DD-MM-RR'),to_date('07-12-11','DD-MM-RR'),'Closed','Tiger Scott',200,200,40);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (30,9,'Check software licenses',to_date('07-12-11','DD-MM-RR'),to_date('07-12-11','DD-MM-RR'),'Closed','Tom Suess',100,100,40);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (31,10,'Identify pilot users',to_date('05-12-11','DD-MM-RR'),to_date('06-12-11','DD-MM-RR'),'Closed','Scott Spencer',200,200,33);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (32,10,'Software Deliverable',to_date('07-12-11','DD-MM-RR'),to_date('20-12-11','DD-MM-RR'),'Closed','Scott Spencer',400,500,33);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (33,10,'Early Adopter Release',to_date('21-12-11','DD-MM-RR'),to_date('21-12-11','DD-MM-RR'),'Closed','Pam King',100,100,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (35,11,'Determine midtier configuration(s)',to_date('02-11-11','DD-MM-RR'),to_date('02-11-11','DD-MM-RR'),'Closed','James Cassidy',100,100,61);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (36,5,'Manage Training Activities',to_date('28-11-11','DD-MM-RR'),to_date('03-02-12','DD-MM-RR'),'On-Hold','John Watson',1000,2000,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (38,12,'Review feedback',to_date('09-01-12','DD-MM-RR'),to_date('15-01-12','DD-MM-RR'),'On-Hold','Irene Jones',200,400,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (39,12,'Plan rollout schedule',to_date('16-01-12','DD-MM-RR'),to_date('24-01-12','DD-MM-RR'),'On-Hold','Irene Jones',0,750,38);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (40,9,'Plan rollout schedule',to_date('10-12-11','DD-MM-RR'),to_date('02-01-12','DD-MM-RR'),'On-Hold','Al Bines',300,1000,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (41,9,'Develop web pages',to_date('10-01-12','DD-MM-RR'),to_date('15-02-12','DD-MM-RR'),'On-Hold','Tiger Scott',800,2000,40);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (42,9,'Purchase additional software licenses, if needed',to_date('17-02-12','DD-MM-RR'),to_date('17-02-12','DD-MM-RR'),'On-Hold','Tom Suess',0,100,40);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (43,1,'Investigate new Virus Protection software',to_date('29-12-11','DD-MM-RR'),to_date('13-01-12','DD-MM-RR'),'Open','Pam King',1700,1500,3);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (44,3,'Get RFPs for new server',to_date('13-12-11','DD-MM-RR'),to_date('03-01-12','DD-MM-RR'),'Open','Mark Nile',2000,1000,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (45,13,'Collect mission-critical spreadsheets',to_date('15-12-11','DD-MM-RR'),to_date('15-02-12','DD-MM-RR'),'Open','Pam King',2500,4000,46);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (46,13,'Create  applications from spreadsheets',to_date('15-12-11','DD-MM-RR'),to_date('30-05-12','DD-MM-RR'),'Open','Pam King',6000,10000,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (47,13,'Lock spreadsheets',to_date('15-12-11','DD-MM-RR'),to_date('30-05-12','DD-MM-RR'),'Open','Pam King',1000,800,46);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (48,13,'Send links to previous spreadsheet owners',to_date('16-12-11','DD-MM-RR'),to_date('01-06-12','DD-MM-RR'),'Open','Pam King',1000,1500,46);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (49,2,'Customize solutions',to_date('08-12-11','DD-MM-RR'),to_date('01-03-12','DD-MM-RR'),'Open','John Watson',1500,4000,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (50,2,'Train developers / users',to_date('10-01-12','DD-MM-RR'),to_date('25-03-12','DD-MM-RR'),'Pending','John Watson',0,8000,49);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (51,2,'Implement in Production',to_date('27-12-11','DD-MM-RR'),to_date('03-05-12','DD-MM-RR'),'Open','John Watson',200,1500,49);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (52,7,'Migrate applications',to_date('15-12-11','DD-MM-RR'),to_date('20-02-12','DD-MM-RR'),'Open','Mark Nile',1000,8000,53);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (53,7,'Plan migration schedule',to_date('22-12-11','DD-MM-RR'),to_date('03-03-12','DD-MM-RR'),'Open','Mark Nile',1500,6000,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (54,10,'Publish Feedback application',to_date('26-12-11','DD-MM-RR'),to_date('04-05-12','DD-MM-RR'),'Open','Pam King',300,12000,33);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (55,6,'Train developers on tracking bugs',to_date('20-01-12','DD-MM-RR'),to_date('10-03-12','DD-MM-RR'),'On-Hold','Myra Sutcliff',0,2000,18);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (56,7,'End-user Training',to_date('28-12-11','DD-MM-RR'),to_date('22-02-12','DD-MM-RR'),'Open','John Watson',0,2000,53);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (57,11,'Identify server requirements',to_date('01-11-11','DD-MM-RR'),to_date('02-11-11','DD-MM-RR'),'Closed','John Watson',100,200,61);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (58,11,'Specify security authentication scheme(s)',to_date('03-11-11','DD-MM-RR'),to_date('05-11-11','DD-MM-RR'),'Closed','John Watson',200,300,61);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (60,11,'Create pilot workspace',to_date('10-11-11','DD-MM-RR'),to_date('10-11-11','DD-MM-RR'),'Closed','John Watson',100,100,61);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (61,11,'Configure Workspace provisioning',to_date('10-11-11','DD-MM-RR'),to_date('10-11-11','DD-MM-RR'),'Closed','John Watson',200,100,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (62,11,'Run installation',to_date('11-11-11','DD-MM-RR'),to_date('11-11-11','DD-MM-RR'),'Closed','James Cassidy',100,100,57);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (64,14,'Obtain equipment specifications',to_date('03-01-12','DD-MM-RR'),to_date('06-01-12','DD-MM-RR'),'Pending','James Cassidy',0,500,67);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (65,3,'Purchase backup server',to_date('12-01-12','DD-MM-RR'),to_date('07-02-12','DD-MM-RR'),'Pending','Mark Nile',0,3000,44);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (66,14,'Identify integration points',to_date('08-01-12','DD-MM-RR'),to_date('28-01-12','DD-MM-RR'),'Pending','Mark Nile',0,2000,67);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (67,14,'Decommission machines',to_date('08-01-12','DD-MM-RR'),to_date('08-01-12','DD-MM-RR'),'Pending','Scott Spencer',0,100,null);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (68,14,'Map data usage',to_date('20-01-12','DD-MM-RR'),to_date('03-03-12','DD-MM-RR'),'Pending','Mark Nile',0,8000,67);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (69,14,'Purchase new machines',to_date('24-02-12','DD-MM-RR'),to_date('20-03-12','DD-MM-RR'),'Pending','John Watson',0,2500,67);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (70,14,'Import data',to_date('25-02-12','DD-MM-RR'),to_date('23-03-12','DD-MM-RR'),'Pending','John Watson',0,1000,67);
    insert into eba_demo_chart_tasks (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET,PARENT_TASK) values (71,14,'Convert processes',to_date('02-02-12','DD-MM-RR'),to_date('01-04-12','DD-MM-RR'),'Pending','Pam King',0,3000,67);

update eba_demo_chart_tasks
   set start_date = start_date + (SYSDATE - TO_DATE('01012012','MMDDYYYY')),
       end_date = end_date + (SYSDATE - TO_DATE('01012012','MMDDYYYY'));

/* Charts Population Table Data */
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (51,'Wyoming','WY',563626,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (9,'Georgia','GA',9687653,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (17,'Tennessee','TN',6346105,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (18,'Missouri','MO',5988927,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (19,'Maryland','MD',5773552,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (21,'Minnesota','MN',5303925,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (36,'New Mexico','NM',2059179,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (1,'California','CA',37253956,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (2,'Texas','TX',25145561,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (3,'New York','NY',19378102,1);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (4,'Florida','FL',18801310,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (5,'Illinois','IL',12830310,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (6,'Pennsylvania','PA',12702379,1);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (7,'Ohio','OH',11536504,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (8,'Michigan','MI',9883640,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (10,'North Carolina','NC',9535483,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (11,'New Jersey','NJ',8791894,1);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (12,'Virginia','VA',8001024,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (13,'Washington','WA',6724540,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (14,'Arizona','AZ',6392017,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (15,'Massachusetts','MA',6547629,1);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (16,'Indiana','IN',6483802,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (20,'Wisconsin','WI',5686986,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (22,'Colorado','CO',5029196,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (23,'Alabama','AL',4779736,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (24,'South Carolina','SC',4625364,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (25,'Louisiana','LA',4533372,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (26,'Kentucky','KY',4339367,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (27,'Oregon','OR',3831074,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (28,'Oklahoma','OK',3751351,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (29,'Connecticut','CT',3574097,1);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (30,'Iowa','IA',3046355,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (31,'Mississippi','MS',2967297,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (32,'Arkansas','AR',2915918,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (33,'Kansas','KS',2853118,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (34,'Utah','UT',2763885,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (35,'Nevada','NV',2700551,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (37,'West Virginia','WV',1852994,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (38,'Nebraska','NE',1826341,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (39,'Idaho','ID',1567582,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (40,'Maine','ME',1328361,1);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (41,'New Hampshire','NH',1316470,1);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (42,'Hawaii','HI',1360301,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (43,'Rhode Island','RI',1052567,1);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (44,'Montana','MT',989415,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (45,'Delaware','DE',897934,3);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (46,'South Dakota','SD',814180,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (47,'Alaska','AK',710231,4);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (48,'North Dakota','ND',672591,2);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (49,'Vermont','VT',625741,1);
    insert into eba_demo_chart_population (ID,STATE_NAME,STATE_CODE,POPULATION,REGION) values (50,'District of Columbia','DC',601723,3);

/* Charts Dept Table */
    insert into eba_demo_chart_dept (DEPTNO,DNAME,LOC) values (10,'ACCOUNTING','NEW YORK');
    insert into eba_demo_chart_dept (DEPTNO,DNAME,LOC) values (20,'RESEARCH','DALLAS');
    insert into eba_demo_chart_dept (DEPTNO,DNAME,LOC) values (30,'SALES','CHICAGO');
    insert into eba_demo_chart_dept (DEPTNO,DNAME,LOC) values (40,'OPERATIONS','BOSTON');

/* Charts Emp Table */
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7839,'KING','PRESIDENT',null,to_date('17-11-81','DD-MM-RR'),5000,null,10);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7698,'BLAKE','MANAGER',7839,to_date('01-05-81','DD-MM-RR'),2850,null,30);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7782,'CLARK','MANAGER',7839,to_date('09-06-81','DD-MM-RR'),2450,null,10);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7566,'JONES','MANAGER',7839,to_date('02-04-81','DD-MM-RR'),2975,null,20);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7788,'SCOTT','ANALYST',7566,to_date('09-12-82','DD-MM-RR'),3000,null,20);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7902,'FORD','ANALYST',7566,to_date('03-12-81','DD-MM-RR'),3000,null,20);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7369,'SMITH','CLERK',7902,to_date('17-12-80','DD-MM-RR'),800,null,20);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7499,'ALLEN','SALESMAN',7698,to_date('20-02-81','DD-MM-RR'),1600,300,30);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7521,'WARD','SALESMAN',7698,to_date('22-02-81','DD-MM-RR'),1250,500,30);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7654,'MARTIN','SALESMAN',7698,to_date('28-09-81','DD-MM-RR'),1250,1400,30);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7844,'TURNER','SALESMAN',7698,to_date('08-09-81','DD-MM-RR'),1500,0,30);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7876,'ADAMS','CLERK',7788,to_date('12-01-83','DD-MM-RR'),1100,null,20);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7900,'JAMES','CLERK',7698,to_date('03-12-81','DD-MM-RR'),950,null,30);
    insert into eba_demo_chart_emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7934,'MILLER','CLERK',7782,to_date('23-01-82','DD-MM-RR'),1300,null,10);

/* Charts BBall Table */
    insert into eba_demo_chart_bball (ID,CITY,TEAM,CONFERENCE,WINS) values (1,'Boston','Celtics','East',17);
    insert into eba_demo_chart_bball (ID,CITY,TEAM,CONFERENCE,WINS) values (2,'Los Angeles','Lakers','West',16);
    insert into eba_demo_chart_bball (ID,CITY,TEAM,CONFERENCE,WINS) values (3,'Chicago','Bulls','East',6);
    insert into eba_demo_chart_bball (ID,CITY,TEAM,CONFERENCE,WINS) values (4,'San Antonio','Spurs','West',5);
    insert into eba_demo_chart_bball (ID,CITY,TEAM,CONFERENCE,WINS) values (5,'Golden Gate','Warriors','West',4);
    insert into eba_demo_chart_bball (ID,CITY,TEAM,CONFERENCE,WINS) values (6,'Philadelphia','76ers','East',3);
    insert into eba_demo_chart_bball (ID,CITY,TEAM,CONFERENCE,WINS) values (7,'Detroit','Pistons','East',3);
    insert into eba_demo_chart_bball (ID,CITY,TEAM,CONFERENCE,WINS) values (8,'Miami','Heat','East',3);
    insert into eba_demo_chart_bball (ID,CITY,TEAM,CONFERENCE,WINS) values (9,'New York','Knicks','East',2);
    insert into eba_demo_chart_bball (ID,CITY,TEAM,CONFERENCE,WINS) values (10,'Houston','Rockets','West',2);

/* Charts Products Tables */
    insert into eba_demo_chart_products(product_id, product_name, product_description, list_price) values(1,'Apples','Red pink lady apples',1.20);
    insert into eba_demo_chart_products(product_id, product_name, product_description, list_price) values(2,'Bananas','Bunches of yellow bananas',3.80);
    insert into eba_demo_chart_products(product_id, product_name, product_description, list_price) values(3,'Cantaloupe','Coral coloured melon',2.95);
    insert into eba_demo_chart_products(product_id, product_name, product_description, list_price) values(4,'Dates','Dried dates',3.30);
    insert into eba_demo_chart_products(product_id, product_name, product_description, list_price) values(5,'Grapes','Punnet of Red Seedless Grapes',2.05);

/* Charts Orders Table */
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (1,1,42,'Store A',to_date('08-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (2,2,55,'Store A',to_date('09-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (3,3,36,'Store A',to_date('11-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (4,4,22,'Store A',to_date('12-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (5,5,42,'Store A',to_date('14-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (6,1,32,'Acme Store',to_date('03-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (7,2,39,'Acme Store',to_date('04-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (8,3,36,'Acme Store',to_date('07-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (9,4,27,'Acme Store',to_date('13-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (10,5,50,'Acme Store',to_date('14-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (11,1,34,'Shop C',to_date('08-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (12,2,30,'Shop C',to_date('09-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (13,3,50,'Shop C',to_date('11-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (14,4,46,'Shop C',to_date('12-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (15,5,36,'Shop C',to_date('14-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (16,1,74,'Deli',to_date('02-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (17,2,42,'Deli',to_date('04-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (18,3,70,'Deli',to_date('06-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (19,4,46,'Deli',to_date('08-04-16','DD-MM-RR'));
    insert into eba_demo_chart_orders(order_id,product_id, quantity,customer, sales_date) values (20,5,22,'Deli',to_date('10-04-16','DD-MM-RR'));

/* Charts Stats Table */
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('AU','Australia',0,0,0);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('BE','Belgium',3.5,3.7,7.8);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('CA','Canada',2.3,2,4.7);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('CZ','Czech Republic',1.8,6,8.3);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('DK','Denmark',0,0,0);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('FI','Finland',1.8,6.8,9);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('DE','Germany',2.8,3.2,6.9);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('GR','Greece',3.4,4.3,9.2);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('HU','Hungary',1.4,6.4,8.3);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('IT','Italy',2.2,6.8,9);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('JA','Japan',3.2,3.1,6.3);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('KO','Korea',1.2,0.9,2.1);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('LU','Luxembourg',2.8,2.4,5.9);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('MX','Mexico',0,0,0);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('NZ','New Zealand',0,0,0);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('PO','Poland',3,2.6,6.8);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('SK','Slovakia',0.9,2.5,4.3);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('ES','Spain',1.4,6.8,9.2);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('SE','Sweden',2.5,3.6,6.2);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('CH','Switzerland',2.7,2.7,5.9);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('TR','Turkey',1.1,1.3,2.4);
    insert into eba_demo_chart_stats (name,country,employee,employer,total) values ('US','United States',1.8,3,5.2);

/* Charts Stocks Table Data */
    l_open  := 200;
    l_close := dbms_random.value*5+200;
    insert into eba_demo_chart_stocks (ID, STOCK_CODE, STOCK_NAME, PRICING_DATE, PRICING_TIMESTAMP, PRICING_TIMESTAMP_TZ,OPENING_VAL,HIGH,LOW,CLOSING_VAL,VOLUME) values (1,'METR','Metro Trading',SYSDATE - 500, SYSTIMESTAMP - 500,LOCALTIMESTAMP -500,200,202,199,l_close,1000000);
    for i in 1..500 loop  
        l_open   := l_close;
        l_close  := l_open + dbms_random.value * 5 * power(-1, round(dbms_random.value));
        l_high   := greatest(l_open, l_close) + dbms_random.value * 2;
        l_low    := least(l_open, l_close) - dbms_random.value * 2;
        l_volume := 1000000 + dbms_random.value * 10000000;
        
        insert into eba_demo_chart_stocks (ID, STOCK_CODE, STOCK_NAME, PRICING_DATE, PRICING_TIMESTAMP, PRICING_TIMESTAMP_TZ,OPENING_VAL,HIGH,LOW,CLOSING_VAL,VOLUME) values (i+1,'METR','Metro Trading', SYSDATE-500+i, SYSTIMESTAMP-500+i,CURRENT_TIMESTAMP-500+i,l_open,l_high,l_low,l_close,l_volume);
    end loop;
    
/* Box Plot Grades Table Data */
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (1,'English',93,53,71);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (2,'Physics',61,55,65);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (3,'English',70,50,90);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (4,'Math',50,70,45);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (5,'English',30,67,90);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (6,'English',85,56,67);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (7,'Math',70,45,59);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (8,'Math',62,53,66);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (9,'English',77,50,60);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (10,'English',90,54,69);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (11,'Physics',60,40,64);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (12,'English',88,28,67);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (13,'Math',71,56,45);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (14,'Math',63,58,64);
    insert into eba_demo_chart_grades (ID,COURSE,SCHOOLA,SCHOOLB,SCHOOLC) values (15,'English',59,54,65);
    
/* Box Plot Samples Table Data */
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.64,6.48,9.36,6.48,9.36);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.47,9.81,16.31,9.81,16.31);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.03,8.95,4.02,8.95,4.02);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.44,12.79,8.4,12.79,8.4);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.07,16.17,16.42,16.17,16.42);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.11,16.54,15.81,16.54,15.81);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.23,12.93,3.76,12.93,3.76);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.55,9.23,7.17,9.23,7.17);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.17,18.93,12.78,18.93,12.78);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.84,14.94,13.57,14.94,13.57);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11,0.21,16.99,0.21,16.99);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.01,12.13,0.72,12.13,0.72);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.12,16.18,5.64,16.18,5.64);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.24,12.78,16.16,12.78,16.16);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.32,12.29,9.98,12.29,9.98);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.55,10.85,-1.45,10.85,-1.45);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.37,16.72,null,16.72,13.97);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.49,13.36,null,13.36,13.37);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.99,6.99,null,6.99,3.39);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.66,15.18,null,15.18,9.12);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.78,10.86,null,10.86,-2.9);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.31,13.78,null,13.78,10.52);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.71,8.31,null,8.31,15.04);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.86,6.82,null,6.82,7.24);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.42,6.75,null,6.75,13.87);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.57,10.13,null,10.13,11.42);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.92,17.08,null,17.08,12.79);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.8,14.56,null,14.56,17.91);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.31,18.52,null,18.52,12.5);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.64,11.66,null,11.66,7.41);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.06,18.01,null,18.01,21.19);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.65,13.39,null,13.39,9.69);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.5,14.9,null,14.9,6.79);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.3,20.97,null,20.97,15.16);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (7.87,11,null,11,3.19);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.5,3.85,null,3.85,15.05);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.54,4.18,null,4.18,13.83);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.24,15.34,null,15.34,7.2);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.96,12.6,null,12.6,7);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.5,18.48,null,18.48,8);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.51,17.22,null,17.22,9);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.29,15.53,null,15.53,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.63,10.44,null,10.44,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.09,10.31,null,10.31,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.36,5.24,null,5.24,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.21,18.02,null,18.02,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.46,6.82,null,6.82,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.09,9.07,null,9.07,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.68,12.86,null,12.86,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.51,10.73,null,10.73,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.78,17.69,null,17.69,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.27,12.12,null,12.12,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.61,12.21,null,12.21,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.59,5.66,null,5.66,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.61,9.3,null,9.3,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.6,13.49,null,13.49,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.2,13.67,null,13.67,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.31,9.06,null,9.06,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.47,16.6,null,16.6,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.71,14.83,null,14.83,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (7.98,12.6,null,12.6,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.25,15.25,null,15.25,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.19,9.22,null,9.22,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.97,12.11,null,12.11,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.86,7.43,null,7.43,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (12.07,12.19,null,12.19,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.09,16.49,null,16.49,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.53,9.41,null,9.41,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.74,10.49,null,10.49,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.92,18.6,null,18.6,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.65,16.65,null,16.65,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.31,11.17,null,11.17,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.2,14.49,null,14.49,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.6,16.34,null,16.34,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (12.55,10.31,null,10.31,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.95,11.37,null,11.37,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.9,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.97,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.26,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.32,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.74,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.06,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (8.99,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.74,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.59,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.55,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.95,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.8,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.69,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.75,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.14,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.06,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.69,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.11,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (11.15,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.73,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.6,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (10.33,null,null,null,null);
    insert into eba_demo_chart_samples (SAMPLE1,SAMPLE2,SAMPLE3,SAMPLE4,SAMPLE5) values (9.63,null,null,null,null);
    
/* Box Plot Sample Names Table Data */
    insert into eba_demo_chart_sample_names (ID,SAMPLE_NAME,SAMPLE_DATE) values (1,'Sample 1',to_date('20-07-17','DD-MM-RR'));
    insert into eba_demo_chart_sample_names (ID,SAMPLE_NAME,SAMPLE_DATE) values (2,'Sample 2',to_date('27-07-17','DD-MM-RR'));
    insert into eba_demo_chart_sample_names (ID,SAMPLE_NAME,SAMPLE_DATE) values (3,'Sample 3',to_date('30-07-17','DD-MM-RR'));
    insert into eba_demo_chart_sample_names (ID,SAMPLE_NAME,SAMPLE_DATE) values (4,'Sample 4',to_date('03-08-17','DD-MM-RR'));
    insert into eba_demo_chart_sample_names (ID,SAMPLE_NAME,SAMPLE_DATE) values (5,'Sample 5',to_date('10-08-17','DD-MM-RR'));
    
/* Box Plot Sample Data Table Data */
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (321,1,9.64);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (322,2,6.48);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (323,3,9.36);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (324,4,6.48);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (325,5,9.36);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (326,1,9.47);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (327,2,9.81);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (328,3,16.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (329,4,9.81);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (330,5,16.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (331,1,9.03);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (332,2,8.95);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (333,3,4.02);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (334,4,8.95);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (335,5,4.02);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (336,1,9.44);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (337,2,12.79);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (338,3,8.4);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (339,4,12.79);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (340,5,8.4);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (341,1,11.07);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (342,2,16.17);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (343,3,16.42);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (344,4,16.17);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (345,5,16.42);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (346,1,9.11);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (347,2,16.54);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (348,3,15.81);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (349,4,16.54);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (350,5,15.81);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (351,1,9.23);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (352,2,12.93);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (353,3,3.76);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (354,4,12.93);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (355,5,3.76);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (356,1,9.55);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (357,2,9.23);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (358,3,7.17);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (359,4,9.23);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (360,5,7.17);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (361,1,11.17);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (362,2,18.93);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (363,3,12.78);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (364,4,18.93);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (365,5,12.78);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (366,1,9.84);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (367,2,14.94);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (368,3,13.57);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (369,4,14.94);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (370,5,13.57);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (371,1,11);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (372,2,0.21);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (373,3,16.99);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (374,4,0.21);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (375,5,16.99);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (376,1,10.01);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (377,2,12.13);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (378,3,0.72);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (379,4,12.13);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (380,5,0.72);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (381,1,10.12);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (382,2,16.18);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (383,3,5.64);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (384,4,16.18);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (385,5,5.64);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (386,1,9.24);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (387,2,12.78);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (388,3,16.16);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (389,4,12.78);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (390,5,16.16);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (391,1,11.32);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (392,2,12.29);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (393,3,9.98);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (394,4,12.29);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (395,5,9.98);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (396,1,9.55);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (397,2,10.85);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (398,3,-1.45);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (399,4,10.85);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (400,5,-1.45);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (401,1,10.37);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (402,2,16.72);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (403,4,16.72);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (404,5,13.97);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (405,1,9.49);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (406,2,13.36);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (407,4,13.36);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (408,5,13.37);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (409,1,8.99);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (410,2,6.99);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (411,4,6.99);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (412,5,3.39);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (413,1,9.66);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (414,2,15.18);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (415,4,15.18);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (416,5,9.12);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (417,1,10.78);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (418,2,10.86);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (419,4,10.86);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (420,5,-2.9);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (421,1,11.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (422,2,13.78);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (423,4,13.78);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (424,5,10.52);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (425,1,9.71);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (426,2,8.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (427,4,8.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (428,5,15.04);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (429,1,9.86);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (430,2,6.82);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (431,4,6.82);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (432,5,7.24);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (433,1,10.42);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (434,2,6.75);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (435,4,6.75);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (436,5,13.87);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (437,1,9.57);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (438,2,10.13);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (439,4,10.13);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (440,5,11.42);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (441,1,8.92);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (442,2,17.08);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (443,4,17.08);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (444,5,12.79);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (445,1,10.8);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (446,2,14.56);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (447,4,14.56);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (448,5,17.91);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (449,1,10.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (450,2,18.52);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (451,4,18.52);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (452,5,12.5);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (453,1,8.64);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (454,2,11.66);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (455,4,11.66);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (456,5,7.41);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (457,1,11.06);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (458,2,18.01);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (459,4,18.01);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (460,5,21.19);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (461,1,8.65);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (462,2,13.39);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (463,4,13.39);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (464,5,9.69);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (465,1,10.5);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (466,2,14.9);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (467,4,14.9);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (468,5,6.79);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (469,1,8.3);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (470,2,20.97);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (471,4,20.97);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (472,5,15.16);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (473,1,7.87);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (474,2,11);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (475,4,11);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (476,5,3.19);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (477,1,9.5);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (478,2,3.85);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (479,4,3.85);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (480,5,15.05);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (481,1,9.54);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (482,2,4.18);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (483,4,4.18);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (484,5,13.83);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (485,1,11.24);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (486,2,15.34);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (487,4,15.34);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (488,5,7.2);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (489,1,8.96);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (490,2,12.6);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (491,4,12.6);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (492,5,7);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (493,1,9.5);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (494,2,18.48);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (495,4,18.48);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (496,5,8);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (497,1,9.51);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (498,2,17.22);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (499,4,17.22);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (500,5,9);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (501,1,9.29);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (502,2,15.53);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (503,4,15.53);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (504,1,9.63);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (505,2,10.44);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (506,4,10.44);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (507,1,9.09);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (508,2,10.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (509,4,10.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (510,1,10.36);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (511,2,5.24);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (512,4,5.24);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (513,1,9.21);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (514,2,18.02);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (515,4,18.02);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (516,1,10.46);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (517,2,6.82);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (518,4,6.82);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (519,1,9.09);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (520,2,9.07);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (521,4,9.07);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (522,1,9.68);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (523,2,12.86);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (524,4,12.86);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (525,1,10.51);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (526,2,10.73);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (527,4,10.73);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (528,1,10.78);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (529,2,17.69);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (530,4,17.69);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (531,1,10.27);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (532,2,12.12);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (533,4,12.12);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (534,1,10.61);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (535,2,12.21);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (536,4,12.21);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (537,1,9.59);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (538,2,5.66);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (539,4,5.66);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (540,1,9.61);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (541,2,9.3);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (542,4,9.3);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (543,1,10.6);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (544,2,13.49);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (545,4,13.49);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (546,1,10.2);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (547,2,13.67);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (548,4,13.67);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (549,1,9.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (550,2,9.06);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (551,4,9.06);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (552,1,8.47);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (553,2,16.6);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (554,4,16.6);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (555,1,10.71);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (556,2,14.83);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (557,4,14.83);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (558,1,7.98);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (559,2,12.6);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (560,4,12.6);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (561,1,11.25);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (562,2,15.25);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (563,4,15.25);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (564,1,8.19);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (565,2,9.22);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (566,4,9.22);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (567,1,9.97);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (568,2,12.11);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (569,4,12.11);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (570,1,9.86);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (571,2,7.43);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (572,4,7.43);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (573,1,12.07);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (574,2,12.19);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (575,4,12.19);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (576,1,11.09);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (577,2,16.49);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (578,4,16.49);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (579,1,10.53);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (580,2,9.41);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (581,4,9.41);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (582,1,9.74);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (583,2,10.49);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (584,4,10.49);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (585,1,10.92);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (586,2,18.6);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (587,4,18.6);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (588,1,8.65);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (589,2,16.65);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (590,4,16.65);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (591,1,9.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (592,2,11.17);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (593,4,11.17);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (594,1,11.2);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (595,2,14.49);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (596,4,14.49);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (597,1,8.6);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (598,2,16.34);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (599,4,16.34);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (600,1,12.55);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (601,2,10.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (602,4,10.31);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (603,1,11.95);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (604,2,11.37);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (605,4,11.37);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (606,1,10.9);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (607,1,10.97);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (608,1,9.26);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (609,1,10.32);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (610,1,8.74);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (611,1,11.06);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (612,1,8.99);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (613,1,9.74);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (614,1,9.59);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (615,1,10.55);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (616,1,10.95);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (617,1,10.8);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (618,1,9.69);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (619,1,11.75);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (620,1,10);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (621,1,9.14);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (622,1,10.06);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (623,1,9.69);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (624,1,10.11);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (625,1,11.15);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (626,1,10.73);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (627,1,10.6);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (628,1,10.33);
    insert into eba_demo_chart_sample_data (ID,SAMPLE_ID,RESPONSE) values (629,1,9.63);    

end;
/
show errors

begin
eba_demo_chart_data;
commit;
end;
/

-----------------------------------------------------------
create or replace trigger biu_eba_demo_chart_proj 
   before insert or update on eba_demo_chart_projects
   for each row 
begin  
   if :new."ID" is null then
     select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
   end if;
   if inserting then
       :new.created := current_timestamp;
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting or updating then
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting then
       :new.row_version_number := 1;
   elsif updating then
       :new.row_version_number := nvl(:old.row_version_number,1) + 1;
   end if;
end;
/
    
alter trigger biu_eba_demo_chart_proj enable
/
    
create or replace trigger biu_eba_demo_chart_tasks
   before insert or update on eba_demo_chart_tasks
   for each row
begin  
   if :new."ID" is null then
     select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
   end if;
   if inserting then
       :new.created := current_timestamp;
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting or updating then
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting then
       :new.row_version_number := 1;
   elsif updating then
       :new.row_version_number := nvl(:old.row_version_number,1) + 1;
   end if;
end;
/
    
alter trigger biu_eba_demo_chart_tasks enable
/

create or replace trigger biu_eba_demo_chart_stocks
   before insert or update on eba_demo_chart_stocks
   for each row
begin  
   if :new."ID" is null then
     select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
   end if;
   if inserting then
       :new.created := current_timestamp;
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting or updating then
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting then
       :new.row_version_number := 1;
   elsif updating then
       :new.row_version_number := nvl(:old.row_version_number,1) + 1;
   end if;
end;
/
    
alter trigger biu_eba_demo_chart_stocks enable
/
    

create or replace trigger biu_eba_demo_chart_pop
   before insert or update on eba_demo_chart_population
   for each row
begin  
   if :new."ID" is null then
     select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
   end if;
   if inserting then
       :new.created := current_timestamp;
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting or updating then
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting then
       :new.row_version_number := 1;
   elsif updating then
       :new.row_version_number := nvl(:old.row_version_number,1) + 1;
   end if;
end;
/
    
alter trigger biu_eba_demo_chart_pop enable
/    


create or replace trigger biu_eba_demo_chart_bball
   before insert or update on eba_demo_chart_bball
   for each row
begin  
   if :new."ID" is null then
     select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
   end if;
   if inserting then
       :new.created := current_timestamp;
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting or updating then
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
end;
/
    
alter trigger biu_eba_demo_chart_bball enable
/

create or replace trigger biu_eba_demo_chart_products
   before insert or update on eba_demo_chart_products
   for each row
begin  
   if :new."PRODUCT_ID" is null then
     select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.product_id from dual;
   end if;
   if inserting then
       :new.created := current_timestamp;
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting or updating then
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
end;
/
    
alter trigger biu_eba_demo_chart_products enable
/

create or replace trigger biu_eba_demo_chart_orders
   before insert or update on eba_demo_chart_orders
   for each row
begin  
   if :new."ORDER_ID" is null then
     select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.order_id from dual;
   end if;
   if inserting then
       :new.created := current_timestamp;
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting or updating then
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
end;
/
    
alter trigger biu_eba_demo_chart_orders enable
/

create or replace trigger biu_eba_demo_chart_stats
   before insert or update on eba_demo_chart_stats
   for each row
begin  
   if :new."ID" is null then
     select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
   end if;
   if inserting then
       :new.created := current_timestamp;
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting or updating then
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
end;
/
    
alter trigger biu_eba_demo_chart_stats enable
/

create or replace trigger biu_eba_demo_chart_sample_data 
   before insert or update on eba_demo_chart_sample_data
   for each row 
begin  
   if :new."ID" is null then
     select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
   end if;
   if inserting then
       :new.created := current_timestamp;
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
   if inserting or updating then
       :new.updated := current_timestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
end;
/
    
alter trigger biu_eba_demo_chart_sample_data enable
/


---------------------------------------------
REM eba_demo_chart_projects
create table  eba_demo_chart_projects (
    id                   number         not null
                                        constraint eba_demo_charts_proj_pk
                                        primary key,
    project              varchar2(30)   not null,
    row_version_number   number,
    created              timestamp(6) with time zone,
    created_by           varchar2(255),
    updated              timestamp(6) with time zone,
    updated_by           varchar2(255)
   )
/

REM eba_demo_chart_tasks    
create table  eba_demo_chart_tasks (
    id                       number         not null
                                            constraint eba_demo_chart_tasks_pk
                                            primary key,
    project                  number         constraint eba_demo_chart_tasks_fk
                                            references eba_demo_chart_projects on delete cascade,
    parent_task              number,
    task_name                varchar2(255),
    row_version_number       number,
    start_date               date,
    end_date                 date,
    status                   varchar2(30),
    assigned_to              varchar2(30),
    cost                     number,
    budget                   number,
    created                  timestamp(6) with time zone,
    created_by               varchar2(255),
    updated                  timestamp(6) with time zone,
    updated_by               varchar2(255)
   )
/

create index eba_demo_chart_tasks_idx1 on eba_demo_chart_tasks (project)
/
    
REM eba_demo_chart_stocks    
create table eba_demo_chart_stocks (
    id                     number       not null
                                        constraint eba_demo_chart_stocks_pk
                                        primary key,
    row_version_number     number,
    stock_code             varchar2(4),
    stock_name             varchar2(130),
    pricing_date           date,
    pricing_timestamp      timestamp(6),
    pricing_timestamp_tz   timestamp(6) with time zone,
    opening_val            number,
    high                   number,
    low                    number,
    closing_val            number,
    volume                 number,
    created                timestamp(6) with time zone,
    created_by             varchar2(255),
    updated                timestamp(6) with time zone,
    updated_by             varchar2(255)    
   )
/
    
REM eba_demo_chart_population    
create table eba_demo_chart_population (
    id                  number          not null
                                        constraint eba_demo_chart_pop_pk
                                        primary key,
    row_version_number  number,
    state_name          varchar2(100),
    state_code          varchar2(2),
    population          number,
    region              number,
    created             timestamp(6) with time zone,
    created_by          varchar2(255),
    updated             timestamp(6) with time zone,
    updated_by          varchar2(255)    
   )
/

REM eba_demo_chart_dept
create table eba_demo_chart_dept (
    deptno  NUMBER(2,0) not null
                        constraint eba_demo_chart_dept_pk
                        primary key, 
    dname   VARCHAR2(14 BYTE), 
    loc     VARCHAR2(13 BYTE)
)
/
REM eba_demo_chart_emp
create table eba_demo_chart_emp (
    empno     NUMBER(4,0) not null
                          constraint eba_demo_chart_emp_pk
                          primary key, 
    ename     VARCHAR2(10 BYTE), 
    job       VARCHAR2(9 BYTE), 
    mgr       NUMBER(4,0), 
    hiredate  DATE, 
    sal       NUMBER(7,2), 
    comm      NUMBER(7,2), 
    deptno    NUMBER(2,0)
)
/

alter table eba_demo_chart_emp add foreign key (MGR) references eba_demo_chart_emp (EMPNO) ENABLE
/

create index eba_demo_chart_emp_1 ON eba_demo_chart_emp (MGR)
/
    
create index eba_demo_chart_emp_2 ON eba_demo_chart_emp (DEPTNO)
/

REM eba_demo_chart_bball
create table eba_demo_chart_bball (
    id                  number          not null
                                        constraint eba_demo_chart_bball_pk
                                        primary key,
    city                varchar2(20),
    team                varchar2(30), 
    conference          varchar2(5), 
    wins                number,
    created             timestamp(6) with time zone,
    created_by          varchar2(255),
    updated             timestamp(6) with time zone,
    updated_by          varchar2(255)
   )
/

create index eba_demo_chart_bball_1 ON eba_demo_chart_bball (WINS)
/

Rem eba_demo_chart_products
create table eba_demo_chart_products (  
    product_id            number       not null
                                       constraint eba_demo_chart_prod_pk
                                       primary key,
    product_name          varchar2(50),
    product_description   varchar2(2000),
    list_price            number(8,2),
    created               timestamp(6) with time zone,
    created_by            varchar2(255),
    updated               timestamp(6) with time zone,
    updated_by            varchar2(255)
   )
/

create index eba_demo_chart_prod_1 ON eba_demo_chart_products (list_price)
/

create table eba_demo_chart_orders (  
    order_id            number          not null
                                        constraint eba_demo_chart_order_pk
                                        primary key,
    product_id          number          constraint eba_demo_chart_order_fk
                                        references eba_demo_chart_products on delete cascade,
    quantity            number(8,0),
    customer            varchar2(30),
    sales_date          date,
    created             timestamp(6) with time zone,
    created_by          varchar2(255),
    updated             timestamp(6) with time zone,
    updated_by          varchar2(255)
   )
/

create index eba_demo_chart_ord_1 ON eba_demo_chart_orders (quantity)
/

create index eba_demo_chart_ord_2 ON eba_demo_chart_orders (product_id)
/

create table eba_demo_chart_stats (
    id                  number         not null
                                       constraint eba_demo_chart_stats_pk
                                       primary key,
    name                varchar2(2),
    country             varchar2(30),
    employee            number,
    employer            number,
    total               number,
    created             timestamp(6) with time zone,
    created_by          varchar2(255),
    updated             timestamp(6) with time zone,
    updated_by          varchar2(255)
   )
/

create index eba_demo_chart_stats_1 ON eba_demo_chart_stats (employee)
/

create index eba_demo_chart_stats_2 ON eba_demo_chart_stats (employer)
/

create index eba_demo_chart_stats_3 ON eba_demo_chart_stats (total)
/

REM eba_demo_chart_grades
create table eba_demo_chart_grades (
    id      number,
    course  varchar2(10),
    schoola number,
	schoolb number not null enable,
	schoolc number,
    created                  timestamp(6) with time zone,
    created_by               varchar2(255),
    updated                  timestamp(6) with time zone,
    updated_by               varchar2(255)
   )
/

REM eba_demo_chart_samples
create table eba_demo_chart_samples (
    sample1      number,
    sample2      number,
    sample3      number,
    sample4      number,
    sample5      number
   )
/

REM eba_demo_chart_sample_names
create table eba_demo_chart_sample_names (
    id            number not null 
                  constraint eba_demo_samples_pk 
                  primary key,
    sample_name   varchar2(30) not null enable,
    sample_date   date,
    created       timestamp(6) with time zone,
    created_by    varchar2(255),
    updated       timestamp(6) with time zone,
    updated_by    varchar2(255)
   )
/

REM eba_demo_chart_sample_data
create table eba_demo_chart_sample_data (
    id            number not null 
                  constraint eba_demo_sample_data_pk 
                  primary key,
    sample_id     number constraint eba_demo_sample_fk
                  references eba_demo_chart_sample_names on delete cascade,
    response      number,
    created       timestamp(6) with time zone,
    created_by    varchar2(255),
    updated       timestamp(6) with time zone,
    updated_by    varchar2(255)
   )
/

create index eba_demo_chart_sample_idx1 on eba_demo_chart_sample_data (sample_id)
/

-------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';