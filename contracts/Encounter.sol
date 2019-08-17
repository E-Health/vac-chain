pragma solidity >=0.4.25 <0.6.0;
contract Encounter
{

    // All HCNs (patient_ids) are hashed with keccak256
    struct Patient {
        bytes32 hcn_hash;
        address addr;
    }

    struct Provider {
        address addr;
    }

    struct Vaccine {
        bytes32 name;
    }

    struct Vaccination {
        Patient patient;
        Provider provider;
        Vaccine vaccine;
    }


    // Get vaccination from vaccine code
    mapping (uint64 => Vaccination) vaccinations;
    // This is called by ContractData using the users address as methodArgs
    mapping (address => string) public Status;

    function PatientAddRecord(uint64 vaccineCode, string memory hcn) public
    {
        if (vaccineCode == 0)
        {
            revert();
        }

        bytes32 _hcn= stringToBytes32(hcn);

        if (vaccinations[vaccineCode].patient.hcn_hash != keccak256(abi.encode(_hcn))){
            revert();
        }
        vaccinations[vaccineCode].patient.addr = msg.sender;
    }

    function ProviderAddRecord(uint64 vaccineCode, string memory hcn, string memory name) public
    {
        if (vaccineCode == 0)
        {
            revert();
        }

        bytes32 _hcn= stringToBytes32(hcn);
        bytes32 _name = stringToBytes32(name);
        vaccinations[vaccineCode].provider.addr = msg.sender;
        vaccinations[vaccineCode].patient.hcn_hash = keccak256(abi.encode(_hcn));
        vaccinations[vaccineCode].vaccine.name = _name;
    }

    function CheckVaccination(uint64 vaccineCode, string memory hcn) public
    {
        if (vaccineCode == 0)
        {
            revert();
        }
        bytes32 _hcn= stringToBytes32(hcn);
        if (vaccinations[vaccineCode].patient.hcn_hash != keccak256(abi.encode(_hcn))){
            revert();
        }
        // FIXME: currently return string is stored in a map which is used by ContractData.
        // TODO: Explore a  way in drizzle-react-components to directly display this return value.
        // return bytes32ToString(vaccinations[vaccineCode].vaccine.name);
        Status[msg.sender] = bytes32ToString(vaccinations[vaccineCode].vaccine.name);

    }

    // Internally all strings are converted to bytes32 to reduce gas
    function stringToBytes32(string memory source) internal pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }

    // bytes32 are mapped back to string for display
    function bytes32ToString(bytes32 x) internal pure returns (string memory) {
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (uint j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
        return string(bytesStringTrimmed);
    }

}
