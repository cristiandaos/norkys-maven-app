<%-- 
    Document   : login
    Created on : 22 may. 2024, 13:05:07
    Author     : LUIS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
         <jsp:include page="components/navegacion.jsp" />
        
    <c:if test="${success==false}">
        <p id="error">USUARIO O CONTRASEÑA INCORRECTA</p>
    </c:if >
    
    <section class="vh-100" style="background-color: white;">
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
              <div class="card" style="border-radius: 1rem;">
                <div class="row g-0">
                  <div class="col-md-6 col-lg-5 d-none d-md-block">
                      <img src="assets/img/pollo.jpg"
                      alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                  </div>
                  <div class="col-md-6 col-lg-7 d-flex align-items-center">
                    <div class="card-body p-4 p-lg-5 text-black">

                      <form action="ClienteControlador" method="post" >

                        <div class="d-flex align-items-center mb-3 pb-1">
                            <img src="assets/img/logo_norkys.png" alt="alt"/>
                          
                        </div>

                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Ingresa a tu cuenta</h5>

                        <div data-mdb-input-init class="form-outline mb-4">
                          <input type="email" name="correo" id="form2Example17" class="form-control form-control-lg" />
                          <label class="form-label" for="form2Example17">Correo Electrónico</label>
                        </div>

                        <div data-mdb-input-init class="form-outline mb-4">
                          <input type="password" name="password" id="form2Example27" class="form-control form-control-lg" />
                          <label class="form-label" for="form2Example27">Contraseña</label>
                        </div>
                        
                        <input type="hidden" name="accion" value="session">
                        <div class="pt-1 mb-4">
                          <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-lg btn-block" type="button">Iniciar sesión</button>
                        </div>

                        <a href="#!" class="small text-muted">Terms of use. </a>
                        <a href="#!" class="small text-muted">Privacy policy</a>
                      </form>

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

                <jsp:include page="components/footer.jsp" />
    </body>
</html>
