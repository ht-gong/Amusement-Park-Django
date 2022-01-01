# # This is an auto-generated Django model module.
# # You'll have to do the following manually to clean this up:
# #   * Rearrange models' order
# #   * Make sure each model has one field with primary_key=True
# #   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
# #   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# # Feel free to rename the models, but don't rename db_table values or field names.
# from django.db import models


# class Arcade(models.Model):
#     name = models.CharField(db_column='Name', primary_key=True, blank=True, max_length=30)
#     location = models.CharField(db_column='Location', blank=True, null=True, max_length=50)

#     class Meta:
#         managed = False
#         db_table = 'Arcade'


# class Arcadehasgift(models.Model):
#     aname = models.ForeignKey(Arcade, models.DO_NOTHING,primary_key=True, db_column='AName', blank=True, max_length=30)  # Field name made lowercase.
#     gid = models.ForeignKey('Gift1', models.DO_NOTHING, db_column='GID', blank=True)  # Field name made lowercase.

#     class Meta:
#         unique_together = (('aname', 'gid'),)
#         managed = False
#         db_table = 'ArcadeHasGift'


# class CashierWorksat(models.Model):
#     workid = models.IntegerField(db_column='WorkID', primary_key=True, blank=True)  # Field name made lowercase.
#     aname = models.CharField(db_column='AName', max_length=30)  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Cashier_WorksAt'


# class Equipment(models.Model):
#     id = models.IntegerField(db_column='ID', primary_key=True, blank=True)  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Equipment'


# class Gift1(models.Model):
#     id = models.IntegerField(db_column='ID', primary_key=True, blank=True)  # Field name made lowercase.
#     category = models.CharField(db_column='Category', max_length=30)  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Gift_1'


# class Gift2(models.Model):
#     category = models.CharField(db_column='Category', primary_key=True, blank=True, max_length=30)  # Field name made lowercase.
#     pointsrequired = models.IntegerField(db_column='PointsRequired')  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Gift_2'


# class Machine(models.Model):
#     aname = models.ForeignKey(Arcade, models.DO_NOTHING,primary_key=True, db_column='AName', blank=True)  # Field name made lowercase.
#     mname = models.CharField(db_column='MName', blank=True, max_length=30)  # Field name made lowercase.
#     type = models.CharField(db_column='Type', blank=True, null=True, max_length=30)  # Field name made lowercase.
#     highscores = models.IntegerField(db_column='Highscores', blank=True, null=True)  # Field name made lowercase.

#     class Meta:
#         unique_together = (('aname', 'mname'),)
#         managed = False
#         db_table = 'Machine'


# class OperatorOperates1(models.Model):
#     workid = models.OneToOneField('Staff', models.DO_NOTHING, db_column='WorkID', primary_key=True, blank=True)  # Field name made lowercase.
#     qualification = models.CharField(db_column='Qualification', blank=True, null=True, max_length=50)  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Operator_Operates_1'


# class OperatorOperates2(models.Model):
#     qualification = models.CharField(db_column='Qualification', primary_key=True, blank=True, max_length=50)  # Field name made lowercase.
#     rname = models.ForeignKey('RideMaintains', models.DO_NOTHING, db_column='RName', blank=True, null=True)  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Operator_Operates_2'


# class Redeems(models.Model):
#     gid = models.ForeignKey(Gift1, models.DO_NOTHING, primary_key= True, db_column='GID', blank=True)  # Field name made lowercase.
#     tid = models.ForeignKey('Tourist', models.DO_NOTHING, db_column='TID', blank=True)  # Field name made lowercase.

#     class Meta:
#         unique_together = (('gid', 'tid'),)
#         managed = False
#         db_table = 'Redeems'


# class RideMaintains(models.Model):
#     rname = models.CharField(db_column='RName', primary_key=True, blank=True, max_length=30)  # Field name made lowercase.
#     passengerlimit = models.IntegerField(db_column='PassengerLimit')  # Field name made lowercase.
#     workid = models.ForeignKey('Technician', models.DO_NOTHING, db_column='WorkID')  # Field name made lowercase.
#     eid = models.ForeignKey(Equipment, models.DO_NOTHING, db_column='EID')  # Field name made lowercase.
#     timeofinspection = models.DateField(db_column='TimeofInspection', blank=True, null=True)  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Ride_Maintains'


# class Staff(models.Model):
#     workid = models.AutoField(db_column='WorkID', primary_key=True, blank=True)  # Field name made lowercase.
#     name = models.CharField(db_column='Name', max_length=30)  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Staff'


# class Technician(models.Model):
#     workid = models.OneToOneField(Staff, models.DO_NOTHING, db_column='WorkID', primary_key=True, blank=True)  # Field name made lowercase.
#     qualification = models.CharField(db_column='Qualification', blank=True, null=True, max_length=50)  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Technician'


# class Ticketforride(models.Model):
#     ticketno = models.IntegerField(db_column='TicketNo', primary_key=True, blank=True)  # Field name made lowercase.
#     ridename = models.ForeignKey(RideMaintains, models.DO_NOTHING, db_column='RideName', blank=True)  # Field name made lowercase.

#     class Meta:
#         unique_together = (('ticketno', 'ridename'),)
#         managed = False
#         db_table = 'TicketForRide'


# class Ticket1(models.Model):
#     ticketno = models.IntegerField(db_column='TicketNo', primary_key=True, blank=True)  # Field name made lowercase.
#     type = models.CharField(db_column='Type', max_length=30)  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Ticket_1'


# class Ticket2(models.Model):
#     type = models.CharField(db_column='Type', primary_key=True, blank=True, max_length=30)  # Field name made lowercase.
#     price = models.IntegerField(db_column='Price')  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Ticket_2'


# class Tourist(models.Model):
#     id = models.IntegerField(db_column='ID', primary_key=True, blank=True)  # Field name made lowercase.
#     name = models.CharField(db_column='Name', max_length=30)  # Field name made lowercase.
#     age = models.IntegerField(db_column='Age', blank=True, null=True)  # Field name made lowercase.
#     arcadepoints = models.IntegerField(db_column='ArcadePoints', blank=True, null=True)  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'Tourist'


# class Touristbuysticket(models.Model):
#     tid = models.ForeignKey(Tourist, models.DO_NOTHING, primary_key=True, db_column='TID', blank=True)  # Field name made lowercase.
#     ticketno = models.IntegerField(db_column='TicketNo', blank=True)  # Field name made lowercase.

#     class Meta:
#         unique_together = (('tid', 'ticketno'),)
#         managed = False
#         db_table = 'TouristBuysTicket'


# class Touristplaysmachine(models.Model):
#     tid = models.ForeignKey(Tourist, models.DO_NOTHING, primary_key=True, db_column='TID', blank=True)  # Field name made lowercase.
#     aname = models.CharField(db_column='AName', blank=True, max_length=30)  # Field name made lowercase.
#     mname = models.CharField(db_column='MName', blank=True, max_length=30)  # Field name made lowercase.
#     pointsearned = models.IntegerField(db_column='PointsEarned', blank=True, null=True)  # Field name made lowercase.

#     class Meta:
#         unique_together = (('tid', 'aname', 'mname'),)
#         managed = False
#         db_table = 'TouristPlaysMachine'


# class Uses(models.Model):
#     wid = models.ForeignKey(Technician, models.DO_NOTHING, primary_key=True, db_column='WID', blank=True)  # Field name made lowercase.
#     eid = models.ForeignKey(Equipment, models.DO_NOTHING, db_column='EID', blank=True)  # Field name made lowercase.

#     class Meta:
#         unique_together = (('wid', 'eid'),)
#         managed = False
#         db_table = 'Uses'
