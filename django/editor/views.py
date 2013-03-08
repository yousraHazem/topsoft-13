# Create your views here.
from django.http import HttpResponse
from django.template import Context, loader, RequestContext
from editor.models import Editor, Post, Comment
from django.shortcuts import render, get_object_or_404, render_to_response
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib.comments.models import Comment
from django.shortcuts import get_object_or_404
from django.conf import settings
from django.contrib import comments
from django.core.urlresolvers import reverse

def index(request):
    editor_list = Editor.objects.all()
    output = ', '.join([p.editorName for p in editor_list])
    template = loader.get_template('editor/index.html')
    context = Context(
        {
        'editor_list': editor_list,
        'editors': Editor.objects.all()})
    return HttpResponse(template.render(context))
    

def viewposts(request):
    posts_list = Post.objects.all()
    output = ', '.join([p.text for p in posts_list])
    template = loader.get_template('editor/viewposts.html')
    context = Context({
        'posts_list': posts_list,
    })
    return HttpResponse(template.render(context))

def vieweditors(request):
    editor_list = Editor.objects.all()
    output = ', '.join([p.editorName for p in editor_list])
    template = loader.get_template('editor/vieweditors.html')
    context = Context({
        'editor_list': editor_list,
    })
    return HttpResponse(template.render(context))

def viewcomments(request, post_id):
    comment_list = Comment.objects.all()
    output = ', '.join([p.content for p in comment_list])
    template = loader.get_template('editor/viewcomments.html')
    context = Context({
        'comment_list': comment_list,
    })
    return HttpResponse(template.render(context))


def viewonepost(request, post_id):
    onepost = Post.objects.get(id=post_id)
    template = loader.get_template('editor/viewonepost.html')
    context = Context({
        'onepost': onepost,
    })
    return HttpResponse(template.render(context))

def viewoneeditor(request, editor_id):
    oneeditor = Editor.objects.get(id=editor_id)
    template = loader.get_template('editor/viewoneedior.html')
    context = Context({
        'oneeditor': oneeditor,
    })
    return HttpResponse(template.render(context))

def delete_own_comment(request, comment_id):
    comment = Comment.objects.get(id = comment_id)
    #comment = get_object_or_404(comment.get_model(), pk=comment_id, site__pk=settings.SITE_ID)
    #if comment.user == request.user:
    comment.is_removed = True
    comment.save()
    return render_to_response('editor/viewonepost.html', {'onepost': post}, context_instance=RequestContext(request))

def delete_own_post(request, post_id):
    post = Post.objects.get(id = post_id)
    #comment = get_object_or_404(comment.get_model(), pk=comment_id, site__pk=settings.SITE_ID)
    #if comment.user == request.user:
    post.is_removed = True
    post.save()
    return render_to_response('editor/viewoneeditor.html', {'oneeditor': editor}, context_instance=RequestContext(request))

def edit_comment(request, comment_id): 
    comment = Comment.objects.get(id = comment_id)  
    #print "post_id  ", request.PUT['post_id']
    #postid= request.PUT['post_id']
    #post = Post.objects.get(id=postid)
    comment.content= request.PUT['newcontent']    
    comment.save()

    # comment = Comment.objects.for_model(Comment).filter(object_pk=comment_id)
    #comment = comments[0]
    #comment.content = new_comment
    #print comments[0].comment
    return render_to_response('editor/viewonepost.html', {'onepost': post}, context_instance=RequestContext(request))

def edit_post(request, post_id): 
    post = Post.objects.get(id = post_id)  
    #print "post_id  ", request.PUT['post_id']
    #postid= request.PUT['post_id']
    #post = Post.objects.get(id=postid)
    post.text= request.PUT['newpost']    
    post.save()

    # comment = Comment.objects.for_model(Comment).filter(object_pk=comment_id)
    #comment = comments[0]
    #comment.content = new_comment
    #print comments[0].comment
    return render_to_response('editor/viewoneeditor.html', {'oneeditor': oneeditor}, context_instance=RequestContext(request))

def createcomment(request, post_id):
    content = request.POST['content']
    post = Post.objects.get(id=post_id)
    comment = post.comment_set.create(content=content)
    comment.save()
    return render_to_response('editor/viewonepost.html', {'onepost': post}, context_instance=RequestContext(request))

def createpost(request, editor_id):
    text = request.POST['content']
    editor = Editor.objects.get(id=editor_id)
    post = editor.post_set.create(content=text)
    post.save()
    return render_to_response('editor/viewoneeditor.html', {'oneeditor': editor}, context_instance=RequestContext(request))

def createeditor(request, editor_id):
    content = request.POST['content']
    editor = Post.objects.get(id=post_id)
    editor = editor.create(content=content)
    editor.save()
    return render_to_response('editor/index.html', {'editor_list': editor}, context_instance=RequestContext(request))


def login_user(request):
    state = "Please log in below..."
    username = password = ''
    if request.POST:
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)

                state = "You're successfully logged in!"
            else:
                state = "Your account is not active, please contact the site admin."
        else:
            state = "Your username and/or password were incorrect."
       

    return render_to_response('editor/signin.html',{'state':state, 'username': username})