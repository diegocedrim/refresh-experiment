from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class CodeSmell(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name


class Batch(models.Model):
    title = models.CharField(max_length=100, unique=True)
    removed_smell = models.ForeignKey(CodeSmell, on_delete=models.PROTECT)
    description = models.TextField()

    def feedback(self, user):
        result = BatchFeedback.objects.filter(batch=self, user=user)
        if result:
            return result[0]
        return None

    def __str__(self):
        return self.title


class RefactoringType(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name


class Refactoring(models.Model):
    batch = models.ForeignKey(Batch, on_delete=models.CASCADE, related_name='refactorings')
    type = models.ForeignKey(RefactoringType, on_delete=models.PROTECT)
    class_name = models.CharField(max_length=100)
    order = models.IntegerField()

    def ordered_files(self):
        return self.files.order_by('id')

    class Meta:
        unique_together = ('batch', 'order')

    def __str__(self):
        return "%s na classe %s [%s]" % (self.type, self.class_name, self.order)


class SourceFile(models.Model):
    name = models.CharField(unique=True, max_length=50)
    source_code = models.TextField()
    interesting_lines = models.CharField(max_length=50, null=True, blank=True)
    refactoring = models.ForeignKey(Refactoring, on_delete=models.CASCADE, related_name='files', null=True)
    changes_description = models.TextField()

    def __str__(self):
        return self.name


class BatchFeedback(models.Model):
    batch = models.ForeignKey(Batch, on_delete=models.CASCADE, related_name='feedbacks')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    observations = models.TextField()

    CHOICES = (
        ('s', 'Sim'),
        ('n', 'Não'),
        ('p', 'Parcialmente'),
    )
    perception = models.CharField(max_length=1, choices=CHOICES)

    def perception_choices(self):
        return BatchFeedback.CHOICES

    class Meta:
        unique_together = ('batch', 'user')

    def __str__(self):
        return "%s sobre '%s'" % (self.user.get_short_name(), self.batch)


class UserSubject(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    on_experiment = models.BooleanField(default=True)

    def __str__(self):
        return "%s" % self.user
