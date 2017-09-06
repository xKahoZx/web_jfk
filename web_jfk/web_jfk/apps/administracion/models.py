from django.db import models
from django.contrib.auth.models import User


class noticia(models.Model):

	def url(self,filename):
		ruta = "MultimediaData/noticias/%s_%s.jpg"%(str(self.titulo), str(self.fecha) )
		return ruta

	titulo			= models.CharField(max_length = 200)
	subtitulo		= models.TextField(max_length = 2000)
	cuerpo			= models.TextField(max_length = 10000)	
	fecha			= models.DateField()	
	imagen 			= models.ImageField(upload_to = url , blank = True, null = True)
	autor			= models.CharField(max_length = 50)
	estado			= models.BooleanField(default = True)
	def __unicode__(self):
		return self.titulo

class album(models.Model):

	titulo 			= models.CharField(max_length = 200)
	descripcion		= models.TextField(max_length = 1000)
	estado 			= models.BooleanField(default = True)
	def __unicode__(self):
		return self.titulo

class imagen_album(models.Model):

	def url(self,filename):
		ruta = "MultimediaData/album/%s"%(str(filename))
		return ruta
	imagen 			= models.ImageField(upload_to = url)	
	album 			= models.ForeignKey(album, related_name="imagenes")
	def __unicode__(self):
		return str(self.id)

class slider_show(models.Model):

	def url(self,filename):
		ruta = "MultimediaData/slider/%s"%(str(filename))
		return ruta

	imagen 			= models.ImageField(upload_to = url)
	estado			= models.BooleanField(default = True)

class calendario_eventos(models.Model):

	def url(self,filename):
		ruta = "MultimediaData/calendario/%s.jpg"%(str(self.titulo))
		return ruta
	titulo 			= models.CharField(max_length = 100)
	imagen 			= models.ImageField(upload_to = url)
	descripcion 	= models.TextField(max_length = 500)
	fecha 			= models.DateField()
	estado			= models.BooleanField(default = True)
	anio 			= models.CharField(max_length = 4)
	def __unicode__(self):
		return self.titulo


class documento(models.Model):

	def url(self,filename):
		ruta = "MultimediaData/documentos/%s"%(filename)
		return ruta
	
	titulo			= models.CharField(max_length = 100)
	documento		= models.FileField(upload_to = url)
	materia 		= models.CharField(max_length = 20)
	grado 			= models.CharField(max_length = 20)
	fecha 			= models.DateField()
	descripcion		= models.TextField(max_length = 5000)
	autor			= models.ForeignKey(User)

	def __unicode__(self):
		return self.titulo

class persona(models.Model):
	def url(self,filename):
		ruta = "MultimediaData/persona/%s"%(filename)
		return ruta

	nombres 		= models.CharField(max_length = 100)
	apellidos 		= models.CharField(max_length = 100)
	foto 			= models.ImageField(upload_to = url, blank = True)
	correo 			= models.CharField(max_length = 100)
	user 			= models.OneToOneField(User, blank = True, null = True) 
	class Meta:
		abstract = True

class estudiante(persona):
	identificacion	= models.CharField(max_length = 100, unique = True)
	grado 			= models.CharField(max_length = 100)
	def __unicode__(self):
		return self.nombres + str(" ") + self.apellidos

class funcionario(persona):

	jornada 		= models.CharField(max_length = 100, blank = True)
	tipo_funcionario= models.CharField(max_length = 100)	
	def __unicode__(self):
		return self.nombres + str(" ") + self.apellidos


class administrador(persona):
	tipo_usuario	= models.CharField(max_length = 100)
	def __unicode__(self):
		return self.nombres + str(" ") + self.apellidos

class institucion(models.Model):
	
	def url(self,filename):
		ruta = "MultimediaData/escudo/%s.jpg"%(str(self.nombre) )
		return ruta
	
	rector 			= models.OneToOneField(funcionario)
	nombre 			= models.CharField(max_length = 100)
	escudo			= models.ImageField(upload_to = url )
	def __unicode__(self):
		return self.nombre

class sede(models.Model):

	coordinadores	= models.ManyToManyField(funcionario)
	nombre 			= models.CharField(max_length = 100)
	nit 			= models.CharField(max_length = 100)
	telefono_1 		= models.CharField(max_length = 10)
	telefono_2 		= models.CharField(max_length = 10)
	direccion 		= models.CharField(max_length = 100)
	correo			= models.CharField(max_length = 100)
	institucion 	= models.ForeignKey(institucion)
	def __unicode__(self):
		return self.nombre

class docente(persona):

	curso 			= models.CharField(max_length = 100)
	jornada 		= models.CharField(max_length = 100)
	sede 			= models.ForeignKey(sede)
	def __unicode__(self):
		return self.nombres + str(" ") + self.apellidos


		
class oferta_educativa(models.Model):
	
	fecha_apertura	  = models.DateField()
	fecha_cierre	  = models.DateField()
	estado			  = models.BooleanField(default = True)
	nivel			  = models.CharField(max_length = 100)
	grado			  = models.CharField(max_length = 100)
	cupos			  = models.IntegerField()
	cupos_disponibles = models.IntegerField()
	jornada			  = models.CharField(max_length = 10)
	sede 			  = models.ForeignKey(sede)

	def __unicode__(self):
		return self.sede + " " + self.nivel + " Grado " + self.grado + " " + self.jornada

class inscripcion(models.Model):

	nombres_alumno  = models.CharField(max_length = 50)
	apellidos_alumno= models.CharField(max_length = 50)
	edad			= models.CharField(max_length = 2)
	nombres			= models.CharField(max_length = 50)
	apellidos		= models.CharField(max_length = 50)
	identificacion	= models.CharField(max_length = 15)
	telefono_1		= models.CharField(max_length = 15)
	telefono_2		= models.CharField(max_length = 15, blank = True)
	direccion		= models.CharField(max_length = 50)
	barrio			= models.CharField(max_length = 50)
	fecha_inscripcion= models.DateField()
	oferta 			= models.ForeignKey(oferta_educativa)
	
	def __unicode__(self):
		return self.nombres