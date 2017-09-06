from django.conf.urls.defaults import patterns, url


urlpatterns = patterns('web_jfk.apps.pei.views',


	url(r'^mision-vision/$','mision_vision_view', name = 'vista_mision_vision'),
	url(r'^metas-valores/$','meta_valores_view', name = 'vista_metas-valores'),
	

)