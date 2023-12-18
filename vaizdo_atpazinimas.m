close all
clear all
clc
%% raidziu pavyzdziu nuskaitymas ir pozymiu skaiciavimas
%% read the image with hand-written characters
pavadinimas = 'train_data_full_1.png';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 5);
%% Atpazintuvo kurimas
%% Development of character recognizer
% pozymiai is celiu masyvo perkeliami i matrica 
% take the features from cell-type variable and save into a matrix-type variable
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teisinga atsakyma matrica: 11 raidziu, 8 eilutes mokymui
% create the matrices of correct answers for each line (number of matrices = number of symbol lines)
T = [eye(3),eye(3),eye(3),eye(3),eye(3)];
% sukuriamas SBF tinklas duotiems P ir T sarysiams
% create an RBF network for classification with 13 (now 8) neurons, and sigma = 1

tinklas = newrb(P,T,0,1,3);

%% Tinklo patikra | Test of the network (recognizer)
% skaiciuojamas tinklo isejimas nezinomiems pozymiams
% estimate output of the network for unknown symbols (row, that were not used during training)
pavadinimas = 'test_aba_1.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

P2 = cell2mat(pozymiai_patikrai);

Y2 = sim(tinklas, P2);
% ieskoma, kuriame isejime gauta didziausia reiksme
% find which neural network output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
%% Visualize result
% apskaiciuosime raidziu skaiciu - pozymiu P2 stulpeliu skaiciu
% calculate the total number of symbols in the row
raidziu_sk = size(P2,2);
% rezultatu  saugosime kintamajame 'atsakymas'
% we will save the result in variable 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, 'A'];
        case 2
            atsakymas = [atsakymas, 'B'];
        case 3
            atsakymas = [atsakymas, 'C'];
        case 4
            atsakymas = [atsakymas, 'D'];
        case 5
            atsakymas = [atsakymas, 'E'];
        case 6
            atsakymas = [atsakymas, 'F'];
        case 7
            atsakymas = [atsakymas, 'G'];
        case 8
            atsakymas = [atsakymas, 'H'];
        case 9
            atsakymas = [atsakymas, 'I'];
        case 10
            atsakymas = [atsakymas, 'K'];
        case 11
            atsakymas = [atsakymas, 'J'];
    end
end
% pateikime rezultatu  komandiniame lange
% show the result in command window
disp(atsakymas)
% %% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
% %% zodzio "HEDGE" pozymiu isskyrimas 
% %% Extract features of the test image
% pavadinimas = 'test_aba_1.png';
% pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);
% 
% %% Raidziu atpazinimas
% %% Perform letter/symbol recognition
% % pozymiai is celiu masyvo perkeliami uz matricu 
% % features from cell-variable are stored to matrix-variable
% P2 = cell2mat(pozymiai_patikrai);
% % skaiciuojamas tinklo isejimas nezinomiems pozymiams
% % estimating neuran network output for newly estimated features
% Y2 = sim(tinklas, P2);
% % ieskoma, kuriame isejime gauta didziausia reiksme
% % searching which output gives maximum value
% [a2, b2] = max(Y2);
% %% Rezultato atvaizdavimas | Visualization of result
% % apskaiciuosime raidziu skaiciu - pozymiu P2 stulpeliu skaiciu
% % calculating number of symbols - number of columns
% raidziu_sk = size(P2,2);
% % rezultatu  saugosime kintamajame 'atsakymas'
% atsakymas = [];
% for k = 1:raidziu_sk
%     switch b2(k)
%         case 1
%             atsakymas = [atsakymas, 'A'];
%         case 2
%             atsakymas = [atsakymas, 'B'];
%         case 3
%             atsakymas = [atsakymas, 'C'];
%         case 4
%             atsakymas = [atsakymas, 'D'];
%         case 5
%             atsakymas = [atsakymas, 'E'];
%         case 6
%             atsakymas = [atsakymas, 'F'];
%         case 7
%             atsakymas = [atsakymas, 'G'];
%         case 8
%             atsakymas = [atsakymas, 'H'];
%         case 9
%             atsakymas = [atsakymas, 'I'];
%         case 10
%             atsakymas = [atsakymas, 'K'];
%         case 11
%             atsakymas = [atsakymas, 'J'];
%     end
% end
% % pateikime rezultatu  komandiniame lange
% % disp(atsakymas)
% figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off
% %% zodzio "BED" pozymiu isskyrimas 
% %% extract features for next/another test image
% pavadinimas = 'test_cab1.png';
% pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);
% 
% %% Raidziu atpazinimas
% % pozymiai is celiu masyvo perkeliami uz matricu 
% P2 = cell2mat(pozymiai_patikrai);
% % skaiciuojamas tinklo isejimas nezinomiems pozymiams
% Y2 = sim(tinklas, P2);
% % ieskoma, kuriame isejime gauta didziausia reiksme
% [a2, b2] = max(Y2);
% %% Rezultato atvaizdavimas
% % apskaiciuosime raidziu skaiciu - pozymiu P2 stulpeliu skaiciu
% raidziu_sk = size(P2,2);
% % rezultatu  saugosime kintamajame 'atsakymas'
% atsakymas = [];
% for k = 1:raidziu_sk
%     switch b2(k)
%         case 1
%             atsakymas = [atsakymas, 'A'];
%         case 2
%             atsakymas = [atsakymas, 'B'];
%         case 3
%             atsakymas = [atsakymas, 'C'];
%         case 4
%             atsakymas = [atsakymas, 'D'];
%         case 5
%             atsakymas = [atsakymas, 'E'];
%         case 6
%             atsakymas = [atsakymas, 'F'];
%         case 7
%             atsakymas = [atsakymas, 'G'];
%         case 8
%             atsakymas = [atsakymas, 'H'];
%         case 9
%             atsakymas = [atsakymas, 'I'];
%         case 10
%             atsakymas = [atsakymas, 'K'];
%         case 11
%             atsakymas = [atsakymas, 'J'];
%     end
% end
% % pateikime rezultatu  komandiniame lange
% % disp(atsakymas)
% figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off
% 
