from django.db import models

SEX = (
    ('M', 'Male'),
    ('F', 'Female'),
)

CRIME = (
    ('M', 'Murder'),
)

class Office(models.Model):
    id = models.AutoField(
        primary_key=True,
    )
    division = models.CharField(
        max_length=30,
        null = False,
    )
    bureau = models.CharField(
        max_length=30,
        null = False,
    )

class Case(models.Model):
    dr_nbr = models.CharField(
        primary_key = True,
        max_length = 32,
    )
    volumes = models.IntegerField(
        null = False,
        default = 1,
    )
    date_reviewed = models.DateTimeField(
        null = True,
    )
    motive = models.CharField(
        max_length = 32,
        null = False,
    )
    court_case_number = models.CharField(
        max_length = 32,
        null = True,
    )
    notes = models.TextField(
        null = True,
    )
    related_cases = models.ForeignKey(
        'self',
        null = True,
    )
    office = models.ForeignKey(
        Office,
        null = False,
    )

class Event(models.Model):
    id = models.AutoField(
        primary_key=True
    )
    # Already in Case, what to do?
    # crime_committed = models.CharField(
    #     max_length = 30,
    #     null = False,
    # )
    date_occurred = models.DateTimeField(
        null = False,
    )
    date_reported = models.DateTimeField(
        null = False,
    )
    address = models.CharField(
        max_length = 50,
        null = False,
    )
    weapon = models.CharField(
        max_length = 30,
        null = True,
    )
    crime_committed = models.CharField(
        max_length = 1,
        choices = CRIME,
        default = 'M',
        null = False,
    )
    coroner_case_number = models.CharField(
        max_length = 32,
        null = True,
    )
    case = models.ForeignKey(
        Case,
        null = False,
    )

class Person(models.Model):
    id = models.AutoField(
        primary_key=True
    )
    first_name = models.CharField(
        max_length = 30,
        null = True,
    )
    last_name = models.CharField(
        max_length = 30,
        null = True,
    )
    age = models.IntegerField(
        null = True,
    )
    sex = models.CharField(
        max_length = 32,
        choices = SEX,
        null = True,
    )
    case = models.ForeignKey(
        Case,
        null = False,
    )

class History(models.Model):
    id = models.AutoField(
        primary_key=True
    )
    date_edited = models.DateTimeField(
        null = False,
    )
    edited_by = models.CharField(
        max_length = 30,
        null = False,
    )
    case = models.ForeignKey(
        Case,
        null = False,
    )
