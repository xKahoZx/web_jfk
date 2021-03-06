# Create your views here.
from django.shortcuts import render_to_response
from django.template import RequestContext
from web_jfk.apps.administracion.models import *
from web_jfk.apps.administracion.views import verificar_fecha, verificar_fecha_evento
from django.contrib.auth.models import User
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import login, logout , authenticate
from django.core.paginator import Paginator, EmptyPage, InvalidPage
from datetime import datetime
def consulta_institucion():	
	try:
		query = institucion.objects.get(id = 1)
	except:
		query = []
	return query
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

	ctx = {'institucion':consulta_institucion(),'noticias':noticias, 'noticias_aux':noticias_aux,'id':id, 'slider':slider, 'id_slider':id_slider, 'total':total, 'eventos':eventos} 
	return render_to_response('home/index.html',ctx, context_instance = RequestContext(request))

#slider
def lista_slider_view(request):
	try:
		if request.user.is_superuser or  request.user.administrador.tipo_usuario == "Administrador Multimedia":
			items = slider_show.objects.all().order_by('-id')
			ctx = {'items':items,'institucion':consulta_institucion()}
			return render_to_response('home/lista_slider.html', ctx, context_instance=RequestContext(request))
		else:
			return HttpResponseRedirect('/')
	except:
		return  HttpResponseRedirect('/')

#albums
def media_view(request,pagina):
	albums = album.objects.all().order_by('-id')	
	album_aux = album.objects.all().order_by('-id')
	for p in album_aux:
		p.descripcion = p.descripcion[0:300] + "..."

	paginator = Paginator(albums, 4)
	paginator2 = Paginator(album_aux, 4)
	try:
		page = int(pagina)
	except:
		page = 1
	try:
		albums = paginator.page(page)
		album_aux = paginator2.page(page)
	except (EmptyPage, InvalidPage):
		albums = paginator.page(paginator.num_pages)
		album_aux = paginator2.page(paginator2.num_pages)
	
	paginas = []
	num_page = 0
	for p in range(paginator.num_pages):
		num_page = num_page + 1
		paginas.append(num_page)
	ctx = {'album':albums, 'album_aux':album_aux, 'paginas':paginas,'institucion':consulta_institucion()}
	return render_to_response('home/media.html', ctx, context_instance = RequestContext(request))


#Noticias
def noticias_view(request, pagina):
	noticias = noticia.objects.all().order_by('-id')
	noticias_aux = noticia.objects.all().order_by('-id')
	for p in noticias:
		p.cuerpo = p.cuerpo[0:792] + "..."

	paginator = Paginator(noticias, 4)
	paginator2 = Paginator(noticias_aux, 4)
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

	ctx = {'noticias':noticias, 'noticias_aux': noticias_aux, 'paginas':paginas,'institucion':consulta_institucion()}
	return render_to_response('home/noticias.html', ctx, context_instance = RequestContext(request))


#Calendario
def eventos_view(request):
	verificar_fecha_evento()
	year = datetime.now().year
	calendario = calendario_eventos.objects.filter(anio = year).order_by('fecha')
	calendario_aux = calendario_eventos.objects.filter(anio = year).order_by('fecha')
	if request.method == "POST":
		busqueda = request.POST['busqueda']
		calendario = calendario_eventos.objects.filter(anio = busqueda).order_by('fecha')
		calendario_aux = calendario_eventos.objects.filter(anio = busqueda).order_by('fecha')
	for p in calendario_aux:
		p.descripcion = p.descripcion[0:200]
	ctx = {'calendario':calendario, 'calendario_aux': calendario_aux,'institucion':consulta_institucion()}	
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

	ctx = {'ofertas':ofertas, 'men': mensaje, 'sedes': sedes,'institucion':consulta_institucion()}	

	return render_to_response('home/lista_oferta_educativa.html', ctx,context_instance = RequestContext(request))


def lista_ofertas_view(request):

	if request.user.is_authenticated():
		verificar_fecha()
		if request.method == "POST":
			consulta = request.POST['sede_select']
			if consulta == "Todas":
				ofertas = oferta_educativa.objects.all()
			else:
				ofertas = oferta_educativa.objects.filter(sede__nombre = consulta)
			ctx = {'ofertas':ofertas,'institucion':consulta_institucion()}
			return render_to_response('home/lista_ofertas.html', ctx, context_instance = RequestContext(request))
		else:
			if request.user.is_superuser:
				ofertas = oferta_educativa.objects.all().order_by('-id')
				ctx = {'ofertas':ofertas,'institucion':consulta_institucion()}
				return render_to_response('home/lista_ofertas.html', ctx, context_instance = RequestContext(request))
			else:	
				try:
					if request.user.funcionario:
						id_sede = sede.objects.get(coordinadores = request.user.id).id
						ofertas = oferta_educativa.objects.filter(sede = id_sede, jornada = request.user.funcionario.jornada).order_by('-id')		
						ctx = {'ofertas':ofertas,'institucion':consulta_institucion()}
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
				ctx = {'documentos':documentos,'institucion':consulta_institucion()}
				return render_to_response('home/academico.html', ctx, context_instance = RequestContext(request))
		else:
			if request.user.is_superuser:
				documentos = documento.objects.all().exclude(autor__docente__tipo = "Docente")
				ctx = {'documentos':documentos,'institucion':consulta_institucion()}
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
					ctx = {'documentos':documentos_sede, 'documentos_rector':documentos_rector,'institucion':consulta_institucion()}
					return render_to_response('home/academico.html', ctx, context_instance = RequestContext(request))
				except:
					return render_to_response('home/academico.html', context_instance=RequestContext(request))

	return HttpResponseRedirect('/login')

def mis_documentos_view(request):

	if request.user.is_authenticated():
		try:
			if request.user.funcionario:
				mis_documentos = documento.objects.filter(autor = request.user)
				ctx = {'documentos':mis_documentos,'institucion':consulta_institucion()}
				return render_to_response('home/lista_documentos.html', ctx, context_instance = RequestContext(request))
		except:
			try:
				if request.user.docente.jornada ==  "Tarde" and request.user.docente.sede.nombre == "John F. Kennedy":
					mis_documentos = documento.objects.filter(autor = request.user)
					ctx = {'documentos':mis_documentos,'institucion':consulta_institucion()}
					return render_to_response('home/lista_documentos.html', ctx, context_instance = RequestContext(request))
			except:
				return HttpResponseRedirect('/aula_virtual')

		return HttpResponseRedirect('/aula_virtual')
	else:
		return HttpResponseRedirect('/login')
#Contacto

def contacto_view(request):
	sedes = sede.objects.all()
	ctx = {'sedes':sedes,'institucion':consulta_institucion()}
	return render_to_response('home/contacto.html', ctx,context_instance = RequestContext(request))

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

	ctx = {'sedes':sedes,'institucion':consulta_institucion()}


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

	ctx = {'sedes':sedes, 'docentes':docentes, 'sede': sede_select,'institucion':consulta_institucion()}

	return render_to_response('home/lista_docentes.html',ctx, context_instance = RequestContext(request))

#lista de administradores
def lista_administradores_view(request):

	administradores = administrador.objects.all()

	ctx = {'administradores':administradores,'institucion':consulta_institucion()}

	return render_to_response('home/lista_administradores.html', ctx, context_instance = RequestContext(request))

def lista_estudiantes_view(request):

	estudiantes = estudiante.objects.all().order_by('apellidos')
	if request.method == "POST":
		if request.POST['tipo'] == "grado":
			estudiantes = estudiante.objects.filter(grado = request.POST['consulta']).order_by('apellidos')
		else:
			if request.POST['tipo'] == "0":
				estudiantes = estudiante.objects.all().order_by('apellidos')
			else:
				estudiantes = estudiante.objects.filter(identificacion = request.POST['consulta'])

	ctx = {'estudiantes':estudiantes,'institucion':consulta_institucion()}

	return render_to_response('home/lista_estudiantes.html', ctx, context_instance = RequestContext(request))

#lista de sedes
def lista_sedes_view(request):

	sedes = sede.objects.all()
	ctx = {'sedes':sedes,'institucion':consulta_institucion()}
	return render_to_response('home/lista_sedes.html', ctx, context_instance = RequestContext(request))

def ver_sede_view(request, id_sede):
	ver_sede = sede.objects.get(id = id_sede)
	ctx = {'sede':ver_sede,'institucion':consulta_institucion()}
	return render_to_response('home/single_sede.html', ctx, context_instance = RequestContext(request))


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
		
		
	ctx = {'men': mensaje,'institucion':consulta_institucion()}
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

