<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modificar Producto</title>
<sb:head />
<sj:head jqueryui="true" jquerytheme="smoothness" />
</head>
<body>
	<ul class="nav nav-tabs">
		<li role="presentation"><a href="#">Home</a></li>
		<li role="presentation" class="active"><a href="#">Productos</a></li>
		<li role="presentation"><s:a action="listarProductos">Ver Productos</s:a></li>
	</ul>
	<s:form action="modificarProducto" id="frm-Productos" enctype="multipart/form-data" theme="bootstrap" cssClass="form-horizontal" label="Modificar Producto">
	<s:iterator value="listaPro">
		<s:textfield label="Cod. Producto" name="pro.codigo" value="%{codigo}" readonly="true"/>
		<s:textfield label="Descripción" name="pro.nombre" value="%{nombre}" tooltip="Ingresa la descripción del producto"/>
		<s:textfield label="Precio" name="pro.precio" value="%{precio}"/>
		<s:textfield label="Stock" name="pro.stock" value="%{stock}"/>
		<s:url var="listarCat" action="listarCategorias" />
		<sj:select label="Categoría" name="pro.categoria" href="%{listarCat}" list="listaPro" listValue="categoria" listKey="categoria" headerKey="-1" headerValue="--Seleccione--" value="%{categoria}"/>
		<sj:datepicker name="pro.fecha" label="Fecha" displayFormat="yy/mm/dd" placeholder="YYYY/MM/dd" value="%{fecha}"/>
		<sj:submit cssClass="btn btn-primary" cssStyle="margin-left: 300px;" value="Modificar" />
	</s:iterator>
	</s:form>
	<div id="msg" style="width: 400px">
		<s:actionmessage theme="jquery"/>
		<s:actionerror theme="jquery"/>
	</div>
</body>
</html>