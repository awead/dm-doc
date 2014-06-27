# dm-doc

This is the github repository for my doctoral paper on lute temperaments.  The paper is by no means exhaustive, 
but covers some of the basic issues of temperament in Western music and discusses fretting systems used on the
lute from the sixteenth through early seventeenth centuries.  It's mostly written in LaTeX, but the musical
examples are in Lilypond and there are some random perl scripts that I wrote to generate the LaTeX code for 
the fretboard drawings. 

Bibliographic information is handled using Biber and references are formatted according to the Chicago 
Manual of Style.

### Document Status

It was published in 2014 and is available via IUScholarWorks

[http://hdl.handle.net/2022/18424](http://hdl.handle.net/2022/18424)

### Why is this here?

If you've never used LaTeX before, you may find this confusing.  If you have and want to write your own paper
using it, feel free to look at the source files for examples.

If you're interested in the paper topic, you can either read the .tex files which contain the actual text
of the paper, or download the entire project and generate the paper in pdf format.

### Installation

##### Pre-requisites

* pdflatex (I use [MacTex](http://tug.org/mactex/))
* biber (comes with MacTex above)
* [lilypond](http://www.lilypond.org/)
* your favorite text editor (I use [Sublime Text](http://www.sublimetext.com/))

##### Create the pdf

* Clone the project to your computer using git
* run make all

You should have a file called paper.pdf in the root of the project folder.

### Copyright

Except where I have cited the work of others, everything here, including the text of the paper and the code
written to generate the paper, is all my own work.  I have attempted to indicate this to the best of my
ability.  If you find any fault with this, please contact me and I will make corrections.

By placing everything here, I'm allowing anyone to freely use and distribute my work under the 
[Creative Commons License](http://creativecommons.org/licenses/) which states that one is freely 
able to use my work so long as credit is given.  If you use or distribute any of the work here that
is not my own, such as the information cited from other sources in this paper, then I expect you to
cite that information in your own work just as I have attempted to do in mine.

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">dm-doc</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/awead/dm-doc" property="cc:attributionName" rel="cc:attributionURL">Adam Wead</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.
