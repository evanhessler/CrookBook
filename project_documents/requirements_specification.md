## 1.0	Requirements Specification

## 1.1	Introduction
This Software Requirements Specification (SRS) documents the requirements for the Los Angeles Police Department (LAPD) Database Web Application called
CrookBook. The CrookBook Database is a relational database that will allow LAPD
to enter in and find police case data with ease. The procedure will be done across the Internet from a desktop computer or laptop and the application is built and tailored for the needs of LAPD. The application is meant to provide authorized LAPD personnel data reports that indicate cases that are worthwhile investigating. The Web Application will be built with a three-tier client/server architecture. So at a high level, the user will be interacting with a Graphical User Interface completed by a frontend framework. 

The following table defines the language used in specifying requirements in this document. Only 'shall' statements are explicit requirements for this project.

| Type   | Definition                                    |
|--------|-----------------------------------------------|
| Shall  | Expresses mandatory provision.                |
| Should | Expresses non-mandatory provision.            |
| Will   | Declaration of purpose such as a design goal. |

DESCRIBE APPLICATION SERVER OR WEB SERVER(BACKEND) -> DESCRIBE DATABASE SERVER

## Document Outline
- 1.2	CSCI Component Breakdown
- 1.3	Functional Requirements by CSC
- 1.4	Performance Requirements by CSC
- 1.5	Project Environment Requirements
	- 5.5.1	Development Environment Requirements
	- 5.5.2	Execution Environment Requirements

### 1.2 	CSCI Component Breakdown
CSCI CrookBook is composed of the following CSCs:

- 1.2.1		**GUI Client CSC**:  Web based portal to CrookBook
- 1.2.1.1	**Cases Table CSU**: Displays list of the top priority cases
- 1.2.1.2	**Search Cases Form CSU**: Form used to search existing CrookBook cases
- 1.2.1.3	**Add New Case Page CSU**: Form used to add new case to CrookBook
- 1.2.1.4	**Login Page CSU**: Webpage containing login form
- 1.2.1.5	**Detailed Case Info Page CSU**: Page for each entry in CrookBook database that displays all case information
- 1.2.1.6	**Navigation Bar CSU**: Navigation bar used on every page in CrookBook

1.2.2		DESCRIBE BACKEND CSC HERE

1.2.3		DESCRIBE DATABASE CSC HERE
### 1.3	Functional Requirements
#### 1.3.1  GUI Client CSC
- 1.3.1.1 The GUI subsystem shall display a window for the main application.
- 1.3.1.2 The GUI subsystem shall react to mouse clicks on displayed buttons.
- 1.3.1.3 The GUI subsystem shall react to typing within displayed text fields.
- 1.3.1.4 The GUI subsystem shall display both the cases table module and search form module on one webpage
- 1.3.1.5 The GUI subsystem shall use Hyper Text Markup Language (HTML)
- 1.3.1.6 The GUI subsystem should include 4 seperate pages
- 1.3.1.7 The GUI subsystem should include instructions for use when needed
- 1.3.1.8 One GUI subsystem page shall contain the cases table CSU, search cases form CSU, and navigation bar CSU
- 1.3.1.9 The second GUI subsystem page shall contain exclusively the login page CSU and navigation bar CSU
- 1.3.1.10 The third GUI subsystem page shall contain the detailed case info page CSU and navigation bar CSU
- 1.3.1.11 The fourth GUI subsystem page will display the current users profile
- 1.3.1.12 The fourth GUI subsystem page will have an option to give another user write access if the current user is an administrator
- 1.3.1.11 The cases table CSU should display the most commonly used information on cases
- 1.3.1.12 The cases table CSU should have the highest priority cases on top
- 1.3.1.13 The cases table CSU entries will be large and legible
- 1.3.1.14 The cases table CSU should have an edit button next to each entry if the user is an administrator
- 1.3.1.15 The cases table CSU entries should link to each corresponding detailed case info page for each entry
- 1.3.1.14 The search cases form CSU shall use some combination of text fields and buttons
- 1.3.1.15 The search cases form CSU shall include options necessary to enter any amount of search criteria needed to find murder cases
- 1.3.1.16 The login page CSU shall have a username input field
- 1.3.1.17 The login page CSU shall have a password input field
- 1.3.1.18 The login page shall have a login button
- 1.3.1.20 The login page shall redirect to another page if the user is successfully authenticated
- 1.3.1.21 The login page shall not appear if the user is currently logged in
#### 1.3.1  BACKEND CSC FUNCTIONAL REQUIREMENTS HERE


### 1.4	Performance Requirements

### 1.5	Project Environment Requirements

#### 1.5.1	Development Environment Requirements

#### 1.5.2	Execution Environment Requirements
