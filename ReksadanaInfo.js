var
    myArgs = process.argv.slice(2),
    axios = require('axios'),
    CryptoJS = require("crypto-js"),
    fs = require("fs"),
    Metod = encodeURIComponent(myArgs[0]),
    UserInput = encodeURIComponent(myArgs[1]),
    Period = encodeURIComponent(myArgs[2]),
    BaseUrlApi = 'https://api.bibit.id/',
    SaveFolder = "cache/";

if (UserInput === "" || UserInput === "undefined" || Metod === "" || Metod === "undefined") {
    console.log("must have 2 arg; method & value\nex:\nnode x.js \"method\" \"value\"")
    process.exit()
}

if (Metod === "list" || Metod === "product" || Metod === "prospectus" || Metod === "factsheets" || Metod === "simulation" || Metod === "chart" || Metod === "aum" || Metod === "dividends" || Metod === "switchables") {
    GetMetod = Metod;
} else {
    console.log("no method avail")
    process.exit()
}

if (GetMetod === "list" || GetMetod === "product" || GetMetod === "chart" || GetMetod === "aum") {
    RequireCripto = 0;
} else {
    RequireCripto = 1;
}

if (GetMetod === "chart" || GetMetod === "aum") {
    if (Period === "" || Period === "undefined") {
        console.log("for method:\"chart,aum\"\nmust have 3 arg; method, producname, and period\nex:\nnode x.js \"method\" \"producname\" \"period\"")
        process.exit()
    }
}

if (GetMetod === "chart" || GetMetod === "aum") {
    const AvailRangePeroid = ["1D", "1M", "3M", "YTD", "1Y", "3Y", "5Y", "10Y", "ALL"];
    const FinalAvailRangePeroid = AvailRangePeroid.find(element => element === Period.toUpperCase());

    if (FinalAvailRangePeroid === undefined) {
        console.log("Avail range peroid for method \"chart, aum\":\n" + AvailRangePeroid)
        process.exit()
    }
}
let BuildFolder = GetMetod;
let MakeDir;

switch (BuildFolder) {
    case "list":
        MakeDir = SaveFolder + 'reksainfo';
        break;
    default:
        MakeDir = SaveFolder + 'product/' + UserInput;
}

let UrlConfig,
    FinalSaveFolder;
switch (GetMetod) {
    case "list":
        UrlConfig = BaseUrlApi + 'products/' + 'list?page=' + UserInput + '&limit=40&sort_by=7&sort=asc';
        FinalSaveFolder = SaveFolder + 'reksainfo/page_' + UserInput + '.json';
        break;
    case "product":
        UrlConfig = BaseUrlApi + 'products/' + UserInput;
        FinalSaveFolder = SaveFolder + 'product/' + UserInput + '/' + UserInput + '_product.json';
        break;
    case "prospectus":
        UrlConfig = BaseUrlApi + 'products/' + UserInput + '/prospectus';
        FinalSaveFolder = SaveFolder + 'product/' + UserInput + '/' + UserInput + '_prospectus.json';
        break;
    case "factsheets":
        UrlConfig = BaseUrlApi + 'products/' + UserInput + '/factsheets';
        FinalSaveFolder = SaveFolder + 'product/' + UserInput + '/' + UserInput + '_factsheets.json';
        break;
    case "simulation":
        UrlConfig = BaseUrlApi + 'simulation/' + UserInput + '?range=120'
        FinalSaveFolder = SaveFolder + 'product/' + UserInput + '/' + UserInput + '_simulation.json';
        break;
    case "chart":
        UrlConfig = BaseUrlApi + 'products/' + UserInput + '/chart?period=' + Period.toUpperCase();
        FinalSaveFolder = SaveFolder + 'product/' + UserInput + '/' + UserInput + '_chart_' + Period.toUpperCase() + '.json';
        break;
    case "aum":
        UrlConfig = BaseUrlApi + 'products/' + UserInput + '/chart/aum?period=' + Period.toUpperCase();
        FinalSaveFolder = SaveFolder + 'product/' + UserInput + '/' + UserInput + '_aum_' + Period.toUpperCase() + '.json';
        break;
    case "dividends":
        UrlConfig = BaseUrlApi + 'products/' + UserInput + '/dividends?page=1&limit=999'
        FinalSaveFolder = SaveFolder + 'product/' + UserInput + '/' + UserInput + '_dividends.json';
        break;
    case "switchables":
        UrlConfig = BaseUrlApi + 'products/' + UserInput + '/switchables?page=1&limit=999'
        FinalSaveFolder = SaveFolder + 'product/' + UserInput + '/' + UserInput + '_switchables.json';
        break;
    default:
        // No default
}

var config = {
    method: 'get',
    url: UrlConfig,
    headers: {
        'origin': 'https://bibit.id'
    }
};

axios(config)
    .then(function(response) {
        ParseJson = JSON.parse(JSON.stringify(response.data));
        const theData = ParseJson.data;

        if (RequireCripto === 0) {
            const option = {
                iv: CryptoJS.enc.Hex.parse(theData.slice(0, 32)),
                mode: CryptoJS.mode.CBC,
                format: CryptoJS.format.Hex
            }
            const bytes = CryptoJS.AES.decrypt(theData.slice(32, theData.length - 32), CryptoJS.enc.Utf8.parse(theData.slice(theData.length - 32, theData.length)), option);
            const decryptedData = JSON.parse(bytes.toString(CryptoJS.enc.Utf8));
            const Isinya = decryptedData;
            var FinalValue = Isinya;
            var StorePath = FinalSaveFolder;
        } else {
            var FinalValue = theData;
            var StorePath = FinalSaveFolder
        }
        fs.mkdirSync(MakeDir, {
            recursive: true
        })
        
        fs.writeFileSync(StorePath, JSON.stringify(FinalValue), function(err) {
            if (err) throw err;
        });
    
        console.log(JSON.stringify(FinalValue));

    })
    .catch(function(error) {
        //console.log(error);
        process.exit()
    });
