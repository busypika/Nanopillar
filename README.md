# Nanopillar
Simulate an nanopillar with Fortran and Matlab

## Requirements

Fortran 90/95
Matlab 2016 or higher version

## Instructions
  Use Nanopillar.f90 to ganarate coordinates, then use Matlab to visualize graphics.
  To change parameters in the program, P_SIZE, SIZE and P_l are what you’re looking for. SIZE stands for the FCC cubic size, keep it as much as you need while not taking too much computer performance.
  SIZE will effect to both P_SIZE and P_l, so choose wisely.
  P_SIZE determines the radius of pillar, the bigger it takes, a bigger hexagon shows up. P_l determines the length of nanopillar, this one should be smaller than SIZE to avoid errors.
  
## Demonstrations

Smallest pillar:
![image](https://github.com/busypika/Nanopillar/blob/master/Pic/smallest.jpg)

Same pillar from another viewpoint:
![image](https://github.com/busypika/Nanopillar/blob/master/Pic/Hexagon_pattern.jpg)

Bigger pillar:
![image](https://github.com/busypika/Nanopillar/blob/master/Pic/bigger.jpg)

Same pillar from another viewpoint, pattern still maintain hexagonal:
![image](https://github.com/busypika/Nanopillar/blob/master/Pic/Hexagonal.jpg)

Larger pillar:
![image](https://github.com/busypika/Nanopillar/blob/master/Pic/Pillar.jpg)
