import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  const data = victim.deployTransaction.data;
  const password = `0x${data.substr(data.length - 64)}`;
  //console.log(data);
  //console.log(password);
  await victim.unlock(password);
};

export default helper;
