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

class Comment(models.Model):
    thepost = models.ForeignKey(Post)
    content = models.CharField(max_length = 1000)
    def __unicode__(self):
        return self.content

class Users(models.Model):
    theComment = models.ForeignKey(Comment)
    userName = models.CharField(max_length = 200)
    userPassword = models.CharField(max_length = 10)
    def __unicode__(self):
        return self.userName

class Admin(models.Model):
    adminName = models.CharField(max_length = 200)
    adminPassword = models.CharField(max_length = 10)
    def __unicode__(self):
        return self.adminName
