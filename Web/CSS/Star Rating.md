# Star Rating with vanilla CSS

## 이거 안됨
```html
<div class="Star">
☆☆☆☆☆
</div>
```

```css
.Star{
  position: relative;
}
.Star:before {
  content: "★★★★★";
  position: absolute;
  z-index: +1;
  background: linear-gradient(90deg, #fc0 30%, #fff 30%);
  -webkit-background-clip: text; 
  -webkit-text-fill-color: transparent;
}
```

## in React

```js
// Component
import React from 'react'
import styles from './StarRate.module.css'
const starRate = (props) => {
    const rate = props.children / 5 * 100;
    const style = {
        backgroundImage: `linear-gradient(90deg, #fc0 ${rate}%, #fff ${rate}%)`,
    }
    return (
        <div style={style} className={styles.StarRate} >★★★★★</div>
    )
}

export default starRate
```

```css
// CSS
.StarRate {
  background-size: cover;
  background-position: center;
  text-align: center;
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

```

```jsx
// Usage
<StarRate>{props.room.star_rate}</StarRate>
```

