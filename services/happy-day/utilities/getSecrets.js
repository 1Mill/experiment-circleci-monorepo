const { runShellCommand } = require('./runShellCommand');

const DEVELOPMENT_ENVIRONMENT = 'development';
const PRODUCTION_ENVIRONMENT = 'production';
const STAGING_ENVIRONMENT = 'staging';

_filePath = () => {
	let prefix = '';
	if (process.env.NODE_ENV === DEVELOPMENT_ENVIRONMENT) {
		prefix = 'dev';
	}
	if (process.env.NODE_ENV === PRODUCTION_ENVIRONMENT) {
		prefix = 'prod';
	}
	if (process.env.NODE_ENV === STAGING_ENVIRONMENT) {
		prefix = 'stag';
	}
	return `./secrets/${prefix}.sops.json`;
};

const getSecrets = async () => {
	try {
		const response = await runShellCommand({
			cmd: `sops --decrypt ${_filePath()}`
		});
		return JSON.parse(response);
	} catch (err) {
		console.error(err);
		return {}
	}
};

module.exports = { getSecrets };
