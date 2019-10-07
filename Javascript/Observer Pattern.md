# Observer Pattern

[github link](https://github.com/njh7799/Observer_Pattern)

```js
// Observable.js

class Observable {
    constructor() {
        this._observers = new Set();
    }
    // Adds an observer to the internal list of observers.
    addObserver(observer) {
        this._observers.add(observer);
    }

    // Deletes an observer from the internal list of observers.
    deleteObserver(observer) {
        this._observers = [...this._observers].filter(subscriber => subscriber !== observer);
    }

    // Deletes all observers from the internal list of observers.
    deleteObservers() {
        this._observers = new Set();
    }

    // Returns the number of observers in the internal list of observers.
    countObservers()

    // Sets the internal flag that indicates this observable has changed state.
    setChanged()

    // Clears the internal flag that indicates this observable has changed state.
    clearChanged()

    // Returns the boolean value true if this observable has changed state.
    hasChanged()

    // Checks the internal flag to see if the observable has changed state and notifies all observers.
    notifyObservers() {
        this.this._observers.forEach(observer => observer.update(this))
    }

    // Checks the internal flag to see if the observable has changed state and notifies all observers. Passes the object specified in the parameter list to the notify() method of the observer.
    notifyObservers(obj) {
        this.this._observers.forEach(observer => observer.update(this, obj))
    }
}

module.exports = Observable
```

```js
// Observer.js

class Oberser {
    // Called when a change has occurred in the state of the observable.
    update(observable, obj)
}

module.exports = Oberser
```

