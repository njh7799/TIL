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

<h2>map 메소드를 이용한 state elements 파싱</h2>

```javascript
persons = (
  <div>
    {this.state.persons.map(person => {
      return <Person name={person.name} age={person.age}></Person>;
    })}
  </div>
);
```

<h2>클릭한 div 제거하기</h2>

```javascript
deletePersonHandler = personIndex => {
    const persons = this.state.persons;// 옳지 않은 방법
    persons.splice(personIndex, 1);
    this.setState({
      persons: persons
    });
  };

render(){
  persons = (
    <div>
      {this.state.persons.map((person, index) => {
        return (
          <Person
            name={person.name}
            age={person.age}
            click={() => this.deletePersonHandler(index)}
          ></Person>
        );
      })}
    </div>
  );

  return (
    {persons}
  )
}
```

<h2>배열의 복사</h2>

`const persons = this.state.persons` 와 같은 방법으로 복사를 할 경우, originalArr의 pointer가 복사가 되기 때문에, arr를 변경하였을 때, original Arr까지 변경되는 문제가 발생할 수 있다.

해결책)

1. const persons = this.state.persons.slice()
2. const persons = [...this.state.persons]

<h2>Key 설정</h2>

```javascript
<Person
  name={person.name}
  age={person.age}
  click={() => this.deletePersonHandler(index)}
  ket={person.id}
></Person>
```

Q. event handler에서의 `event` 변수
