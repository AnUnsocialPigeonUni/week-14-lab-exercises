


const generateHelloString = (language = "english") => {
  switch (language) {
    case "english":   return "Hello";
    case "german":    return "Hallo";
    case "french":    return "Bonjour"
    case "bob":       return "Bobert!"
    case "gurmukhi":  return "ਸਤਿ ਸ੍ਰੀ ਅਕਾਲ";
    default:          return `Unknown language ${language}`;
  }
}

module.exports={generateHelloString}
