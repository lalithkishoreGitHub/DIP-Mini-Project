To restore an image using median filtering, the process involves the following steps:

Load the original image and convert it to grayscale if it is in RGB format. Grayscale simplifies the analysis as it operates on 2D arrays.
Add noise (e.g., salt-and-pepper noise) to simulate real-world degradations in image quality.
Apply a median blur filter to remove noise while preserving edges. Median filtering works by replacing each pixel's value with the median of its neighbors in a defined window.
Calculate the quality metrics—PSNR (Peak Signal-to-Noise Ratio), SSIM (Structural Similarity Index), and MSE (Mean Square Error)—to evaluate the effectiveness of the noise reduction.
Display the original, noised, and restored images for visual comparison.
