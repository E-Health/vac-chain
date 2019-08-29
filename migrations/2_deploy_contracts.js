const Encounter = artifacts.require("Encounter");

module.exports = function(deployer) {
  deployer.deploy(Encounter);

};
