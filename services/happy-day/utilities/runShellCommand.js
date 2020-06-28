const util = require("util");
const { exec } = require("child_process");

const _exec = util.promisify(exec);

const runShellCommand = async({ cmd }) => {
	try {
		const { stdout } = await _exec(cmd);
		return stdout;
	} catch (err) {
		return err;
	}
};

module.exports = { runShellCommand };
