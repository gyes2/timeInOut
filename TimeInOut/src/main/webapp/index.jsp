<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">

  <title>Time In Out</title>
  <style>

    *{
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      text-decoration: none;
    }

    body {
      min-height: 100vh;
      background-color: #99CCFF;
    }

    #header {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      padding: 30px 100px;
      display: flex;
      align-items: center;
      z-index: 3;
      box-shadow: none;
      justify-content: space-between;
    }

    #header nav a {
      font-size: 20px;
      font-weight: bold;
      color: black;
      position: relative;
    }

    #section {
      position: relative;
      width: 100%;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    #section img {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    :root {
      overflow: hidden;
    }

    .sun {
      background-color: yellow;
      border-radius: 50%;
      height: 100vh;
      aspect-ratio: 1 / 1;
      animation: 4s linear 0s infinite alternate animating-multiple-properties;
    }

    /* 단일 애니메이션에서 여러 속성을 애니메이션할 수 있습니다. */
    @keyframes animating-multiple-properties {
      from {
        transform: translateY(100vh);
        background-color: red;
        filter: brightness(75%);
      }
      to {
        transform: translateY(0);
        background-color: orange;
        /* 설정되지 않은 속성, 즉 'filter'는 기본값으로 되돌아갑니다. */
      }
    }

    #mountains_front{
      z-index: 2;
    }

    #text{
      position: absolute;
      color: #fff;
      font-size: 7.5rem;
      z-index: 3;
    }



  </style>
</head>

<body>
<div id="wrap">
  <!-- 헤더 -->
  <header id="header">
    <h1 class="logo">
      <a href="/index.jsp">TIME IN OUT</a>
    </h1>
    <nav>
      <ul>
        <a href="/login.jsp">LOG IN | SIGN UP</a>
      </ul>
    </nav>
  </header>
  <!-- 메인 -->
  <main id="main">
    <section id="section">
      <div class="sun"></div>
      <h1 id="text">TIME IN OUT</h1>
      <img src="/image/mountains_front.png" id="mountains_front">
      <img src="/image/mountains_behind.png" id="mountains_behind">
    </section>
  </main>
  <!-- 푸터 -->
  <footer></footer>
</div>
</body>

</html>