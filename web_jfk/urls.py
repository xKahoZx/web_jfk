from django.conf.urls import patterns, include, url
import settings
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    
    url(r'^',include('web_jfk.apps.home.urls')),
    url(r'^',include('web_jfk.apps.administracion.urls')),
    url(r'^',include('web_jfk.apps.reporte.urls')),
    url(r'^',include('web_jfk.apps.matricula.urls')),
    url(r'^',include('web_jfk.apps.pei.urls')),
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
	url(r'^admin/', include(admin.site.urls)),
    url(r'^media/(?P<path>.*)$','django.views.static.serve',{'document_root':settings.MEDIA_ROOT}),

)
