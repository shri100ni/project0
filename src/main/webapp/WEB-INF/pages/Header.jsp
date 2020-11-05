
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC >
<%@page import="in.co.rays.dto.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page isELIgnored="false"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- fontawesome Library -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"

	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
 $(document).ready(function(){
	    $('#select_all').on('click',function(){
	        if(this.checked){
	            $('.checkbox').each(function(){
	                this.checked = true;
	            });
	        }else{
	             $('.checkbox').each(function(){
	                this.checked = false;
	            });
	        }
	    });
	    
	    $('.checkbox').on('click',function()
	    {
	        if($('.checkbox:checked').length == $('.checkbox').length){
	            $('#select_all').prop('checked',true);
	        }else{
	            $('#select_all').prop('checked',false);
	        }
	    });
	});
  </script>



</head>
<body>





<nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
<a href='<c:url value="/Welcome"></c:url>'>
<div class=" bg-light" >
      <img  src='<c:url value="/resources/img/customLogoT.png"></c:url>' class=" bg-light"height="50px" >
</div></a>&nbsp;&nbsp;
<!--   <a class="navbar-brand" href="#">Navbar</a>
 --> 
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
  
  <a class="text-dark circle p-1 m-0" style="background-color: #c7c6c6;" href='<c:url value="?lang=en"></c:url>'><strong>English</strong></a>&ensp;
     	<a class="text-dark circle p-1 m-0" style="background-color: #c7c6c6;" href='<c:url value="?lang=hi"></c:url>'><strong>हिन्दी</strong></a>
<%-- 		<a class="nav-link text-light font-weight-bold px-3" href="<c:url value="/Welcome"></c:url>"><i class="fas fa-home" ></i></a>
 --%>  
  
    <ul class="navbar-nav  ml-auto">
     
    <c:if test="${not empty sessionScope.user}">
<%-- 
<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class='fas fa-user'></i><s:message code="label.User"/>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="<%=ORSView.USER_CTL%>"> <i class="fas fa-user-plus"></i>Add User</a>
          <a class="dropdown-item" href="<%=ORSView.USER_LIST_CTL%>"><i class="fas fa-users"></i> User List</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class='fas fa-file-alt' ></i> Marksheet
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">Get Marksheet</a>
          <a class="dropdown-item" href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><i class="fas fa-user-tag"></i>Marksheet MeritList</a>
          <a class="dropdown-item" href="<%=ORSView.MARKSHEET_CTL%>"><i class="fas fa-user-tag"></i>Add Marksheet</a>
          <a class="dropdown-item" href="<%=ORSView.MARKSHEET_LIST_CTL%>"><i class="fas fa-list-ol"></i>Marksheet List</a>
        </div>
      </li>
      
      
      <%
}else if(userDto.getRoleId()==RoleDTO.ADMIN){
%> --%>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class='fas fa-user'></i><s:message code="label.user" />
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="top: 128% ">
          <a class="dropdown-item" href="<c:url value="/ctl/User/AddUser"/>"> <i class="fas fa-user-plus"></i><s:message code="label.adduser" /></a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class='fas fa-file-alt' ></i><s:message code="label.marksheet" />
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"style="top: 128% ">
<!--           <a class="dropdown-item" href="#">Get Marksheet</a>
 -->          <a class="dropdown-item" href="<c:url value="/ctl/Marksheet/MeritList"/>"><i class="fas fa-user-tag"></i><s:message code="label.marksheetmeritlist" /></a>
          <a class="dropdown-item" href="<c:url value="/ctl/Marksheet/AddMarksheet"/>"><i class="fas fa-file-alt"></i><s:message code="label.addmarksheet" /></a>
        </div>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class='fas fa-university'></i> <s:message code="label.college" />
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="top: 128% ">
          <a class="dropdown-item" href="<c:url value="/ctl/College/AddCollege"/>"><i class="fa fa-university"></i><s:message code="label.addcollege" /></a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class='fas fa-user-circle'></i><s:message code="label.role" />
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="top: 128% ">
          <a class="dropdown-item" href="<c:url value="/ctl/Role/AddRole"/>"><i class="fas fa-user-circle"></i><s:message code="label.addrole" /></a>
        </div>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class='fas fa-user-graduate'></i><s:message code="label.student" />
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="top: 128% ">
          <a class="dropdown-item" href="<c:url value="/ctl/Student/AddStudent"/>"><i class="fas fa-user-graduate"></i><s:message code="label.addstudent" /></a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class='fa fa-book'></i><s:message code="label.course" />
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="top: 128% ">
          <a class="dropdown-item" href="<c:url value="/ctl/Course/AddCourse"/>"><i class="fas fa-book"></i><s:message code="label.addcourse" /></a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           <i class='fas fa-book'></i><s:message code="label.subject" />
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="top: 128% ">
          <a class="dropdown-item" href="<c:url value="/ctl/Subject/AddSubject"/>"><i class="fas fa-book"></i><s:message code="label.addsubject" /></a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class='fas fa-user-tie'></i><s:message code="label.faculty" />
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="top: 128% ">
          <a class="dropdown-item" href="<c:url value="/ctl/Faculty/AddFaculty"/>"><i class="fas fa-user-tie"></i><s:message code="label.addfaculty" /></a>
        </div>
      </li>
      <li class="nav-item dropdown ">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class='fas fa-clock'></i><s:message code="label.timetable" />
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="top: 128% ">
          <a class="dropdown-item" href="<c:url value="/ctl/TimeTable/AddTimeTable"/>"><i class="fas fa-clock"></i><s:message code="label.addtimetable" /></a>
        </div>
      </li>
   
   </c:if>   
       
  
       <li class="nav-item dropdown " >
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<i class="fas fa-user-circle"></i>

<c:if test="${not empty sessionScope.user}">
					<c:set var="name" value="${sessionScope.user.firstName}" />
    				<c:set var="role" value='${sessionScope["role"]}' />
    				<c:out value="${name}(${role})"></c:out> 
    				</c:if>
    				<c:if test="${empty sessionScope.user}">
    					<s:message code="label.hiGuest"></s:message>
    				</c:if>
        </a>

    <c:if test="${not empty sessionScope.user}">
    
    
       <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink " style="top: 128% ; left: -34px">
       
          <a class="dropdown-item" href="<c:url value="/ctl/User/MyProfileCtl" />"><i class="fa fa-user-secret" aria-hidden="true"></i><s:message code="label.myprofile" /></a>
          <a class="dropdown-item" href="<c:url value="/ctl/User/ChangePasswordCtl"/>"><i class="fa fa-key"></i><s:message code="label.changepassword" /></a>
          <a class="dropdown-item" href="<c:url value="/resources/doc/index.html"/>" target="_blank"><i class="fas fa-file-alt "></i><s:message code="label.javadoc" /></a>
          <a class="dropdown-item" href="<c:url value="/Login?signout=logout"></c:url>"><i class="fas fa-sign-out-alt"></i><s:message code="label.logout" /></a>
       </div>
         
         </c:if>
         
         <c:if test="${empty sessionScope.user}">
         
           <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink " style="top: 128% ; left: -58px">
       
          <a class="dropdown-item" href="<c:url value="/Login"></c:url>"><i class="fas fa-sign-in-alt"></i><s:message code="label.login" /></a>
          <a class="dropdown-item" href="<c:url value="/Registration"></c:url>"><i class="fa fa-registered"></i><s:message code="label.signup" /></a>
          <a class="dropdown-item" href="<c:url value="/ForgetPassword"></c:url>"><i class="fa fa-key"></i><s:message code="label.pass" /></a>
        </div>
      </li>
      
      </c:if>
   
      </ul>
     </div>
    </nav>

</body>
</html>