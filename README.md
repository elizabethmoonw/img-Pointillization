# MATLAB-Projects

# Image Pointillization
Pointillization is a technique of painting using small dots or strokes of color pioneered by French Post-Impressionist
painter Georges-Pierre Seurat. I implemented a set of Matlab functions to “pointillize” digital images.

The basic steps are:
(1) divide the image into non-overlapping square blocks of pixels
(2) calculate for each block the average RGB intensities and average gray intensity
(3) for each block draw a dot in a size and a color related to the gray and/or color intensity of the block. Our functions allow the user to choose grayscale or full color or anywhere in between. 

The user can also choose between a still image or an animation—of your own design—of the pointillization. We use pointillization to produce interesting images in this project, but in fact pointillization is a way to compress data, representing a set (block) of data with one or few values.

# The Game of Life
Conway’s “Game” of Life is not actually a game that one plays; rather it is a simulation from some initial state following a set of rules. The state of the game is a grid (matrix) of elements, sometimes called cells. A cell can be either alive or dead. In one step of the game, the cells will either live or die according to some rules. Three functions are written to simulate this game. The rules stated below are taken from the Wikipedia entry on Conway’s Game of Life.
