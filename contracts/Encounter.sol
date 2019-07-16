pragma solidity >=0.4.25 <0.6.0;

contract Encounter
{


    constructor(int price) public
    {
    }

    struct Patient {
        address addr;
    }

    struct Provider {
        address addr;
        string name;
    }

    struct Vaccine {
        uint64 code;
    }

    struct Vaccination {
        Patient patient;
        Provider provider;
        Vaccine vaccine;
    }

    Vaccination[] public myVaccinations;

    // Get vaccination from vaccine code
    mapping (uint64 => Vaccination) vaccinations;
    // Check if the vaccine was ever given
    mapping (uint64 => bool) vaccinated;
    // Map individuals to array of vaccines
    mapping (address => myVaccinations) allVaccinations;

    function PatientRequestRecord(uint64 vaccineCode) public
    {
        if (vaccineCode == 0)
        {
            revert();
        }

        if (!vaccinated[vaccineCode])
        {
            revert();
        }
        vaccinations[vaccineCode].patient.addr = msg.sender;
        allVaccinations[msg.sender].push(vaccinations[vaccineCode]);
    }

    function ProviderAddRecord(uint64 vaccineCode) public
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
        vaccinations[vaccineCode].vaccine.code = vaccineCode;
    }

    function DisplayRecord(address client) public
    {
        return allVaccinations[client];
    }

}
