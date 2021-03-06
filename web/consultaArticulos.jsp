<%-- 
    Document   : index
    Created on : 21-ene-2019, 17:34:38
    Author     : lmfdez
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <!--<link rel="stylesheet" href="css/smartphones.css">
        <link rel="stylesheet" href="css/tablets.css">
        <link rel="stylesheet" href="css/ordenadores.css.css">
        <link rel="stylesheet" href="css/widescreen.css">-->
        <link rel="stylesheet" href="css/reset meyer.css">
        <link rel="stylesheet" href="css/default.css">
        <title>Resultado de búsquedas</title>
    </head>
    <body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/331_jquery.min.js"><\/script>')</script>
        <jsp:include page="cargaCombos"/>
        <header>
            <div id="banner" role="banner">
                <h2>Edupedia</h2>
                <p>Al encuentro del saber</p>
            </div>
            <form action="#" method="GET" id="formularioBusqueda">
                <input type="search" name="busqueda" placeholder="Búsqueda" role="search">
                <select name="filtroCurso" id="filtroCurso">
                    <option value="0">Todos los cursos</option>
                    <c:forEach var="curso" items="${requestScope.cursos}">
                         <option value="${curso.codCursos}">${curso.nombreCurso}</option>
                    </c:forEach>
                </select>
                <select name="filtroAsig" id="filtroAsig">
                    <option value="0">Todas las asignaturas</option>
                    <c:forEach var="asig" items="${requestScope.asignaturas}">
                         <option value="${asig.codAsignatura}">${asig.nombreAsignatura}</option>
                    </c:forEach>
                </select>
            </form>
            
            <section>
                <img id="iconUsuario" src="img/UsuarioGenerico.png" alt="icono del usuario registrado">
                <a href="#">Iniciar Sesión</a>
            </section>
        </header>
        
        <aside id="lateral">
            <nav role="navegator">
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li>
                        Cursos
                        <ul>
                            <c:forEach var="curso" items="${requestScope.cursos}">
                              <li><a href="consultaArticulos.jsp?curso=${curso.codCursos}">${curso.nombreCurso}</a></li>
                            </c:forEach>  
                        </ul>
                    </li>
                    <li>
                        Asignaturas
                        <ul>
                            <c:forEach var="asig" items="${requestScope.asignaturas}">
                                <li><a href="consultaArticulos.jsp?asignatura=${asig.codAsignatura}">${asig.nombreAsignatura}</a></li>
                            </c:forEach>  
                        </ul>
                    </li>
                    <li>
                        Idiomas
                        <ul>
                            <li><a href="#">Frances</a></li>  
                            <li><a href="#">Español</a></li>  
                            <li><a href="#">Inglés</a></li>  
                        </ul>
                    </li>
                    <li><a href="contactos.jsp">Contactanos</a></li>
                    <li><a href="descargaProyecto.jsp">Descargue el proyecto</a></li>
                </ul>
            </nav>
        </aside>
        
        <main>
            <jsp:include page="buscaArticulos"/>
            <c:choose>
                <c:when test="${!empty requestScope.articulosEncontrados && requestScope.articulosEncontrados!=null}">
                    <h1>${requestScope.mensaje}</h1>
                    <c:forEach var="articulo" items="${requestScope.articulosEncontrados}" varStatus="estado">
                        <div>
                            <h2>${articulo.titulo}</h2>
                            <h3>Breve descripcion que no estaria de mas meterla en la base de datos</h3>
                            <img src="img/${articulo.imagen}">
                        </div>
                        <hr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <h2>No hemos encontrado ningún artículo</h2>
                    <h3>¡Se el primero en aportar algo!</h3>
                </c:otherwise>
            </c:choose>

        </main>
        <script src="js/ajaxAsignaturas.js"></script>
    </body>
</html>
