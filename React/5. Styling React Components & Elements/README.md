# Styling React Components & Elements

## style 설정해서 직접 배정하기

```javascript
const style = {
      backgroundColor: 'green',
      color: 'white',
      font: 'inherit',
      border: '1px solid blue',
      padding: '8px',
      cursor: 'pointer'
    };
return (
      <div className='App'>
        <button style={style}>
          Switch Name
        </button>
      </div>
    );
```

## 클래스 다이나믹 방식으로 적용하기

```javascript
let classes = [];
    if (this.state.persons.length <= 2) {
      classes.push('red');
    }
    if (this.state.persons.length <= 1) {
      classes.push('bold');
    }
    return (
      <div className='App'>
        <p className={classes.join(' ')}>FunFUnFun</p>
      </div>
```

