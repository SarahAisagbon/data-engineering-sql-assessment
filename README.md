# Data Engineering Project 

In this project, I was tasked with building a new database for a Real Estate Company called MyHomes. I was provided with information about what the company does and the different information that they would like to be included in the database along with how the different information areas relate to each other. 

## Part 1

This part of the project was focused on producing a Conceptual, Logical and Physical design for the database, and then writing a SQL script to create the tables. I used db diagrams to create my database design and this is what it looked like:

![image](https://github.com/kpashindla25/data-engineering-sql-SarahAisagbon/assets/114437040/4c78b2e3-c0da-4df7-9cd1-80910f847ffe)

I decided to have 5 tables:
1. Employees
  > primary key: emp_no
3. Supervisors
  > primary key: super_id
5. Customers
  > primary key: customer id
6. Properties
  > primary key: property_id
7. Areas
  > primary key:area_id

I had two bridge tables:
1. emp_areas
2. property_reg

Also, I had one lookup table:
1. Regulations
  > primary key: reg_id

## Part 2

This part of the project was focused on seeing if the database worked and met the relationship requirements.

Firstly, I filled the tables with sample data and then I answered two questions. 

1) Display names of representatives, details of the properties they represent, and 
names of their supervisors.
2) Display details of customers together with details of their areas and names of the 
managers of their areas.

Because I finished early I decided to write some more questions to test out the database further. 3) - 8) in data_engineering_assessment.sql.


## Content 

SQL Data Engineer Assessment (Module 2) includes the different Entities, Attributes and Datatypes. Also, the database diagram is in the pdf and all the SQL script along with the outputs. For some questions, there are a few ways of answering the questions and I'm not sure which is the most optimised solution.

data_engineering_assessment.sql includes all the SQL script.




