#!/bin/bash

echo "input extension (jpg, png, etc ...), use * for all files in the folder:"
read inExt 

echo "output extension (jpg, png, svg):"
read outExt 

echo "Number of shapes, less is faster but less accurate, start at 100 for a simple image, 500 for more complex:"
read numShapes 

echo "convert to: one or more (use spaces between them if you are using more than one): " 
echo "rectangle rotated_rectangle triangle ellipse rotated_ellipse circle line quadratic_bezier polyline "
read setMod 

for i in *.$inExt ; do echo $i ; geometrize_g++ -i $i -o g-$i."$outExt" -s "$numShapes" -t "$setMod" ; done 
for r in *.$inExt.$outExt; do mv "$r" "${r%.*.*}.$outExt" ; done
