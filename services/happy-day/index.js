const { getSecrets } = require("./utilities/getSecrets");

const main = async() => {
	const { hello } = await getSecrets();
	console.log(hello);
	// setTimeout(() => {
	// 	const secrets = SecretsClass.secrets;
	// 	console.log(secrets);
	// 	const { hello } = secrets;
	// 	console.log(hello);
	// }, 3000);
}

setInterval(() => {
	main();
}, 1000)
