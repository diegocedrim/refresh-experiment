from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Batch)
admin.site.register(BatchClassification)
admin.site.register(SynthesisHeuristic)
admin.site.register(Project)
admin.site.register(Node)
admin.site.register(BatchGroup)