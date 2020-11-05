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


function disableSunday(d){
	  var day = d.getDay();
	  if(day==0)
	  {
	   return [false];
	  }else
	  {
		  return [true];
	  }
}
$( function() {
  $( "#datepicker" ).datepicker({ 
  	beforeShowDay:disableSunday,
  	changeMonth :true,
		  changeYear :true,
		  yearRange: '0:+2',
		  dateFormat:'dd/mm/yy',
		  minDate:0
		 /*  endDate: '-9y' */  
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
	<c:choose>
<c:when test="${form.id==0}">          
                           <h3 class="text-center default-text py-3"><s:message code="label.adduser" /></h3>
           </c:when>
<c:otherwise>              <h3 class="text-center default-text py-3"><s:message code="label.updateuser" /></h3>
          
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
     
          
    
    <h6 style="color: #20B2AA"><s:message code="label.course"/><font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-book"></i> </span>
		</div>

<sf:select path="courseId" class="form-control">
					<sf:option value="0"><s:message code="label.selectcourse"/></sf:option>
					<sf:options items="${courseList}" itemValue="id" itemLabel="name"/>
				</sf:select> 

    </div> <font color="red" class="ml-5"><sf:errors path="courseId"/> </font>
    </div>
    <!-- form-group// --> 
    
    
    <h6 style="color: #20B2AA"><s:message code="label.subject"/><font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-book"></i> </span>
		</div>

<sf:select path="subjectId" class="form-control">
					<sf:option value="0"><s:message code="label.selectsubject"/></sf:option>
					<sf:options items="${subjectList}" itemValue="id" itemLabel="name"/>
				</sf:select> 

    </div> <font color="red" class="ml-5"><sf:errors path="subjectId"/></font>
    </div>
    <!-- form-group// --> 
 
        
   
    <h6 style="color: #20B2AA"><s:message code="label.semester"/><font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i  class="fa fa-columns"></i> </span>
		</div>

<sf:select path="semester" class="form-control">
					<sf:option value=""><s:message code="label.selectsemester"/></sf:option>
					<sf:option value="1st" label="I"></sf:option>
					<sf:option value="2nd" label="II"></sf:option>
					<sf:option value="3rd" label="III"></sf:option>
					<sf:option value="4th" label="IV"></sf:option>
					<sf:option value="5th" label="V"></sf:option>
					<sf:option value="6th" label="VI"></sf:option>
					<sf:option value="7th" label="VII"></sf:option>
					<sf:option value="8th" label="VIII"></sf:option>
				</sf:select>

	</div> <font color="red" class="ml-5"> <sf:errors path="semester"/></font>
	</div>
	<!-- form-group end.// -->
	
	 <h6 style="color: #20B2AA"><s:message code="label.examdate" /><font color="red">*</font></h6>
       
       <div class="input-group mb-3">
       <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-calendar"></i> </span>
		 </div>

<sf:input path="examDate" class="form-control" id="datepicker"
					placeholder="${enterDate}" autocomplete="off" />

    </div> 
    <font color="red" class="ml-5"><sf:errors path="examDate" /></font>
</div>
        <!-- form-group// -->
        
            
         <h6 style="color: #20B2AA"><s:message code="label.examtime"/><font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i  class="fa fa-clock"></i> </span>
		</div>

<sf:select path="examTime" class="form-control">
					<sf:option value=""><s:message code="label.selecttime"/></sf:option>
					<sf:option value="09:00 AM to 12:00 PM" label="09:00 PM to 03:00 PM"></sf:option>
					<sf:option value="10:00 PM to 01:00 PM" label="10:00 PM to 01:00 PM"></sf:option>
					<sf:option value="12:00 PM to 03:00 PM" label="12:00 PM to 03:00 PM"></sf:option>
					<sf:option value="01:00 PM to 04:00 PM" label="02:00 PM to 05:00 PM"></sf:option>
				</sf:select> 

	</div> <font color="red" class="ml-5"> <sf:errors path="examTime"/></font>
	</div>
	<!-- form-group end.// -->
        
   <%--  <h6 style="color: #20B2AA"><s:message code="label.description" /><font color="red">*</font></h6>
         
         <div class="input-group mb-3">                   
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-align-left "></i> </span>
		 </div>

<sf:textarea path="description" class="form-control"
					placeholder="${enterdescription}"/> 

    </div>
    <font color="red" class="ml-5"><sf:errors path="description" /> </font>
    </div> --%>
     <!-- form-group// --> 
  
      <c:choose>
							<c:when test="${form.id==0}">  
							                                
    <div class="form-group " align="center">
    <button type="submit" class="btn btn-success " name="operation" value="Save" ><s:message code="label.save"/></button> 
       <button type="submit" class="btn btn-warning " name="operation" value="Reset" ><s:message code="label.reset"/></button> 
          </div>
     <!-- form-group// -->  
   
   </c:when>
	<c:otherwise>
							
							<div class="form-group " align="center">
	 <button type="submit" class="btn btn-success " name="operation" value="Save" ><s:message code="label.update"/></button> 
       <button type="submit" class="btn btn-warning " name="operation" value="Cancel" ><s:message code="label.cancel"/></button> 
    											
            </div> 
     
      <!-- form-group// -->  
   </c:otherwise>
						</c:choose>
        
</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->

<br>
</sf:form>
</body>
</html>