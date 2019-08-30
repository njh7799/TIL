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

