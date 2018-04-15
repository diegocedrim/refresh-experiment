from django.contrib import admin
from .models import *
# Register your models here.


class BatchAdmin(admin.ModelAdmin):
    list_display = ('removed_smell', 'title')


admin.site.register(Batch, BatchAdmin)
admin.site.register(Refactoring)
admin.site.register(RefactoringType)
admin.site.register(CodeSmell)
admin.site.register(SourceFile)
