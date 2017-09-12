from django.conf.urls.defaults import patterns, url


urlpatterns = patterns('web_jfk.apps.home.views',
	url(r'^$','index_view', name = 'vista_index'),

	#album
	url(r'^media/$','media_view', name = 'vista_media'),
	
	#eventos
	url(r'^eventos/$','eventos_view', name = 'vista_calendario'),

	#urls ofertas educativas
	url(r'^ofertas_educativas/$','oferta_view', name = 'vista_ofertas'),
	url(r'^lista_ofertas/$','lista_ofertas_view', name = 'vista_listas_ofertas'),
	
	#aula virtual
	url(r'^aula_virtual/$','documentos_view', name = 'vista_academico'),

	#Contacto
	url(r'^contacto/$', 'contacto_view', name='vista_contacto'),
	

	#Noticias
	url(r'^noticias/page/(?P<pagina>.*)/$', 'noticias_view' , name = 'vista_noticias'),
	

	#autenticacion 
	url(r'^logout/$', 'logout_view', name = "vista_logout"),
	url(r'^login/$', 'login_view', name = "vista_login"),

	#administracion	
	url(r'^administracion/$', 'administracion_view', name = "vista_administracion"),
	
	#docentes
	url(r'^docentes/$', 'docentes_view', name='vista_lista_docentes'),
	url(r'^lista_docentes/$', 'lista_docentes_view', name = "vista_lista_docentes"),

	#administradores
	url(r'^lista_administradores/$', 'lista_administradores_view', name = "vista_lista_administradores"),

	#sedes
	url(r'^lista_sedes/$', 'lista_sedes_view', name = "vista_lista_sedes"),

	#institucion
	url(r'^institucion/$', 'institucion_view', name = "vista_institucion_view"),

	#slider
	url(r'^lista_items_carrousel/$','lista_slider',name = 'vista_slider'),


)