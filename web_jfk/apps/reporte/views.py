from django.shortcuts import render_to_response
from django.template import RequestContext
from web_jfk.apps.administracion.models import *
from django.http import HttpResponse
from io import BytesIO
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4, cm
from reportlab.lib.styles import getSampleStyleSheet, TA_CENTER
from reportlab.platypus import Paragraph, Table, TableStyle
from reportlab.lib import colors
from datetime import date
from web_jfk.settings import *
import os
# -*- coding: uft-8 -*-


def reporte_view(request,id):
	
	try:
		reporte = oferta_educativa.objects.get(id = id)
		inscripciones = inscripcion.objects.filter(oferta__id = id)
		
	except oferta_educativa.DoesNotExist:
		reporte = []
		inscripciones = []
	ctx = {'reporte':reporte, 'inscripciones':inscripciones}
	
	return render_to_response('reporte/reporte.html',ctx, context_instance = RequestContext(request))

def generar_pdf(request, id):

	response = HttpResponse(content_type='application/pdf')
	response['Content-Disposition'] = 'attachment; filename = Reporte-inscripciones.pdf'

	buffer = BytesIO()
	c = canvas.Canvas(buffer, pagesize=A4)
	
	#Header
	
	def report_hearder():
		c.setLineWidth(.3)
		c.setFont('Helvetica', 18)
		c.drawString(160,800,'INSTITUCION EDUCATIVA JOHN F. KENNEDY')	
		c.setFont('Helvetica-Bold', 12)
		c.drawString(190,785, 'Aprobada Segun Resolucion No. 2325 de Nov. 6 de 2009')
		c.setFont('Helvetica-Bold', 12)
		c.drawString(215,770, 'DANE: 119001004023     Nit. No. 800137367-9')
		c.setFont('Helvetica', 10)
		c.drawString(220,755, 'Carrera 18  No. 7  32    Telefonos: 8373043-8373044')
		c.setFont('Helvetica', 10)
		c.drawString(310,740, 'POPAYAN')
		c.drawImage('%s/images/escudo.jpg' % MEDIA_ROOT,20,700,110,130)
		c.setFont('Helvetica-Bold',14)
		c.drawString(200,700, 'Reporte de inscripciones')
	
	report_hearder()	

	#Table Header
	def my_table():
		styles = getSampleStyleSheet()
		styleBH = styles["Normal"]
		styleBH.alignment = TA_CENTER
		styleBH.fontSize = 10

		numero = Paragraph('''No.''',styleBH)
		apellidos = Paragraph('''Apellidos''',styleBH)
		nombres = Paragraph('''Nombres''',styleBH)
		edad = Paragraph('''Edad''',styleBH)
		identificacion = Paragraph('''Identificacion''',styleBH)
		nombres_familiar = Paragraph('''Nombres y Apellidos del Familiar''',styleBH)
		telefono = Paragraph('''Telefono''',styleBH)
		#TABLE
		styleN = styles['BodyText']
		styleN.alignment = TA_CENTER
		styleN.fontSize = 7
		data = []
		data.append([numero,apellidos,nombres,edad,identificacion,nombres_familiar,telefono])
		return data

	def table_size(data, high):
		report_hearder()
		#TABLE SIZE
		width, height = A4
		table = Table(data, colWidths = [1*cm, 3.5*cm, 3.5*cm, 1.1*cm, 2.9*cm, 5.6*cm, 2.6*cm])
		table.setStyle(TableStyle([#estilos de la tabla
			('INNERGRID',(0,0),(-1,-1), 0.25, colors.black),
			('BOX',(0,0),(-1,-1), 0.25, colors.black),]))
		#pdf size
		table.wrapOn(c, width, height)
		table.drawOn(c, 10, high)
		c.showPage()
		return my_table()
		
		
	#QUERY
	
	reporte = oferta_educativa.objects.get(id = id)
	inscripciones = inscripcion.objects.filter(oferta__id = id)
	high = 650
	number = 0
	data = my_table()
	bandera = True
	
	for p in inscripciones:
		bandera = True
		number = number + 1
		nombres = p.nombres + " " + p.apellidos
		this_p = [number,p.apellidos_alumno,p.nombres_alumno, p.edad, p.identificacion, nombres[0:32] , p.telefono_1]
		data.append(this_p)
		high = high - 18
		if (high == 56):
			data = table_size(data, high)
			high = 650
			bandera = False

	if bandera:
		table_size(data, high)
	c.save()
	pdf = buffer.getvalue()
	buffer.close()
	response.write(pdf) 	


	return response

