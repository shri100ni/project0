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
<script type="text/javascript">
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57))
      return false;

   return true;
}


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
	
	
<c:choose>
<c:when test="${form.id==0}">          
                           <h3 class="text-center default-text py-3"><s:message code="label.addmarksheet" /></h3>
           </c:when>
<c:otherwise>              <h3 class="text-center default-text py-3"><s:message code="label.updatemarksheet" /></h3>
          
   </c:otherwise>
   </c:choose>                       
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

         <h6 style="color: #20B2AA"><s:message code="label.rollNo" /><font color="red">*</font></h6>
         
         <div class="input-group mb-3">                   
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>

<sf:input path="rollNo" class="form-control"
					placeholder="${enterRollNo}"/>

    </div>
    <font color="red" class="ml-5"><sf:errors path="rollNo" /></font>
    </div>
     <!-- form-group// -->
    
    
    <h6 style="color: #20B2AA">><s:message code="label.name" /><font color="red">*</font></h6>
        
    <div class="input-group mb-3">
    <div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user-graduate"></i> </span>
		 </div>
		 
<sf:select path="studentId" class="form-control">
					<sf:option value="0">
						<s:message code="label.select"></s:message>
					</sf:option>
					<sf:options items="${studentList}" itemValue="id" itemLabel="firstName"/>
				</sf:select>

    </div>
    <font color="red" class="ml-5"><sf:errors path="studentId" /></font>
</div>     <!-- form-group// -->
    
    <h6 style="color: #20B2AA"><s:message code="label.physics" /><font color="red">*</font></h6>
    
    <div class="input-group mb-3">
     <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-file-alt"></i> </span>
		</div>

<sf:input path="physics" class="form-control"
					placeholder="${enterPhysics}"/>

    </div><font color="red" class="ml-5"><sf:errors path="physics" /></font> 
    </div>
    <!-- form-group// -->
    
     <h6 style="color: #20B2AA"><s:message code="label.chemistry" /><font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-file-alt"></i> </span>
		 </div>

<sf:input path="chemistry" class="form-control"
					placeholder="${enterChemistry}"/>

    </div> <font color="red" class="ml-5"><sf:errors path="chemistry" /></font>
    </div>
    <!-- form-group// -->
    
    <h6 style="color: #20B2AA"><s:message code="label.maths" /><font color="red">*</font></h6>
    
    <div class="input-group mb-3">
   <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-file-alt"></i> </span>
		</div>

<sf:input path="maths" class="form-control"
					placeholder="${enterMaths}"/>
					

    </div> <font color="red" class="ml-5"><sf:errors path="maths" /></font>
    </div>
    <!-- form-group// -->
    <c:choose>
              		<c:when test="${form.id==0}"> 
  
                                        
    <div class="form-group " align="center">
         <button type="submit" class="btn btn-success " name="operation" value="Save" ><s:message code="label.save"/></button> 
       <button type="submit" class="btn btn-warning " name="operation" value="Reset" ><s:message code="label.reset"/></button> 
         </div> <!-- form-group// -->  
   
   </c:when>
						<c:otherwise>
   <div class="form-group " align="center">
       <button type="submit" class="btn btn-success " name="operation" value="Save" ><s:message code="label.update"/></button> 
       <button type="submit" class="btn btn-warning " name="operation" value="Cancel" ><s:message code="label.cancel"/></button> 
    	        </div> <!-- form-group// -->  
 </c:otherwise>
 </c:choose>
      
</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->
<br><br>
<br>
</sf:form>
</body>
</html>