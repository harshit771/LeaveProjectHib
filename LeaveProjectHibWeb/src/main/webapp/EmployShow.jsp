<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="infinite.leaveprojecthib.EmployDAO" />
<table border="3" align="center">
  <tr>
     <th>Employ Id</th>
     <th>Employ Name</th>
     <th>Email</th>
     <th>Mobile No</th>
     <th>Date Of Join</th>
     <th>Department</th>
     <th>Manager Id</th>
     <th>Leave Balance</th>     
  </tr>
  <c:forEach var="e" items="${dao.showEmploy()}">
    <tr>
       <c:set var="id" value="${e.empId}"></c:set>
       <td>${e.empId}</td>
       <td>${e.name }</td>
       <td>${e.email}</td>
       <td>${e.mob}</td>
       <td>${e.doj}</td>
       <td>${e.dept}</td>
      <td>
      ${e.mId}
        </td>
       <td>${e.leaveAvail}</td>
       <td><a href="ShowInfo.jsp?id=${id}">show info</a></td>
    </tr>
  </c:forEach>
</table>

</body>
</html>