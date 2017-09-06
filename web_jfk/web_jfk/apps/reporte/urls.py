from django.conf.urls.defaults import patterns, url


urlpatterns = patterns('web_jfk.apps.reporte.views',
	
	url(r"^reporte/(?P<id>.*)/$", 'reporte_view' , name = 'generar_reporte'),
	
	url(r"^reporte-pdf/(?P<id>.*)/$", 'generar_pdf' , name = 'generar_reporte'),

	
)