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
  - date: 2018-10-11
    comment: "Simplify the downloading of the font"
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
#R> [1] "R version 3.5.2 (2018-12-20)"
```


### 1. Open R and download the font

The [*Triforce* font](https://zeldauniverse.net/media/fonts/) is available on line.
Below we download it using R. Alternatively, you may simply download and install
it using a couple of clicks, if you proceed so, skip step 1.




```r
# Download Triforce font < Triforce.ttf >
url <- "http://zeldauniverse.net/wp-content/uploads/2014/01/Triforce.ttf_.zip"
download.file(url, destfile = basename(url))

# Unzip the file
unzip(basename(url))

# Remove .zip
file.remove(basename(url))
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
#R>                              path                                file
#R> 1 /home/kevcaz/.local/share/fonts                      3270Medium.ttf
#R> 2 /home/kevcaz/.local/share/fonts                      3270Narrow.ttf
#R> 3 /home/kevcaz/.local/share/fonts                  3270SemiNarrow.ttf
#R> 4 /home/kevcaz/.local/share/fonts Anonymice Powerline Bold Italic.ttf
#R> 5 /home/kevcaz/.local/share/fonts        Anonymice Powerline Bold.ttf
#R>                 family        face          version
#R> 1             IBM 3270      Medium Version 001.000 
#R> 2      IBM 3270 Narrow      Medium Version 001.000 
#R> 3 IBM 3270 Semi-Narrow      Medium Version 001.000 
#R> 4  Anonymice Powerline Bold Italic    Version 1.002
#R> 5  Anonymice Powerline        Bold    Version 1.002
#R>                         ps_name
#R> 1                    3270Medium
#R> 2                    3270Narrow
#R> 3                3270SemiNarrow
#R> 4 AnonymicePowerline-BoldItalic
#R> 5       AnonymicePowerline-Bold
#R>  [ reached 'max' / getOption("max.print") -- omitted 2881 rows ]
```

If you have installed the font on your computer, it should be in the list,
then you can skip step 4.


### 4. Add a path to your font

If you have downloaded the font using R, you must notify showtext about to
folder `dr` where the font has been stored. To so do, use the `font_paths()`
function:


```r
font_paths(".")
#R>   [1] "/home/kevcaz/Github/Websites/inSileco.github.io/content/post/Archived/hylianStyle"
#R>   [2] "/home/kevcaz/.local/share/fonts"                                                  
#R>   [3] "/usr/local/share/fonts"                                                           
#R>   [4] "/usr/share/fonts"                                                                 
#R>   [5] "/usr/share/fonts/cmap"                                                            
#R>   [6] "/usr/share/fonts/cMap"                                                            
#R>   [7] "/usr/share/poppler/cMap/Adobe-CNS1"                                               
#R>   [8] "/usr/share/poppler/cMap/Adobe-GB1"                                                
#R>   [9] "/usr/share/poppler/cMap/Adobe-Japan1"                                             
#R>  [10] "/usr/share/poppler/cMap/Adobe-Japan2"                                             
#R>  [11] "/usr/share/poppler/cMap/Adobe-Korea1"                                             
#R>  [12] "/usr/share/fonts/eot"                                                             
#R>  [13] "/usr/share/fonts/eot/font-awesome"                                                
#R>  [14] "/usr/share/fonts/fonts-go"                                                        
#R>  [15] "/usr/share/fonts/opentype"                                                        
#R>  [16] "/usr/share/fonts/opentype/cabin"                                                  
#R>  [17] "/usr/share/fonts/opentype/cantarell"                                              
#R>  [18] "/usr/share/fonts/opentype/ebgaramond"                                             
#R>  [19] "/usr/share/fonts/opentype/firacode"                                               
#R>  [20] "/usr/share/fonts/opentype/font-awesome"                                           
#R>  [21] "/usr/share/fonts/opentype/fonts-hosny-amiri"                                      
#R>  [22] "/usr/share/fonts/opentype/fonts-hosny-thabit"                                     
#R>  [23] "/usr/share/fonts/opentype/freefont"                                               
#R>  [24] "/usr/share/fonts/opentype/gentiumplus"                                            
#R>  [25] "/usr/share/fonts/opentype/ipaexfont-gothic"                                       
#R>  [26] "/usr/share/fonts/opentype/ipaexfont-mincho"                                       
#R>  [27] "/usr/share/fonts/opentype/ipafont-gothic"                                         
#R>  [28] "/usr/share/fonts/opentype/ipafont-mincho"                                         
#R>  [29] "/usr/share/fonts/opentype/linux-libertine"                                        
#R>  [30] "/usr/share/fonts/opentype/lobster"                                                
#R>  [31] "/usr/share/fonts/opentype/lobstertwo"                                             
#R>  [32] "/usr/share/fonts/opentype/malayalam"                                              
#R>  [33] "/usr/share/javascript/mathjax/fonts/HTML-CSS/TeX/otf"                             
#R>  [34] "/usr/share/fonts/opentype/noto"                                                   
#R>  [35] "/usr/share/fonts/opentype/stix"                                                   
#R>  [36] "/usr/share/fonts/opentype/stix-word"                                              
#R>  [37] "/usr/share/fonts/opentype/tlwg"                                                   
#R>  [38] "/usr/share/fonts/svg"                                                             
#R>  [39] "/usr/share/fonts/svg/font-awesome"                                                
#R>  [40] "/usr/share/fonts/truetype"                                                        
#R>  [41] "/usr/share/fonts/truetype/abyssinica"                                             
#R>  [42] "/usr/share/fonts/truetype/adf"                                                    
#R>  [43] "/usr/share/fonts/truetype/andika"                                                 
#R>  [44] "/usr/share/fonts/truetype/arphic"                                                 
#R>  [45] "/usr/share/fonts/truetype/arphic-bkai00mp"                                        
#R>  [46] "/usr/share/fonts/truetype/arphic-bsmi00lp"                                        
#R>  [47] "/usr/share/fonts/truetype/arphic-gbsn00lp"                                        
#R>  [48] "/usr/share/fonts/truetype/arphic-gkai00mp"                                        
#R>  [49] "/usr/share/fonts/truetype/artemisia"                                              
#R>  [50] "/usr/share/fonts/truetype/arundina"                                               
#R>  [51] "/usr/share/fonts/truetype/asana-math"                                             
#R>  [52] "/usr/share/fonts/truetype/baekmuk"                                                
#R>  [53] "/usr/share/fonts/truetype/baskerville"                                            
#R>  [54] "/usr/share/fonts/truetype/bodoni-classic"                                         
#R>  [55] "/usr/share/fonts/truetype/comfortaa"                                              
#R>  [56] "/usr/share/fonts/truetype/complutum"                                              
#R>  [57] "/usr/share/fonts/truetype/croscore"                                               
#R>  [58] "/usr/share/fonts/truetype/crosextra"                                              
#R>  [59] "/usr/share/fonts/truetype/culmus"                                                 
#R>  [60] "/usr/share/fonts/truetype/dejavu"                                                 
#R>  [61] "/usr/share/fonts/truetype/didot"                                                  
#R>  [62] "/usr/share/fonts/truetype/didot-classic"                                          
#R>  [63] "/usr/share/fonts/truetype/droid"                                                  
#R>  [64] "/usr/share/fonts/truetype/dzongkha"                                               
#R>  [65] "/usr/share/fonts/truetype/ebgaramond"                                             
#R>  [66] "/usr/share/fonts/truetype/farsiweb"                                               
#R>  [67] "/usr/share/fonts/truetype/font-awesome"                                           
#R>  [68] "/usr/share/fonts/truetype/fonts-arabeyes"                                         
#R>  [69] "/usr/share/fonts/truetype/fonts-beng-extra"                                       
#R>  [70] "/usr/share/fonts/truetype/fonts-bpg-georgian"                                     
#R>  [71] "/usr/share/fonts/truetype/fonts-deva-extra"                                       
#R>  [72] "/usr/share/fonts/truetype/fonts-gujr-extra"                                       
#R>  [73] "/usr/share/fonts/truetype/fonts-guru-extra"                                       
#R>  [74] "/usr/share/fonts/truetype/fonts-kalapi"                                           
#R>  [75] "/usr/share/fonts/truetype/fonts-telu-extra"                                       
#R>  [76] "/usr/share/fonts/truetype/fonts-ukij-uyghur"                                      
#R>  [77] "/usr/share/fonts/truetype/fonts-yrsa-rasa"                                        
#R>  [78] "/usr/share/fonts/truetype/freefont"                                               
#R>  [79] "/usr/share/fonts/truetype/Gargi"                                                  
#R>  [80] "/usr/share/fonts/truetype/gazis"                                                  
#R>  [81] "/usr/share/fonts/truetype/gentium"                                                
#R>  [82] "/usr/share/fonts/truetype/gentium-basic"                                          
#R>  [83] "/usr/share/fonts/truetype/gentiumplus"                                            
#R>  [84] "/usr/share/fonts/truetype/glyphicons"                                             
#R>  [85] "/usr/share/fonts/truetype/junicode"                                               
#R>  [86] "/usr/share/fonts/truetype/kacst"                                                  
#R>  [87] "/usr/share/fonts/truetype/kacst-one"                                              
#R>  [88] "/usr/share/fonts/truetype/khmeros"                                                
#R>  [89] "/usr/share/fonts/truetype/lato"                                                   
#R>  [90] "/usr/share/fonts/truetype/liberation"                                             
#R>  [91] "/usr/share/fonts/truetype/liberation2"                                            
#R>  [92] "/usr/share/fonts/truetype/lohit-assamese"                                         
#R>  [93] "/usr/share/fonts/truetype/lohit-bengali"                                          
#R>  [94] "/usr/share/fonts/truetype/lohit-devanagari"                                       
#R>  [95] "/usr/share/fonts/truetype/lohit-gujarati"                                         
#R>  [96] "/usr/share/fonts/truetype/lohit-kannada"                                          
#R>  [97] "/usr/share/fonts/truetype/lohit-malayalam"                                        
#R>  [98] "/usr/share/fonts/truetype/lohit-punjabi"                                          
#R>  [99] "/usr/share/fonts/truetype/lohit-tamil"                                            
#R> [100] "/usr/share/fonts/truetype/lohit-tamil-classical"                                  
#R> [101] "/usr/share/fonts/truetype/lohit-telugu"                                           
#R> [102] "/usr/share/fonts/truetype/lyx"                                                    
#R> [103] "/usr/share/fonts/truetype/malayalam"                                              
#R> [104] "/usr/share/fonts/truetype/msttcorefonts"                                          
#R> [105] "/usr/share/fonts/truetype/Nakula"                                                 
#R> [106] "/usr/share/fonts/truetype/nanum"                                                  
#R> [107] "/usr/share/fonts/truetype/neohellenic"                                            
#R> [108] "/usr/share/fonts/truetype/noto"                                                   
#R> [109] "/usr/share/fonts/truetype/olga"                                                   
#R> [110] "/usr/share/fonts/truetype/open-sans"                                              
#R> [111] "/usr/share/fonts/truetype/openoffice"                                             
#R> [112] "/usr/share/fonts/truetype/padauk"                                                 
#R> [113] "/usr/share/fonts/truetype/porson"                                                 
#R> [114] "/usr/share/fonts/truetype/roboto"                                                 
#R> [115] "/usr/share/fonts/truetype/roboto/hinted"                                          
#R> [116] "/usr/share/fonts/truetype/roboto/unhinted"                                        
#R> [117] "/usr/share/fonts/truetype/roboto/unhinted/RobotoTTF"                              
#R> [118] "/usr/share/fonts/truetype/Sahadeva"                                               
#R> [119] "/usr/share/fonts/truetype/samyak"                                                 
#R> [120] "/usr/share/fonts/truetype/samyak-fonts"                                           
#R> [121] "/usr/share/fonts/truetype/Sarai"                                                  
#R> [122] "/usr/share/fonts/truetype/scheherazade"                                           
#R> [123] "/usr/share/fonts/truetype/solomos"                                                
#R> [124] "/usr/share/fonts/truetype/theokritos"                                             
#R> [125] "/usr/share/fonts/truetype/tlwg"                                                   
#R> [126] "/usr/share/fonts/truetype/ttf-bitstream-vera"                                     
#R> [127] "/usr/share/fonts/truetype/unfonts-core"                                           
#R> [128] "/usr/share/fonts/truetype/unfonts-extra"                                          
#R> [129] "/usr/share/fonts/truetype/unifont"                                                
#R> [130] "/usr/share/fonts/truetype/unikurdweb"                                             
#R> [131] "/usr/share/fonts/truetype/vlgothic"                                               
#R> [132] "/usr/share/fonts/type1"                                                           
#R> [133] "/usr/share/fonts/type1/gsfonts"                                                   
#R> [134] "/usr/share/fonts/type1/texlive-fonts-recommended"                                 
#R> [135] "/usr/share/fonts/woff"                                                            
#R> [136] "/usr/share/fonts/woff/ebgaramond"                                                 
#R> [137] "/usr/share/fonts/woff/font-awesome"                                               
#R> [138] "/usr/share/fonts/X11"                                                             
#R> [139] "/usr/share/fonts/X11/100dpi"                                                      
#R> [140] "/usr/share/fonts/X11/75dpi"                                                       
#R> [141] "/usr/share/fonts/X11/encodings"                                                   
#R> [142] "/usr/share/fonts/X11/encodings/large"                                             
#R> [143] "/usr/share/fonts/X11/misc"                                                        
#R> [144] "/usr/share/fonts/X11/Type1"                                                       
#R> [145] "/usr/share/fonts/X11/util"
```

### 5. Add the *Triforce* font to your session:


Either way, the Triforce font should now be available


```r
# Is the TTF present?
font_files()[grep("Triforce", font_files())]
#R>                                                 file
#R> 1                                     3270Medium.ttf
#R> 2                                     3270Narrow.ttf
#R> 3                                 3270SemiNarrow.ttf
#R> 4                Anonymice Powerline Bold Italic.ttf
#R> 5                       Anonymice Powerline Bold.ttf
#R> 6                     Anonymice Powerline Italic.ttf
#R> 7                            Anonymice Powerline.ttf
#R> 8                       Arimo Bold for Powerline.ttf
#R> 9                Arimo Bold Italic for Powerline.ttf
#R> 10                           Arimo for Powerline.ttf
#R> 11                    Arimo Italic for Powerline.ttf
#R> 12                    Cousine Bold for Powerline.ttf
#R> 13             Cousine Bold Italic for Powerline.ttf
#R> 14                         Cousine for Powerline.ttf
#R> 15                  Cousine Italic for Powerline.ttf
#R> 16           DejaVu Sans Mono Bold for Powerline.ttf
#R> 17   DejaVu Sans Mono Bold Oblique for Powerline.ttf
#R> 18                DejaVu Sans Mono for Powerline.ttf
#R> 19        DejaVu Sans Mono Oblique for Powerline.ttf
#R> 20          Droid Sans Mono Dotted for Powerline.ttf
#R> 21                 Droid Sans Mono for Powerline.otf
#R> 22         Droid Sans Mono Slashed for Powerline.ttf
#R> 23                       FuraMono-Bold Powerline.otf
#R> 24                     FuraMono-Medium Powerline.otf
#R> 25                    FuraMono-Regular Powerline.otf
#R> 26                    Go Mono Bold for Powerline.ttf
#R> 27             Go Mono Bold Italic for Powerline.ttf
#R> 28                         Go Mono for Powerline.ttf
#R> 29                  Go Mono Italic for Powerline.ttf
#R> 30                                     Hack-Bold.ttf
#R> 31                               Hack-BoldItalic.ttf
#R> 32                                   Hack-Italic.ttf
#R> 33                                  Hack-Regular.ttf
#R> 34                Inconsolata Bold for Powerline.ttf
#R> 35                     Inconsolata for Powerline.otf
#R> 36                  Inconsolata-dz for Powerline.otf
#R> 37                   Inconsolata-g for Powerline.otf
#R> 38         Literation Mono Powerline Bold Italic.ttf
#R> 39                Literation Mono Powerline Bold.ttf
#R> 40              Literation Mono Powerline Italic.ttf
#R> 41                     Literation Mono Powerline.ttf
#R> 42                 Meslo LG L Bold for Powerline.ttf
#R> 43          Meslo LG L Bold Italic for Powerline.ttf
#R> 44              Meslo LG L DZ Bold for Powerline.ttf
#R> 45       Meslo LG L DZ Bold Italic for Powerline.ttf
#R> 46            Meslo LG L DZ Italic for Powerline.ttf
#R> 47           Meslo LG L DZ Regular for Powerline.ttf
#R> 48               Meslo LG L Italic for Powerline.ttf
#R> 49              Meslo LG L Regular for Powerline.ttf
#R> 50                 Meslo LG M Bold for Powerline.ttf
#R> 51          Meslo LG M Bold Italic for Powerline.ttf
#R> 52              Meslo LG M DZ Bold for Powerline.ttf
#R> 53       Meslo LG M DZ Bold Italic for Powerline.ttf
#R> 54            Meslo LG M DZ Italic for Powerline.ttf
#R> 55           Meslo LG M DZ Regular for Powerline.ttf
#R> 56               Meslo LG M Italic for Powerline.ttf
#R> 57              Meslo LG M Regular for Powerline.ttf
#R> 58                 Meslo LG S Bold for Powerline.ttf
#R> 59          Meslo LG S Bold Italic for Powerline.ttf
#R> 60              Meslo LG S DZ Bold for Powerline.ttf
#R> 61       Meslo LG S DZ Bold Italic for Powerline.ttf
#R> 62            Meslo LG S DZ Italic for Powerline.ttf
#R> 63           Meslo LG S DZ Regular for Powerline.ttf
#R> 64               Meslo LG S Italic for Powerline.ttf
#R> 65              Meslo LG S Regular for Powerline.ttf
#R> 66                    Monofur Bold for Powerline.ttf
#R> 67                         Monofur for Powerline.ttf
#R> 68                  Monofur Italic for Powerline.ttf
#R> 69                       Noto Mono for Powerline.ttf
#R> 70                        NovaMono for Powerline.ttf
#R> 71                    ProFont Bold For Powerline.ttf
#R> 72                         ProFont For Powerline.ttf
#R> 73                Roboto Mono Bold for Powerline.ttf
#R> 74         Roboto Mono Bold Italic for Powerline.ttf
#R> 75                     Roboto Mono for Powerline.ttf
#R> 76              Roboto Mono Italic for Powerline.ttf
#R> 77               Roboto Mono Light for Powerline.ttf
#R> 78        Roboto Mono Light Italic for Powerline.ttf
#R> 79              Roboto Mono Medium for Powerline.ttf
#R> 80       Roboto Mono Medium Italic for Powerline.ttf
#R> 81                Roboto Mono Thin for Powerline.ttf
#R> 82         Roboto Mono Thin Italic for Powerline.ttf
#R> 83           Source Code Pro Black for Powerline.otf
#R> 84            Source Code Pro Bold for Powerline.otf
#R> 85      Source Code Pro ExtraLight for Powerline.otf
#R> 86                 Source Code Pro for Powerline.otf
#R> 87           Source Code Pro Light for Powerline.otf
#R> 88          Source Code Pro Medium for Powerline.otf
#R> 89         Source Code Pro Powerline BlackItalic.otf
#R> 90          Source Code Pro Powerline BoldItalic.otf
#R> 91    Source Code Pro Powerline ExtraLightItalic.otf
#R> 92              Source Code Pro Powerline Italic.otf
#R> 93         Source Code Pro Powerline LightItalic.otf
#R> 94        Source Code Pro Powerline MediumItalic.otf
#R> 95      Source Code Pro Powerline SemiboldItalic.otf
#R> 96        Source Code Pro Semibold for Powerline.otf
#R> 97                 Space Mono Bold for Powerline.ttf
#R> 98          Space Mono Bold Italic for Powerline.ttf
#R> 99                      Space Mono for Powerline.ttf
#R> 100              Space Mono Italic for Powerline.ttf
#R> 101                               SpaceMono-Bold.ttf
#R> 102                         SpaceMono-BoldItalic.ttf
#R> 103                             SpaceMono-Italic.ttf
#R> 104                            SpaceMono-Regular.ttf
#R> 105                     Symbol Neu for Powerline.ttf
#R> 106                     Tinos Bold for Powerline.ttf
#R> 107              Tinos Bold Italic for Powerline.ttf
#R> 108                          Tinos for Powerline.ttf
#R> 109                   Tinos Italic for Powerline.ttf
#R> 110 Ubuntu Mono derivative Powerline Bold Italic.ttf
#R> 111        Ubuntu Mono derivative Powerline Bold.ttf
#R> 112      Ubuntu Mono derivative Powerline Italic.ttf
#R> 113             Ubuntu Mono derivative Powerline.ttf
#R> 114                                     Triforce.ttf
#R> 115                               Go-Bold-Italic.ttf
#R> 116                                      Go-Bold.ttf
#R> 117                                    Go-Italic.ttf
#R> 118                             Go-Medium-Italic.ttf
#R> 119                                    Go-Medium.ttf
#R> 120                          Go-Mono-Bold-Italic.ttf
#R> 121                                 Go-Mono-Bold.ttf
#R> 122                               Go-Mono-Italic.ttf
#R> 123                                      Go-Mono.ttf
#R> 124                                   Go-Regular.ttf
#R> 125                          Go-Smallcaps-Italic.ttf
#R> 126                                 Go-Smallcaps.ttf
#R> 127                                   Cabin-Bold.otf
#R> 128                             Cabin-BoldItalic.otf
#R> 129                                 Cabin-Italic.otf
#R> 130                                 Cabin-Medium.otf
#R> 131                           Cabin-MediumItalic.otf
#R> 132                                Cabin-Regular.otf
#R> 133                               Cabin-SemiBold.otf
#R> 134                         Cabin-SemiBoldItalic.otf
#R> 135                               Cantarell-Bold.otf
#R> 136                          Cantarell-ExtraBold.otf
#R> 137                              Cantarell-Light.otf
#R> 138                            Cantarell-Regular.otf
#R> 139                               Cantarell-Thin.otf
#R> 140                          EBGaramond-Initials.otf
#R> 141                        EBGaramond-InitialsF1.otf
#R> 142                        EBGaramond-InitialsF2.otf
#R> 143                          EBGaramond08-Italic.otf
#R> 144                         EBGaramond08-Regular.otf
#R> 145                           EBGaramond12-AllSC.otf
#R> 146                          EBGaramond12-Italic.otf
#R> 147                         EBGaramond12-Regular.otf
#R> 148                       EBGaramondSC08-Regular.otf
#R> 149                       EBGaramondSC12-Regular.otf
#R> 150                                FiraCode-Bold.otf
#R> 151                               FiraCode-Light.otf
#R> 152                              FiraCode-Medium.otf
#R> 153                             FiraCode-Regular.otf
#R> 154                              FiraCode-Retina.otf
#R> 155                                  FontAwesome.otf
#R> 156                                   Amiri-Bold.ttf
#R> 157                            Amiri-BoldSlanted.ttf
#R> 158                                Amiri-Regular.ttf
#R> 159                                Amiri-Slanted.ttf
#R> 160                                   AmiriQuran.ttf
#R> 161                            AmiriQuranColored.ttf
#R> 162                          Thabit-Bold-Oblique.ttf
#R> 163                                  Thabit-Bold.ttf
#R> 164                               Thabit-Oblique.ttf
#R> 165                                       Thabit.ttf
#R> 166                                     FreeMono.otf
#R> 167                                 FreeMonoBold.otf
#R> 168                          FreeMonoBoldOblique.otf
#R> 169                              FreeMonoOblique.otf
#R> 170                                     FreeSans.otf
#R> 171                                 FreeSansBold.otf
#R> 172                          FreeSansBoldOblique.otf
#R> 173                              FreeSansOblique.otf
#R> 174                                    FreeSerif.otf
#R> 175                                FreeSerifBold.otf
#R> 176                          FreeSerifBoldItalic.otf
#R> 177                              FreeSerifItalic.otf
#R> 178                         GentiumPlusCompact-I.ttf
#R> 179                         GentiumPlusCompact-R.ttf
#R> 180                                       ipaexg.ttf
#R> 181                                       ipaexm.ttf
#R> 182                                         ipag.ttf
#R> 183                                        ipagp.ttf
#R> 184                                         ipam.ttf
#R> 185                                        ipamp.ttf
#R> 186                                LinBiolinum_K.otf
#R> 187                                LinBiolinum_R.otf
#R> 188                               LinBiolinum_RB.otf
#R> 189                               LinBiolinum_RI.otf
#R> 190                              LinLibertine_DR.otf
#R> 191                               LinLibertine_I.otf
#R> 192                               LinLibertine_M.otf
#R> 193                               LinLibertine_R.otf
#R> 194                              LinLibertine_RB.otf
#R> 195                             LinLibertine_RBI.otf
#R> 196                              LinLibertine_RI.otf
#R> 197                              LinLibertine_RZ.otf
#R> 198                             LinLibertine_RZI.otf
#R> 199                                      lobster.otf
#R> 200                              LobsterTwo-Bold.otf
#R> 201                        LobsterTwo-BoldItalic.otf
#R> 202                            LobsterTwo-Italic.otf
#R> 203                           LobsterTwo-Regular.otf
#R> 204                                 Manjari-Bold.otf
#R> 205                              Manjari-Regular.otf
#R> 206                                 Manjari-Thin.otf
#R> 207                            NotoSansCJK-Black.ttc
#R> 208                             NotoSansCJK-Bold.ttc
#R> 209                        NotoSansCJK-DemiLight.ttc
#R> 210                            NotoSansCJK-Light.ttc
#R> 211                           NotoSansCJK-Medium.ttc
#R> 212                          NotoSansCJK-Regular.ttc
#R> 213                             NotoSansCJK-Thin.ttc
#R> 214                           NotoSerifCJK-Black.ttc
#R> 215                            NotoSerifCJK-Bold.ttc
#R> 216                      NotoSerifCJK-ExtraLight.ttc
#R> 217                           NotoSerifCJK-Light.ttc
#R> 218                          NotoSerifCJK-Medium.ttc
#R> 219                         NotoSerifCJK-Regular.ttc
#R> 220                        NotoSerifCJK-SemiBold.ttc
#R> 221                                    STIX-Bold.otf
#R> 222                              STIX-BoldItalic.otf
#R> 223                                  STIX-Italic.otf
#R> 224                                 STIX-Regular.otf
#R> 225                             STIXMath-Regular.otf
#R> 226                             STIXGeneral-Bold.otf
#R> 227                       STIXGeneral-BoldItalic.otf
#R> 228                           STIXGeneral-Italic.otf
#R> 229                          STIXGeneral-Regular.otf
#R> 230                          STIXIntegralsD-Bold.otf
#R> 231                       STIXIntegralsD-Regular.otf
#R> 232                         STIXIntegralsSm-Bold.otf
#R> 233                      STIXIntegralsSm-Regular.otf
#R> 234                         STIXIntegralsUp-Bold.otf
#R> 235                      STIXIntegralsUp-Regular.otf
#R> 236                        STIXIntegralsUpD-Bold.otf
#R> 237                     STIXIntegralsUpD-Regular.otf
#R> 238                       STIXIntegralsUpSm-Bold.otf
#R> 239                    STIXIntegralsUpSm-Regular.otf
#R> 240                          STIXNonUnicode-Bold.otf
#R> 241                    STIXNonUnicode-BoldItalic.otf
#R> 242                        STIXNonUnicode-Italic.otf
#R> 243                       STIXNonUnicode-Regular.otf
#R> 244                      STIXSizeFiveSym-Regular.otf
#R> 245                         STIXSizeFourSym-Bold.otf
#R> 246                      STIXSizeFourSym-Regular.otf
#R> 247                          STIXSizeOneSym-Bold.otf
#R> 248                       STIXSizeOneSym-Regular.otf
#R> 249                        STIXSizeThreeSym-Bold.otf
#R> 250                     STIXSizeThreeSym-Regular.otf
#R> 251                          STIXSizeTwoSym-Bold.otf
#R> 252                       STIXSizeTwoSym-Regular.otf
#R> 253                            STIXVariants-Bold.otf
#R> 254                         STIXVariants-Regular.otf
#R> 255                                  Garuda-Bold.otf
#R> 256                           Garuda-BoldOblique.otf
#R> 257                               Garuda-Oblique.otf
#R> 258                                       Garuda.otf
#R> 259                                 Kinnari-Bold.otf
#R> 260                           Kinnari-BoldItalic.otf
#R> 261                          Kinnari-BoldOblique.otf
#R> 262                               Kinnari-Italic.otf
#R> 263                              Kinnari-Oblique.otf
#R> 264                                      Kinnari.otf
#R> 265                                Laksaman-Bold.otf
#R> 266                          Laksaman-BoldItalic.otf
#R> 267                              Laksaman-Italic.otf
#R> 268                                     Laksaman.otf
#R> 269                                    Loma-Bold.otf
#R> 270                             Loma-BoldOblique.otf
#R> 271                                 Loma-Oblique.otf
#R> 272                                         Loma.otf
#R> 273                                  Norasi-Bold.otf
#R> 274                            Norasi-BoldItalic.otf
#R> 275                           Norasi-BoldOblique.otf
#R> 276                                Norasi-Italic.otf
#R> 277                               Norasi-Oblique.otf
#R> 278                                       Norasi.otf
#R> 279                                  Purisa-Bold.otf
#R> 280                           Purisa-BoldOblique.otf
#R> 281                               Purisa-Oblique.otf
#R> 282                                       Purisa.otf
#R> 283                                Sawasdee-Bold.otf
#R> 284                         Sawasdee-BoldOblique.otf
#R> 285                             Sawasdee-Oblique.otf
#R> 286                                     Sawasdee.otf
#R> 287                                TlwgMono-Bold.otf
#R> 288                         TlwgMono-BoldOblique.otf
#R> 289                             TlwgMono-Oblique.otf
#R> 290                                     TlwgMono.otf
#R> 291                          TlwgTypewriter-Bold.otf
#R> 292                   TlwgTypewriter-BoldOblique.otf
#R> 293                       TlwgTypewriter-Oblique.otf
#R> 294                               TlwgTypewriter.otf
#R> 295                              TlwgTypist-Bold.otf
#R> 296                       TlwgTypist-BoldOblique.otf
#R> 297                           TlwgTypist-Oblique.otf
#R> 298                                   TlwgTypist.otf
#R> 299                                TlwgTypo-Bold.otf
#R> 300                         TlwgTypo-BoldOblique.otf
#R> 301                             TlwgTypo-Oblique.otf
#R> 302                                     TlwgTypo.otf
#R> 303                                  Umpush-Bold.otf
#R> 304                           Umpush-BoldOblique.otf
#R> 305                                 Umpush-Light.otf
#R> 306                          Umpush-LightOblique.otf
#R> 307                               Umpush-Oblique.otf
#R> 308                                       Umpush.otf
#R> 309                                   Waree-Bold.otf
#R> 310                            Waree-BoldOblique.otf
#R> 311                                Waree-Oblique.otf
#R> 312                                        Waree.otf
#R> 313                              AbyssinicaSIL-R.ttf
#R> 314                         AccanthisADFStd-Bold.otf
#R> 315                   AccanthisADFStd-BoldItalic.otf
#R> 316                       AccanthisADFStd-Italic.otf
#R> 317                      AccanthisADFStd-Regular.otf
#R> 318                      AccanthisADFStdNo2-Bold.otf
#R> 319                AccanthisADFStdNo2-BoldItalic.otf
#R> 320                    AccanthisADFStdNo2-Italic.otf
#R> 321                   AccanthisADFStdNo2-Regular.otf
#R> 322                      AccanthisADFStdNo3-Bold.otf
#R> 323                AccanthisADFStdNo3-BoldItalic.otf
#R> 324                    AccanthisADFStdNo3-Italic.otf
#R> 325                   AccanthisADFStdNo3-Regular.otf
#R> 326                           BerenisADFPro-Bold.otf
#R> 327                     BerenisADFPro-BoldItalic.otf
#R> 328                         BerenisADFPro-Italic.otf
#R> 329                        BerenisADFPro-Regular.otf
#R> 330                         BerenisADFProSC-Bold.otf
#R> 331                   BerenisADFProSC-BoldItalic.otf
#R> 332                       BerenisADFProSC-Italic.otf
#R> 333                      BerenisADFProSC-Regular.otf
#R> 334                              GilliusADF-Bold.otf
#R> 335                          GilliusADF-BoldCond.otf
#R> 336                    GilliusADF-BoldCondItalic.otf
#R> 337                        GilliusADF-BoldItalic.otf
#R> 338                              GilliusADF-Cond.otf
#R> 339                        GilliusADF-CondItalic.otf
#R> 340                            GilliusADF-Italic.otf
#R> 341                           GilliusADF-Regular.otf
#R> 342                           GilliusADFNo2-Bold.otf
#R> 343                       GilliusADFNo2-BoldCond.otf
#R> 344                 GilliusADFNo2-BoldCondItalic.otf
#R> 345                     GilliusADFNo2-BoldItalic.otf
#R> 346                           GilliusADFNo2-Cond.otf
#R> 347                     GilliusADFNo2-CondItalic.otf
#R> 348                         GilliusADFNo2-Italic.otf
#R> 349                        GilliusADFNo2-Regular.otf
#R> 350                       UniversalisADFStd-Bold.otf
#R> 351                   UniversalisADFStd-BoldCond.otf
#R> 352                UniversalisADFStd-BoldCondObl.otf
#R> 353                UniversalisADFStd-BoldOblique.otf
#R> 354                       UniversalisADFStd-Cond.otf
#R> 355                UniversalisADFStd-CondOblique.otf
#R> 356                    UniversalisADFStd-Oblique.otf
#R> 357                    UniversalisADFStd-Regular.otf
#R> 358                                     Andika-R.ttf
#R> 359                                     bkai00mp.ttf
#R> 360                                     bsmi00lp.ttf
#R> 361                                     gbsn00lp.ttf
#R> 362                                     gkai00mp.ttf
#R> 363                                         ukai.ttc
#R> 364                                        uming.ttc
#R> 365                                 GFSArtemisia.otf
#R> 366                             GFSArtemisiaBold.otf
#R> 367                           GFSArtemisiaBoldIt.otf
#R> 368                               GFSArtemisiaIt.otf
#R> 369                            ArundinaSans-Bold.ttf
#R> 370                     ArundinaSans-BoldOblique.ttf
#R> 371                         ArundinaSans-Oblique.ttf
#R> 372                                 ArundinaSans.ttf
#R> 373                        ArundinaSansMono-Bold.ttf
#R> 374                 ArundinaSansMono-BoldOblique.ttf
#R> 375                     ArundinaSansMono-Oblique.ttf
#R> 376                             ArundinaSansMono.ttf
#R> 377                           ArundinaSerif-Bold.ttf
#R> 378                                ArundinaSerif.ttf
#R> 379                                   Asana-Math.otf
#R> 380                                       batang.ttf
#R> 381                                        dotum.ttf
#R> 382                                        gulim.ttf
#R> 383                                        hline.ttf
#R> 384                               GFSBaskerville.otf
#R> 385                             GFSBodoniClassic.otf
#R> 386                               Comfortaa-Bold.ttf
#R> 387                              Comfortaa-Light.ttf
#R> 388                            Comfortaa-Regular.ttf
#R> 389                                  GFSPolyglot.otf
#R> 390                                   Arimo-Bold.ttf
#R> 391                             Arimo-BoldItalic.ttf
#R> 392                                 Arimo-Italic.ttf
#R> 393                                Arimo-Regular.ttf
#R> 394                                 Cousine-Bold.ttf
#R> 395                           Cousine-BoldItalic.ttf
#R> 396                               Cousine-Italic.ttf
#R> 397                              Cousine-Regular.ttf
#R> 398                                   Tinos-Bold.ttf
#R> 399                             Tinos-BoldItalic.ttf
#R> 400                                 Tinos-Italic.ttf
#R> 401                                Tinos-Regular.ttf
#R> 402                                 Caladea-Bold.ttf
#R> 403                           Caladea-BoldItalic.ttf
#R> 404                               Caladea-Italic.ttf
#R> 405                              Caladea-Regular.ttf
#R> 406                                 Carlito-Bold.ttf
#R> 407                           Carlito-BoldItalic.ttf
#R> 408                               Carlito-Italic.ttf
#R> 409                              Carlito-Regular.ttf
#R> 410                                DavidCLM-Bold.otf
#R> 411                          DavidCLM-BoldItalic.otf
#R> 412                              DavidCLM-Medium.otf
#R> 413                        DavidCLM-MediumItalic.otf
#R> 414                           FrankRuehlCLM-Bold.ttf
#R> 415                    FrankRuehlCLM-BoldOblique.ttf
#R> 416                         FrankRuehlCLM-Medium.ttf
#R> 417                  FrankRuehlCLM-MediumOblique.ttf
#R> 418                              HadasimCLM-Bold.ttf
#R> 419                       HadasimCLM-BoldOblique.ttf
#R> 420                           HadasimCLM-Regular.ttf
#R> 421                    HadasimCLM-RegularOblique.ttf
#R> 422                                 KeterYG-Bold.ttf
#R> 423                          KeterYG-BoldOblique.ttf
#R> 424                               KeterYG-Medium.ttf
#R> 425                        KeterYG-MediumOblique.ttf
#R> 426                               MiriamCLM-Bold.ttf
#R> 427                               MiriamCLM-Book.ttf
#R> 428                           MiriamMonoCLM-Bold.ttf
#R> 429                    MiriamMonoCLM-BoldOblique.ttf
#R> 430                           MiriamMonoCLM-Book.ttf
#R> 431                    MiriamMonoCLM-BookOblique.ttf
#R> 432                            NachlieliCLM-Bold.otf
#R> 433                     NachlieliCLM-BoldOblique.otf
#R> 434                           NachlieliCLM-Light.otf
#R> 435                    NachlieliCLM-LightOblique.otf
#R> 436                              ShofarDemi-Bold.ttf
#R> 437                       ShofarDemi-BoldOblique.ttf
#R> 438                                ShofarRegular.ttf
#R> 439                         ShofarRegularOblique.ttf
#R> 440                               SimpleCLM-Bold.ttf
#R> 441                        SimpleCLM-BoldOblique.ttf
#R> 442                             SimpleCLM-Medium.ttf
#R> 443                      SimpleCLM-MediumOblique.ttf
#R> 444                              StamAshkenazCLM.ttf
#R> 445                               StamSefaradCLM.ttf
#R> 446                            DejaVuMathTeXGyre.ttf
#R> 447                              DejaVuSans-Bold.ttf
#R> 448                       DejaVuSans-BoldOblique.ttf
#R> 449                        DejaVuSans-ExtraLight.ttf
#R> 450                           DejaVuSans-Oblique.ttf
#R> 451                                   DejaVuSans.ttf
#R> 452                     DejaVuSansCondensed-Bold.ttf
#R> 453              DejaVuSansCondensed-BoldOblique.ttf
#R> 454                  DejaVuSansCondensed-Oblique.ttf
#R> 455                          DejaVuSansCondensed.ttf
#R> 456                          DejaVuSansMono-Bold.ttf
#R> 457                   DejaVuSansMono-BoldOblique.ttf
#R> 458                       DejaVuSansMono-Oblique.ttf
#R> 459                               DejaVuSansMono.ttf
#R> 460                             DejaVuSerif-Bold.ttf
#R> 461                       DejaVuSerif-BoldItalic.ttf
#R> 462                           DejaVuSerif-Italic.ttf
#R> 463                                  DejaVuSerif.ttf
#R> 464                    DejaVuSerifCondensed-Bold.ttf
#R> 465              DejaVuSerifCondensed-BoldItalic.ttf
#R> 466                  DejaVuSerifCondensed-Italic.ttf
#R> 467                         DejaVuSerifCondensed.ttf
#R> 468                              GFSDidotClassic.otf
#R> 469                                     GFSDidot.otf
#R> 470                                 GFSDidotBold.otf
#R> 471                           GFSDidotBoldItalic.otf
#R> 472                               GFSDidotItalic.otf
#R> 473                        DroidSansFallbackFull.ttf
#R> 474                    Jomolhari-alpha3c-0605331.ttf
#R> 475                          EBGaramond-Initials.ttf
#R> 476                        EBGaramond-InitialsF1.ttf
#R> 477                        EBGaramond-InitialsF2.ttf
#R> 478                          EBGaramond08-Italic.ttf
#R> 479                         EBGaramond08-Regular.ttf
#R> 480                           EBGaramond12-AllSC.ttf
#R> 481                          EBGaramond12-Italic.ttf
#R> 482                         EBGaramond12-Regular.ttf
#R> 483                       EBGaramondSC08-Regular.ttf
#R> 484                       EBGaramondSC12-Regular.ttf
#R> 485                                         homa.ttf
#R> 486                                        nazli.ttf
#R> 487                                       nazlib.ttf
#R> 488                                         titr.ttf
#R> 489                          fontawesome-webfont.ttf
#R> 490                                 ae_AlArabiya.ttf
#R> 491                                  ae_AlBattar.ttf
#R> 492                                     ae_AlHor.ttf
#R> 493                                ae_AlManzomah.ttf
#R> 494                                 ae_AlYarmook.ttf
#R> 495                                      ae_Arab.ttf
#R> 496                                   ae_Cortoba.ttf
#R> 497                                    ae_Dimnah.ttf
#R> 498                                  ae_Electron.ttf
#R> 499                                     ae_Furat.ttf
#R> 500                                   ae_Granada.ttf
#R>                                    family             face
#R> 1                                IBM 3270           Medium
#R> 2                         IBM 3270 Narrow           Medium
#R> 3                    IBM 3270 Semi-Narrow           Medium
#R> 4                     Anonymice Powerline      Bold Italic
#R> 5                     Anonymice Powerline             Bold
#R> 6                     Anonymice Powerline           Italic
#R> 7                     Anonymice Powerline          Regular
#R> 8                     Arimo for Powerline             Bold
#R> 9                     Arimo for Powerline      Bold Italic
#R> 10                    Arimo for Powerline          Regular
#R> 11                    Arimo for Powerline           Italic
#R> 12                  Cousine for Powerline             Bold
#R> 13                  Cousine for Powerline      Bold Italic
#R> 14                  Cousine for Powerline          Regular
#R> 15                  Cousine for Powerline           Italic
#R> 16         DejaVu Sans Mono for Powerline             Bold
#R> 17         DejaVu Sans Mono for Powerline     Bold Oblique
#R> 18         DejaVu Sans Mono for Powerline             Book
#R> 19         DejaVu Sans Mono for Powerline          Oblique
#R> 20   Droid Sans Mono Dotted for Powerline          Regular
#R> 21          Droid Sans Mono for Powerline          Regular
#R> 22  Droid Sans Mono Slashed for Powerline          Regular
#R> 23                Fira Mono for Powerline             Bold
#R> 24                Fira Mono for Powerline           Medium
#R> 25                Fira Mono for Powerline          Regular
#R> 26                  Go Mono for Powerline             Bold
#R> 27                  Go Mono for Powerline      Bold Italic
#R> 28                  Go Mono for Powerline          Regular
#R> 29                  Go Mono for Powerline           Italic
#R> 30                                   Hack             Bold
#R> 31                                   Hack      Bold Italic
#R> 32                                   Hack           Italic
#R> 33                                   Hack          Regular
#R> 34              Inconsolata for Powerline BoldForPowerline
#R> 35              Inconsolata for Powerline           Medium
#R> 36           Inconsolata-dz for Powerline               dz
#R> 37            Inconsolata-g for Powerline                g
#R> 38              Literation Mono Powerline      Bold Italic
#R> 39              Literation Mono Powerline             Bold
#R> 40              Literation Mono Powerline           Italic
#R> 41              Literation Mono Powerline          Regular
#R> 42               Meslo LG L for Powerline             Bold
#R> 43               Meslo LG L for Powerline      Bold Italic
#R> 44            Meslo LG L DZ for Powerline             Bold
#R> 45            Meslo LG L DZ for Powerline      Bold Italic
#R> 46            Meslo LG L DZ for Powerline           Italic
#R> 47            Meslo LG L DZ for Powerline          Regular
#R> 48               Meslo LG L for Powerline           Italic
#R> 49               Meslo LG L for Powerline          Regular
#R> 50               Meslo LG M for Powerline             Bold
#R> 51               Meslo LG M for Powerline      Bold Italic
#R> 52            Meslo LG M DZ for Powerline             Bold
#R> 53            Meslo LG M DZ for Powerline      Bold Italic
#R> 54            Meslo LG M DZ for Powerline           Italic
#R> 55            Meslo LG M DZ for Powerline          Regular
#R> 56               Meslo LG M for Powerline           Italic
#R> 57               Meslo LG M for Powerline          Regular
#R> 58               Meslo LG S for Powerline             Bold
#R> 59               Meslo LG S for Powerline      Bold Italic
#R> 60            Meslo LG S DZ for Powerline             Bold
#R> 61            Meslo LG S DZ for Powerline      Bold Italic
#R> 62            Meslo LG S DZ for Powerline           Italic
#R> 63            Meslo LG S DZ for Powerline          Regular
#R> 64               Meslo LG S for Powerline           Italic
#R> 65               Meslo LG S for Powerline          Regular
#R> 66                  monofur for Powerline             bold
#R> 67                  monofur for Powerline          Regular
#R> 68                  monofur for Powerline           italic
#R> 69                Noto Mono for Powerline          Regular
#R> 70                 NovaMono for Powerline          Regular
#R> 71                  ProFont for Powerline             Bold
#R> 72                  ProFont for Powerline          Regular
#R> 73              Roboto Mono for Powerline             Bold
#R> 74              Roboto Mono for Powerline      Bold Italic
#R> 75              Roboto Mono for Powerline          Regular
#R> 76              Roboto Mono for Powerline           Italic
#R> 77        Roboto Mono Light for Powerline          Regular
#R> 78        Roboto Mono Light for Powerline           Italic
#R> 79       Roboto Mono Medium for Powerline          Regular
#R> 80       Roboto Mono Medium for Powerline           Italic
#R> 81         Roboto Mono Thin for Powerline          Regular
#R> 82         Roboto Mono Thin for Powerline           Italic
#R> 83                  Source Code Pro Black          Regular
#R> 84          Source Code Pro for Powerline             Bold
#R> 85             Source Code Pro ExtraLight          Regular
#R> 86          Source Code Pro for Powerline          Regular
#R> 87                  Source Code Pro Light          Regular
#R> 88                 Source Code Pro Medium          Regular
#R> 89                  Source Code Pro Black           Italic
#R> 90          Source Code Pro for Powerline      Bold Italic
#R> 91             Source Code Pro ExtraLight           Italic
#R> 92          Source Code Pro for Powerline           Italic
#R> 93                  Source Code Pro Light           Italic
#R> 94                 Source Code Pro Medium           Italic
#R> 95               Source Code Pro Semibold           Italic
#R> 96               Source Code Pro Semibold          Regular
#R> 97               Space Mono for Powerline             Bold
#R> 98               Space Mono for Powerline      Bold Italic
#R> 99               Space Mono for Powerline          Regular
#R> 100              Space Mono for Powerline           Italic
#R> 101                            Space Mono             Bold
#R> 102                            Space Mono      Bold Italic
#R> 103                            Space Mono           Italic
#R> 104                            Space Mono          Regular
#R> 105              Symbol Neu for Powerline          Regular
#R> 106                   Tinos for Powerline             Bold
#R> 107                   Tinos for Powerline      Bold Italic
#R> 108                   Tinos for Powerline          Regular
#R> 109                   Tinos for Powerline           Italic
#R> 110      Ubuntu Mono derivative Powerline      Bold Italic
#R> 111      Ubuntu Mono derivative Powerline             Bold
#R> 112      Ubuntu Mono derivative Powerline           Italic
#R> 113      Ubuntu Mono derivative Powerline          Regular
#R> 114                              Triforce         Triforce
#R> 115                                    Go      Bold Italic
#R> 116                                    Go             Bold
#R> 117                                    Go           Italic
#R> 118                             Go Medium           Italic
#R> 119                             Go Medium          Regular
#R> 120                               Go Mono      Bold Italic
#R> 121                               Go Mono             Bold
#R> 122                               Go Mono           Italic
#R> 123                               Go Mono          Regular
#R> 124                                    Go          Regular
#R> 125                          Go Smallcaps           Italic
#R> 126                          Go Smallcaps          Regular
#R> 127                                 Cabin             Bold
#R> 128                                 Cabin      Bold Italic
#R> 129                                 Cabin           Italic
#R> 130                                 Cabin           Medium
#R> 131                                 Cabin    Medium Italic
#R> 132                                 Cabin          Regular
#R> 133                                 Cabin         SemiBold
#R> 134                                 Cabin  SemiBold Italic
#R> 135                             Cantarell             Bold
#R> 136                  Cantarell Extra Bold          Regular
#R> 137                       Cantarell Light          Regular
#R> 138                             Cantarell          Regular
#R> 139                        Cantarell Thin          Regular
#R> 140                  EB Garamond Initials          Regular
#R> 141            EB Garamond Initials Fill1          Regular
#R> 142            EB Garamond Initials Fill2          Regular
#R> 143                        EB Garamond 08           Italic
#R> 144                        EB Garamond 08          Regular
#R> 145                 EB Garamond 12 All SC            AllSC
#R> 146                        EB Garamond 12           Italic
#R> 147                        EB Garamond 12          Regular
#R> 148                     EB Garamond SC 08          Regular
#R> 149                     EB Garamond SC 12          Regular
#R> 150                             Fira Code             Bold
#R> 151                       Fira Code Light          Regular
#R> 152                      Fira Code Medium          Regular
#R> 153                             Fira Code          Regular
#R> 154                      Fira Code Retina          Regular
#R> 155                           FontAwesome          Regular
#R> 156                                 Amiri             Bold
#R> 157                                 Amiri     Bold Slanted
#R> 158                                 Amiri          Regular
#R> 159                                 Amiri          Slanted
#R> 160                           Amiri Quran          Regular
#R> 161                   Amiri Quran Colored          Regular
#R> 162                   Thabit-Bold-Oblique     Bold Oblique
#R> 163                           Thabit-Bold             Bold
#R> 164                        Thabit-Oblique          Oblique
#R> 165                                Thabit          Regular
#R> 166                              FreeMono          Regular
#R> 167                              FreeMono             Bold
#R> 168                              FreeMono     Bold Oblique
#R> 169                              FreeMono          Oblique
#R> 170                              FreeSans          Regular
#R> 171                              FreeSans             Bold
#R> 172                              FreeSans     Bold Oblique
#R> 173                              FreeSans          Oblique
#R> 174                             FreeSerif          Regular
#R> 175                             FreeSerif             Bold
#R> 176                             FreeSerif      Bold Italic
#R> 177                             FreeSerif           Italic
#R> 178                  Gentium Plus Compact           Italic
#R> 179                  Gentium Plus Compact          Regular
#R> 180                           IPAexGothic          Regular
#R> 181                           IPAexMincho          Regular
#R> 182                             IPAGothic          Regular
#R> 183                            IPAPGothic          Regular
#R> 184                             IPAMincho          Regular
#R> 185                            IPAPMincho          Regular
#R> 186             Linux Biolinum Keyboard O          Regular
#R> 187                      Linux Biolinum O          Regular
#R> 188                      Linux Biolinum O             Bold
#R> 189                      Linux Biolinum O           Italic
#R> 190             Linux Libertine Display O          Regular
#R> 191            Linux Libertine Initials O         Initials
#R> 192                Linux Libertine Mono O             Mono
#R> 193                     Linux Libertine O          Regular
#R> 194                     Linux Libertine O             Bold
#R> 195                     Linux Libertine O      Bold Italic
#R> 196                     Linux Libertine O           Italic
#R> 197                     Linux Libertine O         Semibold
#R> 198                     Linux Libertine O  Semibold Italic
#R> 199                           Lobster Two      Bold Italic
#R> 200                           Lobster Two             Bold
#R> 201                           Lobster Two      Bold Italic
#R> 202                           Lobster Two           Italic
#R> 203                           Lobster Two          Regular
#R> 204                               Manjari             Bold
#R> 205                               Manjari          Regular
#R> 206                          Manjari Thin          Regular
#R> 207                Noto Sans CJK JP Black          Regular
#R> 208                 Noto Sans CJK JP Bold          Regular
#R> 209            Noto Sans CJK JP DemiLight          Regular
#R> 210                Noto Sans CJK JP Light          Regular
#R> 211               Noto Sans CJK JP Medium          Regular
#R> 212              Noto Sans CJK JP Regular          Regular
#R> 213                 Noto Sans CJK JP Thin          Regular
#R> 214               Noto Serif CJK JP Black          Regular
#R> 215                     Noto Serif CJK JP             Bold
#R> 216          Noto Serif CJK JP ExtraLight          Regular
#R> 217               Noto Serif CJK JP Light          Regular
#R> 218              Noto Serif CJK JP Medium          Regular
#R> 219                     Noto Serif CJK JP          Regular
#R> 220            Noto Serif CJK JP SemiBold          Regular
#R> 221                                  STIX             Bold
#R> 222                                  STIX      Bold Italic
#R> 223                                  STIX           Italic
#R> 224                                  STIX          Regular
#R> 225                             STIX Math          Regular
#R> 226                           STIXGeneral             Bold
#R> 227                           STIXGeneral      Bold Italic
#R> 228                           STIXGeneral           Italic
#R> 229                           STIXGeneral          Regular
#R> 230                        STIXIntegralsD             Bold
#R> 231                        STIXIntegralsD          Regular
#R> 232                       STIXIntegralsSm             Bold
#R> 233                       STIXIntegralsSm          Regular
#R> 234                       STIXIntegralsUp             Bold
#R> 235                       STIXIntegralsUp          Regular
#R> 236                      STIXIntegralsUpD             Bold
#R> 237                      STIXIntegralsUpD          Regular
#R> 238                     STIXIntegralsUpSm             Bold
#R> 239                     STIXIntegralsUpSm          Regular
#R> 240                        STIXNonUnicode             Bold
#R> 241                        STIXNonUnicode      Bold Italic
#R> 242                        STIXNonUnicode           Italic
#R> 243                        STIXNonUnicode          Regular
#R> 244                       STIXSizeFiveSym          Regular
#R> 245                       STIXSizeFourSym             Bold
#R> 246                       STIXSizeFourSym          Regular
#R> 247                        STIXSizeOneSym             Bold
#R> 248                        STIXSizeOneSym          Regular
#R> 249                      STIXSizeThreeSym             Bold
#R> 250                      STIXSizeThreeSym          Regular
#R> 251                        STIXSizeTwoSym             Bold
#R> 252                        STIXSizeTwoSym          Regular
#R> 253                          STIXVariants             Bold
#R> 254                          STIXVariants          Regular
#R> 255                                Garuda             Bold
#R> 256                                Garuda      BoldOblique
#R> 257                                Garuda          Oblique
#R> 258                                Garuda          Regular
#R> 259                               Kinnari             Bold
#R> 260                               Kinnari       BoldItalic
#R> 261                               Kinnari      BoldOblique
#R> 262                               Kinnari           Italic
#R> 263                               Kinnari          Oblique
#R> 264                               Kinnari          Regular
#R> 265                              Laksaman             Bold
#R> 266                              Laksaman      Bold Italic
#R> 267                              Laksaman           Italic
#R> 268                              Laksaman          Regular
#R> 269                                  Loma             Bold
#R> 270                                  Loma      BoldOblique
#R> 271                                  Loma          Oblique
#R> 272                                  Loma          Regular
#R> 273                                Norasi             Bold
#R> 274                                Norasi       BoldItalic
#R> 275                                Norasi      BoldOblique
#R> 276                                Norasi           Italic
#R> 277                                Norasi          Oblique
#R> 278                                Norasi          Regular
#R> 279                                Purisa             Bold
#R> 280                                Purisa      BoldOblique
#R> 281                                Purisa          Oblique
#R> 282                                Purisa          Regular
#R> 283                              Sawasdee             Bold
#R> 284                              Sawasdee      BoldOblique
#R> 285                              Sawasdee          Oblique
#R> 286                              Sawasdee          Regular
#R> 287                              TlwgMono             Bold
#R> 288                              TlwgMono      BoldOblique
#R> 289                              TlwgMono          Oblique
#R> 290                              TlwgMono          Regular
#R> 291                        TlwgTypewriter             Bold
#R> 292                        TlwgTypewriter      BoldOblique
#R> 293                        TlwgTypewriter          Oblique
#R> 294                        TlwgTypewriter          Regular
#R> 295                           Tlwg Typist             Bold
#R> 296                           Tlwg Typist      BoldOblique
#R> 297                           Tlwg Typist          Oblique
#R> 298                           Tlwg Typist          Regular
#R> 299                             Tlwg Typo             Bold
#R> 300                             Tlwg Typo      BoldOblique
#R> 301                             Tlwg Typo          Oblique
#R> 302                             Tlwg Typo          Regular
#R> 303                                Umpush             Bold
#R> 304                                Umpush      BoldOblique
#R> 305                                Umpush            Light
#R> 306                                Umpush     LightOblique
#R> 307                                Umpush          Oblique
#R> 308                                Umpush          Regular
#R> 309                                 Waree             Bold
#R> 310                                 Waree      BoldOblique
#R> 311                                 Waree          Oblique
#R> 312                                 Waree          Regular
#R> 313                        Abyssinica SIL          Regular
#R> 314                     Accanthis ADF Std             Bold
#R> 315                     Accanthis ADF Std      Bold Italic
#R> 316                     Accanthis ADF Std           Italic
#R> 317                     Accanthis ADF Std          Regular
#R> 318                 Accanthis ADF Std No2             Bold
#R> 319                 Accanthis ADF Std No2      Bold Italic
#R> 320                 Accanthis ADF Std No2           Italic
#R> 321                 Accanthis ADF Std No2          Regular
#R> 322                 Accanthis ADF Std No3             Bold
#R> 323                 Accanthis ADF Std No3      Bold Italic
#R> 324                 Accanthis ADF Std No3           Italic
#R> 325                 Accanthis ADF Std No3          Regular
#R> 326                       Berenis ADF Pro             Bold
#R> 327                       Berenis ADF Pro      Bold Italic
#R> 328                       Berenis ADF Pro           Italic
#R> 329                       Berenis ADF Pro          Regular
#R> 330                    Berenis ADF Pro SC             Bold
#R> 331                    Berenis ADF Pro SC      Bold Italic
#R> 332                    Berenis ADF Pro SC           Italic
#R> 333                    Berenis ADF Pro SC          Regular
#R> 334                           Gillius ADF             Bold
#R> 335                      Gillius ADF Cond             Bold
#R> 336                      Gillius ADF Cond      Bold Italic
#R> 337                           Gillius ADF      Bold Italic
#R> 338                      Gillius ADF Cond          Regular
#R> 339                      Gillius ADF Cond           Italic
#R> 340                           Gillius ADF           Italic
#R> 341                           Gillius ADF          Regular
#R> 342                       Gillius ADF No2             Bold
#R> 343                  Gillius ADF No2 Cond             Bold
#R> 344                  Gillius ADF No2 Cond      Bold Italic
#R> 345                       Gillius ADF No2      Bold Italic
#R> 346                  Gillius ADF No2 Cond          Regular
#R> 347                  Gillius ADF No2 Cond           Italic
#R> 348                       Gillius ADF No2           Italic
#R> 349                       Gillius ADF No2          Regular
#R> 350                   Universalis ADF Std             Bold
#R> 351              Universalis ADF Std cond             Bold
#R> 352              Universalis ADF Std Cond      Bold Italic
#R> 353                   Universalis ADF Std      Bold Italic
#R> 354              Universalis ADF Std Cond          Regular
#R> 355              Universalis ADF Std Cond           Italic
#R> 356                   Universalis ADF Std           Italic
#R> 357                   Universalis ADF Std          Regular
#R> 358                                Andika          Regular
#R> 359                     AR PL KaitiM Big5          Regular
#R> 360                   AR PL Mingti2L Big5          Regular
#R> 361                      AR PL SungtiL GB          Regular
#R> 362                       AR PL KaitiM GB          Regular
#R> 363                         AR PL UKai CN             Book
#R> 364                        AR PL UMing CN            Light
#R> 365                         GFS Artemisia          Regular
#R> 366                         GFS Artemisia             Bold
#R> 367                         GFS Artemisia      Bold Italic
#R> 368                         GFS Artemisia           Italic
#R> 369                         Arundina Sans             Bold
#R> 370                         Arundina Sans      BoldOblique
#R> 371                         Arundina Sans          Oblique
#R> 372                         Arundina Sans          Regular
#R> 373                    Arundina Sans Mono             Bold
#R> 374                    Arundina Sans Mono     Bold Oblique
#R> 375                    Arundina Sans Mono          Oblique
#R> 376                    Arundina Sans Mono          Regular
#R> 377                        Arundina Serif             Bold
#R> 378                        Arundina Serif          Regular
#R> 379                            Asana Math          Regular
#R> 380                        Baekmuk Batang          Regular
#R> 381                         Baekmuk Dotum          Regular
#R> 382                         Baekmuk Gulim          Regular
#R> 383                      Baekmuk Headline          Regular
#R> 384                       GFS Baskerville          Regular
#R> 385                     GFS BodoniClassic          Regular
#R> 386                             Comfortaa             Bold
#R> 387                       Comfortaa Light          Regular
#R> 388                             Comfortaa          Regular
#R> 389                         GFS Complutum          Regular
#R> 390                                 Arimo             Bold
#R> 391                                 Arimo      Bold Italic
#R> 392                                 Arimo           Italic
#R> 393                                 Arimo          Regular
#R> 394                               Cousine             Bold
#R> 395                               Cousine      Bold Italic
#R> 396                               Cousine           Italic
#R> 397                               Cousine          Regular
#R> 398                                 Tinos             Bold
#R> 399                                 Tinos      Bold Italic
#R> 400                                 Tinos           Italic
#R> 401                                 Tinos          Regular
#R> 402                               Caladea             Bold
#R> 403                               Caladea           Italic
#R> 404                               Caladea           Italic
#R> 405                               Caladea          Regular
#R> 406                               Carlito             Bold
#R> 407                               Carlito      Bold Italic
#R> 408                               Carlito           Italic
#R> 409                               Carlito          Regular
#R> 410                             David CLM             Bold
#R> 411                             David CLM       BoldItalic
#R> 412                             David CLM           Medium
#R> 413                             David CLM     MediumItalic
#R> 414                       Frank Ruehl CLM             Bold
#R> 415                       Frank Ruehl CLM      BoldOblique
#R> 416                       Frank Ruehl CLM           Medium
#R> 417                       Frank Ruehl CLM    MediumOblique
#R> 418                           Hadasim CLM             Bold
#R> 419                           Hadasim CLM      BoldOblique
#R> 420                           Hadasim CLM          Regular
#R> 421                           Hadasim CLM   RegularOblique
#R> 422                              Keter YG             Bold
#R> 423                              Keter YG      BoldOblique
#R> 424                              Keter YG           Medium
#R> 425                              Keter YG    MediumOblique
#R> 426                            Miriam CLM             Bold
#R> 427                            Miriam CLM             Book
#R> 428                       Miriam Mono CLM             Bold
#R> 429                       Miriam Mono CLM      BoldOblique
#R> 430                       Miriam Mono CLM             Book
#R> 431                       Miriam Mono CLM      BookOblique
#R> 432                         Nachlieli CLM             Bold
#R> 433                         Nachlieli CLM      BoldOblique
#R> 434                         Nachlieli CLM            Light
#R> 435                         Nachlieli CLM     LightOblique
#R> 436                                Shofar             Bold
#R> 437                                Shofar      BoldOblique
#R> 438                                Shofar          Regular
#R> 439                                Shofar   RegularOblique
#R> 440                            Simple CLM             Bold
#R> 441                            Simple CLM      BoldOblique
#R> 442                            Simple CLM           Medium
#R> 443                            Simple CLM    MediumOblique
#R> 444                     Stam Ashkenaz CLM           Medium
#R> 445                      Stam Sefarad CLM           Medium
#R> 446                  DejaVu Math TeX Gyre          Regular
#R> 447                           DejaVu Sans             Bold
#R> 448                           DejaVu Sans     Bold Oblique
#R> 449                     DejaVu Sans Light       ExtraLight
#R> 450                           DejaVu Sans          Oblique
#R> 451                           DejaVu Sans             Book
#R> 452                 DejaVu Sans Condensed             Bold
#R> 453                 DejaVu Sans Condensed     Bold Oblique
#R> 454                 DejaVu Sans Condensed          Oblique
#R> 455                 DejaVu Sans Condensed             Book
#R> 456                      DejaVu Sans Mono             Bold
#R> 457                      DejaVu Sans Mono     Bold Oblique
#R> 458                      DejaVu Sans Mono          Oblique
#R> 459                      DejaVu Sans Mono             Book
#R> 460                          DejaVu Serif             Bold
#R> 461                          DejaVu Serif      Bold Italic
#R> 462                          DejaVu Serif           Italic
#R> 463                          DejaVu Serif             Book
#R> 464                DejaVu Serif Condensed             Bold
#R> 465                DejaVu Serif Condensed      Bold Italic
#R> 466                DejaVu Serif Condensed           Italic
#R> 467                DejaVu Serif Condensed             Book
#R> 468                     GFS Didot Classic          Regular
#R> 469                             GFS Didot          Regular
#R> 470                          GFS Didot Rg             Bold
#R> 471                             GFS Didot      Bold Italic
#R> 472                             GFS Didot           Italic
#R> 473                   Droid Sans Fallback          Regular
#R> 474                             Jomolhari          Regular
#R> 475                  EB Garamond Initials          Regular
#R> 476            EB Garamond Initials Fill1          Regular
#R> 477            EB Garamond Initials Fill2          Regular
#R> 478                        EB Garamond 08           Italic
#R> 479                        EB Garamond 08          Regular
#R> 480                 EB Garamond 12 All SC            AllSC
#R> 481                        EB Garamond 12           Italic
#R> 482                        EB Garamond 12          Regular
#R> 483                     EB Garamond SC 08          Regular
#R> 484                     EB Garamond SC 12          Regular
#R> 485                                  Homa          Regular
#R> 486                                 Nazli          Regular
#R> 487                                 Nazli             Bold
#R> 488                                  Titr             Bold
#R> 489                           FontAwesome          Regular
#R> 490                             AlArabiya          Regular
#R> 491                              AlBattar          Regular
#R> 492                                 AlHor          Regular
#R> 493                            AlManzomah          Regular
#R> 494                             AlYarmook          Regular
#R> 495                                  Arab          Regular
#R> 496                               Cortoba          Regular
#R> 497                                Dimnah          Regular
#R> 498                              Electron          Regular
#R> 499                                 Furat          Regular
#R> 500                               Granada          Regular
#R>                                      ps_name
#R> 1                                 3270Medium
#R> 2                                 3270Narrow
#R> 3                             3270SemiNarrow
#R> 4              AnonymicePowerline-BoldItalic
#R> 5                    AnonymicePowerline-Bold
#R> 6                  AnonymicePowerline-Italic
#R> 7                         AnonymicePowerline
#R> 8                     ArimoForPowerline-Bold
#R> 9               ArimoForPowerline-BoldItalic
#R> 10                         ArimoForPowerline
#R> 11                  ArimoForPowerline-Italic
#R> 12                  CousineForPowerline-Bold
#R> 13            CousineForPowerline-BoldItalic
#R> 14                       CousineForPowerline
#R> 15                CousineForPowerline-Italic
#R> 16              DejaVuSansMonoPowerline-Bold
#R> 17       DejaVuSansMonoPowerline-BoldOblique
#R> 18                   DejaVuSansMonoPowerline
#R> 19           DejaVuSansMonoPowerline-Oblique
#R> 20           DroidSansMonoDottedForPowerline
#R> 21                 DroidSansMonoForPowerline
#R> 22          DroidSansMonoSlashedForPowerline
#R> 23                 FiraMonoForPowerline-Bold
#R> 24               FiraMonoForPowerline-Medium
#R> 25              FiraMonoForPowerline-Regular
#R> 26                   GoMonoForPowerline-Bold
#R> 27             GoMonoForPowerline-BoldItalic
#R> 28                        GoMonoForPowerline
#R> 29                 GoMonoForPowerline-Italic
#R> 30                                 Hack-Bold
#R> 31                           Hack-BoldItalic
#R> 32                               Hack-Italic
#R> 33                              Hack-Regular
#R> 34              Inconsolata-BoldForPowerline
#R> 35                   InconsolataForPowerline
#R> 36                InconsolataForPowerline-dz
#R> 37                 InconsolataForPowerline-g
#R> 38        LiterationMonoPowerline-BoldItalic
#R> 39              LiterationMonoPowerline-Bold
#R> 40            LiterationMonoPowerline-Italic
#R> 41                   LiterationMonoPowerline
#R> 42                 MesloLGLForPowerline-Bold
#R> 43           MesloLGLForPowerline-BoldItalic
#R> 44               MesloLGLDZForPowerline-Bold
#R> 45         MesloLGLDZForPowerline-BoldItalic
#R> 46             MesloLGLDZForPowerline-Italic
#R> 47            MesloLGLDZForPowerline-Regular
#R> 48               MesloLGLForPowerline-Italic
#R> 49              MesloLGLForPowerline-Regular
#R> 50                 MesloLGMForPowerline-Bold
#R> 51           MesloLGMForPowerline-BoldItalic
#R> 52               MesloLGMDZForPowerline-Bold
#R> 53         MesloLGMDZForPowerline-BoldItalic
#R> 54             MesloLGMDZForPowerline-Italic
#R> 55            MesloLGMDZForPowerline-Regular
#R> 56               MesloLGMForPowerline-Italic
#R> 57              MesloLGMForPowerline-Regular
#R> 58                 MesloLGSForPowerline-Bold
#R> 59           MesloLGSForPowerline-BoldItalic
#R> 60               MesloLGSDZForPowerline-Bold
#R> 61         MesloLGSDZForPowerline-BoldItalic
#R> 62             MesloLGSDZForPowerline-Italic
#R> 63            MesloLGSDZForPowerline-Regular
#R> 64               MesloLGSForPowerline-Italic
#R> 65              MesloLGSForPowerline-Regular
#R> 66                   MonofurboldForPowerline
#R> 67                       MonofurForPowerline
#R> 68                 MonofuritalicForPowerline
#R> 69                      NotoMonoForPowerline
#R> 70                      NovaMonoForPowerline
#R> 71                  ProFontForPowerline-Bold
#R> 72                       ProFontForPowerline
#R> 73               RobotoMonoForPowerline-Bold
#R> 74         RobotoMonoForPowerline-BoldItalic
#R> 75            RobotoMonoForPowerline-Regular
#R> 76             RobotoMonoForPowerline-Italic
#R> 77              RobotoMonoForPowerline-Light
#R> 78        RobotoMonoForPowerline-LightItalic
#R> 79             RobotoMonoForPowerline-Medium
#R> 80       RobotoMonoForPowerline-MediumItalic
#R> 81               RobotoMonoForPowerline-Thin
#R> 82         RobotoMonoForPowerline-ThinItalic
#R> 83           SourceCodeProForPowerline-Black
#R> 84            SourceCodeProForPowerline-Bold
#R> 85      SourceCodeProForPowerline-ExtraLight
#R> 86         SourceCodeProForPowerline-Regular
#R> 87           SourceCodeProForPowerline-Light
#R> 88          SourceCodeProForPowerline-Medium
#R> 89         SourceCodeProForPowerline-BlackIt
#R> 90          SourceCodeProForPowerline-BoldIt
#R> 91    SourceCodeProForPowerline-ExtraLightIt
#R> 92              SourceCodeProForPowerline-It
#R> 93         SourceCodeProForPowerline-LightIt
#R> 94        SourceCodeProForPowerline-MediumIt
#R> 95      SourceCodeProForPowerline-SemiboldIt
#R> 96        SourceCodeProForPowerline-Semibold
#R> 97                SpaceMonoForPowerline-Bold
#R> 98          SpaceMonoForPowerline-BoldItalic
#R> 99             SpaceMonoForPowerline-Regular
#R> 100             SpaceMonoForPowerline-Italic
#R> 101                           SpaceMono-Bold
#R> 102                     SpaceMono-BoldItalic
#R> 103                         SpaceMono-Italic
#R> 104                        SpaceMono-Regular
#R> 105                    SymbolNeuForPowerline
#R> 106                   TinosForPowerline-Bold
#R> 107             TinosForPowerline-BoldItalic
#R> 108                        TinosForPowerline
#R> 109                 TinosForPowerline-Italic
#R> 110 UbuntuMonoDerivativePowerline-BoldItalic
#R> 111       UbuntuMonoDerivativePowerline-Bold
#R> 112     UbuntuMonoDerivativePowerline-Italic
#R> 113    UbuntuMonoDerivativePowerline-Regular
#R> 114                                 Triforce
#R> 115                            Go-BoldItalic
#R> 116                                  Go-Bold
#R> 117                                Go-Italic
#R> 118                          GoMedium-Italic
#R> 119                                 GoMedium
#R> 120                        GoMono-BoldItalic
#R> 121                              GoMono-Bold
#R> 122                            GoMono-Italic
#R> 123                                   GoMono
#R> 124                                GoRegular
#R> 125                       GoSmallcaps-Italic
#R> 126                              GoSmallcaps
#R> 127                               Cabin-Bold
#R> 128                         Cabin-BoldItalic
#R> 129                             Cabin-Italic
#R> 130                             Cabin-Medium
#R> 131                       Cabin-MediumItalic
#R> 132                            Cabin-Regular
#R> 133                           Cabin-SemiBold
#R> 134                     Cabin-SemiBoldItalic
#R> 135                           Cantarell-Bold
#R> 136                      Cantarell-ExtraBold
#R> 137                          Cantarell-Light
#R> 138                        Cantarell-Regular
#R> 139                           Cantarell-Thin
#R> 140                       EBGaramondInitials
#R> 141                     EBGaramondInitialsF1
#R> 142                     EBGaramondInitialsF2
#R> 143                      EBGaramond08-Italic
#R> 144                     EBGaramond08-Regular
#R> 145                       EBGaramond12-AllSC
#R> 146                      EBGaramond12-Italic
#R> 147                     EBGaramond12-Regular
#R> 148                   EBGaramondSC08-Regular
#R> 149                   EBGaramondSC12-Regular
#R> 150                            FiraCode-Bold
#R> 151                           FiraCode-Light
#R> 152                          FiraCode-Medium
#R> 153                         FiraCode-Regular
#R> 154                          FiraCode-Retina
#R> 155                              FontAwesome
#R> 156                               Amiri-Bold
#R> 157                        Amiri-BoldSlanted
#R> 158                            Amiri-Regular
#R> 159                            Amiri-Slanted
#R> 160                       AmiriQuran-Regular
#R> 161                AmiriQuranColored-Regular
#R> 162                      Thabit-Bold-Oblique
#R> 163                              Thabit-Bold
#R> 164                           Thabit-Oblique
#R> 165                                   Thabit
#R> 166                                 FreeMono
#R> 167                             FreeMonoBold
#R> 168                      FreeMonoBoldOblique
#R> 169                          FreeMonoOblique
#R> 170                                 FreeSans
#R> 171                             FreeSansBold
#R> 172                      FreeSansBoldOblique
#R> 173                          FreeSansOblique
#R> 174                                FreeSerif
#R> 175                            FreeSerifBold
#R> 176                      FreeSerifBoldItalic
#R> 177                          FreeSerifItalic
#R> 178                GentiumPlusCompact-Italic
#R> 179                       GentiumPlusCompact
#R> 180                              IPAexGothic
#R> 181                              IPAexMincho
#R> 182                                IPAGothic
#R> 183                               IPAPGothic
#R> 184                                IPAMincho
#R> 185                               IPAPMincho
#R> 186                           LinBiolinumOKb
#R> 187                             LinBiolinumO
#R> 188                            LinBiolinumOB
#R> 189                            LinBiolinumOI
#R> 190                     LinLibertineDisplayO
#R> 191                           LinLibertineIO
#R> 192                           LinLibertineMO
#R> 193                            LinLibertineO
#R> 194                           LinLibertineOB
#R> 195                          LinLibertineOBI
#R> 196                           LinLibertineOI
#R> 197                           LinLibertineOZ
#R> 198                          LinLibertineOZI
#R> 199                    LobsterTwo-BoldItalic
#R> 200                          LobsterTwo-Bold
#R> 201                    LobsterTwo-BoldItalic
#R> 202                        LobsterTwo-Italic
#R> 203                               LobsterTwo
#R> 204                             Manjari-Bold
#R> 205                          Manjari-Regular
#R> 206                             Manjari-Thin
#R> 207                      NotoSansCJKjp-Black
#R> 208                       NotoSansCJKjp-Bold
#R> 209                  NotoSansCJKjp-DemiLight
#R> 210                      NotoSansCJKjp-Light
#R> 211                     NotoSansCJKjp-Medium
#R> 212                    NotoSansCJKjp-Regular
#R> 213                       NotoSansCJKjp-Thin
#R> 214                     NotoSerifCJKjp-Black
#R> 215                      NotoSerifCJKjp-Bold
#R> 216                NotoSerifCJKjp-ExtraLight
#R> 217                     NotoSerifCJKjp-Light
#R> 218                    NotoSerifCJKjp-Medium
#R> 219                   NotoSerifCJKjp-Regular
#R> 220                  NotoSerifCJKjp-SemiBold
#R> 221                                STIX-Bold
#R> 222                          STIX-BoldItalic
#R> 223                              STIX-Italic
#R> 224                             STIX-Regular
#R> 225                         STIXMath-Regular
#R> 226                         STIXGeneral-Bold
#R> 227                   STIXGeneral-BoldItalic
#R> 228                       STIXGeneral-Italic
#R> 229                      STIXGeneral-Regular
#R> 230                      STIXIntegralsD-Bold
#R> 231                   STIXIntegralsD-Regular
#R> 232                     STIXIntegralsSm-Bold
#R> 233                  STIXIntegralsSm-Regular
#R> 234                     STIXIntegralsUp-Bold
#R> 235                  STIXIntegralsUp-Regular
#R> 236                    STIXIntegralsUpD-Bold
#R> 237                 STIXIntegralsUpD-Regular
#R> 238                   STIXIntegralsUpSm-Bold
#R> 239                STIXIntegralsUpSm-Regular
#R> 240                      STIXNonUnicode-Bold
#R> 241                STIXNonUnicode-BoldItalic
#R> 242                    STIXNonUnicode-Italic
#R> 243                   STIXNonUnicode-Regular
#R> 244                  STIXSizeFiveSym-Regular
#R> 245                     STIXSizeFourSym-Bold
#R> 246                  STIXSizeFourSym-Regular
#R> 247                      STIXSizeOneSym-Bold
#R> 248                   STIXSizeOneSym-Regular
#R> 249                    STIXSizeThreeSym-Bold
#R> 250                 STIXSizeThreeSym-Regular
#R> 251                      STIXSizeTwoSym-Bold
#R> 252                   STIXSizeTwoSym-Regular
#R> 253                        STIXVariants-Bold
#R> 254                     STIXVariants-Regular
#R> 255                              Garuda-Bold
#R> 256                       Garuda-BoldOblique
#R> 257                           Garuda-Oblique
#R> 258                                   Garuda
#R> 259                             Kinnari-Bold
#R> 260                       Kinnari-BoldItalic
#R> 261                      Kinnari-BoldOblique
#R> 262                           Kinnari-Italic
#R> 263                          Kinnari-Oblique
#R> 264                                  Kinnari
#R> 265                            Laksaman-Bold
#R> 266                      Laksaman-BoldItalic
#R> 267                          Laksaman-Italic
#R> 268                                 Laksaman
#R> 269                                Loma-Bold
#R> 270                         Loma-BoldOblique
#R> 271                             Loma-Oblique
#R> 272                                     Loma
#R> 273                              Norasi-Bold
#R> 274                        Norasi-BoldItalic
#R> 275                       Norasi-BoldOblique
#R> 276                            Norasi-Italic
#R> 277                           Norasi-Oblique
#R> 278                                   Norasi
#R> 279                              Purisa-Bold
#R> 280                       Purisa-BoldOblique
#R> 281                           Purisa-Oblique
#R> 282                                   Purisa
#R> 283                            Sawasdee-Bold
#R> 284                     Sawasdee-BoldOblique
#R> 285                         Sawasdee-Oblique
#R> 286                                 Sawasdee
#R> 287                            TlwgMono-Bold
#R> 288                     TlwgMono-BoldOblique
#R> 289                         TlwgMono-Oblique
#R> 290                                 TlwgMono
#R> 291                      TlwgTypewriter-Bold
#R> 292               TlwgTypewriter-BoldOblique
#R> 293                   TlwgTypewriter-Oblique
#R> 294                           TlwgTypewriter
#R> 295                          TlwgTypist-Bold
#R> 296                   TlwgTypist-BoldOblique
#R> 297                       TlwgTypist-Oblique
#R> 298                               TlwgTypist
#R> 299                            TlwgTypo-Bold
#R> 300                     TlwgTypo-BoldOblique
#R> 301                         TlwgTypo-Oblique
#R> 302                                 TlwgTypo
#R> 303                              Umpush-Bold
#R> 304                       Umpush-BoldOblique
#R> 305                             Umpush-Light
#R> 306                      Umpush-LightOblique
#R> 307                           Umpush-Oblique
#R> 308                                   Umpush
#R> 309                               Waree-Bold
#R> 310                        Waree-BoldOblique
#R> 311                            Waree-Oblique
#R> 312                                    Waree
#R> 313                            AbyssinicaSIL
#R> 314                     AccanthisADFStd-Bold
#R> 315               AccanthisADFStd-BoldItalic
#R> 316                   AccanthisADFStd-Italic
#R> 317                  AccanthisADFStd-Regular
#R> 318                  AccanthisADFStdNo2-Bold
#R> 319            AccanthisADFStdNo2-BoldItalic
#R> 320                AccanthisADFStdNo2-Italic
#R> 321               AccanthisADFStdNo2-Regular
#R> 322                  AccanthisADFStdNo3-Bold
#R> 323            AccanthisADFStdNo3-BoldItalic
#R> 324                AccanthisADFStdNo3-Italic
#R> 325               AccanthisADFStdNo3-Regular
#R> 326                       BerenisADFPro-Bold
#R> 327                 BerenisADFPro-BoldItalic
#R> 328                     BerenisADFPro-Italic
#R> 329                    BerenisADFPro-Regular
#R> 330                     BerenisADFProSC-Bold
#R> 331               BerenisADFProSC-BoldItalic
#R> 332                   BerenisADFProSC-Italic
#R> 333                  BerenisADFProSC-Regular
#R> 334                          GilliusADF-Bold
#R> 335                      GilliusADF-BoldCond
#R> 336                GilliusADF-BoldCondItalic
#R> 337                    GilliusADF-BoldItalic
#R> 338                          GilliusADF-Cond
#R> 339                    GilliusADF-CondItalic
#R> 340                        GilliusADF-Italic
#R> 341                       GilliusADF-Regular
#R> 342                       GilliusADFNo2-Bold
#R> 343                   GilliusADFNo2-BoldCond
#R> 344             GilliusADFNo2-BoldCondItalic
#R> 345                 GilliusADFNo2-BoldItalic
#R> 346                       GilliusADFNo2-Cond
#R> 347                 GilliusADFNo2-CondItalic
#R> 348                     GilliusADFNo2-Italic
#R> 349                    GilliusADFNo2-Regular
#R> 350                   UniversalisADFStd-Bold
#R> 351               UniversalisADFStd-BoldCond
#R> 352            UniversalisADFStd-BoldCondObl
#R> 353            UniversalisADFStd-BoldOblique
#R> 354                   UniversalisADFStd-Cond
#R> 355            UniversalisADFStd-CondOblique
#R> 356                UniversalisADFStd-Oblique
#R> 357                UniversalisADFStd-Regular
#R> 358                                   Andika
#R> 359                            ZenKai-Medium
#R> 360                         ShanHeiSun-Light
#R> 361                       BousungEG-Light-GB
#R> 362                          GBZenKai-Medium
#R> 363                                   UKaiCN
#R> 364                                  UMingCN
#R> 365                     GFSArtemisia-Regular
#R> 366                        GFSArtemisia-Bold
#R> 367                  GFSArtemisia-BoldItalic
#R> 368                      GFSArtemisia-Italic
#R> 369                        ArundinaSans-Bold
#R> 370                 ArundinaSans-BoldOblique
#R> 371                     ArundinaSans-Oblique
#R> 372                             ArundinaSans
#R> 373                    ArundinaSansMono-Bold
#R> 374             ArundinaSansMono-BoldOblique
#R> 375                 ArundinaSansMono-Oblique
#R> 376                         ArundinaSansMono
#R> 377                       ArundinaSerif-Bold
#R> 378                            ArundinaSerif
#R> 379                               Asana-Math
#R> 380                           Baekmuk-Batang
#R> 381                            Baekmuk-Dotum
#R> 382                            Baekmuk-Gulim
#R> 383                         Baekmuk-Headline
#R> 384                   GFSBaskerville-Regular
#R> 385                 GFSBodoniClassic-Regular
#R> 386                           Comfortaa-Bold
#R> 387                          Comfortaa-Light
#R> 388                        Comfortaa-Regular
#R> 389                     GFSComplutum-Regular
#R> 390                               Arimo-Bold
#R> 391                         Arimo-BoldItalic
#R> 392                             Arimo-Italic
#R> 393                                    Arimo
#R> 394                             Cousine-Bold
#R> 395                       Cousine-BoldItalic
#R> 396                           Cousine-Italic
#R> 397                                  Cousine
#R> 398                               Tinos-Bold
#R> 399                         Tinos-BoldItalic
#R> 400                             Tinos-Italic
#R> 401                                    Tinos
#R> 402                             Caladea-Bold
#R> 403                       Caladea-BoldItalic
#R> 404                           Caladea-Italic
#R> 405                          Caladea-Regular
#R> 406                             Carlito-Bold
#R> 407                       Carlito-BoldItalic
#R> 408                           Carlito-Italic
#R> 409                                  Carlito
#R> 410                            DavidCLM-Bold
#R> 411                      DavidCLM-BoldItalic
#R> 412                          DavidCLM-Medium
#R> 413                    DavidCLM-MediumItalic
#R> 414                       FrankRuehlCLM-Bold
#R> 415                FrankRuehlCLM-BoldOblique
#R> 416                     FrankRuehlCLM-Medium
#R> 417              FrankRuehlCLM-MediumOblique
#R> 418                          HadasimCLM-Bold
#R> 419                   HadasimCLM-BoldOblique
#R> 420                       HadasimCLM-Regular
#R> 421                HadasimCLM-RegularOblique
#R> 422                             KeterYG-Bold
#R> 423                      KeterYG-BoldOblique
#R> 424                           KeterYG-Medium
#R> 425                    KeterYG-MediumOblique
#R> 426                           MiriamCLM-Bold
#R> 427                           MiriamCLM-Book
#R> 428                       MiriamMonoCLM-Bold
#R> 429                MiriamMonoCLM-BoldOblique
#R> 430                       MiriamMonoCLM-Book
#R> 431                MiriamMonoCLM-BookOblique
#R> 432                        NachlieliCLM-Bold
#R> 433                 NachlieliCLM-BoldOblique
#R> 434                       NachlieliCLM-Light
#R> 435                NachlieliCLM-LightOblique
#R> 436                          ShofarDemi-Bold
#R> 437                   ShofarDemi-BoldOblique
#R> 438                            ShofarRegular
#R> 439                     ShofarRegularOblique
#R> 440                           SimpleCLM-Bold
#R> 441                    SimpleCLM-BoldOblique
#R> 442                         SimpleCLM-Medium
#R> 443                  SimpleCLM-MediumOblique
#R> 444                          StamAshkenazCLM
#R> 445                           StamSefaradCLM
#R> 446                DejaVuMathTeXGyre-Regular
#R> 447                          DejaVuSans-Bold
#R> 448                   DejaVuSans-BoldOblique
#R> 449                    DejaVuSans-ExtraLight
#R> 450                       DejaVuSans-Oblique
#R> 451                               DejaVuSans
#R> 452                 DejaVuSansCondensed-Bold
#R> 453          DejaVuSansCondensed-BoldOblique
#R> 454              DejaVuSansCondensed-Oblique
#R> 455                      DejaVuSansCondensed
#R> 456                      DejaVuSansMono-Bold
#R> 457               DejaVuSansMono-BoldOblique
#R> 458                   DejaVuSansMono-Oblique
#R> 459                           DejaVuSansMono
#R> 460                         DejaVuSerif-Bold
#R> 461                   DejaVuSerif-BoldItalic
#R> 462                       DejaVuSerif-Italic
#R> 463                              DejaVuSerif
#R> 464                DejaVuSerifCondensed-Bold
#R> 465          DejaVuSerifCondensed-BoldItalic
#R> 466              DejaVuSerifCondensed-Italic
#R> 467                     DejaVuSerifCondensed
#R> 468                  GFSDidotClassic-Regular
#R> 469                         GFSDidot-Regular
#R> 470                            GFSDidot-Bold
#R> 471                      GFSDidot-BoldItalic
#R> 472                          GFSDidot-Italic
#R> 473                        DroidSansFallback
#R> 474                                Jomolhari
#R> 475                       EBGaramondInitials
#R> 476                     EBGaramondInitialsF1
#R> 477                     EBGaramondInitialsF2
#R> 478                      EBGaramond08-Italic
#R> 479                     EBGaramond08-Regular
#R> 480                       EBGaramond12-AllSC
#R> 481                      EBGaramond12-Italic
#R> 482                     EBGaramond12-Regular
#R> 483                   EBGaramondSC08-Regular
#R> 484                   EBGaramondSC12-Regular
#R> 485                                     Homa
#R> 486                                    Nazli
#R> 487                               Nazli-Bold
#R> 488                                Titr-Bold
#R> 489                              FontAwesome
#R> 490                                AlArabiya
#R> 491                                 AlBattar
#R> 492                                    AlHor
#R> 493                               AlManzomah
#R> 494                                AlYarmook
#R> 495                                     Arab
#R> 496                                  Cortoba
#R> 497                                   Dimnah
#R> 498                                 Electron
#R> 499                                    Furat
#R> 500                                  Granada
#R>  [ reached 'max' / getOption("max.print") -- omitted 2387 rows ]
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

<img src="/post/Archived/hylianStyle/index_files/figure-html/unnamed-chunk-8-1.png" width="864" style="display: block; margin: auto;" />

<br><br>

#### YEAH! :sunglasses:

<details>
<summary> Session info <i class="fa fa-cogs" aria-hidden="true"></i> </summary>

```r
sessionInfo()
#R> R version 3.5.2 (2018-12-20)
#R> Platform: x86_64-pc-linux-gnu (64-bit)
#R> Running under: Debian GNU/Linux buster/sid
#R> 
#R> Matrix products: default
#R> BLAS: /usr/lib/x86_64-linux-gnu/openblas/libblas.so.3
#R> LAPACK: /usr/lib/x86_64-linux-gnu/libopenblasp-r0.3.5.so
#R> 
#R> locale:
#R>  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
#R>  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
#R>  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
#R>  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
#R>  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
#R> [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
#R> 
#R> attached base packages:
#R> [1] stats     graphics  grDevices datasets  utils     methods   base     
#R> 
#R> other attached packages:
#R> [1] showtext_0.6   showtextdb_2.0 sysfonts_0.8   usethis_1.4.0 
#R> [5] devtools_2.0.2
#R> 
#R> loaded via a namespace (and not attached):
#R>  [1] Rcpp_1.0.0        knitr_1.22        magrittr_1.5     
#R>  [4] pkgload_1.0.2     R6_2.4.0          rlang_0.3.1      
#R>  [7] stringr_1.4.0     tools_3.5.2       pkgbuild_1.0.2   
#R> [10] xfun_0.5          sessioninfo_1.1.1 cli_1.0.1        
#R> [13] withr_2.1.2       htmltools_0.3.6   remotes_2.0.2    
#R> [16] yaml_2.2.0        assertthat_0.2.0  rprojroot_1.3-2  
#R> [19] digest_0.6.18     bookdown_0.9.2    crayon_1.3.4     
#R> [22] processx_3.2.1    callr_3.1.1       fs_1.2.6         
#R> [25] ps_1.3.0          testthat_2.0.1    memoise_1.1.0    
#R> [28] glue_1.3.0        evaluate_0.13     rmarkdown_1.12   
#R> [31] blogdown_0.11     stringi_1.4.3     compiler_3.5.2   
#R> [34] desc_1.2.0        backports_1.1.3   prettyunits_1.0.2
```
</details>
