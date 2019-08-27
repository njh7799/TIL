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
    const persons = this.state.persons;
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
