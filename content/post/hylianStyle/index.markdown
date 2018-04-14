---
title: Make your R plot Hylian
author: [kevin, david, nicolas]
date: 2017-04-14
tags: [R, plot, fonts, icons, zelda]
rpkgs: [showtext, utils, graphics]
draft: false
tweet: Make your R plot Hylian
estime: 8
edits:
  - date: 2017-11-11
    comment: "Change paths to font files"
output:
  rmarkdown::html_page:
    toc: true
    fig_width: 3
    dev: svg
---





#### Below are presented the 6 steps you need to make your plot a Hylian one! **May the triforce be with you**!

### 0. R Version


```r
sessionInfo()[[1L]]$version.string
#R> [1] "R version 3.4.4 (2018-03-15)"
```


### 1. Open R and download the font

The [*Triforce* font](https://zeldauniverse.net/media/fonts/) is available on line.
Below we download it using R! Alternatively, you may simply download and install
it using a couple of clicks, if you proceed so, skip step 1.



```r
# Create a directory < fonts >
dr <- "assets/"
dir.create(dr, showWarnings = FALSE)

# Download Triforce font < Triforce.ttf >
url <- "http://zeldauniverse.net/wp-content/uploads/2014/01/Triforce.ttf_.zip"
download.file(url, destfile=paste0(dr, basename(url)), method="libcurl")

# Unzip the file
unzip(paste0(dr, basename(url)), exdir = dr)

# Remove .zip
file.remove(paste0(dr, basename(url)))
#R> [1] TRUE
```

### 2. Install the `showtext` package


```r
install.packages("showtext")
```

### 3. Look at the list of fonts available locally


```r
library(showtext)
showtext_auto()
font_files()
#R>  [1] "3270Medium.ttf"                     
#R>  [2] "3270Narrow.ttf"                     
#R>  [3] "3270SemiNarrow.ttf"                 
#R>  [4] "academicons.ttf"                    
#R>  [5] "AccanthisADFStd-Bold.otf"           
#R>  [6] "AccanthisADFStd-BoldItalic.otf"     
#R>  [7] "AccanthisADFStd-Italic.otf"         
#R>  [8] "AccanthisADFStd-Regular.otf"        
#R>  [9] "AccanthisADFStdNo2-Bold.otf"        
#R> [10] "AccanthisADFStdNo2-BoldItalic.otf"  
#R> [11] "AccanthisADFStdNo2-Italic.otf"      
#R> [12] "AccanthisADFStdNo2-Regular.otf"     
#R> [13] "AccanthisADFStdNo3-Bold.otf"        
#R> [14] "AccanthisADFStdNo3-BoldItalic.otf"  
#R> [15] "AccanthisADFStdNo3-Italic.otf"      
#R> [16] "AccanthisADFStdNo3-Regular.otf"     
#R> [17] "amiri-bold.ttf"                     
#R> [18] "amiri-boldslanted.ttf"              
#R> [19] "amiri-quran-colored.ttf"            
#R> [20] "amiri-quran.ttf"                    
#R> [21] "amiri-regular.ttf"                  
#R> [22] "amiri-slanted.ttf"                  
#R> [23] "Andale_Mono.ttf"                    
#R> [24] "andalemo.ttf"                       
#R> [25] "Anonymice Powerline Bold Italic.ttf"
#R> [26] "Anonymice Powerline Bold.ttf"       
#R> [27] "Anonymice Powerline Italic.ttf"     
#R> [28] "Anonymice Powerline.ttf"            
#R> [29] "Arial_Black.ttf"                    
#R> [30] "Arial_Bold_Italic.ttf"              
#R>  [ reached getOption("max.print") -- omitted 730 entries ]
```

If you have installed the font on your computer, it should be in the list,
then you can skip step 4.


### 4. Add a path to your font

If you have downloaded the font using R, you must notify showtext about to
folder `dr` where the font has been stored. To so do, use the `font_paths()`
function:


```r
font_paths(dr)
#R>  [1] "/home/kevcaz/Github/Websites/inSileco.github.io/content/post/hylianStyle/assets"
#R>  [2] "/home/kevcaz/.local/share/fonts"                                                
#R>  [3] "/usr/local/share/fonts"                                                         
#R>  [4] "/usr/share/fonts"                                                               
#R>  [5] "/usr/share/fonts/cmap"                                                          
#R>  [6] "/usr/share/fonts/cMap"                                                          
#R>  [7] "/usr/share/poppler/cMap/Adobe-CNS1"                                             
#R>  [8] "/usr/share/poppler/cMap/Adobe-GB1"                                              
#R>  [9] "/usr/share/poppler/cMap/Adobe-Japan1"                                           
#R> [10] "/usr/share/poppler/cMap/Adobe-Japan2"                                           
#R> [11] "/usr/share/poppler/cMap/Adobe-Korea1"                                           
#R> [12] "/usr/share/fonts/eot"                                                           
#R> [13] "/usr/share/fonts/eot/font-awesome"                                              
#R> [14] "/usr/share/fonts/fonts-go"                                                      
#R> [15] "/usr/share/fonts/opentype"                                                      
#R> [16] "/usr/share/fonts/opentype/cabin"                                                
#R> [17] "/usr/share/fonts/opentype/cantarell"                                            
#R> [18] "/usr/share/fonts/opentype/ebgaramond"                                           
#R> [19] "/usr/share/fonts/opentype/font-awesome"                                         
#R> [20] "/usr/share/fonts/opentype/fonts-hosny-amiri"                                    
#R> [21] "/usr/share/fonts/opentype/freefont"                                             
#R> [22] "/usr/share/fonts/opentype/gentiumplus"                                          
#R> [23] "/usr/share/fonts/opentype/ipaexfont-gothic"                                     
#R> [24] "/usr/share/fonts/opentype/ipaexfont-mincho"                                     
#R> [25] "/usr/share/fonts/opentype/ipafont-gothic"                                       
#R> [26] "/usr/share/fonts/opentype/ipafont-mincho"                                       
#R> [27] "/usr/share/fonts/opentype/linux-libertine"                                      
#R> [28] "/usr/share/fonts/opentype/lobster"                                              
#R> [29] "/usr/share/fonts/opentype/lobstertwo"                                           
#R> [30] "/usr/share/javascript/mathjax/fonts/HTML-CSS/TeX/otf"                           
#R> [31] "/usr/share/fonts/opentype/stix"                                                 
#R> [32] "/usr/share/fonts/opentype/stix-word"                                            
#R> [33] "/usr/share/fonts/svg"                                                           
#R> [34] "/usr/share/fonts/svg/font-awesome"                                              
#R> [35] "/usr/share/fonts/truetype"                                                      
#R> [36] "/usr/share/fonts/truetype/adf"                                                  
#R> [37] "/usr/share/fonts/truetype/arphic-bkai00mp"                                      
#R> [38] "/usr/share/fonts/truetype/arphic-bsmi00lp"                                      
#R> [39] "/usr/share/fonts/truetype/arphic-gbsn00lp"                                      
#R> [40] "/usr/share/fonts/truetype/arphic-gkai00mp"                                      
#R> [41] "/usr/share/fonts/truetype/artemisia"                                            
#R> [42] "/usr/share/fonts/truetype/asana-math"                                           
#R> [43] "/usr/share/fonts/truetype/baekmuk"                                              
#R> [44] "/usr/share/fonts/truetype/baskerville"                                          
#R> [45] "/usr/share/fonts/truetype/bodoni-classic"                                       
#R> [46] "/usr/share/fonts/truetype/comfortaa"                                            
#R> [47] "/usr/share/fonts/truetype/complutum"                                            
#R> [48] "/usr/share/fonts/truetype/croscore"                                             
#R> [49] "/usr/share/fonts/truetype/crosextra"                                            
#R> [50] "/usr/share/fonts/truetype/dejavu"                                               
#R> [51] "/usr/share/fonts/truetype/didot"                                                
#R> [52] "/usr/share/fonts/truetype/didot-classic"                                        
#R> [53] "/usr/share/fonts/truetype/droid"                                                
#R> [54] "/usr/share/fonts/truetype/ebgaramond"                                           
#R> [55] "/usr/share/fonts/truetype/font-awesome"                                         
#R> [56] "/usr/share/fonts/truetype/freefont"                                             
#R> [57] "/usr/share/fonts/truetype/gazis"                                                
#R> [58] "/usr/share/fonts/truetype/gentium"                                              
#R> [59] "/usr/share/fonts/truetype/gentium-basic"                                        
#R> [60] "/usr/share/fonts/truetype/gentiumplus"                                          
#R> [61] "/usr/share/fonts/truetype/inconsolata"                                          
#R> [62] "/usr/share/fonts/truetype/junicode"                                             
#R> [63] "/usr/share/fonts/truetype/lato"                                                 
#R> [64] "/usr/share/fonts/truetype/liberation"                                           
#R> [65] "/usr/share/fonts/truetype/liberation2"                                          
#R> [66] "/usr/share/fonts/truetype/lyx"                                                  
#R> [67] "/usr/share/fonts/truetype/msttcorefonts"                                        
#R> [68] "/usr/share/fonts/truetype/neohellenic"                                          
#R> [69] "/usr/share/fonts/truetype/noto"                                                 
#R> [70] "/usr/share/fonts/truetype/olga"                                                 
#R> [71] "/usr/share/fonts/truetype/open-sans"                                            
#R> [72] "/usr/share/fonts/truetype/openoffice"                                           
#R> [73] "/usr/share/fonts/truetype/padauk"                                               
#R> [74] "/usr/share/fonts/truetype/porson"                                               
#R> [75] "/usr/share/fonts/truetype/roboto"                                               
#R> [76] "/usr/share/fonts/truetype/roboto/hinted"                                        
#R> [77] "/usr/share/fonts/truetype/solomos"                                              
#R> [78] "/usr/share/fonts/truetype/theokritos"                                           
#R> [79] "/usr/share/fonts/truetype/ttf-bitstream-vera"                                   
#R> [80] "/usr/share/fonts/truetype/unfonts-core"                                         
#R> [81] "/usr/share/fonts/truetype/unfonts-extra"                                        
#R> [82] "/usr/share/fonts/type1"                                                         
#R> [83] "/usr/share/fonts/type1/gsfonts"                                                 
#R> [84] "/usr/share/fonts/type1/texlive-fonts-recommended"                               
#R> [85] "/usr/share/fonts/woff"                                                          
#R> [86] "/usr/share/fonts/woff/ebgaramond"                                               
#R> [87] "/usr/share/fonts/woff/font-awesome"                                             
#R> [88] "/usr/share/fonts/X11"                                                           
#R> [89] "/usr/share/fonts/X11/100dpi"                                                    
#R> [90] "/usr/share/fonts/X11/75dpi"                                                     
#R> [91] "/usr/share/fonts/X11/encodings"                                                 
#R> [92] "/usr/share/fonts/X11/encodings/large"                                           
#R> [93] "/usr/share/fonts/X11/misc"                                                      
#R> [94] "/usr/share/fonts/X11/Type1"                                                     
#R> [95] "/usr/share/fonts/X11/util"
```

### 5. Add the *Triforce* font to your session:


Either way, the Triforce font should now be available


```r
# Is the TTF present?
font_files()[grep("Triforce", font_files())]
#R> [1] "Triforce.ttf" "Triforce.ttf"
```

Let's add it to our session:


```r
font_add(family = 'Triforce', regular = 'Triforce.ttf')
font_families()
#R> [1] "sans"         "serif"        "mono"         "wqy-microhei"
#R> [5] "Triforce"
```


### 6. Finally, let's make our Hylian plot!


```r
showtext_begin()
par(family = "Triforce", las = 1, cex.lab = 3, cex.main = 3, cex.axis=2, mar = c(4, 5, 5, 0))
plot(x = c(0, 1), y = c(0, 1), type = "n", xlab = "X-axis", ylab = "Y-axis")
title(main = "Hylian Style - Link must be proud of us!")
##-- triforce symbols / rubies / swords
points(x = runif(5), y = runif(5), pch = "*", cex = 4)
points(x = runif(5), y = runif(5), pch = "$", cex = 4, col = "#1b95e0")
points(x = runif(5), y = runif(5), pch = "@", cex = 4, col = "#8555b4")
##-- big Links
points(x = 0.1, y = 0.1, pch = "%", cex = 10, col = "#3fb3b2", lwd=2)
points(x = 0.9, y = 0.9, pch = "^", cex = 10, col = "#ffdd55", lwd=2)
```

<img src="/rmarkdown-libs/figure-html4/unnamed-chunk-8-1.png" width="864" style="display: block; margin: auto;" />

<br><br>

#### YEAH! :sunglasses:
