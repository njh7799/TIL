# Making a Single Page App in ye good olde JS (ES6)

[link](https://dev.to/rishavs/making-a-single-page-app-in-ye-good-olde-js-es6-3eng)



```html
<!--index.html-->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <script type="module" src="./app.js"></script>
  </head>

  <body>
    <!--상단 네비게이션 바가 들어갈 부분-->
    <div id="header_container"></div>
      
    <!--본인이 들어갈 부분-->
    <div id="page_container" class="container pageEntry">
      <article>Loading....</article>
    </div>
    <!--하단 네비게이션 바가 들어갈 부분-->
    <div id="footer_container"></div>
  </body>
</html>
```

```javascript

//app.js

import Home         from './views/pages/Home.js'
import About        from './views/pages/About.js'
import Error404     from './views/pages/Error404.js'
import PostShow     from './views/pages/PostShow.js'
import Register     from './views/pages/Register.js'

import Navbar       from './views/components/Navbar.js'
import Bottombar    from './views/components/Bottombar.js' 

import Utils        from './services/Utils.js'

// 지원되는 경로. routes에 포함 되지 않는 경오로 접근할 경우 Error404로 렌더링 된다.
const routes = {
    '/'             : Home
    , '/about'      : About
    , '/p/:id'      : PostShow
    , '/register'   : Register
};


// 라우터 코드. Takes a URL, checks against the list of supported routes and then renders the corresponding content page.
const router = async () => {

    // Lazy load view element:
    const header = null || document.getElementById('header_container');
    const content = null || document.getElementById('page_container');
    const footer = null || document.getElementById('footer_container');
    
    // 헤더와 푸터를 렌더링 함.
    header.innerHTML = await Navbar.render();
    await Navbar.after_render();
    footer.innerHTML = await Bottombar.render();
    await Bottombar.after_render();


    //  URL을 필요한 요소에 맞게 분해하여 request 변수에 저장한다.
    let request = Utils.parseRequestURL()

    // request 변수의 요소들을 이용하여 이동한 URL을 파싱한다.
    let parsedURL = (request.resource ? '/' + request.resource : '/') + (request.id ? '/:id' : '') + (request.verb ? '/' + request.verb : '')
    
    // 페이지 정보를 가져온다.
    // 해당 URL에 라우터가 존재하지 않을 경우 Error404 페이지를 렌더링 한다.
    let page = routes[parsedURL] ? routes[parsedURL] : Error404
    content.innerHTML = await page.render();
    await page.after_render();
  
}

// Listen on hash change:
window.addEventListener('hashchange', router);

// Listen on page load:
window.addEventListener('load', router);
```

