function fn() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'PRUEBA';
      }
  var config = {
    urlBaseOctoPerf: 'http://api.octoperf.com',
    urlPetStore:'https://petstore.swagger.io'
    }
if(env.toUpperCase() == 'PRUEBA'){
    config.urlBaseOctoPerf= 'https://petstore.swagger.io';
    karate.log('URL BASE PETSTORE', config.urlPetStore)
}

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}
