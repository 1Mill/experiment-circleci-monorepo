const sopsDecode = require('sops-decoder');

const main = async() => {
	try {
		const data = await sopsDecode.decodeFile('./secrets/dev.sops.json');
		console.log(JSON.stringify(data));
	} catch (err) {
		console.error(err);
	}
}
main();
