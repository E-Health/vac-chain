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
        string name;
        uint64 code;
    }

    struct Vaccination {
        Patient patient;
        Provider provider;
        Vaccine vaccine;
    }


    // Get vaccination from vaccine code
    mapping (uint64 => Vaccination) vaccinations;
    // Check if the vaccine was ever given
    mapping (uint64 => bool) public vaccinated;

    function PatientAddRecord(uint64 vaccineCode, string memory hcn) public
    {
        if (vaccineCode == 0)
        {
            revert();
        }

        if (!vaccinated[vaccineCode])
        {
            revert();
        }

        if (vaccinations[vaccineCode].patient.hcn_hash != keccak256(abi.encode(hcn))){
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

        if (vaccinated[vaccineCode])
        {
            revert();
        }

        vaccinated[vaccineCode] = true;
        vaccinations[vaccineCode].provider.addr = msg.sender;
        vaccinations[vaccineCode].patient.hcn_hash = keccak256(abi.encode(hcn));
        vaccinations[vaccineCode].vaccine.code = vaccineCode;
        vaccinations[vaccineCode].vaccine.name = name;
    }

    function CheckVaccination(uint64 vaccineCode, string memory hcn) public view returns (string memory)
    {
        if (vaccineCode == 0)
        {
            revert();
        }

        if (!vaccinated[vaccineCode])
        {
            revert();
        }

        if (vaccinations[vaccineCode].patient.hcn_hash != keccak256(abi.encode(hcn))){
            revert();
        }
        return vaccinations[vaccineCode].vaccine.name;
    }

}
