cv = rgb2gray(imread('demo/img_upscale.png'));
cover = rgb2gray(imread('demo/img_downscale.png'));

points1 = detectSURFFeatures(cv);
points2 = detectSURFFeatures(cover);                              

[features1, valid_points1] = extractFeatures(cv, points1);
[features2, valid_points2] = extractFeatures(cover, points2);

indexPairs = matchFeatures(features1, features2);

matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);



showMatchedFeatures(cv, cover, matchedPoints1, matchedPoints2, 'montage');
% matchedPoints1 = matchedPoints1.Location.';
% matchedPoints2 = matchedPoints2.Location.';
% % matchedPoints1 = matchedPoints1(:,1:4);
% % matchedPoints2 = matchedPoints2(:,1:4);
% matchedPoints1 = [194 190 485 493; 242 500 154 582];
% matchedPoints2 = [1 0 440 440; 1 350 0 350];
% x = matchedPoints1(1,:);
% y = matchedPoints1(2,:);
% X = matchedPoints2(1,:);
% Y = matchedPoints2(2,:);
% n = size(matchedPoints2,2);
% rows0 = zeros(3,n);
% rowsXY = -[X; Y; ones(1,n)];
% hx = [rowsXY; rows0; x.*X; x.*Y; x];
% hy = [rows0; rowsXY; y.*X; y.*Y; y];
% h = [hx hy];
% [U, S, V] = svd(h);
% homography = (reshape(U(:,9), 3, 3)).';
% 
% hp = rgb2gray(imread('hp_cover.jpg'));
% hp = imresize(hp, [size(cover,1) size(cover,2)]);
% %     hp = warpH(hp, inv(homography), size(cv));
% %     imshow(hp);
%  input = [];
%  for i = 1:size(hp,1)
%      for j = 1:size(hp,2)
%          input = [input; [i,j]];
%       end
%   end
% 
%  input = input.';
%  q = homography * [input; ones(1, size(input, 2))];
%  p = q(3,:);
%  output = [q(1,:)./p; q(2,:)./p];
% 
%  output = int16(output);
% 
%  for i = 1:size(hp, 1)
%      for j = 1:size(hp,2)
%         x = output(:,(i-1)*size(hp, 2)+j).';
%         cv(x(1,1),x(1,2)) = hp(i,j);
%     end
%  end
% 
%  imshow(cv);