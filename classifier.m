%%
%% Load latex training data
latex_train= load('featureMat_Latex_train_bioLBP.mat')
%%
latex_matrix = zeros();
latex_matrix = latex_train.featureMat_Latex_train_bioLBP;
%% Load liv training data

liv_train=load('featureMat_liv_train_bioLBP.mat')

%%
liv_matrix=zeros();
liv_matrix = liv_train.featureMat_liv_train_bioLBP;

%% Create labels
latex_label=zeros(200,1);
liv_label=zeros(1000,1);
liv_label(1:1000)=1;

%%
data=[latex_matrix;liv_matrix];
data_label=[latex_label;liv_label];

%% Start the training
model1 = fitcnb(data,data_label);

%% Load latex testing data
latex_test= load('featureMat_Latex_test_bioLBP.mat');
%%
latex_test_matrix = zeros();
latex_test_matrix = latex_test.featureMat_Latex_test_bioLBP;
%% Load liv testing data

liv_test=load('featureMat_liv_test_bioLBP.mat');

%%
liv_test_matrix=zeros();
liv_test_matrix = liv_test.featureMat_liv_test_bioLBP;

%% Create labels
latex_test_label=zeros(200,1);
liv_test_label=zeros(1000,1);
liv_test_label(1:1000)=1;

%%
data_test=[latex_test_matrix;liv_test_matrix];
data_test_label=[latex_test_label;liv_test_label];

%% Start testing
[label, Posterior, cost] = predict(model1, data_test);

%% Calculate loss and resubstitution error

L = loss(model1,data_test,data_test_label);
resubstitutionLoss = resubLoss(model1);

%% Train on latex_gelatin and liv finger prints
%% Load gelatine training data
gela_train= load('featureMat_Gelatine_train_bioLBP.mat')

%%
gela_matrix = zeros();
gela_matrix = gela_train.featureMat_Gelatine_train_bioLBP;
gela_label=zeros(200,1);
gela_label(1:200)=2;
%%
data1=[latex_matrix;liv_matrix;gela_matrix];
datalabel1=[latex_label;liv_label;gela_label];

%% Start the training
model2 = fitcnb(data1,datalabel1);
%% Load gelatine testing data
gela_test= load('featureMat_Gelatine_test_bioLBP.mat');
%%
gel_test_matrix = zeros();
gel_test_matrix = gela_test.featureMat_Gelatine_test_bioLBP;
%% Create labels
gel_test_label=zeros(200,1);

gel_test_label(1:200)=2;