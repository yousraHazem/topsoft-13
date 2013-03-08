# Create your views here.
from django.http import HttpResponse
from django.template import Context, loader, RequestContext
from editor.models import Editor, Post, Comment
from django.shortcuts import render, get_object_or_404, render_to_response
from django.contrib.auth import authenticate, login

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


def createcomment(request, post_id):
    content = request.POST['content']
    post = Post.objects.get(id=post_id)
    comment = post.comment_set.create(content=content)
    comment.save()
    return render_to_response('editor/viewonepost.html', {'onepost': post}, context_instance=RequestContext(request))


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

def deletePost(request,post_id):
    if request.POST:
        post=Post.objects.get(id=post_id)
        post.delete()

    return render_to_response('deletepost.html')
        