<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
.w-50 {
    width: 100%!important;
    border: azure;
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



<div class="container-fluid">

<sf:form class="register-form" method="post" modelAttribute="form">

<c:set value="${((form.pageNo-1)*form.pageSize)+1}" var="index"></c:set>
				<sf:hidden path="pageNo" />
				<sf:hidden path="pageSize" />
				

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

<c:if test="${empty list}">
        <div class="text-center">
			<td><button type="submit" class="btn btn-warning " name="operation" value="Back" ><s:message code="label.back"></s:message></button> </td>
			</div>
			</c:if>

	 <h3 class="text-center default-text text-dark py-3"><s:message code="label.facultylist" /></h3>
	 
	  <br>
	 
	  <div class="row">
	  <div class="col-sm-2"></div>
	  <label class="form-check-label" for="check2" style = "width:50px">
     <s:message code="label.firstName" />
      </label>
	  <div class="col-sm-2"><sf:input path="firstName"
								cssClass="form-control border-left-right"
								placeholder="${enterFName}" />
</div>

<label class="form-check-label" for="check2" style = "width:50px">
      <s:message code="label.lastName" />
      </label>
	  <div class="col-sm-2"><sf:input path="lastName"
								cssClass="form-control border-left-right"
								placeholder="${enterLName}" />
</div>
	 <label class="form-check-label" for="check2" style = "width:50px">
       <s:message code="label.email" />
      </label>
	  <div class="col-sm-2"><sf:input path="emailId"
								cssClass="form-control border-left-right"
								placeholder="${enterEmail}" />
								
	</div>
	 
	   
	 
	  <div class="col-sm-2">
	
 <button type="submit" class="btn btn-success " name="operation" value="Search" ><s:message code="label.search"/></button> 
       <button type="submit" class="btn btn-warning " name="operation" value="Reset" ><s:message code="label.reset"/></button> 
      

  </div> 
	  <div class="col-sm-2"></div>
	  </div>
	  
	  <br>
	  <br>
	  
	  
      <div class="table-responsive " >
      <table class="table table-striped" width="100%">
      <thead class="thead-dark">
      <tr >
      <th class="text-center"><input type="checkbox" id="select_all" name="select"><s:message code="label.selectall"/></th>
                   <th><s:message code="label.SNo"/></th>
					<th><s:message code="label.firstName"/></th>
					<th><s:message code="label.lastName"/></th>
					<th><s:message code="label.gender"/></th>
					<th><s:message code="label.emailId"/></th>
					<th><s:message code="label.mobileNo"/></th>
					<th><s:message code="label.dob"/></th>
					<th><s:message code="label.edit"/></th>
      </tr>
      </thead>
    
               <tbody>
                 <c:forEach items="${list}" var="faculty" varStatus="ct">
                 <tr>
					<td class="text-center"><input type="checkbox" class="checkbox" name="ids" value="${faculty.id}"></td>
					<td><c:out value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" />
						<c:set var="index"	value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>
					<td>${faculty.firstName}</td>
					<td>${faculty.lastName}</td>
					<td>${faculty.gender}</td>
					<td>${faculty.emailId}</td>
					<td>${faculty.mobileNo}</td>
					<td><fmt:formatDate	value="${faculty.dob}" type="date" pattern="dd-MM-yyyy" /></td>
					<td class="textcenter"><c:url var="editUrl" value="/ctl/Faculty/AddFaculty?id=" /> 
					<a class="btn btn-outline-success btn-block btn-round w-50"
												style="border-color: #8A2BE2; color: #8A2BE2;"
												href="${editUrl}${faculty.id}">
												<i class="fa fa-edit" aria-hidden="true"></i>
												<s:message code="label.edit" /></a></td>
		</tr>
				</c:forEach>
				</tbody>
			</table>
			
			</div>
			<div class="row d-flex justify-content-center">
					<div class="col-lg-1 col-3">
						<c:choose>
							<c:when test="${form.pageNo > 1}">
								<button type="submit" class="btn btn-outline-primary btn-block btn-round w-100"  name="operation" name="operation" value="Previous">
									<i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
								</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn btn-outline-secondary btn-block btn-round w-100"  name="operation" name="operation" value="Previous" disabled>
									<i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
								</button>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-lg-1 col-3">
						<button type="submit" class="btn btn-outline-success btn-block btn-round w-100"  name="operation" name="operation" value="New"><i class="fa fa-plus" aria-hidden="true"></i></button>
					</div>
					<div class="col-lg-1 col-3">
						<button type="submit" class="btn btn-outline-danger btn-block btn-round w-100"  name="operation" name="operation" value="Delete"><i class="fa fa-trash" aria-hidden="true"></i></button>
					</div>
					<div class="col-lg-1 col-3">
					<c:choose>
						<c:when test="${nextlistsize != 0}">
							<button type="submit" class="btn btn-outline-primary btn-block btn-round w-100"  name="operation" name="operation" value="Next">
								<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
							</button>
						</c:when>
						<c:otherwise>
							<button type="submit" class="btn btn-outline-secondary btn-block btn-round w-100"  name="operation" name="operation" value="Next" disabled>
								<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
							</button>
						</c:otherwise>
					</c:choose>
			</div>		

 <br><br>     <br><br> 

</div>
</sf:form>
</body>
</html>