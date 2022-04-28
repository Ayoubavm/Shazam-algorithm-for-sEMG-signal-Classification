%% Prepare data vector
 load('data_final.mat')
dataTotal_train = cat(1, ca, la, oa, pa);
dataTotal_test  = cat(1, ct, lt, ot, pt);
%% Validation
labels = zeros(1,60);
labels(1:15) =1;
labels(16:30) =2;
labels(31:45) =3;
labels(46:60) =4;

predictions = zeros(1,60);

% *******************classifier********************************
fs=1000;
for j = 1:1:size(dataTotal_test,1)
%     j=17
j=10;
tic
    sst=dataTotal_test(55,:);
    for zz=1:1:size(dataTotal_train,1)
    temp=corrcoef(crs(sst,fs),crs(dataTotal_train(zz,:),fs));
    result(zz)=temp(1,2);
    end
[val inx]=max(result);
if inx<61
    predictions(j)=1;
elseif inx>60 && inx<121 
    predictions(j)=2;
elseif inx>120 && inx<181 
    predictions(j)=3;
elseif inx>180 && inx<241 
    predictions(j)=4;
end
toc
%display(predictions)
end
%**************************************************************
%% Confusion Matrix
C = confusionmat(labels,predictions);
figure(1),confusionchart(C);

cp = classperf(labels',predictions')
