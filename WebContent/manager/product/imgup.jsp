<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>이미지 업로드 연습</title>
  </head>
  <body>
    <%
    int fileSize = 1024*1024*3; //3mb로 파일 크기를 제한 
    ServletContext context = getServletContext();
    String uploadPath = context.getRealPath("img");
    %>
    업로드 경로 확인 : <%=uploadPath %><br>
    <%
    MultipartRequest multi = null;

    try{
      multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8",new DefaultFileRenamePolicy());
      String name = multi.getParameter("name");
      String subject = multi.getParameter("subject");
      String originalFile = multi.getOriginalFileName("uploadfile");
      String uploadFile = multi.getFilesystemName("uploadfile");
      %>
    <h1>읽어온 데이타 출력하기</h1>
    이름 : <%=name %><br>
    제목 : <%=subject %><br>
    오리지날 파일명 : <%=originalFile %><br>
    실제 업로드된 파일명 : <%=uploadFile %><br><Br>
    <h3>업로드된 파일 불러오기</h3>
    <img src="../img/<%=uploadFile %>">
    <%
    }catch(Exception e){
      out.write("업로드 용량 오류 또는 그 이외..." + e.getMessage());
    }

    %>

</body>
</html>