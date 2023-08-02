# Data Engineering Project 

In this project, I was tasked with building a new database for a Real Estate Company called MyHomes. I was provided with information about what the company does and the different information that they would like to be included in the database along with how the different information areas relate to each other. 

_MyHomes is a real estate company operating globally, their main area of business lies in 
buying and selling properties._

_The properties that the company deals in are of five types: houses, flats/apartments, 
bungalows, land, and commercial property. These properties may be subject to health and 
safety regulations, which govern how these properties must be build and maintained._

_Each property that MyHomes deals in is the main responsibility of one of the company’s 
area sales representatives. Each representative, however, may be responsible for a 
number of different properties. A number of the area sales representatives act as 
supervisors. Supervisors are directly responsible for managing teams of fellow area sales 
representatives. An area sales representative may also be responsible for dealing with a 
number of MyHomes’s customers. Each of the company’s customers will only deal with 
MyHomes through one particular sales representative. Each sales representative also 
covers one or more geographical sales areas, for eliciting new business from prospective 
customers. A number of different sales representatives may cover the same geographical 
area, but there will always be a single sales representative who acts as the chief
salesperson for that area, and who is directly responsible to management for sales 
performance in that area, in terms of hitting sales targets._

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
  > primary key: area_id

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
- SQL Data Engineer Assessment (Module 2) includes the different Entities, Attributes and Datatypes. Also, the database diagram is in the pdf and all the SQL script along with the outputs. For some questions, there are a few ways of answering the questions and I'm not sure which is the most optimised solution.

- data_engineering_assessment.sql includes all the SQL script.




