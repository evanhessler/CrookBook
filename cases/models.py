from django.db import models

class Person(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    age = models.IntegerField()
    sex = models.BooleanField()

class Event(models.Model):
	crime_committed = models.CharField(max_length=30)
	date_occurred = models.DateTimeField()
	date_reported = models.DateTimeField()
	weapon = models.CharField(max_length=30)
	address = models.CharField(max_length=50)

class History(models.Model):
	date_edited = models.DateTimeField()
	edited_by = models.CharField(max_length=30)

class Office(models.Model):
	division = models.CharField(max_length=30)
	bureau = models.CharField(max_length=30)

class Case(models.Model):
	dr_nbr = models.CharField(max_length=30)
	volumes = models.IntegerField()
	date_fully_reviewed = models.DateTimeField()
	crime_committed = models.CharField(max_length=30)
	motive = models.TextField()
	court_case_number = models.IntegerField()
	coroner_case_number = models.IntegerField()
	notes = models.TextField()
	related_cases = models.ForeignKey('self')
	office = models.ForeignKey(Office)
	history = models.ForeignKey(History)
	event = models.ForeignKey(Event)
	# How do we store a list of victims/suspects?
	victim = models.ForeignKey(Person)
	suspect = models.ForeignKey(Person)