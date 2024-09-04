% MATLAB Program for Training (dbtrain.m)
% Program to implement face recognition using Wavelet features and PCA
n=320; %No. of training images
L=90; %No. of dominant Eigen values selected
M=200; N=180; %Required Image Dimensions
X=zeros (n, (M+N)); %Initialize data set matrix [X]

for count=1:n
    I=imread(sprintf('%d.jpg',count)); %Reading Images 
    I=rgb2gray (I); %RGB to Grayscale
    %I = imgaussfilt(I, 2); % GaussianBlur with a kernel size of 5x5 (sigma = 2)
    I = imresize (I, [M,N]); %Resize all images to specified MXN
    %Ibin = imbinarize(I, adaptthresh(I, 0.5, 'NeighborhoodSize', 11, 'Statistic', 'gaussian'));
    level=graythresh (I);
    Ibin=imbinarize (I, level); %Getting binary image
    dwtmode ('per', 'nodisp');
    [cA, cH, cV, cD]=dwt2 (double (Ibin), 'db10');
    wc=[cA, cH; cV, cD]; %Wavelet coefficients arranged
    stdcol=std (wc); %Col. wise
    wcc= (wc');
    stdrow=std (wcc); %Row wise
    fvstd=[stdcol,stdrow]; %Feature vector using STD
    X (count, :)=fvstd; %Saving all feature vectors
end
%Projecting all the feature vectors to PCA space 
m=mean (X); %Mean of all feature vectors
for i=1:n
    X(i,:)=X(i, :)-m; %Subtracting mean from each feature vector
end
Q= (X'*X)/(n-1); %Finding Covariance Matrix
[Evecm, Evalm] =eig (Q); %Getting eigen values and eigen vectors of matrix Q 
Eval=diag (Evalm); %Getting eigen values
[Evalsorted, Index]=sort (Eval, 'descend'); %Sorting eigen values 
Evecsorted=Evecm (:, Index); %Getting corresponding eigen vectors 
Ppca=Evecsorted (:,1: L); %Reduced transformation matrix Ppca 
T=X*Ppca; %Projecting each feature vector to PCA space
save ('E:\My Articles\Face Recognition Using PCA and  Wavelet Transform\Code\wpcadb.mat', 'n', 'm', 'M', 'N', 'Ppca', 'T'); 
%Please change the above path as per your working directory
