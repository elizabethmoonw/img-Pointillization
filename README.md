# Image Pointillization
Pointillization is a technique of painting using small dots or strokes of color pioneered by French Post-Impressionist
painter Georges-Pierre Seurat. I implemented a set of Matlab functions to “pointillize” digital images.

The basic steps are:
(1) divide the image into non-overlapping square blocks of pixels
(2) calculate for each block the average RGB intensities and average gray intensity
(3) for each block draw a dot in a size and a color related to the gray and/or color intensity of the block. Our functions allow the user to choose grayscale or full color or anywhere in between. 

The user can also choose between a still image or an animation—of your own design—of the pointillization. We use pointillization to produce interesting images in this project, but in fact pointillization is a way to compress data, representing a set (block) of data with one or few values.

