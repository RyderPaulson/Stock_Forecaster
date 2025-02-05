function data = pullAndProcess(key,tickers,options)
    arguments
        key
        tickers
        options.stat = "Close";
        options.func = "TIME_SERIES_DAILY";
        options.size = "compact";
    end
    baseQuery = "https://www.alphavantage.co/query?function=";
    URL = strings(length(tickers),1);
    for i = 1:length(tickers)
        symbol = "&symbol=" + tickers{i};
        outputSize = "&outputsize=" + options.size;
        keyQuery = "&apikey=" + key;
        URL(i,1) = baseQuery + options.func + symbol + keyQuery;
        response = webread(URL(i,1));
        dataForProcess = response.TimeSeries_Daily_;
        dateFieldNames = fieldnames(dataForProcess);
        dateStr = regexp(dateFieldNames, 'x(\d{4})_(\d{2})_(\d{2})', 'tokens');
        dates = datetime(dateStr,'InputFormat','yyyy-MM-dd');
        data.(tickers).date = dates;
    end

end