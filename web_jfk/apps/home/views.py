# Create your views here.
from django.shortcuts import render_to_response
from django.template import RequestContext
from web_jfk.apps.administracion.models import *
from web_jfk.apps.administracion.views import verificar_fecha, verificar_fecha_evento
from django.core import serializers
from django.contrib.auth.models import User
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import login, logout , authenticate
from django.core.paginator import Paginator, EmptyPage, InvalidPage


def index_view(request):
	noticias = noticia.objects.filter(estado = True).order_by('-id')[0:3]
	noticias_aux = noticia.objects.filter(estado = True).order_by('-id')[0:3]
	slider = slider_show.objects.filter(estado = True).order_by('-id')	
	verificar_fecha_evento()
	eventos = calendario_eventos.objects.filter(estado = True ).order_by('fecha')[0:2]
	
	id = 0
	if len(noticias) > 0:
		id = noticias[0].id		
	try:
		id_slider = slider[0].id
	except:
		id_slider = 0
	var = 0
	total = []
	for p in range(slider.count()):
		total.append(var)
		var = var + 1

	for p in noticias:
		p.cuerpo = p.cuerpo[0:792] + "..."

	for p in eventos:
		p.descripcion = p.descripcion[0:200]

	ctx = {'noticias':noticias, 'noticias_aux':noticias_aux,'id':id, 'slider':slider, 'id_slider':id_slider, 'total':total, 'eventos':eventos} 
	return render_to_response('home/index.html',ctx, context_instance = RequestContext(request))

#slider
def lista_slider(request):
	items = slider_show.objects.all().order_by('-id')
	ctx = {'items':items}
	return render_to_response('home/lista_slider.html', ctx, context_instance=RequestContext(request))

def media_view(request):
	albums = album.objects.filter(estado = True)	
	album_aux = album.objects.filter(estado = True)	
	for p in album_aux:
		p.descripcion = p.descripcion[0:300] + "..."
	ctx = {'album':albums, 'album_aux':album_aux}
	return render_to_response('home/media.html', ctx, context_instance = RequestContext(request))


#Noticias
def noticias_view(request, pagina):
	noticias = noticia.objects.all().order_by('-id')
	noticias_aux = noticia.objects.all().order_by('-id')
	for p in noticias:
		p.cuerpo = p.cuerpo[0:792] + "..."

	paginator = Paginator(noticias, 3)
	paginator2 = Paginator(noticias_aux, 3)
	try:
		page = int(pagina)
	except:
		page = 1
	try:
		noticias = paginator.page(page)
		noticias_aux = paginator2.page(page)
	except (EmptyPage, InvalidPage):
		noticias = paginator.page(paginator.num_pages)
		noticias_aux = paginator2.page(paginator2.num_pages)
	
	paginas = []
	num_page = 0
	for p in range(paginator.num_pages):
		num_page = num_page + 1
		paginas.append(num_page)

	ctx = {'noticias':noticias, 'noticias_aux': noticias_aux, 'paginas':paginas}
	return render_to_response('home/noticias.html', ctx, context_instance = RequestContext(request))


#Calendario
def eventos_view(request):
	verificar_fecha_evento()
	calendario = calendario_eventos.objects.all().order_by('fecha')
	calendario_aux = calendario_eventos.objects.all().order_by('fecha')
	for p in calendario_aux:
		p.descripcion = p.descripcion[0:200]
	ctx = {'calendario':calendario, 'calendario_aux': calendario_aux}	
	return render_to_response('home/lista_eventos.html', ctx,context_instance = RequestContext(request))

#Oferta educativa
def oferta_view(request):
	ofertas = []
	mensaje = ""
	sedes = sede.objects.all()
	verificar_fecha()
	if request.method == "POST":
		var_sede = request.POST['sede_select']
		var_jornada = request.POST['jornada_select']
		if var_sede != 0 and var_jornada != 0:
			ofertas = oferta_educativa.objects.filter(estado = True, sede__id = var_sede, jornada = var_jornada)
			
		if (len(ofertas) == 0) :
			mensaje = "No hay ofertas educativas disponibles relacionadas con la anterior busqueda"

	ctx = {'ofertas':ofertas, 'men': mensaje, 'sedes': sedes}	

	return render_to_response('home/lista_oferta_educativa.html', ctx,context_instance = RequestContext(request))


def lista_ofertas_view(request):

	if request.user.is_authenticated():
		if request.method == "POST":
			consulta = request.POST['sede_select']
			if consulta == "Todas":
				ofertas = oferta_educativa.objects.all()
			else:
				ofertas = oferta_educativa.objects.filter(sede__nombre = consulta)
			ctx = {'ofertas':ofertas}
			return render_to_response('home/lista_ofertas.html', ctx, context_instance = RequestContext(request))
		else:
			if request.user.is_superuser:
				ofertas = oferta_educativa.objects.all()
				ctx = {'ofertas':ofertas}
				return render_to_response('home/lista_ofertas.html', ctx, context_instance = RequestContext(request))
			else:	
				try:
					if request.user.funcionario:
						id_sede = sede.objects.get(coordinadores = request.user.id).id
						ofertas = oferta_educativa.objects.filter(sede = id_sede, jornada = request.user.funcionario.jornada)			
						ctx = {'ofertas':ofertas}
						return render_to_response('home/lista_ofertas.html', ctx, context_instance = RequestContext(request))
				except:
					return HttpResponseRedirect('/ofertas_educativas')
	else:
		return HttpResponseRedirect('/login')

#aula virtual
def documentos_view(request):

	if request.user.is_authenticated():
		if request.method == "POST":
			var_grado = request.POST['grado_select']
			var_materia = request.POST['materia_select']
			if var_grado != 0 and var_materia != 0:
				documentos = documento.objects.filter(materia = var_materia, grado = var_grado)
				ctx = {'documentos':documentos}
				return render_to_response('home/academico.html', ctx, context_instance = RequestContext(request))
		else:
			if request.user.is_superuser:
				documentos = documento.objects.all().exclude(autor__docente__tipo = "Docente")
				ctx = {'documentos':documentos}
				return render_to_response('home/academico.html', ctx, context_instance = RequestContext(request))
			else:				
				try:
					try:
						query_jornada = docente.objects.get(user = request.user.id).jornada
						query_sede = docente.objects.get(user = request.user.id).sede.id
					except:
						query_jornada = funcionario.objects.get(user = request.user.id).jornada
						query_sede = sede.objects.get(coordinadores = request.user.funcionario.id).id
					try:
						documentos_sede = documento.objects.filter(autor__funcionario__sede__id = query_sede, autor__funcionario__jornada = query_jornada)
						documentos_rector = documento.objects.filter(autor__funcionario__tipo_funcionario = "Rector")
					except:
						documentos_sede = documento.objects.filter(autor__docente__sede = query_sede)
						documentos_rector = documento.objects.filter(autor__funcionario__tipo_funcionario = "Rector")
					ctx = {'documentos':documentos_sede, 'documentos_rector':documentos_rector}
					return render_to_response('home/academico.html', ctx, context_instance = RequestContext(request))
				except:
					return render_to_response('home/academico.html', context_instance=RequestContext(request))

	return HttpResponseRedirect('/login')
#Contacto

def contacto_view(request):


	return render_to_response('home/contacto.html', context_instance = RequestContext(request))

#docente

def docentes_view(request):

	sedes = sede.objects.all()
	institucion_query = institucion.objects.get(pk = 1)
	if request.method == "POST":
		coordinador_query = funcionario()
		info_sede = sede.objects.get(nombre = request.POST['sede_search'])
		for p in info_sede.coordinadores.all():
			if p.jornada == request.POST['jornada_search']:
				coordinador_query = p
		docentes = docente.objects.filter(sede__nombre = request.POST['sede_search'], jornada = request.POST['jornada_search'])

		ctx = {'sedes':sedes, 'info_sede':info_sede, 'insti':institucion_query, 'coordinador':coordinador_query, 'docentes':docentes}
		return render_to_response('home/docentes.html',ctx, context_instance = RequestContext(request))

	ctx = {'sedes':sedes}


	return render_to_response('home/docentes.html',ctx, context_instance = RequestContext(request))


#Lista docentes
#lista los docentes de acuerdo a la sede y jornada seleccionada del usuario
def lista_docentes_view(request):

	sedes = sede.objects.all()	
	docentes = []
	sede_select = ''
	if request.method == "POST":
		sede_select = request.POST['sede_select']
		docentes = docente.objects.filter(sede__nombre = sede_select, jornada = request.POST['jornada_select'])

	ctx = {'sedes':sedes, 'docentes':docentes, 'sede': sede_select}

	return render_to_response('home/lista_docentes.html',ctx, context_instance = RequestContext(request))

#lista de administradores
def lista_administradores_view(request):

	administradores = administrador.objects.all()

	ctx = {'administradores':administradores}

	return render_to_response('home/lista_administradores.html', ctx, context_instance = RequestContext(request))

#lista de sedes
def lista_sedes_view(request):

	sedes = sede.objects.all()

	ctx = {'sedes':sedes}

	return render_to_response('home/lista_sedes.html', ctx, context_instance = RequestContext(request))



#autenticacion
def logout_view(request):
	logout(request)
	return HttpResponseRedirect('/')

def login_view(request):
	mensaje = False
	if request.user.is_authenticated():
		return HttpResponseRedirect('/')
	else:
		if request.method == "POST":
			usu = request.POST['username']
			pas = request.POST['password']
			usuario = authenticate(username = usu, password = pas)
			if usuario is not None and usuario.is_active:
				login(request, usuario)
				return HttpResponseRedirect('/')
			else:
				mensaje = True
		
		
	ctx = {'men': mensaje}
	return render_to_response('home/login.html', ctx, context_instance = RequestContext(request))

#Administracion

def administracion_view(request):

	return render_to_response('home/administracion.html', context_instance = RequestContext(request))


#institucion

def institucion_view(request):

	query_institucion = institucion()

	try:
		query_institucion = institucion.objects.all()[0]
	except:
		
	 	return HttpResponseRedirect('/crear_institucion')

	ctx = {'institucion':query_institucion}
	return render_to_response('home/institucion.html', ctx, context_instance = RequestContext(request))

