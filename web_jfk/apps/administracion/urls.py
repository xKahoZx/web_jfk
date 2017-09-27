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
	url(r"^del_imagen/(?P<id_img>.*)/$", 'del_img_album_view' , name = 'vista_eliminar_imagen'),
	url(r"^del_album/(?P<id_album>.*)/$", 'del_album_view' , name = 'vista_eliminar_album'),
	
	#Slider Inicio
	url(r'^add_item/$','add_item_view',name = 'vista_crear_item'),
	url(r"^modificar/(?P<id_item>[^/]+)/(?P<opc>[^/]+)/$", 'modificar_estado_view' , name = 'modificar_estado'),
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
	url(r'^edit_documento/(?P<id_documento>.*)/$','edit_documento_view', name = 'vista_editar_documento'),
	url(r'^del_documento/(?P<id_documento>.*)/$','del_documento_view',name = 'vista_eliminar_documento'),

	#usuarios
	url(r'^add_usuario/$','add_usuario_view', name = 'vista_agregar_usuario'),
	url(r'^edit_usuario/(?P<tipo_usuario>[^/]+)/(?P<id_user>[^/]+)/$','edit_usuario_view', name = 'vista_editar_usuario'),
	url(r'^registro/$','add_alumno_view', name = 'vista_agregar_usuario'),
	url(r'^cambiar_password/(?P<id_user>.*)/$','edit_password_view', name = 'vista_editar_password'),
	url(r'^del_user/(?P<id_user>.*)/$','del_user_view', name = 'vista_eliminar_usuario'),

	#institucion
	url(r'^edit_funcionario/(?P<id_user>.*)/$','edit_funcionario_view', name = 'vistar_editar_funcionario'),
	
	

)