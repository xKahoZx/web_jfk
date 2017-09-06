from django.shortcuts import render_to_response
from django.template import RequestContext
from web_jfk.apps.administracion.models import *
from django.http import HttpResponseRedirect


def mision_vision_view(request):
	return render_to_response('pei/mision-vision.html', context_instance = RequestContext(request))

def meta_valores_view(request):
	return render_to_response('pei/metas-valores.html', context_instance = RequestContext(request))
