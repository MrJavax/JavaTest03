<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registro de Productos</title>
<sb:head/>
<sj:head jqueryui="true" jquerytheme="smoothness"/>
</head>
<body>
<ul class="nav nav-tabs">
  <li role="presentation" ><a href="#">Home</a></li>
  <li role="presentation" class="active"><a href="#">Productos</a></li>
  <li role="presentation"><s:a action="listarProductos" >Ver Productos</s:a></li>
</ul>
	<s:form action="registrarProducto" id="frm-Productos" enctype="multipart/form-data" theme="bootstrap" cssClass="form-horizontal" label="Registro de Productos">
		<s:textfield label="Descripcion" name="pro.nombre" tooltip="Ingresa la descripción del producto" />
		<s:textfield label="Precio" name="pro.precio" placeholder="Ingrese Precio"/>
		<s:textfield label="Stock" name="pro.stock" placeholder="Ingrese Stock"/>
		<s:url var="listarCat" action="listarCategorias" />
		<sj:select label="Categoría" name="pro.categoria" href="%{listarCat}" list="listaPro" listValue="categoria" listKey="categoria" headerKey="-1" headerValue="--Seleccione--"/>
		<sj:datepicker name="pro.fecha" label="Fecha" displayFormat="yy/mm/dd" placeholder="YYYY/MM/dd" theme="bootstrap"/>
		<sj:submit cssClass="btn btn-primary" cssStyle="margin-left: 300px;" value="Registrar" />
	</s:form>
	<div id="msg" style="width: 500px">
		<s:actionmessage theme="jquery"/>
		<s:actionerror theme="jquery"/>
	</div>
</body>
</html>