pragma solidity >=0.4.25 <0.6.0;
contract Encounter
{

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


    function PatientAddRecord(uint64 vaccineCode, string memory _hcn) public
    {
        if (vaccineCode == 0)
        {
            revert();
        }

        bytes32 hcn = stringToBytes32(_hcn);

        if (vaccinations[vaccineCode].patient.hcn_hash != keccak256(abi.encode(hcn))){
            revert();
        }
        vaccinations[vaccineCode].patient.addr = msg.sender;
    }

    function ProviderAddRecord(uint64 vaccineCode, string memory _hcn, string memory _name) public
    {
        if (vaccineCode == 0)
        {
            revert();
        }

        bytes32 hcn = stringToBytes32(_hcn);
        bytes32 name = stringToBytes32(_name);
        vaccinations[vaccineCode].provider.addr = msg.sender;
        vaccinations[vaccineCode].patient.hcn_hash = keccak256(abi.encode(hcn));
        vaccinations[vaccineCode].vaccine.name = name;
    }

    function CheckVaccination(uint64 vaccineCode, string memory _hcn) public view returns (string memory)
    {
        if (vaccineCode == 0)
        {
            revert();
        }
        bytes32 hcn = stringToBytes32(_hcn);
        if (vaccinations[vaccineCode].patient.hcn_hash != keccak256(abi.encode(hcn))){
            revert();
        }
        return bytes32ToString(vaccinations[vaccineCode].vaccine.name);
    }

    function stringToBytes32(string memory source) public pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }

    function bytes32ToString(bytes32 x) public pure returns (string memory) {
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
