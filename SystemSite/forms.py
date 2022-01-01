from django import forms
import datetime

class insertTouristForm(forms.Form):
    ID = forms.IntegerField(label = 'ID')
    Name = forms.CharField(label = 'Name', max_length = 100)
    Age = forms.IntegerField(label = 'Age')
    Arcadept = forms.IntegerField(label = 'Arcade Pts')

class insertStaffForm(forms.Form):
    WorkID = forms.IntegerField(label = 'WorkID')
    Name = forms.CharField(label = 'Name', max_length = 100)

class deleteArcadeForm(forms.Form):
    ArcadeName = forms.CharField(label = 'Arcade Name ', max_length = 100)

class deleteMachineForm(forms.Form):
    MachineName = forms.CharField(label = 'Machine Name ', max_length = 100)

class MaintainanceForm(forms.Form):
    RideName = forms.CharField(label = 'Ride Name', max_length = 100)
    WorkID = forms.IntegerField(label = 'Work ID')
    EquipmentID = forms.IntegerField(label = 'Equipment ID')
    TOI = forms.DateField(label = 'Time of Inspection', initial=datetime.date.today)



# For join
RIDE_CHOICES = [
    ('Roller-coaster','Roller-coaster'),
    ('Carousel', 'Carousel'),
    ('Flume ride', 'Flume ride'),
    ('Ferris wheel', 'Ferris wheel'),
    ('Haunted Mansion', 'Haunted Mansion'),
    ('Jungle cruise','Jungle cruise'),
]

class joinForm(forms.Form):
    ride_name = forms.CharField(label='Specify the ride name in this query ', widget=forms.Select(choices=RIDE_CHOICES))

# For projection
COLUMES_CHOICES = [
    ('GID', 'Gift ID'),
    ('TID', 'Tourist ID'),
    ('Name', 'Tourist Name'),
    ('Age', 'Age'),
    ('ArcadePoints', 'Arcade Points'),
]
class projForm(forms.Form):
    dropdown1 = forms.CharField(label='Select the attribute you are interested in', widget=forms.Select(choices=COLUMES_CHOICES))
    dropdown2 = forms.CharField(label='Select the attribute you are interested in', widget=forms.Select(choices=COLUMES_CHOICES))
    dropdown3 = forms.CharField(label='Select the attribute you are interested in', widget=forms.Select(choices=COLUMES_CHOICES))
    