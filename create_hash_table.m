%% Prepare data vector

load('data_final.mat')
dataTotal_train = cat(1, ca, la, oa, pa);
dataTotal_test  = cat(1, ct, lt, ot, pt);
fs=1000;
kk=zeros(480,6);
r1=size(kk,1)/8;
c1=size(kk,2)/6;
rows = zeros(1,r1);
rows(:)=8;
columns =zeros(1,c1);
columns(:)=6;
test_data = mat2cell(kk,rows,columns);

for i=1:1:size(dataTotal_test,1)
    test_data{i}=crs(dataTotal_test(i,:),fs);
end

%***********************************************
mm=zeros(1920,6);
r2=size(mm,1)/8;
c2=size(mm,2)/6;
rows = zeros(1,r2);
rows(:)=8;
columns =zeros(1,c2);
columns(:)=6;
train_data = mat2cell(mm,rows,columns);

for i=1:1:size(dataTotal_train,1)
    train_data{i}=crs(dataTotal_train(i,:),fs);
end
