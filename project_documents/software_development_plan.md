# 4.0 Software Development Plan

## 4.1 Plan Introduction
CrookBook is a web application that is meant to help LAPD detectives a better
opportunity to find criminals. It is meant to be a search engine for all of
LAPD's case files along with them having the ability to add or edit a case.
Within the application, it adopts a Google-like search style. Users will be able
to search for cases based on keywords or even use an advanced search, too. The
user will be able to perform sub-searches from the previous search as well.
Every entry will have a unique details page in which all users can view.
Only authorized users will be able to add entries into the database. Throughout
the process of development, each project member will be required to be familiar
with the database (i.e., Postgres) for storing and retrieving data about case
files. Web development calls upon our skills in Python and Django for backend
purposes, and HTML, CSS and JavaScript for the user interface.

With the implementation of Postgres, the team should accomplish the following
tasks by the following date:
- Reading documentation (10/13)
- Post-request (10/16)
- Get-request (10/16)
- Adding a new case (Overlaps with frontend. Keep this?)
- Editing a pre-existing case (Same as adding. Keep this?)

Developing the user interface should be accomplished by the following deadlines:
- Hub Page (10/08)
- Adding a new case file (10/20)
- Editing a pre-existing case file (10/23)
- Basic case file search (11/03)
- Advanced case file search (11/15)
- Red Robin Review (11/16)

Testing the product should be accomplished by the following date:
- Beta Testing (12/13)
- MVP User Interface (12/13)

### 4.1.1 Project Deliverables
The following items are to be delivered to the client:
- Project Proposal Document (9/20)
    - This document will introduce our project, provide a brief description and justification for it.
- Requirements Specification (9/27)
    - This document will list and outline in detail all functional and performance requirements that will be implemented in our project.
- Software Development Plan (10/11)
    - This document will define the objectives, processes and resources that will be used throughout the semester to produce all the required software and documents.
- Software Design Description (11/15)
    - This document will explain in specific detail all attributes and functionality of the software that is being developed.
- Test and Integration Plan (11/29)
    - This document will outline the deployment process that will be used to create the required system and also provide an overview of the testing strategies used to ensure correct functionality.
- User's Manual (12/6)
    - This document will clearly explain how to install and operate our final product.
- Software Development File (12/13)
    - This binder will contain all the previous stated deliverables, as well as written reports, lessons learned, additional notes and the source code for our final product.
## 4.2 Project Resources

### 4.2.1 Hardware Resources
| Operating System | CPU Name      | # of CPU Cores | Amount of Ram | Purpose            |
|:----------------:|-------------- |----------------|---------------|--------------------|
| OSX              | Intel Core i5 | 4 Cores        | 4 GB          | Development/Testing|

### 4.2.2 Software Resources
| Layer      | Software Used             |
|:-----------|---------------------------|
| Front-End  | Bootstrap, jQuery         |
| Back-End   | Django, Node.js, Postgres |
| Development| Atom, Git, Slack          |
## 4.3 Project Organization

## 4.4 Project Schedule

### 4.4.1 PERT/GANTT Chart
![GAANT Chart](./images/CrookBookGaant.png)
### 4.4.2 Task/Resource Table
| Task                             | People                               | Software Needed                      | Hardware Needed    |
|----------------------------------|--------------------------------------|--------------------------------------|--------------------|
| Database Design                  | Anthony, Evan, Max, Nick, Alex, Rony | Draw.io, PostgreSQL, Django          | Dell XPS 13 or Mac |
| Add new entry (FE/BE)            | Anthony, Rony                        | Django, HTML, CSS, Bootstrap, Chrome | Dell XPS 13 or Mac |
| View/Edit Existing Entry (FE/BE) | Evan, Max                            | Django, HTML, CSS, Bootstrap, Chrome | Dell XPS 13 or Mac |
| List all entries (FE/BE)         | Nick, Anthony                        | Django, HTML, CSS, Bootstrap, Chrome | Dell XPS 13 or Mac |
| Design Front End Style           | Nick, Evan                           | Django, HTML, CSS, Bootstrap, Chrome | Dell XPS 13 or Mac |
| Deployment                       | Max                                  | UWSGI, Nginx, PostgreSQL, Django     | Dell XPS 13 or Mac |

### 4.4.3 Class Schedule (Optional..per BJ's website for now)
