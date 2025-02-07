%STOCKFORECASTER Summary of this function goes here
%   Explanation to come
clear; clc; addpath("data\");
key = string(importdata("APIKey.txt"));

tickers = ["FNDX" "ARM" "QQQ"];

pullAndProcess(key,tickers);