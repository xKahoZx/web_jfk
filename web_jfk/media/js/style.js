$(document).ready(function(){
    
    $(".crear_coordinador").click(function(e) {
        e.preventDefault();
        var data = $(this).attr("data-valor");
        document.getElementById("form_coordinador").action="/crear_coordinador/"+ data + "/";  
    });
 
});


$(document).ready(function(){
    
    $(".click").click(function(e) {
        e.preventDefault();
        var data = $(this).attr("data-valor");
        document.getElementById("form").action="/register-offer/"+ data + "/";  
    });
 
});

function hide_forms() {
	$("#group_nombres").hide();
	$("#group_apellidos").hide();
	$("#group_sede").hide();
	$("#group_jornada").hide();
	$("#group_curso_a").hide();
	$("#group_curso_b").hide();
	$("#group_curso_c").hide();
	$("#group_correo").hide();
	$("#group_img").hide();
	$("#group_btn").hide();
	$("#group_rol").hide();
	$("#group_username").hide();
	$("#group_password").hide();
	$("#group_password_conf").hide();
	document.getElementById("jornada_docente").selectedIndex = 0;
	document.getElementById("sede_docente").selectedIndex = 0;
}

$(document).ready(function(){
	$("#tipo_persona").change(function(){
		hide_forms();
		var select = $("#tipo_persona").val();
		if (select == "Docente"){
			$("#group_nombres").show();
			$("#group_apellidos").show();
			$("#group_sede").show();
			$("#group_jornada").show();
			$("#group_curso_a").show();
			$("#group_correo").show();
			$("#group_img").show();
			$("#group_username").show();
			$("#group_password").show();
			$("#group_password_conf").show();
		}
		
		if (select == "Administrador"){
			$("#group_nombres").show();
			$("#group_apellidos").show();
			$("#group_rol").show();
			$("#group_username").show();
			$("#group_password").show();
			$("#group_password_conf").show();
			$("#group_correo").show();
		}
		if (select != "0"){
			$("#group_btn").show();
		}
		if (select == "0") {
			hide_forms();
		}
	});
});

$(document).ready(function(){
	$("#jornada_docente").change(function(){
		if ($("#jornada_docente").val() == "Tarde" && $("#sede_docente").val() == "John F. Kennedy"){
			$("#group_curso_a").hide();
			$("#group_curso_c").hide();
			$("#group_curso_b").show();
		}else{
			if(($("#jornada_docente").val() != "0" && $("#sede_docente").val() != "0")){
				$("#group_curso_a").hide();
				$("#group_curso_b").hide();
				$("#group_curso_c").show();	
							
			}

		}
		if($("#jornada_docente").val() == "0"){
			$("#group_curso_a").show();
			$("#group_curso_b").hide();
			$("#group_curso_c").hide();
		}
	
	});
});

$(document).ready(function(){
	$("#sede_docente").change(function(){
		document.getElementById("jornada_docente").selectedIndex = "0";
		$("#group_curso_a").show();
		$("#group_curso_b").hide();
		$("#group_curso_c").hide();
		
	});
});


$(document).ready(function(){
	$("#jornada").change(function(){
		if ($("#jornada").val() == "Tarde"){
			var html =  
				"<option value='0'>--- Seleccione el grado escolar de la oferta ---</option>" +
				"<option value='Preescolar'>Preescolar</option>" 
				
			$('#curso').html(html);
		}
	});
});

$(document).ready(function(){
	$("#tipo").change(function(){
		document.getElementById("grado").selectedIndex = 0;
		if ($("#tipo").val() == "Preescolar"){
			var html =  
				"<option value='0'>--- Seleccione el grado escolar de la oferta ---</option>" +
				"<option value='Preescolar'>Preescolar</option>" 
				
			$('#grado').html(html);
		}
		if ($("#tipo").val() == "Basica Primaria"){
			var html = 
				"<option value='0'>--- Seleccione el grado escolar de la oferta ---</option>" +
				"<option value='Primero'>Primero</option>" + 
				"<option value='Segundo'>Segundo</option>" + 
				"<option value='Tercero'>Tercero</option>" + 
				"<option value='Cuarto'>Cuarto</option>" + 
				"<option value='Quinto'>Quinto</option>"
			$('#grado').html(html);
		}
		if ($("#tipo").val() == "Basica Secundaria"){
			var html = 			 
				"<option value='0'>--- Seleccione el grado escolar de la oferta ---</option>" +
				"<option value='Sexto'>Sexto</option>" + 
				"<option value='Septimo'>Septimo</option>" + 
				"<option value='Octavo'>Octavo</option>" + 
				"<option value='Noveno'>Noveno</option>" 
			$('#grado').html(html);
		}
		if ($("#tipo").val() == "Educacion Media"){
			var html = 
				"<option value='0'>--- Seleccione el grado escolar de la oferta ---</option>" +
				"<option value='Decimo'>Decimo</option>" + 
				"<option value='Once'>Once</option>" 				
								
			$('#grado').html(html);
		}
		if ($("#tipo").val() == "0"){

			$('#grado').html("<option value='0'>--- Seleccione el grado escolar de la oferta ---</option>" );		
		}
	});
});

$(document).ready(function(){
	$("#sede").change(function(){
		document.getElementById("tipo").selectedIndex = 0;		
		if ($("#sede").val() == "John F. Kennedy"){
			if($("#jornada").val() == "Mañana"){
				document.getElementById("pree").disabled = false;
				document.getElementById("pri").disabled = false;
				document.getElementById("sec").disabled = true;
				document.getElementById("med").disabled = true;
			}else{
				document.getElementById("pree").disabled = true;
				document.getElementById("pri").disabled = true;
				document.getElementById("sec").disabled = false;
				document.getElementById("med").disabled = false;
			}

		}
		if ($("#sede").val() == "Jose Maria Obando"){
			document.getElementById("pree").disabled = false;
			document.getElementById("pri").disabled = false;
			document.getElementById("sec").disabled = true;
			document.getElementById("med").disabled = true;
		}
		if ($("#sede").val() == "Nueva Esperanza"){
			document.getElementById("pree").disabled = false;
			document.getElementById("pri").disabled = false;
			document.getElementById("sec").disabled = true;
			document.getElementById("med").disabled = true;
		}
	});
});	


$(document).ready(function(){
	$("#jornada").change(function(){
		document.getElementById("sede").selectedIndex = 0;
		if ($("#jornada").val() == "Mañana"){
			document.getElementById("jfk").disabled = false;
			document.getElementById("jmo").disabled = false;
			document.getElementById("ne").disabled = false;

		} 
		if ($("#jornada").val() == "0"){
			document.getElementById("jfk").disabled = true;
			document.getElementById("jmo").disabled = true;
			document.getElementById("ne").disabled = true;

		}	
		if ($("#jornada").val() == "Tarde"){
			document.getElementById("jfk").disabled = false;
			document.getElementById("jmo").disabled = false;
			document.getElementById("ne").disabled = true;

		}	
	});
});


function validar_noticia(){

	retorno = true;
	var campo = document.getElementById('imagen').value;
	if(document.getElementById('indicador').innerHTML == "Agregar Nueva Noticia"){	
		if(campo.length == 0){
			retorno = false;
			$('#group_img').addClass('has-error');
		}
		else{
			$('#group_img').removeClass('has-error');
		}
	}
	campo = document.getElementById('titulo').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_titulo').addClass('has-error');
	}else{
		$('#group_titulo').removeClass('has-error');
	}
	campo = document.getElementById('copete').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_subtitulo').addClass('has-error');
	}
	else{
		$('#group_subtitulo').removeClass('has-error');
	}
	campo = document.getElementById('cuerpo').value.trim();
	if(campo.length < 792){
		retorno = false;
		$('#group_cuerpo').addClass('has-error');
		$('.help').show();
	}
	else{
		$('#group_cuerpo').removeClass('has-error');
		$('.help').hide();
	}
	campo = document.getElementById('autor').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_autor').addClass('has-error');
	}
	else{
		$('#group_autor').removeClass('has-error');
	}
	
	if(retorno == false){
		$(".alerta").show();
	}
	
	return retorno;
}

function validar_registro(){

	retorno = true;
	var campo = document.getElementById('nombres_a').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_nombres_a').addClass('has-error');
	}
	else{
		$('#group_nombres_a').removeClass('has-error');
	}

	campo = document.getElementById('apellidos_a').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_apellidos_a').addClass('has-error');
	}
	else{
		$('#group_apellidos_a').removeClass('has-error');
	}

	campo = document.getElementById('edad').value.trim();
	var campo_aux = campo.toString().trim();
	if(!/^([0-9])*$/.test(campo) || campo_aux.length == 0){
		retorno = false;
		$('#group_edad').addClass('has-error');
	}
	else{
		$('#group_edad').removeClass('has-error');
	}

	campo = document.getElementById('identificacion').value.trim();
	campo_aux = campo.toString().trim();
	if(!/^([0-9])*$/.test(campo) || campo_aux.length == 0){
		retorno = false;
		$('#group_identificacion').addClass('has-error');
	}
	else{
		$('#group_identificacion').removeClass('has-error');
	}
	campo = document.getElementById('nombres').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_nombres').addClass('has-error');
	}
	else{
		$('#group_nombres').removeClass('has-error');
	}
	campo = document.getElementById('apellidos').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_apellidos').addClass('has-error');
	}
	else{
		$('#group_apellidos').removeClass('has-error');
	}
	campo = document.getElementById('telefono').value.trim();
	campo_aux = campo.toString().trim();
	if(!/^([0-9])*$/.test(campo) || campo_aux.length == 0){
		retorno = false;
		$('#group_telefono').addClass('has-error');
	}
	else{
		$('#group_telefono').removeClass('has-error');
	}
	campo = document.getElementById('celular').value.trim();
	campo_aux = campo.toString().trim();
	if(!/^([0-9])*$/.test(campo) || campo_aux.length == 0){
		retorno = false;
		$('#group_celular').addClass('has-error');
	}
	else{
		$('#group_celular').removeClass('has-error');
	}
	
	if(retorno == false){
		$("#alerta").show();
	}
	
	return retorno;
}

function validar_img(){
	var retorno = true;
	var campo = document.getElementById('imagen').value;
	if(campo.length == 0){
		retorno = false;
		$('#group_img').addClass('has-error');
	}
	else{
		$('#group_img').removeClass('has-error');
	}
	if(retorno == false){
		$(".alerta").show();
	}
	return retorno;

}

function validar_album(){
	var retorno = true;
	var campo = document.getElementById('titulo').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_titulo').addClass('has-error');
	}
	else{
		$('#group_titulo').removeClass('has-error');
	}
	campo = document.getElementById('descripcion').value.trim();

	if(campo.length < 275){
		retorno = false;
		$('#group_descripcion').addClass('has-error');
		$('.help').show();
	}
	else{
		$('#group_descripcion').removeClass('has-error');
		$('.help').hide();

	}
	if(retorno == false){
		$(".alerta").show();
	}
	return retorno
}

function cuenta(){
	contar(document.getElementById('descripcion').value.trim());
	
}

function contar_noticia(){
	contar(document.getElementById('cuerpo').value.trim());
}

function contar(cadena ){
	$('#helpBlock2').html("Caracteres: " + cadena.length);
}

function validar_oferta(){
	var retorno = true;

	if(document.getElementById('jornada').value == '0'){
		retorno = false;
		$('#group_jornada').addClass('has-error');
	}else{
		$('#group_jornada').removeClass('has-error');
	}
	if(document.getElementById('sede').value == '0'){
		retorno = false;
		$('#group_sede').addClass('has-error')
	}else{
		$('#group_sede').removeClass('has-error')
	}
	if(document.getElementById('tipo').value == '0'){
		retorno = false;
		$('#group_nivel').addClass('has-error')
	}else{
		$('#group_nivel').removeClass('has-error')
	}
	if(document.getElementById('grado').value == '0'){
		retorno = false;
		$('#group_grado').addClass('has-error')
	}else{
		$('#group_grado').removeClass('has-error')
	}
	if(document.getElementById('cupos').value.trim() <= 0){
		retorno = false;
		$('#group_cupos').addClass('has-error')
	}else{
		$('#group_cupos').removeClass('has-error')
	}
	var bandera = true
	if (document.getElementById('inicio').value.length == 0){
		retorno = false;
		bandera = false;
		$('#group_inicio').addClass('has-error')
	}else{
		bandera = true;
		$('#group_inicio').removeClass('has-error')
	}
	if (document.getElementById('fin').value.length == 0){
		bandera = false;
		$('#group_fin').addClass('has-error')
	}else{
		bandera = true;
		$('#group_fin').removeClass('has-error')
	}
	if(bandera){
		if (document.getElementById('inicio').value > document.getElementById('fin').value){
			retorno = false
			$('#group_fin').addClass('has-error')
			$('.help').show();

		}else{
			$('#group_fin').removeClass('has-error')
			$('.help').hide();

		}

	}
	if(retorno == false){
		$(".alerta").show();
	}
	return retorno
}

function validar_evento(){
	var retorno = true;
	if(document.getElementById('titulo').value.trim().length == 0){
		retorno = false;
		$('#group_titulo').addClass('has-error');
	}else{
		$('#group_titulo').removeClass('has-error');
	}
	if(document.getElementById('descripcion').value.trim().length < 200){
		retorno = false;
		$('#group_descripcion').addClass('has-error');
		$('.help').show();
	}else{
		$('.help').hide();
		$('#group_descripcion').removeClass('has-error');
	}
	if(document.getElementById('fecha').value.trim().length == 0){
		retorno = false;
		$('#group_fecha').addClass('has-error');
	}else{
		$('#group_fecha').removeClass('has-error');
	}
	if(document.getElementById('indicador').innerHTML == "Crear nuevo evento"){	
		if(document.getElementById('imagen').value.trim().length == 0){
			retorno = false;
			$('#group_imagen').addClass('has-error');
		}else{
			$('#group_imagen').removeClass('has-error');
		}
	}
	return retorno;
}


function validar_usuario(){

	var retorno = true;
	if(document.getElementById('nombres').value.trim().length == 0){
		retorno = false;
		$('#group_nombres').addClass('has-error');
	}else{
		$('#group_nombres').removeClass('has-error');
	}
	if(document.getElementById('apellidos').value.trim().length == 0){
		retorno = false;
		$('#group_apellidos').addClass('has-error');
	}else{
		$('#group_apellidos').removeClass('has-error');
	}
	if(document.getElementById('correo').value.trim().length == 0){
		retorno = false;
		$('#group_correo').addClass('has-error');
	}else{
		$('#group_correo').removeClass('has-error');
	}
	if(document.getElementById('username').value.trim().length == 0){
		retorno = false;
		$('#group_username').addClass('has-error');
	}else{
		$('#group_username').removeClass('has-error');
	}
	var bandera = true;
	if(document.getElementById('password').value.trim().length == 0){
		retorno = false;
		bandera = false; 
		$('#group_password').addClass('has-error');
	}else{
		$('#group_password').removeClass('has-error');
	}
	if(document.getElementById('password_conf').value.trim().length == 0){
		retorno = false;
		bandera = false;
		$('#group_password_conf').addClass('has-error');
	}else{
		
		$('#group_password_conf').removeClass('has-error');
	}
	if(bandera){
		if(document.getElementById('password').value.trim() != document.getElementById('password_conf').value.trim()){
			$('#group_password_conf').addClass('has-error');
			$('#group_password').addClass('has-error');
			$('.help').show();
			document.getElementById('password').value = "";
			document.getElementById('password_conf').value = "";
			retorno = false;
		}else{
			$('#group_password_conf').removeClass('has-error');
			$('#group_password').removeClass('has-error');
			$('.help').hide();
		}
	}

	// validar campos unicos para docente
	if(document.getElementById('tipo_persona').value == 'Docente'){
		if(document.getElementById('sede_docente').value == '0'){
			retorno = false;
			$('#group_sede').addClass('has-error');
		}else{
			$('#group_sede').removeClass('has-error');
		}	
		if(document.getElementById('jornada_docente').value == '0'){
			retorno = false;
			$('#group_jornada').addClass('has-error');
		}else{
			$('#group_jornada').removeClass('has-error');
		}	
		if (document.getElementById('sede_docente').value == 'John F. Kennedy' && document.getElementById('jornada_docente').value == 'Tarde'){
			if(document.getElementById('curso_docente_b').value == '0'){
				retorno = false;
				$('#group_curso_b').addClass('has-error');
			}else{
				$('#group_curso_b').removeClass('has-error');
			}	
		}else{
			if(document.getElementById('curso_docente_c').value == '0'){
				retorno = false;
				$('#group_curso_c').addClass('has-error');
			}else{
				$('#group_curso_c').removeClass('has-error');
			}	
		}
		if(document.getElementById('imagen').value.trim().length == 0){
			retorno = false;
			$('#group_img').addClass('has-error');
		}else{
			$('#group_img').removeClass('has-error');
		}
	//validar campos para administrador
	}else{
		if(document.getElementById('rol_user').value == '0'){
			retorno = false;
			$('#group_rol').addClass('has-error');
		}else{
			$('#group_rol').removeClass('has-error');
		}	
	}
                  
	return retorno;
}

function validar_registro(){
	var retorno = true;
	if(document.getElementById('identificacion').value.trim().length ==0 ){
		retorno = false;
		$('#group_identificacion').addClass('has-error');
	}else{
		$('#group_identificacion').removeClass('has-error');
	}
	if(document.getElementById('email').value.trim().length ==0 ){
		retorno = false;
		$('#group_correo').addClass('has-error');
	}else{
		$('#group_correo').removeClass('has-error');
	}
	if(document.getElementById('email').value.trim().length ==0 ){
		retorno = false;
		$('#group_correo').addClass('has-error');
	}else{
		$('#group_correo').removeClass('has-error');
	}	
	if(document.getElementById('username').value.trim().length == 0){
		retorno = false;
		$('#group_username').addClass('has-error');
	}else{
		$('#group_username').removeClass('has-error');
	}	
	var bandera = true;
	if(document.getElementById('password').value.trim().length == 0){
		retorno = false;
		bandera = false; 
		$('#group_password').addClass('has-error');
	}else{
		$('#group_password').removeClass('has-error');
	}
	if(document.getElementById('password_conf').value.trim().length == 0){
		retorno = false;
		bandera = false;
		$('#group_password_conf').addClass('has-error');
	}else{
		
		$('#group_password_conf').removeClass('has-error');
	}
	if(bandera){
		if(document.getElementById('password').value.trim() != document.getElementById('password_conf').value.trim()){
			$('#group_password_conf').addClass('has-error');
			$('#group_password').addClass('has-error');
			$('.help').show();
			document.getElementById('password').value = "";
			document.getElementById('password_conf').value = "";
			retorno = false;
		}else{
			$('#group_password_conf').removeClass('has-error');
			$('#group_password').removeClass('has-error');
			$('.help').hide();
		}
	}

	return retorno
}