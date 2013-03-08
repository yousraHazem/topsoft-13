from django.conf.urls import patterns, url

from editor import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^posts/$', views.viewposts, name='viewposts'),
    url(r'^posts/(?P<post_id>\d+)/$', views.viewonepost, name='viewonepost'),
    # ex: /polls/5/results/
    url(r'^editor/viewcomments$', views.viewcomments, name='viewcomments'),
    # ex: /polls/5/vote/

     #url(r'^editor/viewcomments$', views.viewcomments, name="viewcomments"),

    url(r'^posts/(?P<post_id>\d+)/comments/create$', views.createcomment, name='createcomment'),
    url(r'^login/$', views.login_user, name='login_user'),
    url(r'^editor/editpost/(?P<post_id>\d+)$', views.editpost),

    url(r'^adminpage$', views.adminpage,  name='adminpage'),
    
    url(r'^adminpage/addeditor$', views.add_editor,  name='add_editor'),

    #url(r'^editor/viewcomments$', views.viewcomments, name='viewcomments'),
)
    