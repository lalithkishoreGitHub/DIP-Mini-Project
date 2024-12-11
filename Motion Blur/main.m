img = imread("Motion Blur\original_images\cam_img2.jpg");
img_gray = im2gray(img);

% Step 1: Add Gaussian Noise
noisyImage = imnoise(img_gray, 'speckle',0.05);

% Step 2: Add Motion Blur
psf = fspecial('motion', 30, 90);

% Step 3: Perform Richardson-Lucy Deconvolution
blurredImage = im2double(imfilter(noisyImage, psf, 'symmetric')); 
restoredImage = deconvlucy(blurredImage, psf, 100, 0.3);

% Step 4: Post-Processing
restoredImage = imbilatfilt(restoredImage, 0.1);

% Step 5: Display Results
figure;
subplot(2, 3, 1), imshow(img_gray), title('Original Image');
subplot(2, 3, 2), imshow(noisyImage), title('Noised Image');
subplot(2, 3, 3), imshow(blurredImage), title('Blurred Image');
subplot(2, 3, 4), imshow(restoredImage), title('Restored Image');

% Step 6: Calculate PSNR and SSIM
psnrValue = psnr(restoredImage, blurredImage);
ssimValue = ssim(restoredImage, im2double(img_gray));

fprintf('PSNR: %.2f dB\n', psnrValue);
fprintf('SSIM: %.2f\n', ssimValue);

% Adjust the parameters according to the images.