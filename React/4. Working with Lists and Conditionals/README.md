<h1>Working with Lists and Conditionals</h1>

<h2>jsx 에서 조건문 사용하기<h2>

- if else 구문dml 직접적 사용은 불가
- 삼항 연산자는 사용 가능

PLAN A.

```javascript
render(){
  return (
    ...
    {
      this.state.showPerson ? (
        <div>
          <Person />
          <Person />
        </div>
      ) : null;
    }
  )

}
```

PLAN B.

```javascript
render(){
  if (this.state.showPersons) {
    persons = (
      <div>
        <Person />
        <Person />
      </div>
    );
  }
  return(
    ...
    {person}
    ...
  )
}
```
