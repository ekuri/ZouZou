from django.shortcuts import render

from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods, require_GET, require_POST
from django.contrib.auth.decorators import login_required

from comment.models import Comment

# Create your views here.

@require_GET
@login_required
def get_comments(request, templateName):
    comments = Comment.objects.filter(user=request.user)
    return render(request, templateName, {
        'comments': comments,
    })
