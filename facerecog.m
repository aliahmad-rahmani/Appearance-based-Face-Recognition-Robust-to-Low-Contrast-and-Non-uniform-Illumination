%facerecog() function (facerecog.m)
%Function for face recognition using wavelet features and PCA
function indx=facerecog (img, M, N, m, n, Ppca, T)
img = rgb2gray (img);
%img = imgaussfilt(img, 2); % GaussianBlur with a kernel size of 5x5 (sigma = 2)
img = imresize (img, [M,N]);
% Adaptive thresholding
%Ibin = imbinarize(img, adaptthresh(img, 0.5, 'NeighborhoodSize', 11, 'Statistic', 'gaussian'));
level=graythresh (img);
Ibin=imbinarize (img, level);
%Finding Discrete Wavelet Transform
dwtmode ('per', 'nodisp');
[cA, cH, cV, cD]=dwt2 (double (Ibin), 'db10');
wc=[cA, cH; cV, cD]; %Wavelet coefficients
%Finding standard deviation of wavelet coefficients
stdcol=std (wc);
wcc= (wc');
stdrow=std (wcc);
fvstd=[stdcol stdrow]; %Feature vector using STD
fvpca= (fvstd-m) *Ppca; %Projecting fv to PCA space 
distarray= zeros(n,1); %Initialize difference array
for i=1:n
    distarray (i) =sum (abs (T(i,:)-fvpca)); %Finding L1 distance
end
[~,indx]=min (distarray); %Getting best match
