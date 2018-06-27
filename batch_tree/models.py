from django.db import models


class BatchClassification(models.Model):
    name = models.CharField(max_length=30)

    def __str__(self):
        return "%s" % self.name


class SynthesisHeuristic(models.Model):
    name = models.CharField(max_length=30)

    def __str__(self):
        return "%s" % self.name


class Batch(models.Model):
    size = models.IntegerField()
    is_cross_type = models.BooleanField()
    open_source = models.BooleanField()
    classification = models.ForeignKey(BatchClassification, on_delete=models.PROTECT)
    heuristic = models.ForeignKey(SynthesisHeuristic, on_delete=models.PROTECT)


class Project(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return "%s" % self.name


class Node(models.Model):
    project = models.ForeignKey(Project, on_delete=models.CASCADE, null=True)
    element_name = models.CharField(max_length=2500)
    parent = models.ForeignKey("Node", on_delete=models.CASCADE, default=None, null=True, related_name="children")

    def __str__(self):
        return "%s" % self.element_name

    def has_children(self):
        return Node.objects.filter(parent=self).count() > 0

    def fetch_group_by_name(self, name):
        return BatchGroup.objects.filter(
            node=self,
            heuristic=SynthesisHeuristic.objects.get(name=name)
        ).get()

    def element_based_group(self):
        return self.fetch_group_by_name("element-based")

    def scope_based_group(self):
        return self.fetch_group_by_name("scope-based")

    def version_based_group(self):
        return self.fetch_group_by_name("version-based")


class BatchGroup(models.Model):
    heuristic = models.ForeignKey(SynthesisHeuristic, on_delete=models.PROTECT)
    batches = models.ManyToManyField(Batch)
    node = models.ForeignKey(Node, on_delete=models.PROTECT, related_name="batch_groups")
    positive = models.IntegerField(default=0)
    negative = models.IntegerField(default=0)
    neutral = models.IntegerField(default=0)

    def count(self):
        return self.positive + self.negative + self.neutral

    class Meta:
        unique_together = (('heuristic', 'node'),)