# react-dates

## install

```bash
npm install --save react-dates moment@>=#.## react@>=#.## react-dom@>=#.##
```



## usage

```js
// Calendar.js

import React from "react";
import { DateRangePicker } from "react-dates";
import 'react-dates/lib/css/_datepicker.css';
import 'react-dates/initialize';

export default class Calendar extends React.Component {
    state = {
        focusedInput: null,
        startDate: null,
        endDate: null
    };
    render() {
        return (
            <DateRangePicker
                startDate={this.state.startDate} // momentPropTypes.momentObj or null,
                startDateId="your_unique_start_date_id" // PropTypes.string.isRequired,
                endDate={this.state.endDate} // momentPropTypes.momentObj or null,
                endDateId="your_unique_end_date_id" // PropTypes.string.isRequired,
                onDatesChange={({ startDate, endDate }) =>
                    this.setState({ startDate, endDate })
                } // PropTypes.func.isRequired,
                focusedInput={this.state.focusedInput} // PropTypes.oneOf([START_DATE, END_DATE]) or null,
                onFocusChange={focusedInput => this.setState({ focusedInput })} // PropTypes.func.isRequired,
            />
        );
    }
}

```
참고
- [codepen](https://codesandbox.io/s/react-dates-5jx2l)
- [공식 문서](https://github.com/airbnb/react-dates)




## DayPickerRangeController
캘린더만 쓰고싶을 때

```js
import React from "react";
import moment from 'moment'
import { DayPickerRangeController, isInclusivelyBeforeDay } from "react-dates";
import 'react-dates/lib/css/_datepicker.css';
import 'react-dates/initialize';

export default class Calendar extends React.Component {
    state = {
        startDate: null,
        endDate: null,
        
        // 포커싱 될 기준을 start로 할지 end 로 할지 설정. 직접 바꿔보면 앎
        // null 로 바꾸면 망함
        focusedInput: "startDate",
    };
    render() {
        return (
            <DayPickerRangeController
                startDate={this.state.startDate}
                endDate={this.state.endDate}

                // 모름
                onDatesChange={({ startDate, endDate }) =>
                    this.setState({ startDate, endDate })
                }
                
                // 모름
                focusedInput={this.state.focusedInput}

                // 모름
                onFocusChange={focusedInput => {
                    this.setState({ focusedInput: focusedInput || "startDate" });
                }}
                
                // 지난 날짜 disable
                isOutsideRange={day => isInclusivelyBeforeDay(day, moment().add(-1, 'days'))} 
                
                // 2달 씩 표시
                numberOfMonths={2} 
            />
        );
    }
}

```

참고

- 도움 하나도 안되는 공식문서 [ref](https://reactjsexample.com/an-easily-internationalizable-mobile-friendly-datepicker-library-for-the-web/)
- 공식 문서 동작 예시 [ref](https://airbnb.io/react-dates/?path=/story/daypickerrangecontroller--default)
- 기본 틀 만들기: [ref](https://github.com/airbnb/react-dates/issues/1700)
- 지난 날짜 disable [ref](https://github.com/airbnb/react-dates/issues/390)
