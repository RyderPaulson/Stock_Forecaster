%STOCKFORECASTER Summary of this function goes here
%   Explanation to come
clear; clc;
key = string(importdata("APIKey.txt"));

tickers = ["IBM" "SPY" "QQQ"];

pullAndProcess(key,tickers);

