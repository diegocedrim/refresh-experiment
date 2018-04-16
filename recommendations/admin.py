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


# Define a new User admin
class UserAdmin(BaseUserAdmin):
    inlines = (UserSubjectInline, )


admin.site.register(Batch, BatchAdmin)
admin.site.register(Refactoring)
admin.site.register(RefactoringType)
admin.site.register(CodeSmell)
admin.site.register(SourceFile)
admin.site.register(BatchFeedback)


admin.site.unregister(User)
admin.site.register(User, UserAdmin)
