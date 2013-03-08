from django.db import models

# Create your models here.
class Editor(models.Model):
    editorName = models.CharField(max_length = 200)
    editorPassword = models.CharField(max_length = 10)
    def __unicode__(self):
        return self.editorName

class Post(models.Model):
    theeditor = models.ForeignKey(Editor)
    text = models.CharField(max_length = 1000)
    def __unicode__(self):
        return self.text

class Users(models.Model):
    userName = models.CharField(max_length = 200)
    userPassword = models.CharField(max_length = 10)
    def __unicode__(self):
        return self.userName

class Comment(models.Model):
    thepost = models.ForeignKey(Post)
    theComment = models.ForeignKey(Users)
    content = models.CharField(max_length = 1000)
    def __unicode__(self):
        return self.content

class Admin(models.Model):
    adminName = models.CharField(max_length = 200)
    adminPassword = models.CharField(max_length = 10)
    def __unicode__(self):
        return self.adminName
