<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<style  >
.divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
}
.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
}
.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
}

.btn-facebook {
    background-color: #405D9D;
    color: #fff;
}
.btn-twitter {
    background-color: #42AEEC;
    color: #fff;
}
</style>
</head>
<body background="/Project_0/resources/img/p3.png">
<sf:form  modelAttribute="form" method="post">
<%-- 
<% 	String uri = (String)request.getAttribute("uri");%>
 --%>
<br>
<div class="container">

<div class="card bg-secondary text-white mx-auto" style="max-width: 400px; " >
<article class="card-body mx-auto" style="max-width: 400px;">
	
	
	<!-- getting role list for preload -->

	
                       
							<h2 class="text-center default-text py-3"><s:message code="label.login"></s:message></h2>
                            
                          
                            <!--Body-->
                            
      <c:if test="${success != null}">
    <div class="alert alert-success alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <b>${success}</b>
    </div>
    </c:if>                      
	
<c:if test="${error != null}">
<div class="alert alert-danger alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <b>${error}</b>
  </div>
</c:if>                                              
        
         <h6 ><b><s:message code="label.enteremail"></s:message></b><font color="red">*</font></h6>           
         <div class="input-group mb-3">                   
	<div class="form-group input-group">
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
		 
		 
					<sf:input path="emailId" class="form-control"
					placeholder="${enteremail}" />
					
					    </div>
    <font color="red" class="ml-5"><sf:errors path="emailId"/></font>
    </div>
     <!-- form-group// --><br>
    
    
     <h6><b><s:message code="label.enterpassword"></s:message></b><font color="red">*</font></h6>           
         <div class="input-group mb-3">                   
	<div class="form-group input-group">
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		 </div>
		 
<sf:input type="password" path="password" class="form-control"
					placeholder="${enterpassword}" />

    </div>
    <font color="red" class="ml-5"><sf:errors path="password"/></font>
    </div>
     <!-- form-group// --><br>
    
                                       
    <div class="form-group " align="center">
    <button type="submit" class="btn btn-primary " name="operation" value="SignIn" ><s:message code="label.login"/></button> 
    
    <button type="submit" class="btn btn-primary " name="operation" value="SignUp" ><s:message code="label.signup"/></button> 
    
       <%--  <input type="submit" class="btn-primary" name="operation" value="<s:message code="label.login"/>">   
                <input type="submit" class="btn-primary" name="operation" value="<s:message code="label.signup"/>">   
     --%>
       <br><br>  <a href="<c:url value="/ForgetPassword"></c:url>"><s:message code="label.pass"/></a>
   
   
    <%--  <input type="hidden" name="uri" value="<%=uri%>">
    --%>
    </div> <!-- form-group// -->  
   
  

</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->

<br>
</sf:form>
</body>
</html>