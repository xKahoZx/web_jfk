from django.conf.urls.defaults import patterns, url


urlpatterns = patterns('web_jfk.apps.matricula.views',
	url(r'^matricula/$','matricula_view', name = 'vista_crear_matricula'),
	url(r'^lista_matriculas/$','lista_matriculas_view', name = 'vista_listar_matriculas'),

)