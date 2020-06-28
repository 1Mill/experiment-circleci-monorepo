const sopsDecode = require('sops-decoder');

const DEVELOPMENT_ENVIRONMENT = 'development';
const PRODUCTION_ENVIRONMENT = 'production';
const STAGING_ENVIRONMENT = 'staging';

_filePath = () => {
	let prefix = "";
	if (process.env.NODE_ENV === DEVELOPMENT_ENVIRONMENT) {
		prefix = "dev";
	}
	if (process.env.NODE_ENV === PRODUCTION_ENVIRONMENT) {
		prefix = "prod";
	}
	if (process.env.NODE_ENV === STAGING_ENVIRONMENT) {
		prefix = "stag";
	}
	return `./secrets/${prefix}.sops.json`;
};

const getSecrets = async() => {
	try {
		const path = _filePath();
		const data = await sopsDecode.decodeFile(path);
		return data;
	} catch (err) {
		console.error(err);
		return {};
	}
};

module.exports = { getSecrets };
