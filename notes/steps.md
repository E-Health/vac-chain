## STEPS

* STEP 1: nvm use node (ganache system)
* STEP 2: ganache-cli -b 2 -h 192.168.0.250 -e 1000000
* STEP 3: nvm use node in dev
* STEP 4: truffle compile (If it does not compile or for 'out of gas' errors try debugging in remix browser IDE)
* STEP 5: truffle migrate
* STEP 6: cd app
* STEP 7:  BROWSER=none npm start
* STEP 8: Access in a browser at port 3000 Ex: 192.168.0.248:3000
