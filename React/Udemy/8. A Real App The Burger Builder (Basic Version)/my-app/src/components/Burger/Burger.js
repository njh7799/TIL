import React from 'react';
import styles from './Burger.module.css'
import BurgerIngredient from './BurgerIngredient/BurgerIngredient'
const burger = (props) => {
    let transfomredIngredients = Object.keys(props.ingredients).reduce((pre, val) => {
        for (let i = 0; i < props.ingredients[val]; i++)
            pre.push(<BurgerIngredient key={val + i} type={val} />)
        return pre
    }, [])
    if (transfomredIngredients.length === 0) {
        transfomredIngredients = <p>please start adding insgredients</p>
    }
    return (
        <div className={styles.Burger}>
            <BurgerIngredient type="bread-top" />
            {transfomredIngredients}
            <BurgerIngredient type="bread-bottom" />
        </div>
    );
}

export default burger;