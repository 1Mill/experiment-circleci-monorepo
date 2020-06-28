const { getSecrets } = require('./utilities/getSecrets');

const main = async() => {
	const { hello } = await getSecrets();
	console.log(hello);
}

setInterval(() => {
	main();
}, 1000)
