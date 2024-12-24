const hre = require("hardhat");

async function main() {
    const Subnet = await hre.ethers.getContractFactory("Subnet");
    const subnet = await Subnet.deploy();
    console.log("deployed at:", await subnet.getAddress());

    const tx = await subnet.getHyperParameter(0, {
        gasLimit: 3_000_000
    });
    await tx.wait();
    console.log("getHyperParameter called");
}

main().catch(console.error);
