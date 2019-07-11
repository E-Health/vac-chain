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
    }

    struct Vaccine {
        address addr;
    }

    struct Vaccination {
        Patient patient;
        Provider provider;
        Vaccine vaccine;
    }

    mapping (uint => Vaccination) Vaccinations;

    function MakeOfferRecord(int offerPrice) public
    {
        if (offerPrice == 0)
        {
            revert();
        }

        if (State != StateType.ItemAvailable)
        {
            revert();
        }

        if (InstanceOwner == msg.sender)
        {
            revert();
        }

        InstanceBuyer = msg.sender;
        OfferPrice = offerPrice;
        State = StateType.OfferPlaced;
    }

    function RejectOfferRecord() public
    {
        if ( State != StateType.OfferPlaced )
        {
            revert();
        }

        if (InstanceOwner != msg.sender)
        {
            revert();
        }

        InstanceBuyer = 0x0000000000000000000000000000000000000000;
        State = StateType.ItemAvailable;
    }

    function AcceptOfferRecord() public
    {
        if ( msg.sender != InstanceOwner )
        {
            revert();
        }

        State = StateType.Accepted;
    }

    function ReleaseMyRecord() public
    {

    }

    function DisplayRecord() public
    {

    }
}
