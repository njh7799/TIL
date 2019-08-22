<h1>Two Kinds of Applications</h1>

- Single Page Applications

  - 단일 페이지 내에서 js 와 React를 이용하여 구현
  - 매번 서버에 접근할 필요가 없다.
  - 페이지 전체가 React의 영향권에 있다.
  - 단 하나의 ReactDOM.render.call이 존재

- Multi Page Applications
  - 여러 URL에 접근하여 페이지를 구성
  - 페이지 전체가 React의 영향권에 있지는 않다.
  - 각각의 위젯들은 서로의 존재에 대해 알지 못한다.
