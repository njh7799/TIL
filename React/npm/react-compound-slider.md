[npm](https://www.npmjs.com/package/react-compound-slider)

[codesandbox](https://codesandbox.io/s/react-compound-slider-viuuk)

```js
// 가공한 코드

import React, { Component } from "react";
import { render } from "react-dom";
import { Slider, Rail, Handles, Tracks, Ticks } from "react-compound-slider";
import { Handle, Track, Tick } from "./components"; // example render components - source below

const sliderStyle = {
    position: "relative",
    width: "100%",
    marginTop: 100
};

const railStyle = {
    position: "absolute",
    width: "100%",
    height: 8,
    borderRadius: 4,
    cursor: "pointer",
    backgroundColor: "rgb(100,100,100)"
};

const domain = [100, 500];
const defaultValues = [100, 500];

class RangeSlider extends Component {
    onChange(e) {
        console.log(e[0], e[1])
    }
    render() {
        return (
            <div style={{ margin: "10%", height: 120, width: "80%" }}>
                <Slider
                    mode={2}
                    step={1}
                    domain={domain}
                    rootStyle={sliderStyle}
                    onUpdate={this.onUpdate}
                    onChange={this.onChange}
                    values={defaultValues}
                >
                    <Rail>
                        {({ getRailProps }) => (
                            <div style={railStyle} {...getRailProps()} />
                        )}
                    </Rail>
                    <Handles>
                        {({ handles, getHandleProps }) => {
                            return (
                                <div className="slider-handles">
                                    {handles.map(handle => (
                                        <Handle
                                            key={handle.id}
                                            handle={handle}
                                            domain={domain}
                                            getHandleProps={getHandleProps}
                                        />
                                    ))}
                                </div>
                            )
                        }}
                    </Handles>
                    <Tracks left={false} right={false}>
                        {({ tracks, getTrackProps }) => (
                            <div className="slider-tracks">
                                {tracks.map(({ id, source, target }) => (
                                    <Track
                                        key={id}
                                        source={source}
                                        target={target}
                                        getTrackProps={getTrackProps}
                                    />
                                ))}
                            </div>
                        )}
                    </Tracks>
                    {/* <Ticks count={5}>
                        {({ ticks }) => (
                            <div className="slider-ticks">
                                {ticks.map(tick => (
                                    <Tick key={tick.id} tick={tick} count={ticks.length} />
                                ))}
                            </div>
                        )}
                    </Ticks> */}
                </Slider>
            </div>
        );
    }
}

export default RangeSlider
```



함수형으로 변경하고 데이터 수정 함수 넘겨 받음	

```js
import React, { Component } from "react";
import { render } from "react-dom";
import { Slider, Rail, Handles, Tracks, Ticks } from "react-compound-slider";
import { Handle, Track, Tick } from "./components"; // example render components - source below

const sliderStyle = {
  position: "relative",
  width: "100%",
  marginTop: 100
};

const railStyle = {
  position: "absolute",
  width: "100%",
  height: 8,
  borderRadius: 4,
  cursor: "pointer",
  backgroundColor: "rgb(100,100,100)"
};

const domain = [100, 500];
const defaultValues = [100, 500];

const RangeSlider = (props) => {
  const onChange = (e) => {
    props.changeBoundary(e[0], e[1])
  }

  return (
    <div style={{ margin: "10%", height: 120, width: "80%" }}>
      <Slider
        mode={2}
        step={1}
        domain={domain}
        rootStyle={sliderStyle}
        onChange={onChange}
        values={defaultValues}
      >
        <Rail>
          {({ getRailProps }) => (
            <div style={railStyle} {...getRailProps()} />
          )}
        </Rail>
        <Handles>
          {({ handles, getHandleProps }) => {
            return (
              <div className="slider-handles">
                {handles.map(handle => (
                  <Handle
                    key={handle.id}
                    handle={handle}
                    domain={domain}
                    getHandleProps={getHandleProps}
                  />
                ))}
              </div>
            )
          }}
        </Handles>
        <Tracks left={false} right={false}>
          {({ tracks, getTrackProps }) => (
            <div className="slider-tracks">
              {tracks.map(({ id, source, target }) => (
                <Track
                  key={id}
                  source={source}
                  target={target}
                  getTrackProps={getTrackProps}
                />
              ))}
            </div>
          )}
        </Tracks>
      </Slider>
    </div>
  );

}

export default RangeSlider
```