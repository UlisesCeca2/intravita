<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<c:set var="user" value="${user}" scope="request" /> <!-- Esto envia variables a las vistas de los includes -->
<c:set var="vista" value="admin" scope="request" />
<%@ include file="/WEB-INF/views/header.jsp" %>
								  
 <!-- main col right -->
 <div class="col-sm-9">

   <div class="panel panel-default">
   	  <div class="panel-heading"><h4>Usuarios</h4></div>
	  <div class="panel-body">
		<div class="clearfix"></div>
		
		<table id="usuarios" class="table table-striped table-bordered" cellspacing="0" width="100%">
			<thead>
	            <tr>
	            	<th>Nombre</th>
	 				<th>Apellidos</th>
	 				<th>Admin</th>
	 				<th>Editar</th>
	 				<th>Eliminar</th>
	            </tr>
	        </thead>
	        <tfoot>
	            <tr>
	                <th>Nombre</th>
	 				<th>Apellidos</th>
	 				<th>Admin</th>
	 				<th>Editar</th>
	 				<th>Eliminar</th>
	            </tr>
	        </tfoot>
	        <tbody>
	
	 		<c:forEach var="listVar" items="${listName}">
	 			<tr>
	 			    <td><c:out value="${listVar[0]}"/></td>
	 			    <td><c:out value="${listVar[1]}"/></td>
	 			    <td><c:if test="${listVar[3] ne 'super.admin'}">
	 			    <button type="button" class="btn btn-primary"><c:out value="${listVar[2]}"/></button>
	 			    </c:if></td>
	 			    
	 				<td><c:if test="${listVar[3] ne 'super.admin'}">
	 				<form action="/intravita/admin/editarUsuario" method="post">
		 			    <input type="text" id="username" name="username" hidden="hidden" value="${listVar[3]}">
		 			    <button type="submit" name="submit" value="submit" class="btn btn-warning">Editar</button>
		 			    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	 			    </form></c:if></td>
	 			    
	 				<td><c:if test="${listVar[3] ne 'super.admin'}">
	 				<form action="/intravita/admin/borrarUsuario" method="post">
		 			    <input type="text" id="username" name="username" hidden="hidden" value="${listVar[3]}">
		 			    <button type="submit" name="submit" value="submit" class="btn btn-danger">Eliminar</button>
		 			    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	 			    </form></c:if></td>
	 		  	</tr>
	 		</c:forEach>
	 		</tbody>
 		</table>
		
		<hr>
		
	  </div>
   </div>
   
   <div class="panel panel-default">
   	  <div class="panel-heading"><h4>Publicaciones</h4></div>
	  <div class="panel-body">
		<div class="clearfix"></div>
		
		<table id="publicaciones" class="table table-striped table-bordered" cellspacing="0" width="100%">
			<thead>
	            <tr>
	            	<th>Usuario</th>
	 				<th>Texto</th>
	 				<th>Editar</th>
	 				<th>Eliminar</th>
	            </tr>
	        </thead>
	        <tfoot>
	            <tr>
	                <th>Usuario</th>
	 				<th>Texto</th>
	 				<th>Editar</th>
	 				<th>Eliminar</th>
	            </tr>
	        </tfoot>
	        <tbody>
	
	 		<c:forEach var="listVar" items="${listName}">
	 			<tr>
	 			    <td><c:out value="${listVar[0]}"/></td>
	 			    <td><a href="<c:out value="${listVar[3]}"/>"><button type="button" class="btn btn-primary"><c:out value="${listVar[2]}"/></button></a></td>
	 			    <td><a href="#"><button type="button" class="btn btn-warning">Editar</button></a></td>
	 				<td><a href="#"><button type="button" class="btn btn-danger">Eliminar</button></a></td>

	 		  	</tr>
	 		</c:forEach>
	 		</tbody>
 		</table>
		
		<hr>
		
	  </div>
   </div>


 </div>
 
 <script src="/intravita/resources/js/jquery-1.11.1.min.js"></script>
 <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
 <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
  
 <script>
 	$(document).ready(function() {
	    $('#usuarios').DataTable();
	    $('#publicaciones').DataTable();
	} );
 </script>

	
<%@ include file="/WEB-INF/views/footer.jsp" %>