from django.shortcuts import render_to_response
from django.template import RequestContext
from web_jfk.apps.administracion.models import *
from django.http import HttpResponseRedirect
from django.contrib.auth.models import User
from datetime import date
import os
import openpyxl
from web_jfk.settings import MEDIA_ROOT

#CRUD noticias
def add_noticia_view(request):

	if request.method == "POST":
		new_noticia = noticia()
		new_noticia.titulo = request.POST['titulo']
		new_noticia.subtitulo = request.POST['subtitulo']
		new_noticia.cuerpo = request.POST['cuerpo']
		new_noticia.autor = request.POST['autor']
		new_noticia.imagen = request.FILES['imagen']
		new_noticia.fecha =  date.today()
		new_noticia.save()
		return HttpResponseRedirect('/noticias/page/1/')
		
	return render_to_response('administracion/admin_noticia.html', context_instance = RequestContext(request))

def edit_noticia_view(request, id_noticia):
	noticia_id = noticia.objects.get(id = id_noticia)
	if request.method == "POST":
		noticia_id.titulo = request.POST['titulo']
		noticia_id.subtitulo = request.POST['subtitulo']
		noticia_id.cuerpo = request.POST['cuerpo']
		noticia_id.autor = request.POST['autor']
		try:
			noticia_id.imagen = request.FILES['imagen']
		except KeyError:
			pass
		noticia_id.save()
		return HttpResponseRedirect('/noticias/page/1')
	ctx = {'noticia': noticia_id}
	return render_to_response('administracion/admin_noticia.html', ctx, context_instance = RequestContext(request))

def del_noticia_view(request, id_noticia):

	if request.user.is_authenticated:		
		try:
			del_noticia = noticia.objects.get(id = id_noticia)
			if os.path.exists(del_noticia.imagen._get_path()) and os.path.isfile(del_noticia.imagen._get_path()):
				os.remove(del_noticia.imagen._get_path())
			del_noticia.delete()
			return HttpResponseRedirect('/lista_noticias')
		except:
			return HttpResponseRedirect('/lista_noticias')
	else:
		return HttpResponseRedirect ('/')

#Album - Media

def add_album_view(request):

	if request.method == "POST":
		new_album = album()
		new_album.titulo = request.POST['titulo']
		new_album.descripcion = request.POST['descripcion']
		new_album.save()
		for p in request.FILES.getlist('imagenes'):
			new_img = imagen_album()
			new_img.imagen = p
			new_img.album = new_album
			new_img.save() 
		return HttpResponseRedirect('/media')

	return render_to_response('administracion/admin_album.html',  context_instance= RequestContext(request))


def edit_album_view(request, id_album):
	album_id = album.objects.get(id = id_album)
	if request.method == "POST":
		album_id.titulo = request.POST['titulo']
		album_id.descripcion = request.POST['descripcion']
		for p in request.FILES.getlist('imagenes'):
			new_img = imagen_album()
			new_img.imagen = p
			new_img.album = album_id
			new_img.save() 
		album_id.save()
		return HttpResponseRedirect('/media/')
	ctx = {'album':album_id}
	return render_to_response('administracion/admin_album.html',ctx, context_instance=RequestContext(request))

def edit_img_view(request, id_img):
	item = imagen_album.objects.get(id = id_img)
	
	if request.method=="POST":		
		item.imagen = request.FILES['imagen']
		item.save()		
		id = album.objects.get(imagenes = id_img).id
		print  id
		return HttpResponseRedirect('/edit-album/%s' %id)
	ctx = {'item':item}

	return render_to_response('administracion/edit_item.html',ctx, context_instance=RequestContext(request))

# Slider
def add_item_slider(request):
	if request.method == "POST":
		item = slider_show()
		item.imagen = request.FILES['imagen']
		item.save()
		return HttpResponseRedirect('/lista_items_carrousel')
	return HttpResponseRedirect('/lista_items_carrousel')

def edit_item_view(request, id_img):
	item = slider_show.objects.get(id = id_img)
	if request.method=="POST":
		item = slider_show.objects.get(id = id_img)
		item.imagen = request.FILES['imagen']
		item.save()
		return HttpResponseRedirect('/list-slider')
	ctx = {'item':item}
	return render_to_response('administracion/edit_item.html',ctx, context_instance=RequestContext(request))

def modificar_estado_view(request, id_item, opc):

	item = slider_show.objects.get(id = id_item)
	if opc == 'activar':
		item.estado = True
	else:
		item.estado = False
	item.save()
	return HttpResponseRedirect('/list-slider')

def del_item_view(request, id_item):

	if request.user.is_authenticated:		
		try:
			del_item = slider_show.objects.get(id = id_item)
			if os.path.exists(del_item.imagen._get_path()) and os.path.isfile(del_item.imagen._get_path()):
				os.remove(del_item.imagen._get_path())
			del_item.delete()
			return HttpResponseRedirect('/list-slider')
		except:
			return HttpResponseRedirect('/list-slider')
	else:
		return HttpResponseRedirect ('/')


#CRUD Eventos

def add_evento_view(request):

	if request.method == "POST":
		new_evento = calendario_eventos()
		new_evento.titulo = request.POST['titulo']
		new_evento.descripcion = request.POST['descripcion']
		new_evento.imagen = request.FILES['imagen']
		new_evento.fecha = request.POST['fecha']
		new_evento.save()
		return HttpResponseRedirect('/eventos')

	return render_to_response('administracion/administracion_eventos.html',context_instance = RequestContext(request))

def del_evento_view(request, id_evento):

	if request.user.is_authenticated:		
		try:
			del_evento = calendario_eventos.objects.get(pk = id_evento)
			if os.path.exists(del_evento.imagen._get_path()) and os.path.isfile(del_evento.imagen._get_path()):
				os.remove(del_evento.imagen._get_path())
			del_evento.delete()
			return HttpResponseRedirect('/eventos')
		except:
			return HttpResponseRedirect('/eventos')


	return render_to_response('administracion/calendario.html', context_instance = RequestContext(request))

def edit_evento_view(request, id_evento):

	edit_evento = calendario_eventos.objects.get(id = id_evento)
	if request.method == "POST":
		edit_evento.titulo = request.POST['titulo']
		edit_evento.descripcion = request.POST['descripcion']
		edit_evento.fecha = request.POST['fecha']		
		try:
			edit_evento.imagen = request.FILES['imagen']
			if os.path.exists(edit_evento.imagen._get_path()) and os.path.isfile(edit_evento.imagen._get_path()):
				os.remove(edit_evento.imagen._get_path())
		except KeyError:
			pass
		fecha = date.today()
		if ( str(edit_evento.fecha) > str(fecha) or str(edit_evento.fecha) == str(fecha)):
			edit_evento.estado = True
		if( str(edit_evento.fecha) < str(fecha)):
			edit_evento.estado = False
		edit_evento.save()
		return HttpResponseRedirect('/eventos')
	ctx = {'evento': edit_evento}
	return render_to_response('administracion/administracion_eventos.html', ctx, context_instance = RequestContext(request))

def verificar_fecha_evento():

	eventos = calendario_eventos.objects.filter(estado = True)
	fecha = date.today()
	for p in eventos:
		if( str(fecha) > str(p.fecha)):
			p.estado = False
			p.save()
			
#CRUD OFERTA EDUCATIVA
def add_oferta_view(request):

	if request.method == "POST":
		oferta = oferta_educativa()
		oferta.fecha_apertura = request.POST['fecha_inicio']
		oferta.fecha_cierre = request.POST['fecha_fin']
		oferta.nivel = request.POST['nivel']
		oferta.grado = request.POST['grado']		
		oferta.cupos = request.POST['cupos']
		oferta.cupos_disponibles = oferta.cupos
		oferta.jornada = request.POST['jornada']		
		oferta.sede  = sede.objects.get(nombre = request.POST['sede'])
		if (str(oferta.fecha_apertura) > str(date.today())):
			oferta.estado = False
		oferta.save()
		return HttpResponseRedirect('/lista_ofertas')
	return render_to_response('administracion/crear_oferta.html', context_instance=RequestContext(request))

def edit_oferta_view(request, id_oferta):

	oferta = oferta_educativa.objects.get(pk = id_oferta)
	if request.method == "POST":
		
		cupos = oferta.cupos	
		oferta.cupos = request.POST['cupos']
		oferta.fecha_apertura = request.POST['fecha_inicio']
		oferta.fecha_cierre = request.POST['fecha_fin']
		if cupos > oferta.cupos:
			cupos = cupos - oferta.cupos
			oferta.cupos_disponibles = oferta.cupos_disponibles - cupos
		else:
			cupos = int(oferta.cupos) - cupos	
			oferta.cupos_disponibles = oferta.cupos_disponibles + cupos

		if oferta.cupos_disponibles == 0:
			oferta.estado = False
		else:
			oferta.estado = True
		
		if (str(oferta.fecha_apertura) > str(date.today())):
			oferta.estado = False
		oferta.save()
		return HttpResponseRedirect('/lista_ofertas')
	
	ctx = {'oferta': oferta}
	return render_to_response('administracion/editar_oferta.html', ctx, context_instance=RequestContext(request))

def delete_oferta_view(request, id_oferta):
	if request.user.is_authenticated:
		oferta = oferta_educativa.objects.get(id = id_oferta)
		inscripciones = inscripcion.objects.filter(oferta__id = id_oferta)
		for p in inscripciones:
			p.delete()
		oferta.delete()

	return HttpResponseRedirect('/lista_ofertas')

def verificar_fecha():

	ofertas = oferta_educativa.objects.all()
	fecha = date.today()
	for p in ofertas:
		if( str(p.fecha_cierre) < str(fecha)):
			p.estado = False
			p.save()
		
		if( str(p.fecha_apertura) == str(fecha) or (str(p.fecha_apertura) < str(fecha)) and str(p.fecha_cierre) > str(fecha) ):
			if(p.cupos_disponibles > 0):
				p.estado = True
				p.save()
	
def inscripcion_view(request, id_oferta):

	if request.method == "POST":
		registro = inscripcion()
		registro.nombres_alumno = request.POST['nombres_a']
		registro.apellidos_alumno = request.POST['apellidos_a']
		registro.nombres = request.POST['nombres']
		registro.apellidos = request.POST['apellidos']
		registro.identificacion = request.POST['identificacion']
		registro.telefono_1 = request.POST['telefono']
		registro.telefono_2 = request.POST['celular']
		registro.direccion = request.POST['direccion']
		registro.barrio = request.POST['barrio']
		registro.edad = request.POST['edad']	
		registro.fecha_inscripcion = date.today()
		oferta_ed = oferta_educativa.objects.get(id = id_oferta)
		oferta_ed.cupos_disponibles = oferta_ed.cupos_disponibles - 1		
		if oferta_ed.cupos_disponibles == 0:
			oferta_ed.estado = False
		oferta_ed.save()
		registro.oferta = oferta_ed
		registro.save()				
	return HttpResponseRedirect('/ofertas_educativas')

#CRUD Documentos academicos

def add_documento_view(request):

	if request.method == "POST":
		new_documento = documento()
		new_documento.titulo = request.POST['titulo']
		new_documento.descripcion = request.POST['descripcion']
		new_documento.materia = request.POST['materia']
		new_documento.grado = request.POST['grado']
		new_documento.fecha = date.today()
		new_documento.autor =  request.user
		new_documento.documento = request.FILES['documento']
		
		new_documento.save()
		return HttpResponseRedirect('/academico')
		
	return render_to_response('administracion/admin_documento.html', context_instance = RequestContext(request))




#CRUD usuarios

def add_usuario_view(request):

	sedes = sede.objects.all()
	if request.method == "POST":
		if (request.POST['tipo_select']== "Docente"): 
			new_usuario = docente()
			new_usuario.foto = request.FILES['foto']
		else:
			new_usuario = administrador()
		
		new_usuario.nombres = request.POST['nombres']
		new_usuario.apellidos = request.POST['apellidos']
		new_usuario.correo = request.POST['correo']
		u = User.objects.create_user(username = request.POST['username'], password = request.POST['password'])
		u.save()

		if(request.POST['tipo_select'] == "Docente"):

			new_usuario.jornada = request.POST['jornada_select']
			if(request.POST['jornada_select'] == "Tarde" and request.POST['sede_select'] == "John F. Kennedy"):
				materias = ""
				for p in request.POST.getlist('curso_select_b'):
					materias = materias +', ' + str(p)

				materias = materias.lstrip(", ")
				print materias					
				
				new_usuario.curso = materias

			else:
				new_usuario.curso = request.POST['curso_select_c']
			new_usuario.user = u	
			new_usuario.sede = sede.objects.get(nombre = request.POST['sede_select'])
			new_usuario.save()
			
		else:
			new_usuario.tipo_usuario = request.POST['rol_select']
			if request.POST['rol_select'] == "Administrador General":
				u.is_superuser = True
				u.save()
			new_usuario.user = u
			new_usuario.save()

		return HttpResponseRedirect('/administracion')
	ctx = {'sedes' : sedes}

	return render_to_response('administracion/admin_usuario.html', ctx, context_instance=RequestContext(request))

def add_alumno_view(request):
	if request.method == "POST":
		identificacion = request.POST['identificacion']
		#abrir el archivo excel
		document = openpyxl.load_workbook('%s/Libro1.xlsx' % MEDIA_ROOT)
		#acceder a una hoja del documento
		hoja = document.get_sheet_by_name('Hoja1')
		#recorre la columna 1 y la fila es una variable que aumenta 
		row = 1
		#el ciclo for se cierra cuando encuentra un campo con valor None osea vacio
		for valor in range(100):
			num_identificacion = hoja.cell(row = row, column = 1).value
			#si encuentra que las identificacion son iguales entra a la siguiente condicion
			print num_identificacion
			if num_identificacion == long(identificacion):
				if hoja.cell(row = row, column = 4).value == None:	
					u = User.objects.create_user(username = request.POST['username'], password=request.POST['password'])
					u.save()
					new_estudiante = estudiante()	
					new_estudiante.user = u
					new_estudiante.correo = request.POST['email']
					new_estudiante.nombres = hoja.cell(row = row, column = 2).value
					new_estudiante.apellidos = hoja.cell(row = row, column = 4).value
					new_estudiante.grado = "Noveno"
					break
				else:
					break
			if hoja.cell(row = row + 1 , column = 1).value == None:
				break
			else:
				row = row + 1
		return HttpResponseRedirect('/add_estudiante')
	return render_to_response('administracion/registro_estudiante.html', context_instance=RequestContext(request))	

	
#CRUD INSTITUCION
def add_institucion_view(request):

	if request.method == "POST":
		u = User.objects.create_user(username = request.POST['username'], password = request.POST['password'])
		u.is_superuser  = True
		u.save()
		new_funcionario = funcionario()
		new_funcionario.nombres = request.POST['nombre_rector']
		new_funcionario.apellidos = request.POST['apellidos_rector']
		new_funcionario.foto = request.FILES['foto']
		new_funcionario.correo = request.POST['correo']
		new_funcionario.tipo_funcionario = "Rector"
		new_funcionario.user = u 
		new_funcionario.save()
		new_institucion = institucion()
		new_institucion.rector = new_funcionario
		new_institucion.nombre = request.POST['nombre']
		new_institucion.save()
		return HttpResponseRedirect('/institucion')
	return render_to_response('administracion/admin_institucion.html', context_instance=RequestContext(request))

def add_sede_view(request):

	if request.method=="POST":
		new_sede = sede()
		new_sede.nombre = request.POST['nombre']
		new_sede.nit = request.POST['nit']
		new_sede.telefono_1 = request.POST['telefono_1']
		new_sede.telefono_2 = request.POST['telefono_2']
		new_sede.direccion = request.POST['direccion']
		new_sede.correo = request.POST['correo']
		new_sede.save()
		return HttpResponseRedirect('/lista_sedes')

	return render_to_response('administracion/admin_sede.html', context_instance=RequestContext(request))

def add_coordinador_view(request, jornada):
	
	if request.method == "POST":
		coordinador = funcionario()
		coordinador.nombres = request.POST['nombres_a']
		coordinador.apellidos = request.POST['apellidos_a']
		coordinador.correo = request.POST['correo_c']
		coordinador.tipo_funcionario = "Coordinador"
		coordinador.foto = request.FILES['foto_c']
		coordinador.jornada = jornada
		u = User.objects.create_user(username = request.POST['username'], password = request.POST['password'])
		u.save()
		coordinador.user = u 
		coordinador.save()

	return None











