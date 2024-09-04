%MATLAB Program for Discrete Testing (discretetesting.m)
%Program for face recognition (Discrete Testing)
load ('E:\My Articles\Face Recognition Using PCA and  Wavelet Transform\Code\wpcadb.mat', 'M', 'N', 'm', 'n', 'Ppca', 'T');
%Please change the above path as per your working directory
%wpcadb.mat loads followings in workspace
%Number of total training images [n], Image size [M, N], Mean Image [m]
%Reduced Eigen vectors transformation matrix [Ppca]
%Transformed dataset matrix [T]
[filename, pathname] =uigetfile ('*.*', 'Select the Input Face Image');
filewithpath=strcat (pathname, filename);
img=imread(filewithpath);
imgo=img; %Copying image for display
img=rgb2gray (img);
%img = imgaussfilt(img, 2); % GaussianBlur with a kernel size of 5x5 (sigma = 2)
img=imresize (img, [M, N]);
%Ibin = imbinarize(img, adaptthresh(img, 0.5, 'NeighborhoodSize', 11, 'Statistic', 'gaussian'));
level=graythresh (img);
Ibin=imbinarize (img, level);
%Finding Discrete Wavelet Transform
dwtmode ('per', 'nodisp');
[cA, cH, cV, cD] =dwt2 (double (Ibin), 'db10');
wc=[cA, cH; cV, cD]; %Wavelet coefficients
%Finding standard deviation of wavelet coefficients 
stdcol=std (wc);
wcc= (wc'); 
stdrow=std (wcc);
fvstd=[stdcol stdrow]; %Feature vector using STD
fvpca= (fvstd-m) *Ppca; %Projecting fv to PCA space
distarray=zeros (n,1); %Initialize difference array
for i=1:n
    distarray(i) =sum (abs (T(i,:)-fvpca)); %Finding L1 distance
end

%Displaying first five matches
[result, indx] =sort (distarray);
resultimg1=imread (sprintf('%d.jpg', indx (1))); 
resultimg2=imread (sprintf('%d.jpg', indx (2))); 
resultimg3=imread(sprintf('%d.jpg',indx (3))); 
resultimg4=imread (sprintf('%d.jpg', indx (4))); 
resultimg5=imread(sprintf('%d.jpg',indx (5)));
subplot (231); imshow(imgo); title('Input Test Image')
subplot (232); imshow(resultimg1); title('First Matched Image') 
subplot (233); imshow(resultimg2); title('Second Matched Image') 
subplot (234); imshow(resultimg3); title('Third Matched Image') 
subplot (235); imshow(resultimg4); title('Fourth Matched Image') 
subplot (236); imshow(resultimg5); title('Fifth Matched Image')
