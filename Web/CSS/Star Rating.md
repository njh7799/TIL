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
import React from 'react'
import styles from './StarRate.module.css'
const starRate = (props) => {
    const style = { background: 'linear-gradient(90deg, #fc0 30%, #fff 30%)' }
    return (
        <div className={styles.StarRate}>★★★★★</div>
    )
}

export default starRate
```

```css
.StarRate {
  background-size: cover;
  background-position: center;
  background: linear-gradient(90deg, #fc0 30%, #fff 30%);
  text-align: center;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

```

