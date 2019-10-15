# apollo  <small>[link]( https://www.apollographql.com/docs/react/v2.5/essentials/get-started/#connect-your-client-to-react )</small>

리액트와 graphQL을 연결시켜주는 도구이다.

## Installing

```bash
npm install apollo-boost react-apollo graphql --save
```

## Create a client

클라이언트 만들기

```js
import ApolloClient from "apollo-boost";

const client = new ApolloClient({
  uri: "https://48p1r2roz4.sse.codesandbox.io"
});
```

간단한 쿼리 요청
```js
import { gql } from "apollo-boost";
// or you can use `import gql from 'graphql-tag';` instead

...

client
  .query({
    query: gql`
      {
        rates(currency: "USD") {
          currency
        }
      }
    `
  })
  .then(result => console.log(result));
```

## Connect your client to React

```js
import React from "react";
import { render } from "react-dom";

import { ApolloProvider } from "react-apollo";

const App = () => (
  <ApolloProvider client={client}>
    <div>
      <h2>My first Apollo app 🚀</h2>
    </div>
  </ApolloProvider>
);

render(<App />, document.getElementById("root"));
```

짜잔 연결이 되었습니다.

## Request data

```js
Copy
import { Query } from "react-apollo";
import { gql } from "apollo-boost";

const ExchangeRates = () => (
  <Query
    query={gql`
      {
        rates(currency: "USD") {
          currency
          rate
        }
      }
    `}
  >
    {({ loading, error, data }) => {
      if (loading) return <p>Loading...</p>;
      if (error) return <p>Error :(</p>;

      return data.rates.map(({ currency, rate }) => (
        <div key={currency}>
          <p>{currency}: {rate}</p>
        </div>
      ));
    }}
  </Query>
);
```

