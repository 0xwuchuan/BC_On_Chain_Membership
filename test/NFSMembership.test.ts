import { expect } from "chai";
import { ethers } from "hardhat";

describe("Token", function () {
	it("Should return name Token", async function () {
		const Token = await ethers.getContractFactory("NFSMembership");
		const token = await Token.deploy();
		await token.deployed();
	});
}); 

describe("Soulbound", () => {
	it("Should block transfer of ownership", async function () {
		const Soulbound = await ethers.getContractFactory("NFSMembership");
		const [addr1, addr2] = await ethers.getSigners();
		const soulbound = await Soulbound.deploy();
		await soulbound.deployed();

		await expect(soulbound.transferFrom(addr1.address, addr2.address, 10)).to.be.revertedWith("cannot transfer ownership");
	})
})
