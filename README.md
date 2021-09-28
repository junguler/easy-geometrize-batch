## bat files for easy batch converting images with geometrize minimal library
click on the animated gif below to go to my repo that shows some examples of you images can look

[![G_banner](https://user-images.githubusercontent.com/59083599/135176240-8a1688e9-c8a5-4635-a932-71a5ab97332b.gif)](https://github.com/junguler/_image-manipulation/tree/main/Geometrize)

### what is it and why should i care?
it's simple and dirty bat files i made for someone who needed to batch convert some of their images using [geometrize-library](https://github.com/Tw1ddle/geometrize-lib-example)

### how to use?
either clone the repo 
``` 
git clone https://github.com/junguler/easy-geometrize-batch.git
```
or download the automatically created [zip file](https://github.com/junguler/easy-geometrize-batch/archive/refs/heads/main.zip) and extract the folder with [7-zip](https://www.7-zip.org/) or [peazip](https://peazip.github.io/), 
put your images in the "in" folder and use primitive.bat, after the process is complete the converted images can be found in the "out" folder

### the binary is out of date
yes, but i'm not using windows anymore and don't know if the new binary files are working since it's an automated process that makes them, you can download newer versions by going to [this page](https://s3.amazonaws.com/geometrize-lib-example-bucket/index.html) just make sure to rename the binary or edit the bat files to the new name

### something went wrong, how could i fix it?
i'll try to help if i can but my knowlege of the language is pretty limited so you are better served searching online

### what about linux?
i've uploaded linux binaries as well, make them executable in the terminal if they are not already 
```
chmod +x geometrize_cg++
chmod +x geometrize_g++
```
there is two binaries for linux, one is built on golang, the other is built on C++, i don't know which one is better as both seem to perform the same and make the same output image

either add the binary to a folder in your `@PATH` or put `./` behind the geometrize binary in the folder it is in to let the shell know where it is, or put the absolute path to the binary like this `~/bin/geometrize_g++`

### bash script

i've included a `geometrize.sh` and `geometrize_advabced.sh` bash scripts for easy usage, these script assume you have the `geometrize_g++` binary in the same folder as it, if you want to put geometrize in your `@PATH` change `./geometrize_g++` to `geometrize_g++` in the script and put the script in `@PATH` aswell and omit `./` in terminal

make it executable:
```
chmod +x geometrize_advanced.sh
chmod +x geometrize.sh
```
in your terminal do:
```
./geometrize.sh
geometrize.sh
```
### bash/zsh function

if you don't need a script there is also a bash/zsh function and for loop as well, read them below:
```
geometrize () { for i in *.jpg; do echo $i; geometrize_g++ -i $i -o g-$i."$1" -s "$2" -t "$3"; done; }
```
`-i` imports images, change `*.jpg` to other extensions as needed or `*.*` if everything you have in a folder is pictures

`-o` decides output extensions, if you want to output to different folders here is where to change it, like this: `-o ./out/g-$i."$1"` 

`-s` decides number of the shapes, more is slower but makes the output image more similar to the input image

`-t` sets the modes, `rectangle` , `rotated_rectangle` , `triangle` , `ellipse` , `rotated_ellipse` , `circle` , `line` , `quadratic_bezier` , `polyline` . multiple choices are permitted here, just use space between them and put them in quotes, for example `-t "triangle circle polyline"` 
default is all shapes

`-c` sets the number of candidates each frame goes thru to choose one, default 500, higher number is slower but more accurate

`-m` sets the number of mutates each shape goes thru, default 100, higher number is slower but more accurate

after setting that function in your `.bashrc` or `.zshrc` open the terminal in a folder with your images and do this for example:
```
geometrize png 500 triangle 
```
above example converts every image with `.jpg` extension in your folder with traingle shape and 500 shapes per image and `png` extension

### for loop

you can also do all of this in the terminal without making a function:
```
for i in *.jpg; do echo $i; geometrize_g++ -i $i -o g-$i.png -s 500 -t "triangle circle"; done
```
if you don't want to change output extension remove `.png` part and just do `-o g-$i`
