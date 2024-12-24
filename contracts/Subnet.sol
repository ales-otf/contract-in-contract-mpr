pragma solidity ^0.8.3;

address constant ISUBTENSOR_SUBNET_ADDRESS = 0x0000000000000000000000000000000000000803;

interface ISubnet {
    function getServingRateLimit(uint16 netuid) external view returns (uint64);
}

contract Subnet {
    event ServingRateLimitRead(uint16 netuid, uint64 servingRateLimit);

    function getHyperParameter(uint16 netuid) external returns (uint64) {
        ISubnet subnetPrecompile = ISubnet(ISUBTENSOR_SUBNET_ADDRESS);
        (bool success, bytes memory data) = ISUBTENSOR_SUBNET_ADDRESS.call(
            abi.encodeWithSelector(
                subnetPrecompile.getServingRateLimit.selector,
                netuid
            )
        );
        require(success, "Subnet call failed");

        uint64 value = abi.decode(data, (uint64));
        emit ServingRateLimitRead(netuid, value);
        return value;
    }
}
