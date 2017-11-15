# 6.0 Software Design Description Document

## 6.1 Introduction
This document presents the architecture and detailed design for the software for
the CrookBook project. The project acts as a database for the LAPD's murder cases,
for which they require a tailored system to access their case files. CrookBook
functions like a search engine, adopting a Google-like search style in which
its users will be able to search for cases based on keywords. There is also an
advanced search functionality, allowing the users to dictate the specific attributes
they wish to search for a case. Based off a previous search, users will also be
able to perform sub-searches from the data to further narrow down the search or
find related cases. Each entry in the database will have its own unique details
page which all users can view. However, only authorized users (dictated by the
LAPD themselves) will be able to add entries into the database. CrookBook uses
Postgres for storing and retrieving data about case files as well as Python and Django for the backend part of the project, and HTML, CSS and JavaScript are used for frontend purposes.

### 6.1.1 System Objectives
An obvious goal and focus of the CrookBook project is to act as a learning
experience for all members of the team. The project calls on skills in both
front and backend aspects of development and CrookBook acts as a way for the team
members to learn skills in both of these aspects. CrookBook also acts as a unique
opportunity to gain some experience in freelance work, as members of the team are
coordinating with the LAPD in order to produce a presentable and usable product.

The objective of CrookBook as an application is to provide a simple and tailored interface for a small section of LAPD detectives. These detectives require a database system that can speed up and simplify their search for their cold-case murder cases and murder books (case binders). CrookBook will allow detectives easy access to relevant information on their cases based off of their search. Should the detectives wish to access more information on a particular case within the database, they can also view entries to provide all the information the database has on that particular entry. The keywords that can be searched are Master DR, Victims, Suspects and Date Occurred.

### 6.1.2 Hardware, Software, and Human Interfaces
- 6.1.2.1 **Human Interface: Mouse and Keyboard**
  - Users will use a physical mouse and keyboard to navigate their way through CrookBook's interface. The mouse and keyboard act as they would for any other web application, being able to click and type on specified fields.
- 6.1.2.2 **Human Interface: Touch**
  - Users that are accessing the CrookBook application on modern smartphones will be able to use the application like they would on a personal computer, except that the phones are touch based rather than mouse and keyboard based.
- 6.1.2.3 **Human Interface: Monitor**
  - Users will need a typical modern day computer monitor in order to view CrookBook's interface. If the user is using a tower computer, then they will need a monitor that is able to display given that computer's output capabilities (i.e. VGA or HDMI). If the user has a laptop then it should already be equipped with an adequate monitor. CrookBook's interface can also be used on mobile so any modern smartphone display will be adequate.
- 6.1.2.4 **Software Interface: GUI**
  - Users will interact with CrookBook's Graphic User Interface. The user interface includes things like buttons, drop down menus and text fields that users can interact with. Buttons lead users to separate pages within the application to access a particular keyword or action such as, settings or login menus. Drop down menus are used to give the users a selection of options to choose from which then act like buttons that lead the user to new pages. By using drop down menus, a user wont need to know how the application works to successfully use it. Additionally, text fields will allow the user to specify which pages they are looking for within the application using their own search.
- 6.1.2.5 **Software Interface: Database**
  - The database holds all the data from the LAPD murder books. The Case, District, Event, Person, and Binder database models are used to store the data in a non-redundant and easily accessable manner. The user interface interacts with the database in order to give the user the proper information they are searching for.
- 6.1.2.6 **Software Interface: Server**
  - The NGINX web server will relay responses between front-end users and the backend of the CrookBook web application and the information stored within the database.
- 6.1.2.7 **Hardware Interface: Wireless/Wired Networking**
  - Since CrookBook is a web based application, a wired or wireless connection will be needed in order to access the application.

#### Interface Home Page
![Interface Home Page](https://github.com/evanhessler/CrookBook/blob/master/project_documents/images/home_page.png)

## 6.2 Architectural Design
CrookBook implements a well designed Model-View-Controller architecture. LAPD detectives will interact with CrookBook's user interface which is being created using CSS, HTML and JavaScript. The user interface will access the database and its models once the user makes a request for a search. From here, the database will access the relevant information using Postgres and Django. The database will then send this information back to controllers and onto the user's view to be displayed on the user interface. Users can then choose to do a new search or another search based on their current search.

### 6.2.1 Major Software Components

We have three major software components in our system:

#### Cases Database
Our CrookBook database will track all information related to the murder cases, binders, suspects, victims, etc. It will be developed in PostgreSQL and should allow detectives to perform all the basic CRUD (Create, Read, Update, and Delete) operations on the database. To follow up with database design, it will also implement the standard rules of having ACID: the four characteristics being Atomicity, Consistency, Isolation, and Durability.

#### GUI Web Interface
The GUI web interface is what the detectives will use to perform the CRUD operations on the CrookBook database. Through a system of forms and tables detectives will be able to easily extract and edit the information they need from the database.
- **Home Page**
  - CrookBook offers a basic search for detectives to work quick and on the go. Here, they can search for cases by Master DR, DR Number, Victim name, Suspect name, and by date.
- **Advanced Search**
  - CrookBook also allows for a more tailored and descriptive search. Here, they can fill out a form consisting of case related fields.
- **Add Cases**
  - CrookBook allows detectives to add a new case into the database. Like the advanced search, they will be filling out a form consisting of case related fields.
- **Detailed Case Page**
  - CrookBook has a unique view page for every case. Here, a case file's data is presented in an elegant and clear way for LAPD personnel to see.

#### API Endpoints
The web API endpoints will serve as entry-points into the crookbook application for additional tools and automated scripts. Each endpoint will use a token based authentication scheme, and require a user's unique token which can also be obtained through the an API endpoint.
- **Get Token**
  - Will return the user's api token when a valid username and password are provided.
- **Get/Create All Entities**
  - There will be one of these endpoints for each database model. After authenticating the provided API token, a GET request will return all entities for the given model, and a POST will create a new entitiy for the model provided all fields are valid.
- **Get/Edit/Delete an Existing Entity**
  - Again, there will be one of these endpoints for each database model. After authenticating the provided API token and primary key, a GET request will return a specific entity, a PUT request will edit an existing entitiy if the provided fields are valid, and a DELETE request will delete a specific entity.  

### 6.2.2 Major Software Interactions
CrookBook is built on two main software engines: Django and Postgres. We developed CrookBook using Django to easily develop under a Model-View-Controller framework. With Django we are able to implement our URLs and determine what type of data should be captured and evaluated in our backend to provide the appropriate response. Django also has built-in models and administrative capabilities so we can easily design and maintain our database. Our web application interacts with our Postgres database by allowing users with certain permissions to add, delete or edit case entries. We provide these users with categorical forms to make inputting new data more straightforward. All users have read permissions so that they can search for a case and read details about that record.

### 6.2.3 Architectural Design Diagrams
#### ERD
![ERD](https://github.com/evanhessler/CrookBook/blob/master/project_documents/images/ERD.png)

#### Top-level Class Diagram
![Architectural Diagrams](https://github.com/evanhessler/CrookBook/blob/master/project_documents/images/Architectural-Diagrams.png)

#### UML Use Case Diagram
![UML Use Case](https://github.com/evanhessler/CrookBook/blob/master/project_documents/images/uml_use_case.png)

## 6.3 CSC and CSU Descriptions
This section of the document focuses on Computer Software Components, CSCs, and the Computer Software Units, CSUs, that make up our entire Computer Science Configuration Item, CSCI, CrookBook.  As previously mentioned, CrookBook is built using the Model-View-Controller architecture, therefore all of the CSCs in our project are the Model CSC, View CSC, and Controller CSC.

### 6.3.1 Detailed Class Descriptions
The following section provided descriptions of all the classes, CSUs, used in constructing the CrookBook CSCI.

#### 6.3.1.1 District Model CSU
The District CSU is part of the Model CSC.  The District database table stores information about the LAPD District which responded to and handled a case.  This table has a One-To-Many relationship with the Case SCU.

Attributes: id, bureau, division, reporting_district

#### 6.3.1.2 Case Model CSU
The Case CSU is part of the Model CSC.  The Case database table stores identifying information about each case, the actions that have been taken in solving the case, and has One-To-Many relationships with the Event, Person, and History CSUs.  Additionally, this CSU has a Many-To-Many relationship to the Binder CSU.

Attributes: dr_nbr, date_fully_reviewed, motive, adjudication, evidence_destroyed, status, status_date, court_case_number, notes, solvability_factor, related_cases, district, binders

#### 6.3.1.3 Event Model CSU
The Event CSU is part of the Model CSC.  The Event database table stores information about each event that occurred in a case, this way multiple locations, people, and crimes can be associated with a case.

Attributes: id, date_occurred, date_reported, address, weapon, crime_committed, coroner_case_number, case

#### 6.3.1.4 Person Model CSU
The Person CSU is part of the Model CSC.  The Person database table stores identifying information about each person, victim or suspect, associated with a case, even if information is missing about the person.

Attributes: id, first_name, last_name, age, sex, ethnicity, description, case

#### 6.3.1.5 Binder Model CSU
The Binder CSU is part of the Model CSC.  The Binder database table stores identifying information about each binder, or murder book.

Attributes: master_dr, check_out_date

#### 6.3.1.6 History Model CSU
The History CSU is part of the Model CSC.  The History database table tracks information about any changes made to any information related to the Case to ensure responsibility and reliable information.

Attributes: id, date_edited, date_edited_by, case

#### 6.3.1.7 Homepage View CSU
The Homepage View CSU is part of the Views CSC. The homepage view contains a navigation bar with links to the Advanced Search View CSU and the Create Case View CSU. The homepage also has a table which displays the Master Dr, Victims, Suspsects, and Date Occurred for all entries in the database. Furthermore, there is a basic search bar which allows the user to perform quick searches for selected terms (the columns in the homepage table). Finally, the user has a generate report button which transforms and downloads the table into a PDF file.

Methods: viewAllCases(), basicSearch(term), generateReport()

#### 6.3.1.8 Create Case View CSU
The Create Case View CSU is part of the Views CSC. The Create Case View is charged with adding a new entry to the crookbook database. The Create Case View has tabs for Case Info, Binder Info, District Info, Victims, Suspects, and Crime Info.

Methods: addEntry(request) where request is the Django.forms.form data from the view.

#### 6.3.1.9 Edit Case View CSU
The Edit Case View CSU is part of the Views CSC. The Edit Case View is responsible for changing data for a specific entry in the crookbook database. The Edit Case View has tabs for Case Info, Binder Info, District Info, Victims, Suspects, and Crime Info which will each contain an editable form prepopulated with the case data.

Methods: editEntry(requst, master_dr)

#### 6.3.1.10 Search Cases View CSU
The Edit Case View CSU is part of the Views CSC. The Search Cases View allows for advanced searching of the CrookBook database. The Edit Case View has tabs for Case Info, Binder Info, District Info, Victims, Suspects, and Crime Info. The user will then be redirected to a table with the search result data in a table.

Methods: searchCases(request) where request is the Django.forms.form data from the advanced search view.

#### 6.3.1.11 Homepage Controller CSU
The homepage controller CSU renders the homepage view and also redirects the viewAllCases(), basicSearch(term), and generateReport() functions to the appropriate backend endpoint.

#### 6.3.1.12 Create Case Controller CSU
The create case controller CSU renders the create case view and also redirects the addEntry(request) to the database.

#### 6.3.1.13 Edit Case Controller CSU
The create case controller CSU renders the create case view and also redirects the editEntry(request, master_dr) to the database.

#### 6.3.1.14 Search Cases Controller CSU
The search cases controller CSU renders the search cases view and also redirects the seachCases(request) to the database.

### 6.3.2  Detailed Interface Descriptions

#### 6.3.2.1 District Model CSU
The District Model interfaces with our controller CSC through a POST request from the Create Case View CSU and through a GET request from the Search Cases View CSU, which takes the request (of type Django.forms.Form).

#### 6.3.2.2 Case Model CSU
The Case Model interfaces with our controller CSC through a POST request from the Create Case View CSU and through a GET request from the Search Cases View CSU, which takes the request (of type Django.forms.Form).

#### 6.3.2.3 Event Model CSU
The Event Model interfaces with our controller CSC through a POST request from the Create Case View CSU and through a GET request from the Search Cases View CSU, which takes the request (of type Django.forms.Form).

#### 6.3.2.4 Person Model CSU
The Person Model interfaces with our controller CSC through a POST request from the Create Case View CSU and through a GET request from the Search Cases View CSU, which takes the request (of type Django.forms.Form).

#### 6.3.2.5 Binder Model CSU
The Binder Model interfaces with our controller CSC through a POST request from the Create Case View CSU and through a GET request from the Search Cases View CSU, which takes the request (of type Django.forms.Form).

#### 6.3.2.6 History Model CSU
The History Model interfaces with our controller CSC through a POST request from the Create Case View CSU and through a GET request from the Search Cases View CSU, which takes the request (of type Django.forms.Form).

#### 6.3.2.7 Homepage View CSU
The Homepage View interfaces with our controller CSU through the viewAllCases() function, which sends a GET request to the controller.

#### 6.3.2.8 Create Case View CSU
The Create Case View interfaces with our controller CSU. After a GET request from the Create Case View CSU, the controller CSU sends a Django.forms.form object to the view which will be filled out by the user. The form is then sent back to the controller with a POST request.

#### 6.3.2.9 Edit Case View CSU
The Edit Case View interfaces with our controller CSU. After a GET request from the Create Case View CSU, the controller CSU sends a Django.forms.form object to the view which will be edited by the user. The form is then sent back to the controller with a POST request.

#### 6.3.2.10 Search Cases View CSU
The Search Cases View interfaces with our controller CSU. After a GET request from the Create Case View CSU, the controller CSU sends a Django.forms.form object to the view which will be filled out by the user. The form is then sent back to the controller with a POST request.

#### 6.3.1.11 Homepage Controller CSU
The homepage controller CSU gets a JSON object from the database and sends it to the homepage view.

#### 6.3.1.12 Create Case Controller CSU
The create case controller CSU sends a Django.forms.form object to the view and takes the same object back. It then validates the form and sends it to the database.

#### 6.3.1.13 Edit Case Controller CSU
The edit case controller CSU sends a Django.forms.form object to the view and takes the same object back. It then validates the form and sends it to the database.

#### 6.3.1.14 Search Cases Controller CSU
The create case controller CSU sends a Django.forms.form object to the view and takes the same object back. It then validates the form and sends it to the database.

### 6.3.3  Detailed Data Structure Descriptions
#### 6.3.3.1 District Model CSU
- Division: LAPD division that signifies where the case is being handled. This is an alphabetic string.
- Bureau: LAPD bureau that signifies where the binder should be held. This is an alphabetic string.
- Reporting District: LAPD reporting districts, where as a whole, represent the Division. This is an integer.
#### 6.3.3.2 Case Model CSU
- DR Number: This is the primary key associated with every case. This is an alphanumeric string.
- Court Case Number: Court number for every case. This is an integer.
- Date Fully Reviewed: Date mm/dd/yyyy that signifies when the case was adjudicated. This is a date value.
- Case Adjudication: Overall case adjudication. This is an alphanumeric string.
- Evidence Destroyed: Yes or no value that indicates if evidence is destroyed. This is a character: either 'y' or 'n'.
- Status: Signifies the crime committed for the case. This is a string value.
- Status Date: Date mm/dd/yyyy that signifies when the status for a case was last edited. This is a date value.
- Motive: This is a string that signifies the suspect(s) motive in a case.
- Solvability factor: This is an integer that signifies the magnitude of solvability. The higher it is, the better it is to case completion.
- Notes: String value to enter case notes.
#### 6.3.3.3 Event Model CSU
- Weapon: Weapon used in a case. This is a string value.
- Date Occurred: Date mm/dd/yyyy that signifies when the case happened. This is a date value.
- Date Reported: Date mm/dd/yyyy that signifies when the case was reported. This is a date value.
- Coroner Case Number: This is an integer that signifies a Coroner Case Number.
- Crime Committed: Signifies the crime committed in a case. This is an alphanumeric string.
- Address: Signifies street location of the crime. This is an alphanumeric string.
#### 6.3.3.4 Person Model CSU
- Age: Victim or suspect age. This is an integer.
- Sex: Victim or suspect sex. This is a character: either 'm', 'f'.
- Description: General notes on the victim or suspect. This is an alphanumeric string.
- Ethnicity: Victim or suspect ethnicity. This is an alphabetic string.
- First Name: Victim or suspect first name. This is an alphabetic string.
- Last Name: Victim or suspect last name. This is an alphabetic string.
#### 6.3.3.5 Binder Model CSU
- Master DR: This is a primary key that signifies a case's binder, and the number of cases associated with said binder.
- Check Out Date: Date mm/dd/yyyy that signifies the last check out date. This is a date value.
#### 6.3.3.6 History Model CSU
- Date Edited: This is a date-timestamp value that signifies when the case was last edited.
- Edited By: This is a string value that signifies who last edited the case
#### 6.3.3.7 Homepage View CSU
The Homepage View CSU takes accepts a JSON array of all cases which it gets from the viewAllCases() function.
#### 6.3.3.8 Create Case View CSU
The Create Case View CSU sends a Django.forms.Form request to the Controller which inputs the form in the CrookBook database.
#### 6.3.3.9 Edit Case View CSU
The Edit Case View CSU sends a Django.forms.Form request (and a master_dr) to the controller.
#### 6.3.3.10 Search Cases View CSU
The Search Cases View CSU sends a Django.forms.Form object to the controller.
#### 6.3.1.11 Homepage Controller CSU
The homepage controller CSU gets a JSON object from the database and sends it to the homepage view.
#### 6.3.1.12 Create Case Controller CSU
The create case controller CSU sends a Django.forms.form object to the view and takes the same object back.
#### 6.3.1.13 Edit Case Controller CSU
The edit case controller CSU sends a Django.forms.form object to the view and takes the same object back.
#### 6.3.1.14 Search Cases Controller CSU
The create case controller CSU sends a Django.forms.form object to the view and takes the same object back.

### 6.3.4  Detailed Design Diagrams
