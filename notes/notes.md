## start ganache

```text
ganache-cli -b 2 -h 192.168.0.250 -e 100000

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
   ```javascript
    truffle migrate --network development
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

* __Where is my production build?__

    The production build will be in the `app/build` folder after running `npm run build` in the `app` folder.
