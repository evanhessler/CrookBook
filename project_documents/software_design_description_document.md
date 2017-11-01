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

The objective of CrookBook as an application is to provide a simple and tailored
interface for a small section of LAPD detectives. These detectives require a database system that can speed up and simplify their search for their murder cases and murder case books. CrookBook will allow the detectives easy access to relevant information on their cases based off of their search. Should the detectives wish to access more information on a particular case within the database, they can also click on entries to provide all the information the database has on that particular entry. The keywords that can be searched are Master DR, Victims, Suspects and Date Occurred.

### 6.1.2 Hardware, Software, and Human Interfaces
- 6.1.2.1 **Human Interface: Mouse and Keyboard**
  - Users will use a basic mouse and keyboard to navigate their way through CrookBook's interface. The mouse and keyboard act as they would for any other web application, being able to click and type on specified fields.
- 6.1.2.2 **Human Interface: Touch**
  - Users that are accessing the CrookBook application on modern smartphones will be able to use the application like they would on a personal computer, except that the phones are touch based rather than mouse and keyboard based.
- 6.1.2.3 **Human Interface: Monitor**
  - Users will need a typical modern day computer monitor in order to view CrookBook's interface. If the user is using a tower computer, then they will need a monitor that is able to display given that computer's output capabilities (i.e. VGA or HDMI). If the user has a laptop then it should already be equipped with an adequate monitor. CrookBook's interface can also be used on mobile so any modern smartphone display will be adequate.
- 6.1.2.4 **Software Interface: GUI**
  - Users will interact with CrookBook's Graphic User Interface. The user interface includes things like buttons, drop down menus and text fields that users can interact with. Buttons lead users to separate pages within the application to access a particular keyword or action such as, settings or login menus. Drop down menus are used to give the users a selection of options to choose from which then act like buttons that lead the user to new pages. Text fields allow the user to specify which pages they are looking for within the application using their own search.
- 6.1.2.5 **Software Interface: Database**
  - The database holds all the data from the LAPD murder case books. The user interface interacts with the database in order to give the user the proper information they are searching for.
- 6.1.2.6 **Software Interface: Server**
  - The server hosts the CrookBook web application as well as all the information stored within the database.
- 6.1.2.7 **Hardware Interface: Wireless/Wired Networking**
  - Since CrookBook is a web based application, a wired or wireless connection will be needed in order to access the application.
//B.J. wants us to add a picture of what our interface looks like

## 6.2 Architectural Design
CrookBook implements a well designed Model-View-Controller architecture. LAPD detectives will interact with CrookBook's user interface which is being created using CSS, HTML and JavaScript. The user interface will access the database and its models once the user makes a request for a search. From here, the database will access the relevant information using Postgres and Django. The database will then send this information back to controllers and onto the user's view to be displayed on the user interface. Users can then choose to do a new search or another search based on their current search.

### 6.2.1 Major Software Components

We have two major software components in our system:

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

### 6.2.2 Major Software Interactions
CrookBook is built on two main software engines: Django and Postgres. We developed CrookBook using Django to easily develop under a Model-View-Controller framework. With Django we are able to implement our URLs and determine what type of data should be captured and evaluated in our backend to provide the appropriate response. Django also has built-in models and administrative capabilities so we can easily design and maintain our database. Our web application interacts with our Postgres database by allowing users with certain permissions to add, delete or edit case entries. We provide these users with categorical forms to make inputting new data more straightforward. All users have read permissions so that they can search for a case and read details about that record.

### 6.2.3 Architectural Design Diagrams
