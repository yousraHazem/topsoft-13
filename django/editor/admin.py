from django.contrib import admin
from editor.models import Editor, Post, Comment

class PostInline(admin.TabularInline):
    model = Post
    extra = 0

class EditorAdmin(admin.ModelAdmin):
    list_display = ('editorName', 'editorPassword')
    search_fields = ['editorName']
    fieldsets = [
        (None,               {'fields': ['editorName']}),
        ('Date information', {'fields': ['editorPassword'], 'classes': ['collapse']}),
    ]
    inlines = [PostInline]
admin.site.register(Editor, EditorAdmin)

class CommentInline(admin.TabularInline):
    model = Comment
    extra = 0

class PostAdmin(admin.ModelAdmin):
    list_display = ('theeditor', 'text')
    fieldsets = [
        (None,               {'fields': ['theeditor']}),
        ('Text information', {'fields': ['text'], 'classes': ['collapse']}),
    ]
    inlines = [CommentInline]

admin.site.register(Post, PostAdmin)
