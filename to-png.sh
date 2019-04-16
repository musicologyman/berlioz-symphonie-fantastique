#!/bin/bash
if [ ! -d "./png" ] 
then
  mkdir png
fi
lilypond --png -dresolution=600 berlioz-symphonie-fantastique-iv.ly
rm *.midi
mv *.png ./png
