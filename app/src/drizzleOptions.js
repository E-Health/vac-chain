import Encounter from "./contracts/Encounter.json";

const options = {
    web3: {
        block: false,
        fallback: {
            type: "ws",
            url: "ws://127.0.0.1:8545",
            //url: "ws://192.168.0.250:8545",
        },
    },
    contracts: [Encounter],
    events: {
    },
    polls: {
        accounts: 1500,
    },
};

export default options;
