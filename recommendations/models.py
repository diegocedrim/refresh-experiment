from django.db import models

# Create your models here.


class CodeSmell(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name


class Batch(models.Model):
    title = models.CharField(max_length=100, unique=True)
    removed_smell = models.ForeignKey(CodeSmell, on_delete=models.PROTECT)
    description = models.TextField()

    def __str__(self):
        return self.title


class RefactoringType(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name


class SourceFile(models.Model):
    name = models.CharField(unique=True, max_length=50)
    source_code = models.TextField()
    changes_description = models.TextField()

    def __str__(self):
        return self.name


class Refactoring(models.Model):
    batch = models.ForeignKey(Batch, on_delete=models.CASCADE)
    type = models.ForeignKey(RefactoringType, on_delete=models.PROTECT)
    class_name = models.CharField(max_length=100)
    changed = models.OneToOneField(SourceFile, on_delete=models.CASCADE, related_name='changed_by')
    produced = models.OneToOneField(SourceFile, on_delete=models.CASCADE, related_name='produced_by')
    order = models.IntegerField()

    class Meta:
        unique_together = ('batch', 'order')

    def __str__(self):
        return "%s na classe %s [%s]" % (self.type, self.class_name, self.order)
