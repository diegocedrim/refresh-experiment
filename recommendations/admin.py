from django.contrib import admin
from .models import *
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
# Register your models here.


class BatchAdmin(admin.ModelAdmin):
    list_display = ('removed_smell', 'title')


# Define an inline admin descriptor for Employee model
# which acts a bit like a singleton
class UserSubjectInline(admin.StackedInline):
    model = UserSubject
    can_delete = False
    verbose_name_plural = 'subjects'


class SourceFileInline(admin.StackedInline):
    model = SourceFile
    can_delete = True
    verbose_name_plural = 'source files'


class RefactoringAdmin(admin.ModelAdmin):
    inlines = (SourceFileInline, )


# Define a new User admin
class UserAdmin(BaseUserAdmin):
    list_display = ('first_name', 'last_name', 'completion')
    inlines = (UserSubjectInline, )

    def on_experiment(self, user):
        return user.subject.on_experiment

    def completion(self, user):
        total = Batch.objects.count()
        complete = user.feedbacks.count()
        return "%.2f%%" % (float(complete)/total * 100)


class SourceFileAdmin(admin.ModelAdmin):
    list_display = ('name', 'refactoring')


class BatchFeedbackAdmin(admin.ModelAdmin):
    list_display = ('user', 'batch', 'perception', 'observations')


admin.site.register(Batch, BatchAdmin)
admin.site.register(Refactoring, RefactoringAdmin)
admin.site.register(RefactoringType)
admin.site.register(CodeSmell)
admin.site.register(SourceFile, SourceFileAdmin)
admin.site.register(BatchFeedback, BatchFeedbackAdmin)


admin.site.unregister(User)
admin.site.register(User, UserAdmin)
