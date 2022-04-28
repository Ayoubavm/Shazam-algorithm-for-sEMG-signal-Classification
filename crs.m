
function y=crs(x,fs)
% Calculate the Stft matrix using a hamming window of 128. and sampling
% frequency fs
ss=stft(x,fs,"Window",hamming(64));
sa=abs(ss);
r1=size(sa,1)/8;
c1=size(sa,2)/2;
rows = zeros(1,r1);
rows(:)=8;
columns =zeros(1,c1);
columns(:)=2;
B = mat2cell(sa,rows,columns);
res=zeros(r1,c1);
for i=1:1:r1
    for j=1:1:c1
    res(i,j)=max(max(B{i,j}));
    end
end
y=res;
end