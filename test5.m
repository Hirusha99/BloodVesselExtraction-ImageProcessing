function [] = test3 ()
  clc;
  clear;
  
  Image = imread('D:\HIRU\USJ\uni\4th year\digital image processing\Picture1.jpg');
  imshow(Image);
  
  GrayImage = rgb2gray(Image);
  imshow(GrayImage);
  
  pkg load image
  
  BinaryImage = im2bw(GrayImage, 0.32);
  imshow(BinaryImage);
  
  NegImage = imcomplement(BinaryImage);
  imshow(NegImage);
  
  NoiseFreeImage = medfilt2(NegImage,[3 3]);
  imshow(NoiseFreeImage);
  
  se = strel('disk',2,0);
  
  ErodedImage = imerode(NoiseFreeImage, se);
  imshow(ErodedImage);
  
  OpenImage = bwareaopen(ErodedImage, 200);
  imshow(OpenImage);

  
  erode_1 = imerode(OpenImage,se);
  imshow(erode_1);
  
  erode_2 = imerode(erode_1,se);
  imshow(erode_2); 
  
  erode_3 = imerode(erode_2,se);
  imshow(erode_3);
  
  erode_4 = imerode(erode_3,se);
  imshow(erode_4);
  
  
  erode_5 = imerode(erode_4,se);
  imshow(erode_5);
  
  
  vessel_img = bwareaopen(erode_5,200);
  imshow(vessel_img);
  
  se2 = strel('disk',12,0);
  
 
  dilate_img = imdilate (vessel_img,se2);
  imshow (dilate_img);
  
  sub_img = imsubtract (NoiseFreeImage, dilate_img);
  imshow(sub_img);
  

  


endfunction
  
  
  
test3();