const simpsonsConfig = {
  'imgBaseUrl': 'https://duckduckgo.com',
  'dataUrl': 'https://api.duckduckgo.com/?q=simpsons+characters&format=json'
};

const wireConfig = {
  'imgBaseUrl': 'https://duckduckgo.com',
  'dataUrl': 'https://api.duckduckgo.com/?q=the+wire+characters&format=json'
};

Map<String, dynamic> getEnvironment() {
  const String env = String.fromEnvironment("env", defaultValue: "wire");

  switch (env) {
    case "simpsons":
      return simpsonsConfig;
    case "wire":
      return wireConfig;
    default:
      return wireConfig;
  }
}

final environment = getEnvironment();
