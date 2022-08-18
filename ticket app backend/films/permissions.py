from rest_framework import permissions


class IsAdminorViewOnly(permissions.BasePermission):
    def has_permission(self, request, view):
        if (request.method == "POST" and request.user.isAdmin):
            return True
        elif request.method == "GET":
            return True
        return False