clear;
%% Hidden Markov Model
initProb = [
    0.97 0.01 0.01 0.01
    ];
Emission = [
    0.10 0.23 0.41 0.26     % From state 1 to another states
    0.21 0.40 0.14 0.25     % From state 2
    0.35 0.15 0.05 0.45     % From state 3
    0.23 0.37 0.31 0.09     % From state 4
    ];

Trans = [
    0.55 0.25 0.10 0.10     % Emission probabilities From state 1
    0.11 0.49 0.18 0.22     % Emission probabilities From state 2
    0.24 0.10 0.56 0.10     % Emission probabilities From state 3
    0.15 0.25 0.13 0.47     % Emission probabilities From state 4
    ];
   
currentProb = initProb;

%% Viterbi algorithem

testSequence = ceil(rand(1,10)*4);

%     currentProb Update
%     currentProb = currentProb*Emission

for i1 = 1:length(testSequence)
    
    inputVal = testSequence(i1);
    
    bk = Emission(:,inputVal);
    onz = ones(1,4);
    bkz = bk*onz;

    currentProb = currentProb*Trans;
    stateSUM = (bk').*currentProb;
    
    estimatedVal = find(max(stateSUM) == stateSUM);
    
    fprintf('Input value %d - Est : %d\n',inputVal,estimatedVal);
    
end