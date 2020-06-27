const fs = require('fs');

let secure = {};
try {
	fs.readFile('./secrets.dev.sops.json', (err, data) => {
		const secrets = JSON.parse(data.toString());

		const {
			example_key,
			hello,
		} = secrets;

		console.log(hello);
		console.log(example_key);
	});
	console.log('Success');
} catch (err) {
	console.error(err);
	console.error('Unable to decode secrets');
}
