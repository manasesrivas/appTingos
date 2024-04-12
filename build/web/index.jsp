<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Productos"%>
<%@page import="modelDAO.productosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
         <header>
        <nav>
            <h1>tingos</h1>
            <ul>
                <li>inicio</li>
                <li>productos</li>
                <li>contacto</li>
            </ul>
        </nav>
    </header>
        <%
        productosDAO proDAO = new productosDAO();
        List<Productos> listado = proDAO.MostrarProductos();
        Iterator<Productos> iterator = listado.iterator();
        Productos promodel = null;
        %>
        <div class="container">

            <div class="row">
                <%
                    while (iterator.hasNext()){
                       promodel = iterator.next();
                    
                 %>
                <div class="col-4">
                    <div class="card text-white bg-dark mb-3" style="width: 18rem;">
                        <img src="<%=promodel.getImagen()%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%=promodel.getNombreProducto()%></h5>
                            <p class="card-text"><%=promodel.getDescripcion()%></p>
                            <span class="badge rounded-pill bg-primary">$<%=promodel.getPrecio()%></span>
                            <span class="badge rounded-pill bg-light text-dark"><%=promodel.getMarca()%></span><br><br>
                            <button type="button" class="btn btn-light">Ordenar</button>
                            <button type="button" class="btn btn-success">Comprar</button>
                        </div>
                    </div>
                </div>
                
                <%}%>
            </div>
        </div>
        
    </body>
</html>