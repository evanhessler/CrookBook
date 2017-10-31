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
interface for a small section of LAPD detectives. These detectives require a database system that can speed up and simplify their search for their murder cases and murder case books. CrookBook will allow the detectives easy access to relevant information on their cases based off of their search. Should the detectives wish to access more information on a particular case within the database, they can also click on entries to provide all the information the database has on that particular entry. The keywords that can be searched are Master DR, Victims, Suspects and Date Occured.

### 6.1.2 Hardware, Software, and Human Interfaces


## 6.2 Architectural Design

### 6.2.1 Major Software Components

### 6.2.2 Major Software Interactions
CrookBook is built on two main software engines: Django and Postgres. We developed CrookBook using Django to easily develop under a Model-View-Controller framework. With Django we are able to implement our URLs and determine what type of data should be captured and evaluated in our backend to provide the appropriate response. Django also has built-in models and administrative capabilities so we can easily design and maintain our database. Our web application interacts with our Postgres database by allowing users with certain permissions to add, delete or edit case entries. We provide these users with categorical forms to make inputting new data more straightforward. All users have read permissions so that they can search for a case and read details about that record.
 
### 6.2.3 Architectural Design Diagrams
