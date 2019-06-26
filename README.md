# :baby_symbol: vac-chain

## Work in Progress (Visit nuchange.ca / canehealth.com for updates)

![vac-chain](https://raw.github.com/E-Health/vac-chain/develop/notes/vacchain.png)

There are discrete pieces of health information that, if stored on-chain may have a huge impact on operational efficiency, availability and patient safety. Vaccination and allergy information are typical examples.
vac-chain is a prototype of an on-chain storage of vaccination information on Ethereum blockchain using smart contracts in solidity using the truffle Drizzle box (React/Redux). This may be extended for similar use cases in medicine.

## Installation

First ensure you are in a new and empty directory.

1. Run the `unbox` command via `npx` and skip to step 3. This will install all necessary dependencies. A Create-React-App is generated in the `app` directory.
   ```js
   npx truffle unbox drizzle
   ```

2. Alternatively, you can install Truffle globally and run the `unbox` command.
    ```javascript
    npm install -g truffle
    truffle unbox drizzle
    ```

3. Run the development console.
    ```javascript
    truffle develop
    ```

4. Compile and migrate the smart contracts. Note inside the development console we don't preface commands with `truffle`.
    ```javascript
    compile
    migrate
    ```

5. In the `app` directory, we run the React app. Smart contract changes must be manually recompiled and migrated.
    ```javascript
    // in another terminal (i.e. not in the truffle develop prompt)
    cd app
    npm run start
    ```

6. Truffle can run tests written in Solidity or JavaScript against your smart contracts. Note the command varies slightly if you're in or outside of the development console.
    ```javascript
    // inside the development console
    test

    // outside the development console
    truffle test
    ```

7. Jest is included for testing React components. Compile your contracts before running Jest, or you may receive some file not found errors.
    ```javascript
    // ensure you are inside the app directory when running this
    npm run test
    ```

8. To build the application for production, use the build script. A production build will be in the `app/build` folder.
    ```javascript
    // ensure you are inside the app directory when running this
    npm run build
    ```

## Author

Bell Eapen (McMaster U) [Homepage](https://nuchange.ca)
