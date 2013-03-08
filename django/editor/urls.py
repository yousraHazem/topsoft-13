from django.conf.urls import patterns, url

from editor import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^posts/$', views.viewposts, name='viewposts'),
    url(r'^posts/(?P<post_id>\d+)/$', views.viewonepost, name='viewonepost'),
    # ex: /polls/5/results/
    url(r'^(?P<post_id>\d+)/viewcomments/$', views.viewcomments, name='viewcomments'),
    # ex: /polls/5/vote/
    url(r'^posts/(?P<post_id>\d+)/comments/create$', views.createcomment, name='createcomment'),
    url(r'^login/$', views.login_user),
    url(r'^?P<post_id>\d+)/editor/deletepost/$',views.deletepost),
)
    