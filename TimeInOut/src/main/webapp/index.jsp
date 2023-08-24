<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="./style/shared.css">
  
  <title>Time In Out</title>
  <style>

    #header {
      position: absolute;
      width: 100%;
    }

    #header nav a {
      font-size: 20px;
      font-weight: bold;
      color: black;
      position: relative;
      right: 100px;
    }

    #main {
      width: 100%;
      height: 4000px;
    }

    #index_page1 {
      height: 33.33%;
      background-image: url("./image/ocean.jpg");
      background-position: center;
      background-size: cover;
    }

    #index_page2 {
      height: 33.33%;
      background-image: url("./image/women\ wakeup.png");
      background-position: center;
      background-size: cover;
    }

    #index_page3 {
      height: 33.33%;
      background-image: url("./image/sand\ clock.png");
      background-position: center;
      background-size: cover;
    }

    #index_page1-content {
      width: 1000px;
      text-align: left;
      padding: 50px 0;
      margin: 0 auto;
      position: relative;
      top: 300px;
      left: 100px;
      float: left;
      text-shadow: 3px 3px 2px rgba(0, 0, 0, 0.5)
    }

    #index_page1-content h1 {
      color: white;
      font-weight: bold;
      font-size: 150px;
      font-family: "Raleway", sans-serif;
      margin: 0;
    }

    #index_page1-content p {
      color: white;
      font-size: 50px;
      margin: 0;
    }

    #index_page2-content {
      width: 1000px;
      text-align: left;
      padding: 50px 0;
      margin: 0 auto;
      position: relative;
      top: 300px;
      left: 100px;
      float: left;
      text-shadow: 1px 1px 1px rgba(0, 0, 0, 1)
    }

    #index_page2-content p {
      color: white;
      font-size: 50px;
      margin: 0;
    }

    #index_page3-content {
      width: 1000px;
      text-align: left;
      padding: 50px 0;
      margin: 0 auto;
      position: relative;
      top: 500px;
      left: 100px;
      float: left;
    }

    #index_page3-content p {
      color: white;
      font-size: 50px;
      margin: 0;
    }

    .slider-nav {
      display: flex;
      flex-direction: column;
      row-gap: 1rem;
      position: fixed;
      right: 2rem;
      bottom: 50%;
      transform: translateX(-50%);
      z-index: 1;
    }

    .slider-nav a {
      width: 1rem;
      height: 1rem;
      border-radius: 50%;
      background-color: #fff;
      opacity: 0.75;
      transition: opacity ease 250ms;
    }

    .slider-nav a:hover {
      opacity: 1;
    }

  </style>
</head>

<body>
 <div id="wrap">
    <!-- 헤더 -->
    <header id="header">
      <h1 class="logo">
        <a href="#">TIME IN OUT.</a>
      </h1>
      <nav>
        <ul>
          <li><a href="./login.jsp">LOG IN | SIGN UP</a></li>
        </ul>
      </nav>
    </header>
    <!-- 메인 -->
    <main id="main">
      <section id="index_page1">
        <div id="index_page1-content">
          <p>스마트한 통합 근태 관리 솔루션</p>
          <h1>TIME IN OUT.</h1>
        </div>
      </section>
      <section id="index_page2">
        <div id="index_page2-content">
          <p>출퇴근 시간 관리의 시작과 끝</p>
          <br>
          <p><strong>타임 인 아웃</strong></p>
        </div>
      </section>
      <section id="index_page3">
        <div id="index_page3-content">
          <p>출장, 외근, 야근 관리도 <strong>문제없이</strong></p>
        </div>
      </section>
      <div class="slider-nav">
        <a href="#index_page1"></a>
        <a href="#index_page2"></a>
        <a href="#index_page3"></a>
      </div>
    </main>
    <!-- 푸터 -->
    <footer></footer>
 </div>
</body>

</html>