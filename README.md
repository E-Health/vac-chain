# :baby_symbol: vac-chain

## Just a POC, nothing more!

![vac-chain](https://raw.github.com/E-Health/vac-chain/develop/notes/vacchain.png)

There are discrete pieces of health information that, if stored on-chain may have a huge impact on operational efficiency, availability and patient safety. Vaccination and allergy information are typical examples.
vac-chain is a prototype of an on-chain storage of vaccination information on Ethereum blockchain using smart contracts in solidity using the truffle Drizzle box (React/Redux). This may be extended for similar use cases in medicine.

## Instructions

* check out this repo and *npm install* in the main folder
* *npm run ganache*
* Open a second terminal and
```
truffle compile
truffle migrate
```
*  switch to app folder *cd app*
* *npm install*
* *npm start*
* Access application at **localhost:3000**

## Steps
* Provider adds a record
* Patient confirms
* Clients can verify - if *code* matches *hcn*, returns *name* as status
* Please note that, for the *status* to work, all three roles should have different active accounts. So run *ganache* on a different machine and add the IP to drizzleOptions.js and truffle-config.js. Finally, run the /app on three different systems for each role.
## Author

Bell Eapen (McMaster U) | [Homepage](https://nuchange.ca)
