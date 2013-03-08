from django.conf.urls import patterns, url
from django.core.urlresolvers import reverse

from editor import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^posts/$', views.viewposts, name='viewposts'),
    url(r'^editors/$', views.vieweditors, name='vieweditors'),
    url(r'^posts/(?P<post_id>\d+)/$', views.viewonepost, name='viewonepost'),
    # ex: /polls/5/results/
    url(r'^editors/(?P<editor_id>\d+)/$', views.viewonepost, name='viewoneeditor'),
    url(r'^(?P<post_id>\d+)/viewcomments/$', views.viewcomments, name='viewcomments'),
    # ex: /polls/5/vote/
    url(r'^posts/(?P<post_id>\d+)/comments/create$', views.createcomment, name='createcomment'),
    url(r'^posts/(?P<post_id>\d+)/comments/delete$', views.delete_own_comment, name='delete_own_comment'),

    url(r'^posts/(?P<post_id>\d+)/comments/edit$', views.edit_comment, name='edit_comment'),
    url(r'^editors/(?P<editor_id>\d+)/posts/edit$', views.edit_post, name='edit_post'),
    url(r'^editors/(?P<editor_id>\d+)/posts/create$', views.createpost, name='createpost'),

    url(r'^login/$', views.login_user),
)
    