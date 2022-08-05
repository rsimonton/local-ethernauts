import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  let i:number = 10;
  
  while(i-- > 0) {
    await attacker.hackContract();
  }
};

export default helper;
