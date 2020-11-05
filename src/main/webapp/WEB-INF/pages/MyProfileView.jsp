<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page isELIgnored="false"%>
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
<script>
  $( function() {
    $( "#datepicker" ).datepicker({ 
    	changeMonth :true,
		  changeYear :true,
		  yearRange :'1980:2030',
		  dateFormat:'mm/dd/yy',
		  endDate: '-18y'	 
		
    	
		 }) ;
  } );
  </script>
</head>
<body background="/Project_0/resources/img/p3.png">
<sf:form  modelAttribute="form" method="post">

<%-- <% 	String uri = (String)request.getAttribute("uri");%>
 --%>
<br>
<div class="container">

<div class="card bg-secondary text-white mx-auto" style="max-width: 400px; " >
<article class="card-body mx-auto" style="max-width: 400px;">
	
	
	<!-- getting role list for preload -->
<%-- <%List list= (List)request.getAttribute("roleList"); %>
 --%>	
	
                        
                       
                           <h3 class="text-center default-text py-3"><s:message code="label.myprofile" /></h3>
                            
                          
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
		 <sf:hidden path="id" />
				<sf:hidden path="createdBy" />
				<sf:hidden path="modifiedBy" />
				<sf:hidden path="createdDatetime" />
				<sf:hidden path="modifiedDatetime" />
 
        
     <h6 style="color: #20B2AA"><s:message code="label.email" /><font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
<sf:input path="login" class="form-control"
					placeholder="${enteremail}" />
	    </div> <font color="red" class="ml-5"><sf:errors path="login"/></font>
    </div>
    <!-- form-group// -->
    
         
         <h6 style="color: #20B2AA"><s:message code="label.firstName" /><font color="red">*</font></h6>
         
         <div class="input-group mb-3">                   
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>

<sf:input path="firstName" class="form-control"
					placeholder="${enterfirstName}" />

    </div>
    <font color="red" class="ml-5"><sf:errors path="firstName" /></font>
    </div>
     <!-- form-group// -->
    
    <h6 style="color: #20B2AA"><s:message code="label.lastName" /><font color="red">*</font></h6>
        
    <div class="input-group mb-3">
    <div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>

<sf:input path="lastName" class="form-control"
					placeholder="${enterLastName}"/>

    </div>
    <font color="red" class="ml-5"><sf:errors path="lastName" /></font>
</div>     <!-- form-group// -->
    
    <h6 style="color: #20B2AA"><s:message code="label.mobileNo" /><font color="red">*</font></h6>
    
    <div class="input-group mb-3">
     <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>

<sf:input path="mobileNo" class="form-control" maxlength="10"
					placeholder="${enterMobile}" />

    </div><font color="red" class="ml-5"><sf:errors path="mobileNo" /></font> 
    </div>
    <!-- form-group// -->
       
    
    <h6 style="color: #20B2AA"><s:message code="label.gender"/><font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i  class="fa fa-venus-mars"></i> </span>
		</div>

<sf:select path="gender" class="form-control">
					<sf:option value="">
						<s:message code="label.selectgender"></s:message>
					</sf:option>
					<sf:options items="${genderList}" />
				</sf:select>
				

	</div> <font color="red" class="ml-5"> <sf:errors path="gender"/></font>
	</div>
	<!-- form-group end.// -->
	
	    
    <h6 style="color: #20B2AA"><s:message code="label.dob" /><font color="red">*</font></h6>
       
       <div class="input-group mb-3">
       <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-calendar"></i> </span>
		 </div>
		
		<sf:input path="dob" class="form-control date"
					placeholder="${enterdob}" autocomplete="off" />
		
		</div> 
    <font color="red" class="ml-5"><sf:errors path="dob" /></font>
</div>
        <!-- form-group// -->
    
    
                                        
   
   
   <div class="form-group " align="center">
   
   <button type="submit" class="btn btn-success " name="operation" value="Save" ><s:message code="label.save"/></button> 
       <button type="submit" class="btn btn-warning " name="operation" value="ChangePassword" ><s:message code="label.changepassword"/></button> 
      
          </div> <!-- form-group// -->  
   

</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->
<br><br><br>

</sf:form>
</body>
</html>