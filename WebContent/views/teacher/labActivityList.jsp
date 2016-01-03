<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>     
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- bootstrap css -->
<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css">

<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>

<!-- bootstrap js -->
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>

<!-- labActivityList css -->
<link rel="stylesheet" type="text/css" href="assets/my/teacher/labActivityList.css">

<!-- labActivityList js -->
<script type="text/javascript" src="assets/my/teacher/labActivityList.js"></script>

<title>${title }</title>
</head>
<body>
    <!-- 引入head jsp -->
    <c:import url="../template/head.jsp"></c:import>
    
    <!-- 引入教师预约情况 jsp -->
    <c:import url="labActivityStateBar.jsp"></c:import>
    
    <div class="labActivityList" data-teacherid="${TEACHERID }">
        <c:if test="${empty pages.getList() }">
            <p>暂无${title }信息</p>
        </c:if>
        
        <c:if test="${not empty pages.getList() }">
           <table class="table table-hover table-bordered table-condensed">
             <tr class="info">
                 <th>科目</th>
                 <th>专业班级</th>
                 <th>开始时间</th>
                 <th>结束时间</th>
                 <th>预约实验室</th>
                 <th>预约实验器材</th>
             </tr>
             <c:forEach items="${pages.getList() }" var="e">
                 <tr>
                     <td>${e.getCourse().getName() }</td>
                     <td>${e.getMajorClass().getName() }</td>
                     <td>${e.getBegin() }</td>
                     <td>${e.getEnd() }</td>
                     <td>${e.getLabClass().getName() }</td>
                     <td>
                         <a href="teacher/labActivity/${e.getId() }/equipments">
                             <span class="glyphicon glyphicon-wrench">查看实验器材</span>
                         </a>
                     </td>
                 </tr>
             </c:forEach>
         </table>
       </c:if>
       
       <!-- 分页 jsp -->
       <c:import url="../template/page.jsp"></c:import>
              
    </div>
</body>
</html>