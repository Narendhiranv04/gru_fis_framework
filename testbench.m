%% Testbench for stwFIS

% Number is the number of trials.
data = readmatrix('1.csv');

% Split data in individual arrays. Each array is supposed to mimic the
% input from a sensor.
onset_actual = data(:,1);
time = data(:,2);
hcomV = data(:,3);
hip = data(:,5);
knee = data(:,6);

%% Sliding window
% The window has a stride length of 5. Each new 5 timesteps are collected
% and stored in a history variable. Once onset is detected, the LSTM can
% read back 25 timesetps for its burn in time.

win_size = 5;

% Total length of the STW trial
len = length(data);

% Check to make sure length of data is divisible by window size (5) and if
% not reduce it. Subtract 1 point each until the length is divisible by 5.
if mod(len,5) ~= 0
    for i=1:10
        len = len-1;
        if mod(len,5) == 0
            break
        end
    end
end


%% FIS Prediction

% A double threshold method is used. If the onset probability (FIS output)
% is above Th1 for a Th2 number of windows then onset is detected.
Th1 = 0.6; 
Th2 = 3;
counter = 0;

% History variable to store consequtive windows.
history = [];

% Index at which FIS predicts movement onset
idx_onset_fis = 0;

%  For loop in windows of 5
for i=1:5:len

    % Append new window to history
    history = [history; hip(i:i+4), hcomV(i:i+4), knee(i:i+4)];
    
    % Average values of window is input into the FIS
    hipM = mean(history(end-4:end,1));
    velM = mean(history(end-4:end,2));
    kneeM = mean(history(end-4:end,3));

    % Evaluate the FIS
    onset_fis = stwFIS(hipM, velM, kneeM);

    fprintf('IF hip is %.2f, hcomV is %.2f and knee is %.2f THEN onset is %.2f \n',hipM, velM, kneeM, onset_fis)

    if onset_fis >= Th1
        counter = counter +1;
    end

    if counter >= Th2
        idx_onset_fis = i;
        break;
    end
end