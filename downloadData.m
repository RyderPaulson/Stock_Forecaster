function data = downloadData(options)
    arguments
        options.stat = "Close";
        options.func = "TIME_SERIES_DAILY";
        options.size = "full";
    end
    % Load key
    key = string(importdata("APIKey.txt"));

    % Get currently downloaded data
    dataNames = dir("data");
    dataNames([dataNames.isdir] == 1) = [];
    preLoadedDataNames = erase(dataNames.name, '.mat');

    % Get Starting point for downloading new data

    % Download initial symbol
    baseQuery = "https://www.alphavantage.co/query?function=";
    symbol = "&symbol=" + ticker;
    outputSize = "&outputsize=" + options.size;
    keyQuery = "&apikey=" + key;
    URL = baseQuery + options.func + symbol + outputSize + keyQuery;
    response = webread(URL);
    invalidResponse = true;
    while response~=invalidResponse
        % Get next ticker and download data
    end
    % Get next ticker and download data
end