from django.conf.urls.defaults import patterns, url


urlpatterns = patterns('web_jfk.apps.administracion.views',
	#Noticias
	url(r'^add-noticia/$','add_noticia_view', name = 'vista_add_noticia'),
	url(r'^edit-noticia/(?P<id_noticia>.*)/$','edit_noticia_view',name = 'vista_editar_noticia'),
	url(r'^del-noticia/(?P<id_noticia>.*)/$','del_noticia_view',name = 'vista_eliminar_noticia'),
	
	#Media
	url(r'^crear_album/$','add_album_view',name = 'vista_crear_album'),
	url(r'^edit-album/(?P<id_album>.*)/$', 'edit_album_view', name = 'vista_editar_album'),
	url(r"^edit-img/(?P<id_img>.*)/$", 'edit_img_view' , name = 'modificar_imagen_album'),
	
	#Slider Inicio
	url(r'^add_item/$','add_item_slider',name = 'vista_crear_item'),
	url(r"^modificar/(?P<id_item>[^/]+)/(?P<opc>[^/]+)$", 'modificar_estado_view' , name = 'modificar_estado'),
	url(r'^edit_item/(?P<id_img>.*)/$','edit_item_view',name = 'vista_editar_img'),
	url(r'^del_item/(?P<id_item>.*)/$','del_item_view',name = 'vista_eliminar_item'),
	
	#Eventos
	url(r'^add-evento/$','add_evento_view', name = 'vistra_agregar_evento'),
	url(r'^del_evento/(?P<id_evento>.*)/$','del_evento_view',name = 'vista_eliminar_evento'),
	url(r'^edit_evento/(?P<id_evento>.*)/$','edit_evento_view',name = 'vista_editar_evento'),
	
	#Ofertas
	url(r'^add_oferta/$','add_oferta_view', name = 'vista_agregar_oferta'),
	url(r'^delete_oferta/(?P<id_oferta>.*)/$','delete_oferta_view', name = 'vista_eliminar_oferta'),
	url(r'^edit_oferta/(?P<id_oferta>.*)/$','edit_oferta_view', name = 'vista_editar_oferta'),
	url(r'^register-offer/(?P<id_oferta>.*)/$','inscripcion_view', name = 'vista_inscripcion_oferta'),
	
	#documentos academicos
	url(r'^add_documento/$','add_documento_view', name = 'vista_agregar_documento'),

	#usuarios
	url(r'^add_usuario/$','add_usuario_view', name = 'vista_agregar_usuario'),
	url(r'^edit_usuario/(?P<id_user>.*)/$','edit_usuario_view', name = 'vista_editar_usuario'),
	url(r'^add_estudiante/$','add_alumno_view', name = 'vista_agregar_usuario'),

	#institucion
	url(r'^crear_institucion/$','add_institucion_view', name = 'vista_agregar_institucion'),
	url(r'^crear_sede/$','add_sede_view', name = 'vista_agregar_sede'),

	url(r'^crear_coordinador/(?P<jornada>.*)/$','add_coordinador_view', name = 'vista_crear_coordinador'),
	

)