from django.db import models
from web_jfk.apps.administracion.models import sede

# Create your models here.
class grado(models.Model):

	nombre			= models.CharField(max_length = 20)
	def __unicode__(self):
		return self.nombre

class jornada(models.Model):

	nombre			= models.CharField(max_length = 20)
	def __unicode__(self):
		return self.nombre

class genero(models.Model):

	nombre			= models.CharField(max_length = 20)
	def __unicode__(self):
		return self.nombre

class tipo_documento(models.Model):

	nombre			= models.CharField(max_length = 20)
	def __unicode__(self):
		return self.nombre

class acudiente(models.Model):
	tipo_documento	= models.ForeignKey(tipo_documento)
	identificacion	= models.CharField(max_length = 15, primary_key = True)
	dept_expedicion	= models.CharField(max_length = 15)
	munic_expedicion= models.CharField(max_length = 15)
	nombres 		= models.CharField(max_length = 50)
	apellidos 		= models.CharField(max_length = 50)
	direccion 		= models.CharField(max_length = 50)
	dept_residencia	= models.CharField(max_length = 50)
	munic_residencia= models.CharField(max_length = 50)
	telefono_1		= models.CharField(max_length = 50)
	telefono_2		= models.CharField(max_length = 50)
	
	def __unicode__(self):
		return self.nombres + str(" ") + self.apellidos

class matricula_estudiante(models.Model):

	tipo_documento	= models.ForeignKey(tipo_documento)
	identificacion	= models.CharField(max_length = 15, primary_key = True)
	dept_expedicion	= models.CharField(max_length = 15)
	munic_expedicion= models.CharField(max_length = 15)
	nombres 		= models.CharField(max_length = 50)
	apellidos 		= models.CharField(max_length = 50)
	fecha_nacimiento= models.DateField()
	dept_nacimiento	= models.CharField(max_length = 50)
	munic_nacimiento= models.CharField(max_length = 50)
	genero 			= models.ForeignKey(genero)
	sede			= models.ForeignKey(sede)
	jornada 		= models.ForeignKey(jornada)
	grado			= models.ForeignKey(grado)
	direccion		=models.CharField(max_length = 50)
	dept_residencia	= models.CharField(max_length = 50)
	munic_residencia= models.CharField(max_length = 50)
	acudiente		= models.ForeignKey(acudiente)

	def __unicode__(self):
		return self.nombres + str(" ") + self.apellidos