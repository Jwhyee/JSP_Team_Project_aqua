<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
  </head>
  <body>

    <h2>JSP업로드 연습 - 이미지 업로드</h2>
    <form action="imgup.jsp" method="post" enctype="multipart/form-data">
      이름 : <input type="text" name="name"><br>
      제목 : <input type="text" name="subject"><br>
      이미지 : <input type="file" name="uploadfile" ><br>

      <input type="submit" value="submit" >
    </form>
  </body>
</html>