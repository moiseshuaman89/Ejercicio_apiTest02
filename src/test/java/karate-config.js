function fn() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'PRUEBA';
      }
  var config = {
    urlBaseOctoPerf: 'http://api.octoperf.com'
    }
if(env.toUpperCase() == 'PRUEBA'){
    config.urlBaseOctoPerf= 'https://api.octoperf.com';
    karate.log('URL BASE OCTOPERF', config.urlBaseOctoPerf)
}

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}
