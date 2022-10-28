<%@page import="infinite.leaveprojecthib.Employ"%>
<%@page import="infinite.leaveprojecthib.EmployDAO"%>
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
 <jsp:useBean id="beanDao" class="infinite.leaveprojecthib.LeaveHistoryDAO" />
<%
int id=Integer.parseInt(request.getParameter("id"));
%>
<c:if test="${param.id!=null }">
<c:set var="empId" value="${param.id}"/>
<c:set var="employ" value="${dao.searchEmploy(empId)}"/>
     <h2>My Details</h2>
       Employ Id:
        <c:out value="${empId}"/><br/> <br/>
       Employ Name :
		<c:out value="${employ.name}"/><br/> <br/>
		Employ EMail:
		<c:out value="${employ.email}"/><br/> <br/>
		 Employ Mobile no:
		<c:out value="${employ.mob}"/><br/> <br/>
	    Employ Date of joining:
		<c:out value="${employ.doj}"/><br/> <br/>
		Employ Department:
		<c:out value="${employ.dept}"/><br/> <br/>
		Employ Manager Id:
		<c:out value="${employ.mId}"/><br/> <br/>
		Employ Leave Balance: 
		<c:out value="${employ.leaveAvail}"/><br/> <br/><hr>
		
		<c:if test="${employ.mId == null}">
		  <h3>you have no manager</h3><hr>
		</c:if>
		
		<c:set var="mId" value="${employ.mId }" />
		<c:if test="${mId != null}">
          <c:set var="employ" value="${dao.searchEmploy(mId)}"/>
		  <h2>My Manager Details</h2>
		  Employ Id:
		  <c:out value="${employ.empId}"/><br/> <br/>
		   Employ Name :
		  <c:out value="${employ.name}"/><br/> <br/>
		  Employ EMail:
		  <c:out value="${employ.email}"/><br/> <br/>
		  Employ Mobile no:
		  <c:out value="${employ.mob}"/><br/> <br/>
	      Employ Date of joining:
		  <c:out value="${employ.doj}"/><br/> <br/>
		  Employ Department:
		  <c:out value="${employ.dept}"/><br/> <br/>
		  Employ Manager Id:
		  <c:out value="${employ.mId}"/><br/> <br/>
		  Employ Leave Balance: 
		  <c:out value="${employ.leaveAvail}"/><br/> <br/><hr>
		   
		    
	   </c:if> 
	    
		
		<h2>My Leave History</h2>
		<table border="3">
		<tr>
		  <th>Leave Id</th>
		  <th>Employ Id</th>
		  <th>Manager Comments</th>
		  <th>Leave Start Date</th>
		  <th>Leave End Date</th>
		  <th>No of Days</th>
		  <th>Leave Type</th>
		  <th>Leave Status</th>
		  <th>Leave Reason</th>
		  
		</tr>
		<c:forEach var="leave" items="${beanDao.searcLeaveHistory(empId) }">
		   <tr>
		   <td>${leave.leaveId}</td>
		   <td>${leave.empId}</td>
		   <td>${leave.mgrCmt}</td>
		   <td>${leave.leaveStartDate}</td>
		   <td>${leave.leaveEndDate}</td>
		   <td>${leave.noOfDays}</td>
		   <td>${leave.leaveType}</td>
		   <td>${leave.leaveStatus}</td>
		   <td>${leave.leaveReason}</td>
		</tr>
		</c:forEach>
		</table>
		
</c:if>
<c:if test="${param.id!=null }">
<c:set var="empId" value="${param.id}"/>
<c:set var="employ" value="${dao.searchEmploy(empId)}"/>
  <c:set var="mId" value="${employ.mId }" />
 
  <h2>My Subordinate Leave Status</h2>
		<table border="3">
		<tr>
		  <th>Leave Id</th>
		  <th>Employ Id</th>
		  <th>Manager Comments</th>
		  <th>Leave Start Date</th>
		  <th>Leave End Date</th>
		  <th>No of Days</th>
		  <th>Leave Type</th>
		  <th>Leave Status</th>
		  <th>Leave Reason</th>
		  
		</tr>
		<c:forEach var="leave" items="${beanDao.pendingLeave(employ.mId) }">
		   <tr>
		   <td>${leave.leaveId}</td>
		   <td>${leave.empId}</td>
		   <td>${leave.mgrCmt}</td>
		   <td>${leave.leaveStartDate}</td>
		   <td>${leave.leaveEndDate}</td>
		   <td>${leave.noOfDays}</td>
		   <td>${leave.leaveType}</td>
		   <td>${leave.leaveStatus}</td>
		   <td>${leave.leaveReason}</td>
		</tr>
		</c:forEach>
		</table>
</c:if>
</body>
</html>