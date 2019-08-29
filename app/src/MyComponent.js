import React from "react";
import {
  AccountData,
  ContractData,
  ContractForm,
} from "drizzle-react-components";

import logo from "./logo.png";




export default ({ accounts }) => (
  <div className="App">
    <div>
      <img src={logo} alt="drizzle-logo" />
      <h1>Vaccine Examples</h1>
      <p>Examples of how to get save vaccine information on blockchain.</p>
    </div>

    <div className="section">
      <h2>Active Account</h2>
      <AccountData accountIndex="0" units="ether" precision="3" />
    </div>

    <div className="section">
      <h2>Provider Add Record</h2>
      <p>
        Providers add vaccine code on blockchain.
      </p>

      <ContractForm contract="Encounter" method="ProviderAddRecord" />
    </div>

    <div className="section">
      <h2>Patient Add Record</h2>
      <p>
       Patients add their status on blockchain
      </p>

      <ContractForm contract="Encounter" method="PatientAddRecord" />
    </div>


    <div className="section">
      <h2>Check Record</h2>
      <p>
        Anybody can check vaccine stat.
      </p>


      <ContractForm contract="Encounter" method="CheckVaccination"/>
      <p>Status</p>
      <ContractData contract="Encounter" method="Status" methodArgs={[accounts[0]]}/>

    </div>

  </div>
);
