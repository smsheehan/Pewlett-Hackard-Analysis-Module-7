# Pewlett-Hackard-Analysis-Module-7

## Overview of the analysis: 
The purpose of this analysis is to help understand the demographics of Pewlett-Hackard employees who are near retirement.  Specifically, we were asked to provide a breakdown of how many individuals are in the retirement zone (born between 1952 and 1955) by their current job titles.  This required combining information from two separate csv files, filtering by birth date range and since many individuals held several titles over the course of their career, we needed to list these individuals by their most recent job title.  In response to the large number of near term retirees, a second aspect of the analysis involved the identification of employees who are eligible to participate in a newly proposed mentorship program.  Eligibility for this program was defined as people who were born in 1965.

## Results: 
Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.

- There are 90,398 people who are nearing retirement as defined by those people who were born between 1952 and 1955.  We already know from the Employees table that Pewlett-Hackard has 300,024 employees so this represents 30% of PH's workforce.  The number of people nearing retirement was determined by first creating a query that joined the Employees and titles tables, filtering them by the desired date range and creating a new table called retirement_titles. I then used the DISTINCT ON() function to retrieve only the most recent title for employees that had more than one title throughout their career.  This was performed on the retirement_titles table and created a new table called unique_titles which contained emp_no, first_name, last_name, and title.  The code for both of those queries is shown below:
  ![image](https://user-images.githubusercontent.com/90977689/140315685-7c25c42e-12fa-4d24-ba6a-d6f5e6c813ea.png)

The header of the resultant table is shown below:

![image](https://user-images.githubusercontent.com/90977689/140316455-fe0a392b-495b-42f2-bf11-76ab7b542dcb.png)

- Senior Engineer and Senior Staff are the two titles with the highest number of near-retiring people. This was determined by querying the unique_titles table and using the COUNT() function on employees and then grouping by titles and ordering by count in descending order.  This was put into a new table called retiring_titles.  The code and resultant table are shown below:
   ![image](https://user-images.githubusercontent.com/90977689/140317703-f5567130-e8ef-4a6f-bc49-5eb1606c20fb.png)

  ![image](https://user-images.githubusercontent.com/90977689/140317843-6aecd362-000c-4b54-abcd-bfef80bde5b0.png)

- Based on the two tables created above, we can determine that many employees in this age group have not changed jobs over the course of their career.  Since the retirement_titles table captures all of the titles and the retiring_titles captures only the latest titles, simple division of the total counts reveals that in this age range employees have an average of 1.48 job titles.  Or in other words, more than half of this population has never had a promotion or job change.

- There are 1,549 people eligible for the proposed mentoring program.  The requirement for eligibility for the program is that the individual was born in the year 1965.  To obtain this information, I joined information from the Employees, dept_emp, and titles tables using the DISTINCT ON() function on emp_no in the Employees table.  This was filtered by birth date and dept_emp.to_date (to capture only active employees).  This was then ordered by emp_no.  A new table called mentorship_eligibility was created.  The query used and header of the resultant table is shown below.  I have a couple of issues with this deliverable of the challenge assignment.  First, with the data sets we were given, there is no need to use distinct on even though we were asked to use this function.  I appreciate that the assignments asks us to use distinct on for the titles table because there are people who have held multiple titles.  HOWEVER, in our tables the earlier title has a distinct to_date and this already gets filtered out through the filtering using the WHERE function on to_date as 9999-01-01.  Second, why would you even want to show people by their first instance which by the assignment's logic would show their outdated title?  For example,  in the challenge image that we are suppposed to match to, employee number 12155, Keiichero Gilnert, is shown as having the title of engineer and a to_date of 9999-01-01.  In my titles table (which was provided to us through the module), Keiichero's to_date for his/her/their assignment as engineer has a to_date of 2001-09-16.  Keichero's current role is in fact senior engineer with a to_date of 9999-01-01.  Thus the output of my table is a little different than the image in the module assignment, but mine is more relevant because it shows the current job title for each person.

![image](https://user-images.githubusercontent.com/90977689/140320792-739d2ebc-c3ae-4d52-a750-f0d643b9038c.png)

![image](https://user-images.githubusercontent.com/90977689/140320989-ff9a7c76-bb0f-4122-aa7f-a409edd66465.png)


## Summary:

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?  If you assume that PH is working at 100% efficiency, then in theory you would need to replace 90,938 positions over the next 5 years.
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?  As eligibility is currently defined, no there are not enough people eligible for this program.  This being said, the eligibility criteria don't make sense.  Why have the managers picked an arbitrary birth year of 1965 as the criteria for people to be eligible for this program, especially when the retiring demographic is birth years 1951-1955?  Wouldn't you rather select people born in 1955 to play this role? Or if you want to stay out of the near retiring population all together, wouldn't you select people born between 1956-1960 as potentially eligible?

### Additional analyses:
- Getting just the absolute number of employees retiring from each department doesn't highlight the true impact on each area.  I believe showing it as a percentage of the current workforce in each department is more meaningful. The table for this is shown below.  As you can see, Senior Engineer is going to be hit the hardest with 97% of that department walking out the door in the next 5 years.  Next, the areas of Senior Staff, Staff, and Technique Leader are losing 30, 29, and 29 percent respectively.

![image](https://user-images.githubusercontent.com/90977689/140366573-170286da-ceca-475c-a179-427346ae8b00.png)

This table was created using the following code:

![image](https://user-images.githubusercontent.com/90977689/140368409-a06082af-2993-4477-b7ad-60845ffedef1.png)





- Additionally, we could glean a little more information from the pool of employees eligible for the mentorship program.  Specifically, it would be nice to know how this list of people breaks down into the different departments.  The table is shown below.  As can be seen, only 397 of the eligible population currently hold the title of Senior Engineer.  


![image](https://user-images.githubusercontent.com/90977689/140402128-46e54d67-0b95-45ac-97c3-f992c048a4af.png)

The code for this is shown below:

![image](https://user-images.githubusercontent.com/90977689/140402310-e4a14864-747c-415a-915b-d7af0db05c97.png)




