$(document).ready(function(){
    
    $(".crear_coordinador").click(function(e) {
        e.preventDefault();
        var data = $(this).attr("data-valor");
        document.getElementById("form_coordinador").action="/crear_coordinador/"+ data + "/";  
    });
 
});


function validar_coordinador(){

	retorno = true;
	var	campo = document.getElementById('nombres_a').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_nombres_a').addClass('has-error');
	}else{
		$('#group_nombres_a').removeClass('has-error');
	}
	campo = document.getElementById('imagen').value;
	if(campo.length == 0){
		retorno = false;
		$('#group_img').addClass('has-error');
	}else{
		$('#group_img').removeClass('has-error');
	}
	campo = document.getElementById('apellidos_a').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_apellidos_a').addClass('has-error');
	}
	else{
		$('#group_apellidos_a').removeClass('has-error');
	}
	campo = document.getElementById('correo_coor').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_correo_coor').addClass('has-error');
	}
	else{
		$('#group_correo_coor').removeClass('has-error');
	}
	campo = document.getElementById('username').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_username').addClass('has-error');
	}
	else{
		$('#group_username').removeClass('has-error');
	}
	campo = document.getElementById('password').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_password').addClass('has-error');
	}
	else{
		$('#group_password').removeClass('has-error');
	}
	campo = document.getElementById('password_conf').value.trim();
	if(campo.length != 0){
		if(campo !== document.getElementById('password').value.trim()){
			retorno = false;
			$('#group_password').addClass('has-error');
			$('#group_password_conf').addClass('has-error');
			$("#alerta_pass").show();
			document.getElementById('password').value = "";
			document.getElementById('password_conf').value = "";
		}else{
			$('#group_password_conf').removeClass('has-error');
			$('#group_password').removeClass('has-error');
			$("#alerta_pass").hide();

		}
	}
	else{
		$('#group_password_conf').addClass('has-error');
	}
	

	if(retorno == false){
		$("#alerta").show();
	}
	if(retorno == true){
		registro_cooridnador();
	}
	return retorno;
}



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
	campo = document.getElementById('subtitulo').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_subtitulo').addClass('has-error');
	}
	else{
		$('#group_subtitulo').removeClass('has-error');
	}
	campo = document.getElementById('cuerpo').value.trim();
	if(campo.length == 0){
		retorno = false;
		$('#group_cuerpo').addClass('has-error');
	}
	else{
		$('#group_cuerpo').removeClass('has-error');
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
	var campo = document.getElementById('nombres_a').value;
	if(campo.length == 0){
		retorno = false;
		$('#group_nombres_a').addClass('has-error');
	}
	else{
		$('#group_nombres_a').removeClass('has-error');
	}

	campo = document.getElementById('apellidos_a').value;
	if(campo.length == 0){
		retorno = false;
		$('#group_apellidos_a').addClass('has-error');
	}
	else{
		$('#group_apellidos_a').removeClass('has-error');
	}

	campo = document.getElementById('edad').value;
	var campo_aux = campo.toString().trim();
	if(!/^([0-9])*$/.test(campo) || campo_aux.length == 0){
		retorno = false;
		$('#group_edad').addClass('has-error');
	}
	else{
		$('#group_edad').removeClass('has-error');
	}

	campo = document.getElementById('identificacion').value;
	campo_aux = campo.toString().trim();
	if(!/^([0-9])*$/.test(campo) || campo_aux.length == 0){
		retorno = false;
		$('#group_identificacion').addClass('has-error');
	}
	else{
		$('#group_identificacion').removeClass('has-error');
	}
	campo = document.getElementById('nombres').value;
	if(campo.length == 0){
		retorno = false;
		$('#group_nombres').addClass('has-error');
	}
	else{
		$('#group_nombres').removeClass('has-error');
	}
	campo = document.getElementById('apellidos').value;
	if(campo.length == 0){
		retorno = false;
		$('#group_apellidos').addClass('has-error');
	}
	else{
		$('#group_apellidos').removeClass('has-error');
	}
	campo = document.getElementById('telefono').value;
	campo_aux = campo.toString().trim();
	if(!/^([0-9])*$/.test(campo) || campo_aux.length == 0){
		retorno = false;
		$('#group_telefono').addClass('has-error');
	}
	else{
		$('#group_telefono').removeClass('has-error');
	}
	campo = document.getElementById('celular').value;
	campo_aux = campo.toString().trim();
	if(!/^([0-9])*$/.test(campo) || campo_aux.length == 0){
		retorno = false;
		$('#group_celular').addClass('has-error');
	}
	else{
		$('#group_celular').removeClass('has-error');
	}
	campo = document.getElementById('direccion').value;
	if(campo.length == 0){
		retorno = false;
		$('#group_direccion').addClass('has-error');
	}
	else{
		$('#group_direccion').removeClass('has-error');
	}
	campo = document.getElementById('barrio').value;
	if(campo.length == 0){
		retorno = false;
		$('#group_barrio').addClass('has-error');
	}
	else{
		$('#group_barrio').removeClass('has-error');
	}
	if(retorno == false){
		$("#alerta").show();
	}
	
	return retorno;
}

