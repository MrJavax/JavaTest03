<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<sb:head />
<sj:head jqueryui="true" jquerytheme="smoothness"/>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e){
    $('[data-toggle="tooltip"]').tooltip();
    
});
</script>
</head>
<body>
<ul class="nav nav-tabs">
  <li role="presentation" ><a href="#">Home</a></li>
  <li role="presentation" ><a href="Registro.jsp">Productos</a></li>
  <li role="presentation" class="active"><s:a action="listarProductos" >Ver Productos</s:a></li>
</ul>
<div id="msg">
<s:actionmessage theme="jquery"/>
<s:actionerror theme="jquery"/>
</div>
<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<h1>Lista de Productos</h1>
			<p><br/></p>
			<s:form action="filtrar">
				<s:label>Categoría :</s:label>
				<s:textfield name="pro.categoria" cssStyle="height: 30px; margin-top: 10px;" placeholder="Ingrese una categoría" />
				<s:submit cssClass="btn btn-primary" value="Filtrar" />
			</s:form>
			<table class="table table-hover table-bordered" id="tbl-Productos">
				<thead>
					<tr class="active">
						<th>Cod. Producto</th>
						<th>Nombre</th>
						<th>Precio</th>
						<th>Categoría</th>
						<th>Cantidad</th>
						<th>Fecha</th>
						<th colspan="2">Acciones</th>
					</tr>
				</thead>
				<s:if test="listaPro.size() > 0">
				<s:iterator value="listaPro" >
				<s:url var="idEliminar" action="eliminarProducto">
					<s:param name="pro.codigo" value="codigo" />
				</s:url>
				<s:url var="idEditar" action="buscarProducto">
					<s:param name="pro.codigo" value="codigo" />
				</s:url>
				<tbody>
					<tr>
						<td><s:property value="codigo"/></td>
						<td><s:property value="nombre"/></td>
						<td><s:property value="precio"/></td>
						<td><s:property value="categoria"/></td>
						<td><s:property value="stock"/></td>
						<td><s:property value="fecha"/></td>
						<td><s:a href="%{idEliminar}" onclick="return alert('Está seguro?')"><button class="btn btn-default" data-placement="bottom" data-toggle="tooltip" title="Eliminar"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button></s:a></td>
						<td><s:a href="%{idEditar}"><button id="btn" type="button" class="btn btn-default" data-placement="bottom" data-toggle="tooltip" title="Modificar"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></s:a></td>
					</tr>
				</tbody>
				</s:iterator>
				</s:if>
				<s:else>
					<tbody>
					<tr>
						<td colspan="8"><span style="margin-left: 480px;">No se encontró datos</span></td>
					</tr>
				</tbody>
				</s:else>
			</table>
		</div>
	</div>
</div>
</body>
</html>