<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<html>
<head>
<style>
html,
body {
  background: white;
  height: 100%;
}

a {
  text-decoration: none;
}

.menu {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

.menu__link {
  display: inline-block;
  color: #2d6c90;
  text-decoration: none;
  position: relative;
  padding: 14px 0;
  font-family: 'Muli', sans-serif;
  font-weight: 300;
  font-size: 22px;
  line-height: 1;
  letter-spacing: 0.040em;
}

.menu__link svg {
  fill: none;
  stroke: #70aec9;
  stroke-width: 2;
  stroke-miterlimit: 10;
  stroke-dasharray: 338;
  stroke-dashoffset: 338;
  stroke-linecap: round;
  position: absolute;
  top: 50%;
  left: 50%;
  width: calc(100% + 60px);
  opacity: 0;
  transform: translate(-50%, -50%);
  transition: stroke-dashoffset 0s 0.2s, opacity 0.2s;
  z-index: -1;
}

.menu__link--active svg {
  stroke: #ff4c4c;
}

.menu__link--active svg,
.menu__link:hover svg {
  stroke-dashoffset: 0;
  opacity: 1;
  transition: opacity 0s, stroke-dashoffset 0.3s cubic-bezier(0.645, 0.045, 0.355, 1);
}

</style>
</head> 
<body>
<div class="menu">
  <a href="noticeGO" class="menu__link menu__link--active">
   	공지게시판
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 152.9 43.4" style="enable-background:new 0 0 152.9 43.4;" xml:space="preserve">
      <path d="M151.9,13.6c0,0,3.3-9.5-85-8.3c-97,1.3-58.3,29-58.3,29s9.7,8.1,69.7,8.1c68.3,0,69.3-23.1,69.3-23.1 s1.7-10.5-14.7-18.4"/>
    </svg>
  </a><br>
  <a href="QnAGO" class="menu__link">
    QnA게시판
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 152.9 43.4" style="enable-background:new 0 0 152.9 43.4;" xml:space="preserve">
      <path d="M151.9,13.6c0,0,3.3-9.5-85-8.3c-97,1.3-58.3,29-58.3,29s9.7,8.1,69.7,8.1c68.3,0,69.3-23.1,69.3-23.1 s1.7-10.5-14.7-18.4"/>
    </svg>
  </a><br>
  <a href="myPageGO?userId=${member.userId}" class="menu__link">
         마이페이지
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 152.9 43.4" style="enable-background:new 0 0 152.9 43.4;" xml:space="preserve">
      <path d="M151.9,13.6c0,0,3.3-9.5-85-8.3c-97,1.3-58.3,29-58.3,29s9.7,8.1,69.7,8.1c68.3,0,69.3-23.1,69.3-23.1 s1.7-10.5-14.7-18.4"/>
    </svg>
  </a><br>
  
</div>
 
</body>
</html>