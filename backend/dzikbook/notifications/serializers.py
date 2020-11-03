from rest_framework import serializers
from .models import Notification


class NotificationSerializer(serializers.ModelSerializer):
    # TODO: user and post using serializers
    class Meta:
        model = Notification
        fields = ['id', 'notification_type', 'user', 'post']

    def create(self, validated_data):
        """
        Create and return a new `Notification` instance, given the validated data.
        """
        return Notification.objects.create(**validated_data)

    # TODO: zamienić na aktualizację żywotności
    def update(self, instance, validated_data):
        """
        Update and return an existing `Notification` instance, given the validated data.
        """
        instance.notification_type = validated_data.get('notification_type', instance.notification_type)
        instance.save()
        return instance
