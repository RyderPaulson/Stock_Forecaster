function equity = cleanData(response)
    %CLEANDATA Cleans initial JSON response
    %   Takes in JSON response and returns a ticker struct.
    arguments
        response
    end
    % Create stock ticker object

    % Store equity information

    % Convert fieldnames into cell array
    dataForProcess = response.TimeSeries_Daily_;
    dateFieldNames = fieldnames(dataForProcess);
    dateCellArr = regexp(dateFieldNames, 'x(\d{4})_(\d{2})_(\d{2})', 'tokens');
    
    % Extract the strings
    extractedStrings = cellfun(@(x) x{1}, dateCellArr, 'UniformOutput', false);
    
    % Convert the cell array to a 100x3 array of strings
    dateStr = string(vertcat(extractedStrings{:}));

    % Concatinate left into one string 
    dateStr = dateStr(:,1) + "-" + dateStr(:,2) + "-" + dateStr(:,3) ;
    dates = datetime(dateStr,'InputFormat','yyyy-MM-dd');
    dates.Hour = 16;
    % Flip so index increases with time
    dates = flip(dates);
    % Convert dates to seconds since Linux epoch
    mDates = posixtime(dates);

    % Extract corresponding values
    values = zeros(length(dateFieldNames),1);
    for i = 1:length(dateFieldNames)
        price = dataForProcess.(string(dateFieldNames(i))).x4_Close;
        values(i,1) = str2double(price);
    end

    values = flip(values);
    
end