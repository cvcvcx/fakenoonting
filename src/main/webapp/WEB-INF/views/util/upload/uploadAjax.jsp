<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
    <style>
      .fileDrop {
        width: 100%;
        height: 200px;
        border: 1px dotted blue;
      }
      small {
        margin-left: 3px;
        font-weight: bold;
        color: gray;
      }
    </style>
