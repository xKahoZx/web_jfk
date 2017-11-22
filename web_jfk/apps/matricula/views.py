# Create your views here.
from django.shortcuts import render_to_response
from django.template import RequestContext
from web_jfk.apps.matricula.models import *
from web_jfk.apps.administracion.models import sede
from django.contrib.auth.models import User
from django.http import HttpResponse, HttpResponseRedirect

def matricula_view(request):
	grados = grado.objects.all()
	sedes  = sede.objects.all()
	jornadas = jornada.objects.all()
	tipos = tipo_documento.objects.all()
	generos = genero.objects.all()
	if request.method == "POST":
		#datos del estudiante
		nuevo_estudiante = matricula_estudiante()
		nuevo_estudiante.tipo_documento = tipo_documento.objects.get(id = request.POST['tipo_documento'])
		nuevo_estudiante.identificacion = request.POST['identificacion']
		nuevo_estudiante.dept_expedicion = request.POST['dept_expedicion']
		nuevo_estudiante.munic_expedicion = request.POST['munic_expedicion']
		nuevo_estudiante.nombres = request.POST['nombres']
		nuevo_estudiante.apellidos = request.POST['apellidos']
		nuevo_estudiante.fecha_nacimiento = request.POST['fecha_nacimiento']
		nuevo_estudiante.dept_nacimiento = request.POST['dept_nacimiento']
		nuevo_estudiante.munic_nacimiento = request.POST['munic_nacimiento']
		nuevo_estudiante.genero = genero.objects.get(id = request.POST['genero'])
		nuevo_estudiante.sede = sede.objects.get(id = request.POST['sede'])
		nuevo_estudiante.jornada = jornada.objects.get(id = request.POST['jornada'])
		nuevo_estudiante.grado = grado.objects.get (id = request.POST['grado'])
		nuevo_estudiante.direccion = request.POST['direccion']
		nuevo_estudiante.dept_residencia = request.POST['dept_residencia']
		nuevo_estudiante.munic_residencia = request.POST['munic_residencia']
		#datos del acudiente
		nuevo_acudiente = acudiente()
		nuevo_acudiente.tipo_documento = tipo_documento.objects.get(id =  request.POST['tipo_documento_acudiente'])
		nuevo_acudiente.identificacion = request.POST['identificacion_acudiente']
		nuevo_acudiente.dept_expedicion = request.POST['dept_expedicion_acudiente']
		nuevo_acudiente.munic_expedicion = request.POST['munic_expedicion_acudiente']
		nuevo_acudiente.nombres = request.POST['nombres_acudiente']
		nuevo_acudiente.apellidos = request.POST['apellidos_acudiente']
		nuevo_acudiente.direccion = request.POST['direccion_acudiente']
		nuevo_acudiente.dept_residencia = request.POST['dept_residencia_acudiente']
		nuevo_acudiente.munic_residencia = request.POST['munic_residencia_acudiente']
		nuevo_acudiente.telefono_1 = request.POST['telefono_1']
		nuevo_acudiente.telefono_2 = request.POST['telefono_2']
		nuevo_acudiente.save()
		nuevo_estudiante.acudiente = nuevo_acudiente
		nuevo_estudiante.save()
		return HttpResponseRedirect('/lista_matriculas')
	ctx = {'generos':generos, 'grados':grados, 'tipos':tipos, 'sedes':sedes, 'jornadas':jornadas}
	return render_to_response('matricula/crear_matricula.html',ctx, context_instance = RequestContext(request))


def lista_matriculas_view(request):

	ctx = {'lista':matricula_estudiante.objects.all()}

	return render_to_response('matricula/lista_matriculas.html', ctx, context_instance = RequestContext(request))