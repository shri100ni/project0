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

</head>
<body background="/Project_0/resources/img/p3.png">


<div class="container-fluid">

<c:set value="${((form.pageNo-1)*form.pageSize)+1}" var="index"></c:set>
<%-- 
				<sf:hidden path="pageNo" />
				<sf:hidden path="pageSize" />
				 --%>

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

<%-- <c:if test="${empty list}">
        <div class="text-center">
			<td><button type="submit" class="btn btn-warning " name="operation" value="Back" ><s:message code="label.back"></s:message></button> </td>
			</div>
			</c:if> --%>
	 <h3 class="text-center default-text text-dark py-3"><s:message code="label.marksheetmeritlist" /></h3>
	
	  
	   <div class="col-12 d-flex justify-content-center">
			<a class="btn btn-info btn-block btn-round w-25" href='<c:url value="/ctl/Jasper"></c:url>' target="_blank"><i class="fa fa-print" aria-hidden="true"></i>Click Here to	Print MeritList</a>
				</div>
	  <br>
	 
	  
      <div class="table-responsive " >
      <table class="table table-striped" width="100%">
      <thead class="thead-dark">
      <tr >
<%--       <th class="text-center"><input type="checkbox" id="select_all" name="select"><s:message code="label.selectall"/></th>
 --%>                   <th><s:message code="label.SNo"/></th>
					<th><s:message code="label.name"/></th>
					<th><s:message code="label.rollNo"/></th>
					<th><s:message code="label.physics"/></th>
					<th><s:message code="label.chemistry"/></th>
					<th><s:message code="label.maths"/></th>
					<th><s:message code="label.total"/></th>
					<th><s:message code="label.percentage"/></th>
      </tr>
      </thead>

    <tbody>
<c:forEach items="${list}" var="marksheet" varStatus="ct">					
					<tr>
					<td class=""><c:out value="${ct.index+1}" />
							<c:set var="index" value="${ct.index+1}" />
					</td>
				    <td>${marksheet.name}</td>
					<td>${marksheet.rollNo}</td>
					<td>${marksheet.physics}</td>
					<td>${marksheet.chemistry}</td>
					<td>${marksheet.maths}</td>
	                <td>${marksheet.physics+marksheet.chemistry+marksheet.maths}</td>
                    <td>${(marksheet.physics+marksheet.chemistry+marksheet.maths)/3}%</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
			</div>
			
 <br><br>     <br><br> 

</div>

</body>
</html>