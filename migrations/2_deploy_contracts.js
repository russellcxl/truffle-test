var Adoption = artifact.require("./Adoption.sol");

module.exports = function (deployer) {
    deployer.deploy(Adoption);
};
