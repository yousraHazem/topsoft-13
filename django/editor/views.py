# Create your views here.
from django.http import HttpResponse
from django.template import Context, loader, RequestContext
from editor.models import Editor, Post, Comment, Users, Admin
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


def deletepost(request, post_id):
    post=Post.objects.get(id=post_id)

    

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

<<<<<<< HEAD
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
=======
def editpost(request,post_id):
    content = request.PUT['content']
    onepost = Post.objects.get(pk=post_id)
    render_to_response('/editor/editpost.html', {'onepost': onepost})
>>>>>>> 327c76559212ab6883abefa0844992b7f3abd106

def createcomment(request, post_id):
    content = request.POST['content']
    post = Post.objects.get(id=post_id)
    comment = post.comment_set.create(content=content)
    comment.save()
    return render_to_response('editor/viewonepost.html', {'onepost': post}, context_instance=RequestContext(request))

<<<<<<< HEAD
def createpost(request, editor_id):
    text = request.POST['content']
    editor = Editor.objects.get(id=editor_id)
    post = editor.post_set.create(content=text)
    post.save()
    return render_to_response('editor/viewoneeditor.html', {'oneeditor': editor}, context_instance=RequestContext(request))
=======
def add_editor(request):
    editorname = request.POST.get('EditorName')
    editorpassword = request.POST.get('EditorPassword')
    e = Editor.objects.create(editorName = editorname, editorPassword = editorpassword)
    e.save()
    print "saved"
>>>>>>> 327c76559212ab6883abefa0844992b7f3abd106

def register(request):

    return render_to_response('editor/register.html')
def login_user(request):
    state = "Please log in below..."
    inputname = password = ''
    if request.POST:
        inputname = request.POST.get('username')
        password = request.POST.get('password')
        user = Users.objects.filter(userName=inputname, userPassword=password);
        editor = Editor.objects.filter(editorName=inputname, editorPassword=password )
        admin = Admin.objects.filter(adminName=inputname, adminPassword=password)
        #user = authenticate(username=username, password=password)
        if editor:
           print "EDITOR" 
           state = "you have logged in"
           request.session['logged_in'] = True
           request.session['user_id'] = user[0].pk
           return render_to_response('editor/index.html',{'state':state, 'username': inputname})

        if admin:
           state = "you have logged in"
           request.session['logged_in'] = True
           request.session['user_id'] = user[0].pk
           return render_to_response('editor/index.html',{'state':state, 'username': inputname})


        if user:
           print "enetr"
           state = "you have logged in"
           # request.session['logged_in'] = True
           # request.session['user_id'] = user[0].pk
           #return render_to_response('editor/index.html',{'state':state, 'username': inputname})

           posts_list = Post.objects.all()
           print posts_list.count()
           template = loader.get_template('editor/viewposts.html')
           context = Context({
               'posts_list': posts_list,
           })
           return HttpResponse(template.render(context))
        else:
            state = "Your username and/or password were incorrect."
            return render_to_response('editor/signin.html',{'state':state, 'username': inputname})
    print "before"
    return render_to_response('editor/signin.html',{'state':state, 'username': inputname})


def sensitive_function(self):
    self.database_record.delete()
    sensitive_function.alters_data = True

def adminpage(request):
    editorname = request.POST.get('EditorName')
    editorpassword = request.POST.get('EditorPassword')
    return render_to_response('editor/adminpage.html',{'username': editorname})   




# def deletecomment(request, commment_id):
#     comment = Comment.objects.get(id=comment_id)
#     if comment.user == request.user:
#         if request.method == "Post":
#             perform_delete(request, comment)
#             return render_o_response("editor/viewcomments.html")
#         else:
#             return render_to_response("editor/index.html")
#     else:
#         return return render_to_response('editor/signin.html')
            
