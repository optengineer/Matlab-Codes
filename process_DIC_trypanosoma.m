% clear all;
clc

fileName = '+dox1_w3DICIIIcube_s4.stk';
[stack, nbImages] = tiffread2(fileName);

%%
[M,N] = size(stack(1).data);
dic = im2uint8((stack(25).data));


% imagesc(dic); colormap gray

%%
std_kernel_size = 9;
% a = stdfilt(merged_dic,[0 1 1;1 1 1; 1 1 0]);
a = stdfilt(dic,ones(std_kernel_size,std_kernel_size));
b = imopen(a,strel('disk',30));
c = b > 0.9;
L = bwlabel(c,4);

imshow(label2rgb(L));

dic_rgb = cat(3,dic,dic,dic);
dic_rgb = dic_rgb + L;
imshow(dic_rgb);
