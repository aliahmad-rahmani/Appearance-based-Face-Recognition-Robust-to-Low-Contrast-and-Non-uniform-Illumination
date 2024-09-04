%MATLAB Program for Bulk Testing (bulktesting.m)
%Program for face recognition (Bulk Testing)
load('E:\My Articles\Face Recognition Using PCA and  Wavelet Transform\Code\wpcadb.mat', 'M', 'N', 'm','n','Ppca','T');
%Please change the above path as per your working directory
%% 
nop=40; %No. of persons
ntr=320; %No. of training images
nte=80; %No. of test images
p=nte/nop; %No. of test images/person
q=ntr/nop; %No. of training images/person 
K=320; %Start of Counter for test images-1 
L=0; %Counter for train images-1
flag= zeros (1, nte); %Outcomes
while (K<= ((ntr+nte) -p))
    for i= (K+1): (K+p)
        img=imread(sprintf('%d.jpg',i)); %Reading Images 
        indx=facerecog (img, M, N, m, n, Ppca, T);
        if (i>=K+1) && (i<=K+p) && (indx>=L+1) && (indx<=L+q)
            flag (i)=1;
        else
            flag (i)=0;
        end
     end
     K=K+p; L=L+q;
end

result= (nnz (flag) /nte) *100; disp('%age accuracy')
result
