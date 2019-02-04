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
#R>                              path                    file
#R> 1 /home/kevcaz/.local/share/fonts          3270Medium.ttf
#R> 2 /home/kevcaz/.local/share/fonts          3270Narrow.ttf
#R> 3 /home/kevcaz/.local/share/fonts      3270SemiNarrow.ttf
#R> 4 /home/kevcaz/.local/share/fonts         academicons.ttf
#R> 5 /home/kevcaz/.local/share/fonts AlfaSlabOne-Regular.ttf
#R>                 family    face          version             ps_name
#R> 1             IBM 3270  Medium Version 001.000           3270Medium
#R> 2      IBM 3270 Narrow  Medium Version 001.000           3270Narrow
#R> 3 IBM 3270 Semi-Narrow  Medium Version 001.000       3270SemiNarrow
#R> 4          academicons Regular      Version 1.8         academicons
#R> 5        Alfa Slab One Regular    Version 2.000 AlfaSlabOne-Regular
#R>  [ reached 'max' / getOption("max.print") -- omitted 948 rows ]
```

If you have installed the font on your computer, it should be in the list,
then you can skip step 4.


### 4. Add a path to your font

If you have downloaded the font using R, you must notify showtext about to
folder `dr` where the font has been stored. To so do, use the `font_paths()`
function:


```r
font_paths(".")
#R>   [1] "/home/kevcaz/Github/Websites/inSileco.github.io/content/post/hylianStyle"
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
#R>  [22] "/usr/share/fonts/opentype/freefont"                                      
#R>  [23] "/usr/share/fonts/opentype/gentiumplus"                                   
#R>  [24] "/usr/share/fonts/opentype/ipaexfont-gothic"                              
#R>  [25] "/usr/share/fonts/opentype/ipaexfont-mincho"                              
#R>  [26] "/usr/share/fonts/opentype/ipafont-gothic"                                
#R>  [27] "/usr/share/fonts/opentype/ipafont-mincho"                                
#R>  [28] "/usr/share/fonts/opentype/linux-libertine"                               
#R>  [29] "/usr/share/fonts/opentype/lobster"                                       
#R>  [30] "/usr/share/fonts/opentype/lobstertwo"                                    
#R>  [31] "/usr/share/javascript/mathjax/fonts/HTML-CSS/TeX/otf"                    
#R>  [32] "/usr/share/fonts/opentype/stix"                                          
#R>  [33] "/usr/share/fonts/opentype/stix-word"                                     
#R>  [34] "/usr/share/fonts/opentype/tlwg"                                          
#R>  [35] "/usr/share/fonts/svg"                                                    
#R>  [36] "/usr/share/fonts/svg/font-awesome"                                       
#R>  [37] "/usr/share/fonts/truetype"                                               
#R>  [38] "/usr/share/fonts/truetype/adf"                                           
#R>  [39] "/usr/share/fonts/truetype/arphic-bkai00mp"                               
#R>  [40] "/usr/share/fonts/truetype/arphic-bsmi00lp"                               
#R>  [41] "/usr/share/fonts/truetype/arphic-gbsn00lp"                               
#R>  [42] "/usr/share/fonts/truetype/arphic-gkai00mp"                               
#R>  [43] "/usr/share/fonts/truetype/artemisia"                                     
#R>  [44] "/usr/share/fonts/truetype/asana-math"                                    
#R>  [45] "/usr/share/fonts/truetype/baekmuk"                                       
#R>  [46] "/usr/share/fonts/truetype/baskerville"                                   
#R>  [47] "/usr/share/fonts/truetype/bodoni-classic"                                
#R>  [48] "/usr/share/fonts/truetype/comfortaa"                                     
#R>  [49] "/usr/share/fonts/truetype/complutum"                                     
#R>  [50] "/usr/share/fonts/truetype/croscore"                                      
#R>  [51] "/usr/share/fonts/truetype/crosextra"                                     
#R>  [52] "/usr/share/fonts/truetype/dejavu"                                        
#R>  [53] "/usr/share/fonts/truetype/didot"                                         
#R>  [54] "/usr/share/fonts/truetype/didot-classic"                                 
#R>  [55] "/usr/share/fonts/truetype/droid"                                         
#R>  [56] "/usr/share/fonts/truetype/ebgaramond"                                    
#R>  [57] "/usr/share/fonts/truetype/font-awesome"                                  
#R>  [58] "/usr/share/fonts/truetype/freefont"                                      
#R>  [59] "/usr/share/fonts/truetype/gazis"                                         
#R>  [60] "/usr/share/fonts/truetype/gentium"                                       
#R>  [61] "/usr/share/fonts/truetype/gentium-basic"                                 
#R>  [62] "/usr/share/fonts/truetype/gentiumplus"                                   
#R>  [63] "/usr/share/fonts/truetype/glyphicons"                                    
#R>  [64] "/usr/share/fonts/truetype/inconsolata"                                   
#R>  [65] "/usr/share/fonts/truetype/junicode"                                      
#R>  [66] "/usr/share/fonts/truetype/lato"                                          
#R>  [67] "/usr/share/fonts/truetype/liberation"                                    
#R>  [68] "/usr/share/fonts/truetype/liberation2"                                   
#R>  [69] "/usr/share/fonts/truetype/lyx"                                           
#R>  [70] "/usr/share/fonts/truetype/msttcorefonts"                                 
#R>  [71] "/usr/share/fonts/truetype/neohellenic"                                   
#R>  [72] "/usr/share/fonts/truetype/noto"                                          
#R>  [73] "/usr/share/fonts/truetype/olga"                                          
#R>  [74] "/usr/share/fonts/truetype/open-sans"                                     
#R>  [75] "/usr/share/fonts/truetype/openoffice"                                    
#R>  [76] "/usr/share/fonts/truetype/padauk"                                        
#R>  [77] "/usr/share/fonts/truetype/porson"                                        
#R>  [78] "/usr/share/fonts/truetype/roboto"                                        
#R>  [79] "/usr/share/fonts/truetype/roboto/hinted"                                 
#R>  [80] "/usr/share/fonts/truetype/roboto/slab"                                   
#R>  [81] "/usr/share/fonts/truetype/roboto/unhinted"                               
#R>  [82] "/usr/share/fonts/truetype/roboto/unhinted/RobotoTTF"                     
#R>  [83] "/usr/share/fonts/truetype/solomos"                                       
#R>  [84] "/usr/share/fonts/truetype/theokritos"                                    
#R>  [85] "/usr/share/fonts/truetype/ttf-bitstream-vera"                            
#R>  [86] "/usr/share/fonts/truetype/unfonts-core"                                  
#R>  [87] "/usr/share/fonts/truetype/unfonts-extra"                                 
#R>  [88] "/usr/share/fonts/type1"                                                  
#R>  [89] "/usr/share/fonts/type1/gsfonts"                                          
#R>  [90] "/usr/share/fonts/type1/texlive-fonts-recommended"                        
#R>  [91] "/usr/share/fonts/woff"                                                   
#R>  [92] "/usr/share/fonts/woff/ebgaramond"                                        
#R>  [93] "/usr/share/fonts/woff/firacode"                                          
#R>  [94] "/usr/share/fonts/woff/font-awesome"                                      
#R>  [95] "/usr/share/fonts/X11"                                                    
#R>  [96] "/usr/share/fonts/X11/100dpi"                                             
#R>  [97] "/usr/share/fonts/X11/75dpi"                                              
#R>  [98] "/usr/share/fonts/X11/encodings"                                          
#R>  [99] "/usr/share/fonts/X11/encodings/large"                                    
#R> [100] "/usr/share/fonts/X11/misc"                                               
#R> [101] "/usr/share/fonts/X11/Type1"                                              
#R> [102] "/usr/share/fonts/X11/util"
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
#R> 4                                    academicons.ttf
#R> 5                            AlfaSlabOne-Regular.ttf
#R> 6                Anonymice Powerline Bold Italic.ttf
#R> 7                       Anonymice Powerline Bold.ttf
#R> 8                     Anonymice Powerline Italic.ttf
#R> 9                            Anonymice Powerline.ttf
#R> 10                          ArchivoBlack-Regular.ttf
#R> 11                      Arimo Bold for Powerline.ttf
#R> 12               Arimo Bold Italic for Powerline.ttf
#R> 13                           Arimo for Powerline.ttf
#R> 14                    Arimo Italic for Powerline.ttf
#R> 15                    Cousine Bold for Powerline.ttf
#R> 16             Cousine Bold Italic for Powerline.ttf
#R> 17                         Cousine for Powerline.ttf
#R> 18                  Cousine Italic for Powerline.ttf
#R> 19                   D2Coding Bold for Powerline.ttf
#R> 20                        D2Coding for Powerline.ttf
#R> 21           DejaVu Sans Mono Bold for Powerline.ttf
#R> 22   DejaVu Sans Mono Bold Oblique for Powerline.ttf
#R> 23                DejaVu Sans Mono for Powerline.ttf
#R> 24        DejaVu Sans Mono Oblique for Powerline.ttf
#R> 25          Droid Sans Mono Dotted for Powerline.ttf
#R> 26                 Droid Sans Mono for Powerline.otf
#R> 27         Droid Sans Mono Slashed for Powerline.ttf
#R> 28                       FuraMono-Bold Powerline.otf
#R> 29                     FuraMono-Medium Powerline.otf
#R> 30                    FuraMono-Regular Powerline.otf
#R> 31                    Go Mono Bold for Powerline.ttf
#R> 32             Go Mono Bold Italic for Powerline.ttf
#R> 33                         Go Mono for Powerline.ttf
#R> 34                  Go Mono Italic for Powerline.ttf
#R> 35                                     Hack-Bold.ttf
#R> 36                               Hack-BoldItalic.ttf
#R> 37                                   Hack-Italic.ttf
#R> 38                                  Hack-Regular.ttf
#R> 39                                       HELR45W.ttf
#R> 40                Inconsolata Bold for Powerline.ttf
#R> 41                     Inconsolata for Powerline.otf
#R> 42                  Inconsolata-dz for Powerline.otf
#R> 43                   Inconsolata-g for Powerline.otf
#R> 44                                      ionicons.ttf
#R> 45                         LibreBaskerville-Bold.ttf
#R> 46                       LibreBaskerville-Italic.ttf
#R> 47                      LibreBaskerville-Regular.ttf
#R> 48         Literation Mono Powerline Bold Italic.ttf
#R> 49                Literation Mono Powerline Bold.ttf
#R> 50              Literation Mono Powerline Italic.ttf
#R> 51                     Literation Mono Powerline.ttf
#R> 52                 Meslo LG L Bold for Powerline.ttf
#R> 53          Meslo LG L Bold Italic for Powerline.ttf
#R> 54              Meslo LG L DZ Bold for Powerline.ttf
#R> 55       Meslo LG L DZ Bold Italic for Powerline.ttf
#R> 56            Meslo LG L DZ Italic for Powerline.ttf
#R> 57           Meslo LG L DZ Regular for Powerline.ttf
#R> 58               Meslo LG L Italic for Powerline.ttf
#R> 59              Meslo LG L Regular for Powerline.ttf
#R> 60                 Meslo LG M Bold for Powerline.ttf
#R> 61          Meslo LG M Bold Italic for Powerline.ttf
#R> 62              Meslo LG M DZ Bold for Powerline.ttf
#R> 63       Meslo LG M DZ Bold Italic for Powerline.ttf
#R> 64            Meslo LG M DZ Italic for Powerline.ttf
#R> 65           Meslo LG M DZ Regular for Powerline.ttf
#R> 66               Meslo LG M Italic for Powerline.ttf
#R> 67              Meslo LG M Regular for Powerline.ttf
#R> 68                 Meslo LG S Bold for Powerline.ttf
#R> 69          Meslo LG S Bold Italic for Powerline.ttf
#R> 70              Meslo LG S DZ Bold for Powerline.ttf
#R> 71       Meslo LG S DZ Bold Italic for Powerline.ttf
#R> 72            Meslo LG S DZ Italic for Powerline.ttf
#R> 73           Meslo LG S DZ Regular for Powerline.ttf
#R> 74               Meslo LG S Italic for Powerline.ttf
#R> 75              Meslo LG S Regular for Powerline.ttf
#R> 76                    Monofur Bold for Powerline.ttf
#R> 77                         Monofur for Powerline.ttf
#R> 78                  Monofur Italic for Powerline.ttf
#R> 79                                    Mukta-Bold.ttf
#R> 80                               Mukta-ExtraBold.ttf
#R> 81                              Mukta-ExtraLight.ttf
#R> 82                                   Mukta-Light.ttf
#R> 83                                  Mukta-Medium.ttf
#R> 84                                 Mukta-Regular.ttf
#R> 85                                Mukta-SemiBold.ttf
#R> 86                       Noto Mono for Powerline.ttf
#R> 87                        NovaMono for Powerline.ttf
#R> 88                    Periodic Table of Elements.ttf
#R> 89                    ProFont Bold For Powerline.ttf
#R> 90                         ProFont For Powerline.ttf
#R> 91                Roboto Mono Bold for Powerline.ttf
#R> 92         Roboto Mono Bold Italic for Powerline.ttf
#R> 93                     Roboto Mono for Powerline.ttf
#R> 94              Roboto Mono Italic for Powerline.ttf
#R> 95               Roboto Mono Light for Powerline.ttf
#R> 96        Roboto Mono Light Italic for Powerline.ttf
#R> 97              Roboto Mono Medium for Powerline.ttf
#R> 98       Roboto Mono Medium Italic for Powerline.ttf
#R> 99                Roboto Mono Thin for Powerline.ttf
#R> 100        Roboto Mono Thin Italic for Powerline.ttf
#R> 101          Source Code Pro Black for Powerline.otf
#R> 102           Source Code Pro Bold for Powerline.otf
#R> 103     Source Code Pro ExtraLight for Powerline.otf
#R> 104                Source Code Pro for Powerline.otf
#R> 105          Source Code Pro Light for Powerline.otf
#R> 106         Source Code Pro Medium for Powerline.otf
#R> 107        Source Code Pro Powerline BlackItalic.otf
#R> 108         Source Code Pro Powerline BoldItalic.otf
#R> 109   Source Code Pro Powerline ExtraLightItalic.otf
#R> 110             Source Code Pro Powerline Italic.otf
#R> 111        Source Code Pro Powerline LightItalic.otf
#R> 112       Source Code Pro Powerline MediumItalic.otf
#R> 113     Source Code Pro Powerline SemiboldItalic.otf
#R> 114       Source Code Pro Semibold for Powerline.otf
#R> 115                Space Mono Bold for Powerline.ttf
#R> 116         Space Mono Bold Italic for Powerline.ttf
#R> 117                     Space Mono for Powerline.ttf
#R> 118              Space Mono Italic for Powerline.ttf
#R> 119                               SpaceMono-Bold.ttf
#R> 120                         SpaceMono-BoldItalic.ttf
#R> 121                             SpaceMono-Italic.ttf
#R> 122                            SpaceMono-Regular.ttf
#R> 123                     Symbol Neu for Powerline.ttf
#R> 124                     Tinos Bold for Powerline.ttf
#R> 125              Tinos Bold Italic for Powerline.ttf
#R> 126                          Tinos for Powerline.ttf
#R> 127                   Tinos Italic for Powerline.ttf
#R> 128                                     Triforce.ttf
#R> 129 Ubuntu Mono derivative Powerline Bold Italic.ttf
#R> 130        Ubuntu Mono derivative Powerline Bold.ttf
#R> 131      Ubuntu Mono derivative Powerline Italic.ttf
#R> 132             Ubuntu Mono derivative Powerline.ttf
#R> 133                                     Triforce.ttf
#R> 134                               Go-Bold-Italic.ttf
#R> 135                                      Go-Bold.ttf
#R> 136                                    Go-Italic.ttf
#R> 137                             Go-Medium-Italic.ttf
#R> 138                                    Go-Medium.ttf
#R> 139                          Go-Mono-Bold-Italic.ttf
#R> 140                                 Go-Mono-Bold.ttf
#R> 141                               Go-Mono-Italic.ttf
#R> 142                                      Go-Mono.ttf
#R> 143                                   Go-Regular.ttf
#R> 144                                   Cabin-Bold.otf
#R> 145                             Cabin-BoldItalic.otf
#R> 146                                 Cabin-Italic.otf
#R> 147                                 Cabin-Medium.otf
#R> 148                           Cabin-MediumItalic.otf
#R> 149                                Cabin-Regular.otf
#R> 150                               Cabin-SemiBold.otf
#R> 151                         Cabin-SemiBoldItalic.otf
#R> 152                               Cantarell-Bold.otf
#R> 153                          Cantarell-ExtraBold.otf
#R> 154                              Cantarell-Light.otf
#R> 155                            Cantarell-Regular.otf
#R> 156                               Cantarell-Thin.otf
#R> 157                          EBGaramond-Initials.otf
#R> 158                        EBGaramond-InitialsF1.otf
#R> 159                        EBGaramond-InitialsF2.otf
#R> 160                          EBGaramond08-Italic.otf
#R> 161                         EBGaramond08-Regular.otf
#R> 162                           EBGaramond12-AllSC.otf
#R> 163                          EBGaramond12-Italic.otf
#R> 164                         EBGaramond12-Regular.otf
#R> 165                       EBGaramondSC08-Regular.otf
#R> 166                       EBGaramondSC12-Regular.otf
#R> 167                                FiraCode-Bold.otf
#R> 168                               FiraCode-Light.otf
#R> 169                              FiraCode-Medium.otf
#R> 170                             FiraCode-Regular.otf
#R> 171                              FiraCode-Retina.otf
#R> 172                                  FontAwesome.otf
#R> 173                                   Amiri-Bold.ttf
#R> 174                            Amiri-BoldSlanted.ttf
#R> 175                                Amiri-Regular.ttf
#R> 176                                Amiri-Slanted.ttf
#R> 177                                   AmiriQuran.ttf
#R> 178                            AmiriQuranColored.ttf
#R> 179                                     FreeMono.otf
#R> 180                                 FreeMonoBold.otf
#R> 181                          FreeMonoBoldOblique.otf
#R> 182                              FreeMonoOblique.otf
#R> 183                                     FreeSans.otf
#R> 184                                 FreeSansBold.otf
#R> 185                          FreeSansBoldOblique.otf
#R> 186                              FreeSansOblique.otf
#R> 187                                    FreeSerif.otf
#R> 188                                FreeSerifBold.otf
#R> 189                          FreeSerifBoldItalic.otf
#R> 190                              FreeSerifItalic.otf
#R> 191                         GentiumPlusCompact-I.ttf
#R> 192                         GentiumPlusCompact-R.ttf
#R> 193                                       ipaexg.ttf
#R> 194                                       ipaexm.ttf
#R> 195                                         ipag.ttf
#R> 196                                        ipagp.ttf
#R> 197                                         ipam.ttf
#R> 198                                        ipamp.ttf
#R> 199                                LinBiolinum_K.otf
#R> 200                                LinBiolinum_R.otf
#R> 201                               LinBiolinum_RB.otf
#R> 202                               LinBiolinum_RI.otf
#R> 203                              LinLibertine_DR.otf
#R> 204                               LinLibertine_I.otf
#R> 205                               LinLibertine_M.otf
#R> 206                               LinLibertine_R.otf
#R> 207                              LinLibertine_RB.otf
#R> 208                             LinLibertine_RBI.otf
#R> 209                              LinLibertine_RI.otf
#R> 210                              LinLibertine_RZ.otf
#R> 211                             LinLibertine_RZI.otf
#R> 212                                      lobster.otf
#R> 213                              LobsterTwo-Bold.otf
#R> 214                        LobsterTwo-BoldItalic.otf
#R> 215                            LobsterTwo-Italic.otf
#R> 216                           LobsterTwo-Regular.otf
#R> 217                                    STIX-Bold.otf
#R> 218                              STIX-BoldItalic.otf
#R> 219                                  STIX-Italic.otf
#R> 220                                 STIX-Regular.otf
#R> 221                             STIXMath-Regular.otf
#R> 222                             STIXGeneral-Bold.otf
#R> 223                       STIXGeneral-BoldItalic.otf
#R> 224                           STIXGeneral-Italic.otf
#R> 225                          STIXGeneral-Regular.otf
#R> 226                          STIXIntegralsD-Bold.otf
#R> 227                       STIXIntegralsD-Regular.otf
#R> 228                         STIXIntegralsSm-Bold.otf
#R> 229                      STIXIntegralsSm-Regular.otf
#R> 230                         STIXIntegralsUp-Bold.otf
#R> 231                      STIXIntegralsUp-Regular.otf
#R> 232                        STIXIntegralsUpD-Bold.otf
#R> 233                     STIXIntegralsUpD-Regular.otf
#R> 234                       STIXIntegralsUpSm-Bold.otf
#R> 235                    STIXIntegralsUpSm-Regular.otf
#R> 236                          STIXNonUnicode-Bold.otf
#R> 237                    STIXNonUnicode-BoldItalic.otf
#R> 238                        STIXNonUnicode-Italic.otf
#R> 239                       STIXNonUnicode-Regular.otf
#R> 240                      STIXSizeFiveSym-Regular.otf
#R> 241                         STIXSizeFourSym-Bold.otf
#R> 242                      STIXSizeFourSym-Regular.otf
#R> 243                          STIXSizeOneSym-Bold.otf
#R> 244                       STIXSizeOneSym-Regular.otf
#R> 245                        STIXSizeThreeSym-Bold.otf
#R> 246                     STIXSizeThreeSym-Regular.otf
#R> 247                          STIXSizeTwoSym-Bold.otf
#R> 248                       STIXSizeTwoSym-Regular.otf
#R> 249                            STIXVariants-Bold.otf
#R> 250                         STIXVariants-Regular.otf
#R> 251                                  Garuda-Bold.otf
#R> 252                           Garuda-BoldOblique.otf
#R> 253                               Garuda-Oblique.otf
#R> 254                                       Garuda.otf
#R> 255                                 Kinnari-Bold.otf
#R> 256                           Kinnari-BoldItalic.otf
#R> 257                          Kinnari-BoldOblique.otf
#R> 258                               Kinnari-Italic.otf
#R> 259                              Kinnari-Oblique.otf
#R> 260                                      Kinnari.otf
#R> 261                                Laksaman-Bold.otf
#R> 262                          Laksaman-BoldItalic.otf
#R> 263                              Laksaman-Italic.otf
#R> 264                                     Laksaman.otf
#R> 265                                    Loma-Bold.otf
#R> 266                             Loma-BoldOblique.otf
#R> 267                                 Loma-Oblique.otf
#R> 268                                         Loma.otf
#R> 269                                  Norasi-Bold.otf
#R> 270                            Norasi-BoldItalic.otf
#R> 271                           Norasi-BoldOblique.otf
#R> 272                                Norasi-Italic.otf
#R> 273                               Norasi-Oblique.otf
#R> 274                                       Norasi.otf
#R> 275                                  Purisa-Bold.otf
#R> 276                           Purisa-BoldOblique.otf
#R> 277                               Purisa-Oblique.otf
#R> 278                                       Purisa.otf
#R> 279                                Sawasdee-Bold.otf
#R> 280                         Sawasdee-BoldOblique.otf
#R> 281                             Sawasdee-Oblique.otf
#R> 282                                     Sawasdee.otf
#R> 283                                TlwgMono-Bold.otf
#R> 284                         TlwgMono-BoldOblique.otf
#R> 285                             TlwgMono-Oblique.otf
#R> 286                                     TlwgMono.otf
#R> 287                          TlwgTypewriter-Bold.otf
#R> 288                   TlwgTypewriter-BoldOblique.otf
#R> 289                       TlwgTypewriter-Oblique.otf
#R> 290                               TlwgTypewriter.otf
#R> 291                              TlwgTypist-Bold.otf
#R> 292                       TlwgTypist-BoldOblique.otf
#R> 293                           TlwgTypist-Oblique.otf
#R> 294                                   TlwgTypist.otf
#R> 295                                TlwgTypo-Bold.otf
#R> 296                         TlwgTypo-BoldOblique.otf
#R> 297                             TlwgTypo-Oblique.otf
#R> 298                                     TlwgTypo.otf
#R> 299                                  Umpush-Bold.otf
#R> 300                           Umpush-BoldOblique.otf
#R> 301                                 Umpush-Light.otf
#R> 302                          Umpush-LightOblique.otf
#R> 303                               Umpush-Oblique.otf
#R> 304                                       Umpush.otf
#R> 305                                   Waree-Bold.otf
#R> 306                            Waree-BoldOblique.otf
#R> 307                                Waree-Oblique.otf
#R> 308                                        Waree.otf
#R> 309                         AccanthisADFStd-Bold.otf
#R> 310                   AccanthisADFStd-BoldItalic.otf
#R> 311                       AccanthisADFStd-Italic.otf
#R> 312                      AccanthisADFStd-Regular.otf
#R> 313                      AccanthisADFStdNo2-Bold.otf
#R> 314                AccanthisADFStdNo2-BoldItalic.otf
#R> 315                    AccanthisADFStdNo2-Italic.otf
#R> 316                   AccanthisADFStdNo2-Regular.otf
#R> 317                      AccanthisADFStdNo3-Bold.otf
#R> 318                AccanthisADFStdNo3-BoldItalic.otf
#R> 319                    AccanthisADFStdNo3-Italic.otf
#R> 320                   AccanthisADFStdNo3-Regular.otf
#R> 321                           BerenisADFPro-Bold.otf
#R> 322                     BerenisADFPro-BoldItalic.otf
#R> 323                         BerenisADFPro-Italic.otf
#R> 324                        BerenisADFPro-Regular.otf
#R> 325                         BerenisADFProSC-Bold.otf
#R> 326                   BerenisADFProSC-BoldItalic.otf
#R> 327                       BerenisADFProSC-Italic.otf
#R> 328                      BerenisADFProSC-Regular.otf
#R> 329                              GilliusADF-Bold.otf
#R> 330                          GilliusADF-BoldCond.otf
#R> 331                    GilliusADF-BoldCondItalic.otf
#R> 332                        GilliusADF-BoldItalic.otf
#R> 333                              GilliusADF-Cond.otf
#R> 334                        GilliusADF-CondItalic.otf
#R> 335                            GilliusADF-Italic.otf
#R> 336                           GilliusADF-Regular.otf
#R> 337                           GilliusADFNo2-Bold.otf
#R> 338                       GilliusADFNo2-BoldCond.otf
#R> 339                 GilliusADFNo2-BoldCondItalic.otf
#R> 340                     GilliusADFNo2-BoldItalic.otf
#R> 341                           GilliusADFNo2-Cond.otf
#R> 342                     GilliusADFNo2-CondItalic.otf
#R> 343                         GilliusADFNo2-Italic.otf
#R> 344                        GilliusADFNo2-Regular.otf
#R> 345                       UniversalisADFStd-Bold.otf
#R> 346                   UniversalisADFStd-BoldCond.otf
#R> 347                UniversalisADFStd-BoldCondObl.otf
#R> 348                UniversalisADFStd-BoldOblique.otf
#R> 349                       UniversalisADFStd-Cond.otf
#R> 350                UniversalisADFStd-CondOblique.otf
#R> 351                    UniversalisADFStd-Oblique.otf
#R> 352                    UniversalisADFStd-Regular.otf
#R> 353                                     bkai00mp.ttf
#R> 354                                     bsmi00lp.ttf
#R> 355                                     gbsn00lp.ttf
#R> 356                                     gkai00mp.ttf
#R> 357                                 GFSArtemisia.otf
#R> 358                             GFSArtemisiaBold.otf
#R> 359                           GFSArtemisiaBoldIt.otf
#R> 360                               GFSArtemisiaIt.otf
#R> 361                                   Asana-Math.otf
#R> 362                                       batang.ttf
#R> 363                                        dotum.ttf
#R> 364                                        gulim.ttf
#R> 365                                        hline.ttf
#R> 366                               GFSBaskerville.otf
#R> 367                             GFSBodoniClassic.otf
#R> 368                               Comfortaa-Bold.ttf
#R> 369                              Comfortaa-Light.ttf
#R> 370                            Comfortaa-Regular.ttf
#R> 371                                  GFSPolyglot.otf
#R> 372                                   Arimo-Bold.ttf
#R> 373                             Arimo-BoldItalic.ttf
#R> 374                                 Arimo-Italic.ttf
#R> 375                                Arimo-Regular.ttf
#R> 376                                 Cousine-Bold.ttf
#R> 377                           Cousine-BoldItalic.ttf
#R> 378                               Cousine-Italic.ttf
#R> 379                              Cousine-Regular.ttf
#R> 380                                   Tinos-Bold.ttf
#R> 381                             Tinos-BoldItalic.ttf
#R> 382                                 Tinos-Italic.ttf
#R> 383                                Tinos-Regular.ttf
#R> 384                                 Caladea-Bold.ttf
#R> 385                           Caladea-BoldItalic.ttf
#R> 386                               Caladea-Italic.ttf
#R> 387                              Caladea-Regular.ttf
#R> 388                                 Carlito-Bold.ttf
#R> 389                           Carlito-BoldItalic.ttf
#R> 390                               Carlito-Italic.ttf
#R> 391                              Carlito-Regular.ttf
#R> 392                            DejaVuMathTeXGyre.ttf
#R> 393                              DejaVuSans-Bold.ttf
#R> 394                       DejaVuSans-BoldOblique.ttf
#R> 395                        DejaVuSans-ExtraLight.ttf
#R> 396                           DejaVuSans-Oblique.ttf
#R> 397                                   DejaVuSans.ttf
#R> 398                     DejaVuSansCondensed-Bold.ttf
#R> 399              DejaVuSansCondensed-BoldOblique.ttf
#R> 400                  DejaVuSansCondensed-Oblique.ttf
#R> 401                          DejaVuSansCondensed.ttf
#R> 402                          DejaVuSansMono-Bold.ttf
#R> 403                   DejaVuSansMono-BoldOblique.ttf
#R> 404                       DejaVuSansMono-Oblique.ttf
#R> 405                               DejaVuSansMono.ttf
#R> 406                             DejaVuSerif-Bold.ttf
#R> 407                       DejaVuSerif-BoldItalic.ttf
#R> 408                           DejaVuSerif-Italic.ttf
#R> 409                                  DejaVuSerif.ttf
#R> 410                    DejaVuSerifCondensed-Bold.ttf
#R> 411              DejaVuSerifCondensed-BoldItalic.ttf
#R> 412                  DejaVuSerifCondensed-Italic.ttf
#R> 413                         DejaVuSerifCondensed.ttf
#R> 414                              GFSDidotClassic.otf
#R> 415                                     GFSDidot.otf
#R> 416                                 GFSDidotBold.otf
#R> 417                           GFSDidotBoldItalic.otf
#R> 418                               GFSDidotItalic.otf
#R> 419                        DroidSansFallbackFull.ttf
#R> 420                          EBGaramond-Initials.ttf
#R> 421                        EBGaramond-InitialsF1.ttf
#R> 422                        EBGaramond-InitialsF2.ttf
#R> 423                          EBGaramond08-Italic.ttf
#R> 424                         EBGaramond08-Regular.ttf
#R> 425                           EBGaramond12-AllSC.ttf
#R> 426                          EBGaramond12-Italic.ttf
#R> 427                         EBGaramond12-Regular.ttf
#R> 428                       EBGaramondSC08-Regular.ttf
#R> 429                       EBGaramondSC12-Regular.ttf
#R> 430                          fontawesome-webfont.ttf
#R> 431                        fonts-japanese-gothic.ttf
#R> 432                        fonts-japanese-mincho.ttf
#R> 433                                     FreeMono.ttf
#R> 434                                 FreeMonoBold.ttf
#R> 435                          FreeMonoBoldOblique.ttf
#R> 436                              FreeMonoOblique.ttf
#R> 437                                     FreeSans.ttf
#R> 438                                 FreeSansBold.ttf
#R> 439                          FreeSansBoldOblique.ttf
#R> 440                              FreeSansOblique.ttf
#R> 441                                    FreeSerif.ttf
#R> 442                                FreeSerifBold.ttf
#R> 443                          FreeSerifBoldItalic.ttf
#R> 444                              FreeSerifItalic.ttf
#R> 445                                     GFSGazis.otf
#R> 446                                      GenBasB.ttf
#R> 447                                     GenBasBI.ttf
#R> 448                                      GenBasI.ttf
#R> 449                                      GenBasR.ttf
#R> 450                                    GenBkBasB.ttf
#R> 451                                   GenBkBasBI.ttf
#R> 452                                    GenBkBasI.ttf
#R> 453                                    GenBkBasR.ttf
#R> 454                                    Gentium-I.ttf
#R> 455                                    Gentium-R.ttf
#R> 456                                 GentiumAlt-I.ttf
#R> 457                                 GentiumAlt-R.ttf
#R> 458                                GentiumPlus-I.ttf
#R> 459                                GentiumPlus-R.ttf
#R> 460                 glyphicons-halflings-regular.ttf
#R> 461                                  Inconsolata.otf
#R> 462                                Junicode-Bold.ttf
#R> 463                          Junicode-BoldItalic.ttf
#R> 464                              Junicode-Italic.ttf
#R> 465                                     Junicode.ttf
#R> 466                                   Lato-Black.ttf
#R> 467                             Lato-BlackItalic.ttf
#R> 468                                    Lato-Bold.ttf
#R> 469                              Lato-BoldItalic.ttf
#R> 470                                Lato-Hairline.ttf
#R> 471                          Lato-HairlineItalic.ttf
#R> 472                                   Lato-Heavy.ttf
#R> 473                             Lato-HeavyItalic.ttf
#R> 474                                  Lato-Italic.ttf
#R> 475                                   Lato-Light.ttf
#R> 476                             Lato-LightItalic.ttf
#R> 477                                  Lato-Medium.ttf
#R> 478                            Lato-MediumItalic.ttf
#R> 479                                 Lato-Regular.ttf
#R> 480                                Lato-Semibold.ttf
#R> 481                          Lato-SemiboldItalic.ttf
#R> 482                                    Lato-Thin.ttf
#R> 483                              Lato-ThinItalic.ttf
#R> 484                          LiberationMono-Bold.ttf
#R> 485                    LiberationMono-BoldItalic.ttf
#R> 486                        LiberationMono-Italic.ttf
#R> 487                       LiberationMono-Regular.ttf
#R> 488                          LiberationSans-Bold.ttf
#R> 489                    LiberationSans-BoldItalic.ttf
#R> 490                        LiberationSans-Italic.ttf
#R> 491                       LiberationSans-Regular.ttf
#R> 492                    LiberationSansNarrow-Bold.ttf
#R> 493              LiberationSansNarrow-BoldItalic.ttf
#R> 494                  LiberationSansNarrow-Italic.ttf
#R> 495                 LiberationSansNarrow-Regular.ttf
#R> 496                         LiberationSerif-Bold.ttf
#R> 497                   LiberationSerif-BoldItalic.ttf
#R> 498                       LiberationSerif-Italic.ttf
#R> 499                      LiberationSerif-Regular.ttf
#R> 500                          LiberationMono-Bold.ttf
#R>                                    family             face
#R> 1                                IBM 3270           Medium
#R> 2                         IBM 3270 Narrow           Medium
#R> 3                    IBM 3270 Semi-Narrow           Medium
#R> 4                             academicons          Regular
#R> 5                           Alfa Slab One          Regular
#R> 6                     Anonymice Powerline      Bold Italic
#R> 7                     Anonymice Powerline             Bold
#R> 8                     Anonymice Powerline           Italic
#R> 9                     Anonymice Powerline          Regular
#R> 10                          Archivo Black          Regular
#R> 11                    Arimo for Powerline             Bold
#R> 12                    Arimo for Powerline      Bold Italic
#R> 13                    Arimo for Powerline          Regular
#R> 14                    Arimo for Powerline           Italic
#R> 15                  Cousine for Powerline             Bold
#R> 16                  Cousine for Powerline      Bold Italic
#R> 17                  Cousine for Powerline          Regular
#R> 18                  Cousine for Powerline           Italic
#R> 19                 D2Coding for Powerline BoldForPowerline
#R> 20                 D2Coding for Powerline          Regular
#R> 21         DejaVu Sans Mono for Powerline             Bold
#R> 22         DejaVu Sans Mono for Powerline     Bold Oblique
#R> 23         DejaVu Sans Mono for Powerline             Book
#R> 24         DejaVu Sans Mono for Powerline          Oblique
#R> 25   Droid Sans Mono Dotted for Powerline          Regular
#R> 26          Droid Sans Mono for Powerline          Regular
#R> 27  Droid Sans Mono Slashed for Powerline          Regular
#R> 28                Fira Mono for Powerline             Bold
#R> 29                Fira Mono for Powerline           Medium
#R> 30                Fira Mono for Powerline          Regular
#R> 31                  Go Mono for Powerline             Bold
#R> 32                  Go Mono for Powerline      Bold Italic
#R> 33                  Go Mono for Powerline          Regular
#R> 34                  Go Mono for Powerline           Italic
#R> 35                                   Hack             Bold
#R> 36                                   Hack      Bold Italic
#R> 37                                   Hack           Italic
#R> 38                                   Hack          Regular
#R> 39                              Helvetica          Regular
#R> 40              Inconsolata for Powerline BoldForPowerline
#R> 41              Inconsolata for Powerline           Medium
#R> 42           Inconsolata-dz for Powerline               dz
#R> 43            Inconsolata-g for Powerline                g
#R> 44                               Ionicons           Medium
#R> 45                      Libre Baskerville             Bold
#R> 46                      Libre Baskerville           Italic
#R> 47                      Libre Baskerville          Regular
#R> 48              Literation Mono Powerline      Bold Italic
#R> 49              Literation Mono Powerline             Bold
#R> 50              Literation Mono Powerline           Italic
#R> 51              Literation Mono Powerline          Regular
#R> 52               Meslo LG L for Powerline             Bold
#R> 53               Meslo LG L for Powerline      Bold Italic
#R> 54            Meslo LG L DZ for Powerline             Bold
#R> 55            Meslo LG L DZ for Powerline      Bold Italic
#R> 56            Meslo LG L DZ for Powerline           Italic
#R> 57            Meslo LG L DZ for Powerline          Regular
#R> 58               Meslo LG L for Powerline           Italic
#R> 59               Meslo LG L for Powerline          Regular
#R> 60               Meslo LG M for Powerline             Bold
#R> 61               Meslo LG M for Powerline      Bold Italic
#R> 62            Meslo LG M DZ for Powerline             Bold
#R> 63            Meslo LG M DZ for Powerline      Bold Italic
#R> 64            Meslo LG M DZ for Powerline           Italic
#R> 65            Meslo LG M DZ for Powerline          Regular
#R> 66               Meslo LG M for Powerline           Italic
#R> 67               Meslo LG M for Powerline          Regular
#R> 68               Meslo LG S for Powerline             Bold
#R> 69               Meslo LG S for Powerline      Bold Italic
#R> 70            Meslo LG S DZ for Powerline             Bold
#R> 71            Meslo LG S DZ for Powerline      Bold Italic
#R> 72            Meslo LG S DZ for Powerline           Italic
#R> 73            Meslo LG S DZ for Powerline          Regular
#R> 74               Meslo LG S for Powerline           Italic
#R> 75               Meslo LG S for Powerline          Regular
#R> 76                  monofur for Powerline             bold
#R> 77                  monofur for Powerline          Regular
#R> 78                  monofur for Powerline           italic
#R> 79                                  Mukta             Bold
#R> 80                        Mukta ExtraBold          Regular
#R> 81                       Mukta ExtraLight          Regular
#R> 82                            Mukta Light          Regular
#R> 83                           Mukta Medium          Regular
#R> 84                                  Mukta          Regular
#R> 85                         Mukta SemiBold          Regular
#R> 86                Noto Mono for Powerline          Regular
#R> 87                 NovaMono for Powerline          Regular
#R> 88             Periodic Table of Elements          Regular
#R> 89                  ProFont for Powerline             Bold
#R> 90                  ProFont for Powerline          Regular
#R> 91              Roboto Mono for Powerline             Bold
#R> 92              Roboto Mono for Powerline      Bold Italic
#R> 93              Roboto Mono for Powerline          Regular
#R> 94              Roboto Mono for Powerline           Italic
#R> 95        Roboto Mono Light for Powerline          Regular
#R> 96        Roboto Mono Light for Powerline           Italic
#R> 97       Roboto Mono Medium for Powerline          Regular
#R> 98       Roboto Mono Medium for Powerline           Italic
#R> 99         Roboto Mono Thin for Powerline          Regular
#R> 100        Roboto Mono Thin for Powerline           Italic
#R> 101                 Source Code Pro Black          Regular
#R> 102         Source Code Pro for Powerline             Bold
#R> 103            Source Code Pro ExtraLight          Regular
#R> 104         Source Code Pro for Powerline          Regular
#R> 105                 Source Code Pro Light          Regular
#R> 106                Source Code Pro Medium          Regular
#R> 107                 Source Code Pro Black           Italic
#R> 108         Source Code Pro for Powerline      Bold Italic
#R> 109            Source Code Pro ExtraLight           Italic
#R> 110         Source Code Pro for Powerline           Italic
#R> 111                 Source Code Pro Light           Italic
#R> 112                Source Code Pro Medium           Italic
#R> 113              Source Code Pro Semibold           Italic
#R> 114              Source Code Pro Semibold          Regular
#R> 115              Space Mono for Powerline             Bold
#R> 116              Space Mono for Powerline      Bold Italic
#R> 117              Space Mono for Powerline          Regular
#R> 118              Space Mono for Powerline           Italic
#R> 119                            Space Mono             Bold
#R> 120                            Space Mono      Bold Italic
#R> 121                            Space Mono           Italic
#R> 122                            Space Mono          Regular
#R> 123              Symbol Neu for Powerline          Regular
#R> 124                   Tinos for Powerline             Bold
#R> 125                   Tinos for Powerline      Bold Italic
#R> 126                   Tinos for Powerline          Regular
#R> 127                   Tinos for Powerline           Italic
#R> 128                              Triforce         Triforce
#R> 129      Ubuntu Mono derivative Powerline      Bold Italic
#R> 130      Ubuntu Mono derivative Powerline             Bold
#R> 131      Ubuntu Mono derivative Powerline           Italic
#R> 132      Ubuntu Mono derivative Powerline          Regular
#R> 133                              Triforce         Triforce
#R> 134                                    Go      Bold Italic
#R> 135                                    Go             Bold
#R> 136                                    Go           Italic
#R> 137                             Go Medium           Italic
#R> 138                             Go Medium          Regular
#R> 139                               Go Mono      Bold Italic
#R> 140                               Go Mono             Bold
#R> 141                               Go Mono           Italic
#R> 142                               Go Mono          Regular
#R> 143                                    Go          Regular
#R> 144                                 Cabin             Bold
#R> 145                                 Cabin      Bold Italic
#R> 146                                 Cabin           Italic
#R> 147                                 Cabin           Medium
#R> 148                                 Cabin    Medium Italic
#R> 149                                 Cabin          Regular
#R> 150                                 Cabin         SemiBold
#R> 151                                 Cabin  SemiBold Italic
#R> 152                             Cantarell             Bold
#R> 153                  Cantarell Extra Bold          Regular
#R> 154                       Cantarell Light          Regular
#R> 155                             Cantarell          Regular
#R> 156                        Cantarell Thin          Regular
#R> 157                  EB Garamond Initials          Regular
#R> 158            EB Garamond Initials Fill1          Regular
#R> 159            EB Garamond Initials Fill2          Regular
#R> 160                        EB Garamond 08           Italic
#R> 161                        EB Garamond 08          Regular
#R> 162                 EB Garamond 12 All SC            AllSC
#R> 163                        EB Garamond 12           Italic
#R> 164                        EB Garamond 12          Regular
#R> 165                     EB Garamond SC 08          Regular
#R> 166                     EB Garamond SC 12          Regular
#R> 167                             Fira Code             Bold
#R> 168                       Fira Code Light          Regular
#R> 169                      Fira Code Medium          Regular
#R> 170                             Fira Code          Regular
#R> 171                      Fira Code Retina          Regular
#R> 172                           FontAwesome          Regular
#R> 173                                 Amiri             Bold
#R> 174                                 Amiri     Bold Slanted
#R> 175                                 Amiri          Regular
#R> 176                                 Amiri          Slanted
#R> 177                           Amiri Quran          Regular
#R> 178                   Amiri Quran Colored          Regular
#R> 179                              FreeMono          Regular
#R> 180                              FreeMono             Bold
#R> 181                              FreeMono     Bold Oblique
#R> 182                              FreeMono          Oblique
#R> 183                              FreeSans          Regular
#R> 184                              FreeSans             Bold
#R> 185                              FreeSans     Bold Oblique
#R> 186                              FreeSans          Oblique
#R> 187                             FreeSerif          Regular
#R> 188                             FreeSerif             Bold
#R> 189                             FreeSerif      Bold Italic
#R> 190                             FreeSerif           Italic
#R> 191                  Gentium Plus Compact           Italic
#R> 192                  Gentium Plus Compact          Regular
#R> 193                           IPAexGothic          Regular
#R> 194                           IPAexMincho          Regular
#R> 195                             IPAGothic          Regular
#R> 196                            IPAPGothic          Regular
#R> 197                             IPAMincho          Regular
#R> 198                            IPAPMincho          Regular
#R> 199             Linux Biolinum Keyboard O          Regular
#R> 200                      Linux Biolinum O          Regular
#R> 201                      Linux Biolinum O             Bold
#R> 202                      Linux Biolinum O           Italic
#R> 203             Linux Libertine Display O          Regular
#R> 204            Linux Libertine Initials O         Initials
#R> 205                Linux Libertine Mono O             Mono
#R> 206                     Linux Libertine O          Regular
#R> 207                     Linux Libertine O             Bold
#R> 208                     Linux Libertine O      Bold Italic
#R> 209                     Linux Libertine O           Italic
#R> 210                     Linux Libertine O         Semibold
#R> 211                     Linux Libertine O  Semibold Italic
#R> 212                           Lobster Two      Bold Italic
#R> 213                           Lobster Two             Bold
#R> 214                           Lobster Two      Bold Italic
#R> 215                           Lobster Two           Italic
#R> 216                           Lobster Two          Regular
#R> 217                                  STIX             Bold
#R> 218                                  STIX      Bold Italic
#R> 219                                  STIX           Italic
#R> 220                                  STIX          Regular
#R> 221                             STIX Math          Regular
#R> 222                           STIXGeneral             Bold
#R> 223                           STIXGeneral      Bold Italic
#R> 224                           STIXGeneral           Italic
#R> 225                           STIXGeneral          Regular
#R> 226                        STIXIntegralsD             Bold
#R> 227                        STIXIntegralsD          Regular
#R> 228                       STIXIntegralsSm             Bold
#R> 229                       STIXIntegralsSm          Regular
#R> 230                       STIXIntegralsUp             Bold
#R> 231                       STIXIntegralsUp          Regular
#R> 232                      STIXIntegralsUpD             Bold
#R> 233                      STIXIntegralsUpD          Regular
#R> 234                     STIXIntegralsUpSm             Bold
#R> 235                     STIXIntegralsUpSm          Regular
#R> 236                        STIXNonUnicode             Bold
#R> 237                        STIXNonUnicode      Bold Italic
#R> 238                        STIXNonUnicode           Italic
#R> 239                        STIXNonUnicode          Regular
#R> 240                       STIXSizeFiveSym          Regular
#R> 241                       STIXSizeFourSym             Bold
#R> 242                       STIXSizeFourSym          Regular
#R> 243                        STIXSizeOneSym             Bold
#R> 244                        STIXSizeOneSym          Regular
#R> 245                      STIXSizeThreeSym             Bold
#R> 246                      STIXSizeThreeSym          Regular
#R> 247                        STIXSizeTwoSym             Bold
#R> 248                        STIXSizeTwoSym          Regular
#R> 249                          STIXVariants             Bold
#R> 250                          STIXVariants          Regular
#R> 251                                Garuda             Bold
#R> 252                                Garuda      BoldOblique
#R> 253                                Garuda          Oblique
#R> 254                                Garuda          Regular
#R> 255                               Kinnari             Bold
#R> 256                               Kinnari       BoldItalic
#R> 257                               Kinnari      BoldOblique
#R> 258                               Kinnari           Italic
#R> 259                               Kinnari          Oblique
#R> 260                               Kinnari          Regular
#R> 261                              Laksaman             Bold
#R> 262                              Laksaman      Bold Italic
#R> 263                              Laksaman           Italic
#R> 264                              Laksaman          Regular
#R> 265                                  Loma             Bold
#R> 266                                  Loma      BoldOblique
#R> 267                                  Loma          Oblique
#R> 268                                  Loma          Regular
#R> 269                                Norasi             Bold
#R> 270                                Norasi       BoldItalic
#R> 271                                Norasi      BoldOblique
#R> 272                                Norasi           Italic
#R> 273                                Norasi          Oblique
#R> 274                                Norasi          Regular
#R> 275                                Purisa             Bold
#R> 276                                Purisa      BoldOblique
#R> 277                                Purisa          Oblique
#R> 278                                Purisa          Regular
#R> 279                              Sawasdee             Bold
#R> 280                              Sawasdee      BoldOblique
#R> 281                              Sawasdee          Oblique
#R> 282                              Sawasdee          Regular
#R> 283                              TlwgMono             Bold
#R> 284                              TlwgMono      BoldOblique
#R> 285                              TlwgMono          Oblique
#R> 286                              TlwgMono          Regular
#R> 287                        TlwgTypewriter             Bold
#R> 288                        TlwgTypewriter      BoldOblique
#R> 289                        TlwgTypewriter          Oblique
#R> 290                        TlwgTypewriter          Regular
#R> 291                           Tlwg Typist             Bold
#R> 292                           Tlwg Typist      BoldOblique
#R> 293                           Tlwg Typist          Oblique
#R> 294                           Tlwg Typist          Regular
#R> 295                             Tlwg Typo             Bold
#R> 296                             Tlwg Typo      BoldOblique
#R> 297                             Tlwg Typo          Oblique
#R> 298                             Tlwg Typo          Regular
#R> 299                                Umpush             Bold
#R> 300                                Umpush      BoldOblique
#R> 301                                Umpush            Light
#R> 302                                Umpush     LightOblique
#R> 303                                Umpush          Oblique
#R> 304                                Umpush          Regular
#R> 305                                 Waree             Bold
#R> 306                                 Waree      BoldOblique
#R> 307                                 Waree          Oblique
#R> 308                                 Waree          Regular
#R> 309                     Accanthis ADF Std             Bold
#R> 310                     Accanthis ADF Std      Bold Italic
#R> 311                     Accanthis ADF Std           Italic
#R> 312                     Accanthis ADF Std          Regular
#R> 313                 Accanthis ADF Std No2             Bold
#R> 314                 Accanthis ADF Std No2      Bold Italic
#R> 315                 Accanthis ADF Std No2           Italic
#R> 316                 Accanthis ADF Std No2          Regular
#R> 317                 Accanthis ADF Std No3             Bold
#R> 318                 Accanthis ADF Std No3      Bold Italic
#R> 319                 Accanthis ADF Std No3           Italic
#R> 320                 Accanthis ADF Std No3          Regular
#R> 321                       Berenis ADF Pro             Bold
#R> 322                       Berenis ADF Pro      Bold Italic
#R> 323                       Berenis ADF Pro           Italic
#R> 324                       Berenis ADF Pro          Regular
#R> 325                    Berenis ADF Pro SC             Bold
#R> 326                    Berenis ADF Pro SC      Bold Italic
#R> 327                    Berenis ADF Pro SC           Italic
#R> 328                    Berenis ADF Pro SC          Regular
#R> 329                           Gillius ADF             Bold
#R> 330                      Gillius ADF Cond             Bold
#R> 331                      Gillius ADF Cond      Bold Italic
#R> 332                           Gillius ADF      Bold Italic
#R> 333                      Gillius ADF Cond          Regular
#R> 334                      Gillius ADF Cond           Italic
#R> 335                           Gillius ADF           Italic
#R> 336                           Gillius ADF          Regular
#R> 337                       Gillius ADF No2             Bold
#R> 338                  Gillius ADF No2 Cond             Bold
#R> 339                  Gillius ADF No2 Cond      Bold Italic
#R> 340                       Gillius ADF No2      Bold Italic
#R> 341                  Gillius ADF No2 Cond          Regular
#R> 342                  Gillius ADF No2 Cond           Italic
#R> 343                       Gillius ADF No2           Italic
#R> 344                       Gillius ADF No2          Regular
#R> 345                   Universalis ADF Std             Bold
#R> 346              Universalis ADF Std cond             Bold
#R> 347              Universalis ADF Std Cond      Bold Italic
#R> 348                   Universalis ADF Std      Bold Italic
#R> 349              Universalis ADF Std Cond          Regular
#R> 350              Universalis ADF Std Cond           Italic
#R> 351                   Universalis ADF Std           Italic
#R> 352                   Universalis ADF Std          Regular
#R> 353                     AR PL KaitiM Big5          Regular
#R> 354                   AR PL Mingti2L Big5          Regular
#R> 355                      AR PL SungtiL GB          Regular
#R> 356                       AR PL KaitiM GB          Regular
#R> 357                         GFS Artemisia          Regular
#R> 358                         GFS Artemisia             Bold
#R> 359                         GFS Artemisia      Bold Italic
#R> 360                         GFS Artemisia           Italic
#R> 361                            Asana Math          Regular
#R> 362                        Baekmuk Batang          Regular
#R> 363                         Baekmuk Dotum          Regular
#R> 364                         Baekmuk Gulim          Regular
#R> 365                      Baekmuk Headline          Regular
#R> 366                       GFS Baskerville          Regular
#R> 367                     GFS BodoniClassic          Regular
#R> 368                             Comfortaa             Bold
#R> 369                       Comfortaa Light          Regular
#R> 370                             Comfortaa          Regular
#R> 371                         GFS Complutum          Regular
#R> 372                                 Arimo             Bold
#R> 373                                 Arimo      Bold Italic
#R> 374                                 Arimo           Italic
#R> 375                                 Arimo          Regular
#R> 376                               Cousine             Bold
#R> 377                               Cousine      Bold Italic
#R> 378                               Cousine           Italic
#R> 379                               Cousine          Regular
#R> 380                                 Tinos             Bold
#R> 381                                 Tinos      Bold Italic
#R> 382                                 Tinos           Italic
#R> 383                                 Tinos          Regular
#R> 384                               Caladea             Bold
#R> 385                               Caladea           Italic
#R> 386                               Caladea           Italic
#R> 387                               Caladea          Regular
#R> 388                               Carlito             Bold
#R> 389                               Carlito      Bold Italic
#R> 390                               Carlito           Italic
#R> 391                               Carlito          Regular
#R> 392                  DejaVu Math TeX Gyre          Regular
#R> 393                           DejaVu Sans             Bold
#R> 394                           DejaVu Sans     Bold Oblique
#R> 395                     DejaVu Sans Light       ExtraLight
#R> 396                           DejaVu Sans          Oblique
#R> 397                           DejaVu Sans             Book
#R> 398                 DejaVu Sans Condensed             Bold
#R> 399                 DejaVu Sans Condensed     Bold Oblique
#R> 400                 DejaVu Sans Condensed          Oblique
#R> 401                 DejaVu Sans Condensed             Book
#R> 402                      DejaVu Sans Mono             Bold
#R> 403                      DejaVu Sans Mono     Bold Oblique
#R> 404                      DejaVu Sans Mono          Oblique
#R> 405                      DejaVu Sans Mono             Book
#R> 406                          DejaVu Serif             Bold
#R> 407                          DejaVu Serif      Bold Italic
#R> 408                          DejaVu Serif           Italic
#R> 409                          DejaVu Serif             Book
#R> 410                DejaVu Serif Condensed             Bold
#R> 411                DejaVu Serif Condensed      Bold Italic
#R> 412                DejaVu Serif Condensed           Italic
#R> 413                DejaVu Serif Condensed             Book
#R> 414                     GFS Didot Classic          Regular
#R> 415                             GFS Didot          Regular
#R> 416                          GFS Didot Rg             Bold
#R> 417                             GFS Didot      Bold Italic
#R> 418                             GFS Didot           Italic
#R> 419                   Droid Sans Fallback          Regular
#R> 420                  EB Garamond Initials          Regular
#R> 421            EB Garamond Initials Fill1          Regular
#R> 422            EB Garamond Initials Fill2          Regular
#R> 423                        EB Garamond 08           Italic
#R> 424                        EB Garamond 08          Regular
#R> 425                 EB Garamond 12 All SC            AllSC
#R> 426                        EB Garamond 12           Italic
#R> 427                        EB Garamond 12          Regular
#R> 428                     EB Garamond SC 08          Regular
#R> 429                     EB Garamond SC 12          Regular
#R> 430                           FontAwesome          Regular
#R> 431                           IPAexGothic          Regular
#R> 432                           IPAexMincho          Regular
#R> 433                              FreeMono          Regular
#R> 434                              FreeMono             Bold
#R> 435                              FreeMono     Bold Oblique
#R> 436                              FreeMono          Oblique
#R> 437                              FreeSans          Regular
#R> 438                              FreeSans             Bold
#R> 439                              FreeSans     Bold Oblique
#R> 440                              FreeSans          Oblique
#R> 441                             FreeSerif          Regular
#R> 442                             FreeSerif             Bold
#R> 443                             FreeSerif      Bold Italic
#R> 444                             FreeSerif           Italic
#R> 445                             GFS Gazis          Regular
#R> 446                         Gentium Basic             Bold
#R> 447                         Gentium Basic      Bold Italic
#R> 448                         Gentium Basic           Italic
#R> 449                         Gentium Basic          Regular
#R> 450                    Gentium Book Basic             Bold
#R> 451                    Gentium Book Basic      Bold Italic
#R> 452                    Gentium Book Basic           Italic
#R> 453                    Gentium Book Basic          Regular
#R> 454                               Gentium           Italic
#R> 455                               Gentium          Regular
#R> 456                            GentiumAlt           Italic
#R> 457                            GentiumAlt          Regular
#R> 458                          Gentium Plus           Italic
#R> 459                          Gentium Plus          Regular
#R> 460                  GLYPHICONS Halflings          Regular
#R> 461                           Inconsolata           Medium
#R> 462                              Junicode             Bold
#R> 463                              Junicode      Bold Italic
#R> 464                              Junicode           Italic
#R> 465                              Junicode          Regular
#R> 466                            Lato Black          Regular
#R> 467                            Lato Black           Italic
#R> 468                                  Lato             Bold
#R> 469                                  Lato      Bold Italic
#R> 470                         Lato Hairline          Regular
#R> 471                         Lato Hairline           Italic
#R> 472                            Lato Heavy          Regular
#R> 473                            Lato Heavy           Italic
#R> 474                                  Lato           Italic
#R> 475                            Lato Light          Regular
#R> 476                            Lato Light           Italic
#R> 477                           Lato Medium          Regular
#R> 478                           Lato Medium           Italic
#R> 479                                  Lato          Regular
#R> 480                         Lato Semibold          Regular
#R> 481                         Lato Semibold           Italic
#R> 482                             Lato Thin          Regular
#R> 483                             Lato Thin           Italic
#R> 484                       Liberation Mono             Bold
#R> 485                       Liberation Mono      Bold Italic
#R> 486                       Liberation Mono           Italic
#R> 487                       Liberation Mono          Regular
#R> 488                       Liberation Sans             Bold
#R> 489                       Liberation Sans      Bold Italic
#R> 490                       Liberation Sans           Italic
#R> 491                       Liberation Sans          Regular
#R> 492                Liberation Sans Narrow             Bold
#R> 493                Liberation Sans Narrow      Bold Italic
#R> 494                Liberation Sans Narrow           Italic
#R> 495                Liberation Sans Narrow          Regular
#R> 496                      Liberation Serif             Bold
#R> 497                      Liberation Serif      Bold Italic
#R> 498                      Liberation Serif           Italic
#R> 499                      Liberation Serif          Regular
#R> 500                       Liberation Mono             Bold
#R>                                      ps_name
#R> 1                                 3270Medium
#R> 2                                 3270Narrow
#R> 3                             3270SemiNarrow
#R> 4                                academicons
#R> 5                        AlfaSlabOne-Regular
#R> 6              AnonymicePowerline-BoldItalic
#R> 7                    AnonymicePowerline-Bold
#R> 8                  AnonymicePowerline-Italic
#R> 9                         AnonymicePowerline
#R> 10                      ArchivoBlack-Regular
#R> 11                    ArimoForPowerline-Bold
#R> 12              ArimoForPowerline-BoldItalic
#R> 13                         ArimoForPowerline
#R> 14                  ArimoForPowerline-Italic
#R> 15                  CousineForPowerline-Bold
#R> 16            CousineForPowerline-BoldItalic
#R> 17                       CousineForPowerline
#R> 18                CousineForPowerline-Italic
#R> 19                  D2CodingBoldForPowerline
#R> 20                      D2CodingForPowerline
#R> 21              DejaVuSansMonoPowerline-Bold
#R> 22       DejaVuSansMonoPowerline-BoldOblique
#R> 23                   DejaVuSansMonoPowerline
#R> 24           DejaVuSansMonoPowerline-Oblique
#R> 25           DroidSansMonoDottedForPowerline
#R> 26                 DroidSansMonoForPowerline
#R> 27          DroidSansMonoSlashedForPowerline
#R> 28                 FiraMonoForPowerline-Bold
#R> 29               FiraMonoForPowerline-Medium
#R> 30              FiraMonoForPowerline-Regular
#R> 31                   GoMonoForPowerline-Bold
#R> 32             GoMonoForPowerline-BoldItalic
#R> 33                        GoMonoForPowerline
#R> 34                 GoMonoForPowerline-Italic
#R> 35                                 Hack-Bold
#R> 36                           Hack-BoldItalic
#R> 37                               Hack-Italic
#R> 38                              Hack-Regular
#R> 39                                 Helvetica
#R> 40              Inconsolata-BoldForPowerline
#R> 41                   InconsolataForPowerline
#R> 42                InconsolataForPowerline-dz
#R> 43                 InconsolataForPowerline-g
#R> 44                                  Ionicons
#R> 45                     LibreBaskerville-Bold
#R> 46                   LibreBaskerville-Italic
#R> 47                  LibreBaskerville-Regular
#R> 48        LiterationMonoPowerline-BoldItalic
#R> 49              LiterationMonoPowerline-Bold
#R> 50            LiterationMonoPowerline-Italic
#R> 51                   LiterationMonoPowerline
#R> 52                 MesloLGLForPowerline-Bold
#R> 53           MesloLGLForPowerline-BoldItalic
#R> 54               MesloLGLDZForPowerline-Bold
#R> 55         MesloLGLDZForPowerline-BoldItalic
#R> 56             MesloLGLDZForPowerline-Italic
#R> 57            MesloLGLDZForPowerline-Regular
#R> 58               MesloLGLForPowerline-Italic
#R> 59              MesloLGLForPowerline-Regular
#R> 60                 MesloLGMForPowerline-Bold
#R> 61           MesloLGMForPowerline-BoldItalic
#R> 62               MesloLGMDZForPowerline-Bold
#R> 63         MesloLGMDZForPowerline-BoldItalic
#R> 64             MesloLGMDZForPowerline-Italic
#R> 65            MesloLGMDZForPowerline-Regular
#R> 66               MesloLGMForPowerline-Italic
#R> 67              MesloLGMForPowerline-Regular
#R> 68                 MesloLGSForPowerline-Bold
#R> 69           MesloLGSForPowerline-BoldItalic
#R> 70               MesloLGSDZForPowerline-Bold
#R> 71         MesloLGSDZForPowerline-BoldItalic
#R> 72             MesloLGSDZForPowerline-Italic
#R> 73            MesloLGSDZForPowerline-Regular
#R> 74               MesloLGSForPowerline-Italic
#R> 75              MesloLGSForPowerline-Regular
#R> 76                   MonofurboldForPowerline
#R> 77                       MonofurForPowerline
#R> 78                 MonofuritalicForPowerline
#R> 79                                Mukta-Bold
#R> 80                           Mukta-ExtraBold
#R> 81                          Mukta-ExtraLight
#R> 82                               Mukta-Light
#R> 83                              Mukta-Medium
#R> 84                             Mukta-Regular
#R> 85                            Mukta-SemiBold
#R> 86                      NotoMonoForPowerline
#R> 87                      NovaMonoForPowerline
#R> 88                   PeriodicTableofElements
#R> 89                  ProFontForPowerline-Bold
#R> 90                       ProFontForPowerline
#R> 91               RobotoMonoForPowerline-Bold
#R> 92         RobotoMonoForPowerline-BoldItalic
#R> 93            RobotoMonoForPowerline-Regular
#R> 94             RobotoMonoForPowerline-Italic
#R> 95              RobotoMonoForPowerline-Light
#R> 96        RobotoMonoForPowerline-LightItalic
#R> 97             RobotoMonoForPowerline-Medium
#R> 98       RobotoMonoForPowerline-MediumItalic
#R> 99               RobotoMonoForPowerline-Thin
#R> 100        RobotoMonoForPowerline-ThinItalic
#R> 101          SourceCodeProForPowerline-Black
#R> 102           SourceCodeProForPowerline-Bold
#R> 103     SourceCodeProForPowerline-ExtraLight
#R> 104        SourceCodeProForPowerline-Regular
#R> 105          SourceCodeProForPowerline-Light
#R> 106         SourceCodeProForPowerline-Medium
#R> 107        SourceCodeProForPowerline-BlackIt
#R> 108         SourceCodeProForPowerline-BoldIt
#R> 109   SourceCodeProForPowerline-ExtraLightIt
#R> 110             SourceCodeProForPowerline-It
#R> 111        SourceCodeProForPowerline-LightIt
#R> 112       SourceCodeProForPowerline-MediumIt
#R> 113     SourceCodeProForPowerline-SemiboldIt
#R> 114       SourceCodeProForPowerline-Semibold
#R> 115               SpaceMonoForPowerline-Bold
#R> 116         SpaceMonoForPowerline-BoldItalic
#R> 117            SpaceMonoForPowerline-Regular
#R> 118             SpaceMonoForPowerline-Italic
#R> 119                           SpaceMono-Bold
#R> 120                     SpaceMono-BoldItalic
#R> 121                         SpaceMono-Italic
#R> 122                        SpaceMono-Regular
#R> 123                    SymbolNeuForPowerline
#R> 124                   TinosForPowerline-Bold
#R> 125             TinosForPowerline-BoldItalic
#R> 126                        TinosForPowerline
#R> 127                 TinosForPowerline-Italic
#R> 128                                 Triforce
#R> 129 UbuntuMonoDerivativePowerline-BoldItalic
#R> 130       UbuntuMonoDerivativePowerline-Bold
#R> 131     UbuntuMonoDerivativePowerline-Italic
#R> 132    UbuntuMonoDerivativePowerline-Regular
#R> 133                                 Triforce
#R> 134                            Go-BoldItalic
#R> 135                                  Go-Bold
#R> 136                                Go-Italic
#R> 137                          GoMedium-Italic
#R> 138                                 GoMedium
#R> 139                        GoMono-BoldItalic
#R> 140                              GoMono-Bold
#R> 141                            GoMono-Italic
#R> 142                                   GoMono
#R> 143                                GoRegular
#R> 144                               Cabin-Bold
#R> 145                         Cabin-BoldItalic
#R> 146                             Cabin-Italic
#R> 147                             Cabin-Medium
#R> 148                       Cabin-MediumItalic
#R> 149                            Cabin-Regular
#R> 150                           Cabin-SemiBold
#R> 151                     Cabin-SemiBoldItalic
#R> 152                           Cantarell-Bold
#R> 153                      Cantarell-ExtraBold
#R> 154                          Cantarell-Light
#R> 155                        Cantarell-Regular
#R> 156                           Cantarell-Thin
#R> 157                       EBGaramondInitials
#R> 158                     EBGaramondInitialsF1
#R> 159                     EBGaramondInitialsF2
#R> 160                      EBGaramond08-Italic
#R> 161                     EBGaramond08-Regular
#R> 162                       EBGaramond12-AllSC
#R> 163                      EBGaramond12-Italic
#R> 164                     EBGaramond12-Regular
#R> 165                   EBGaramondSC08-Regular
#R> 166                   EBGaramondSC12-Regular
#R> 167                            FiraCode-Bold
#R> 168                           FiraCode-Light
#R> 169                          FiraCode-Medium
#R> 170                         FiraCode-Regular
#R> 171                          FiraCode-Retina
#R> 172                              FontAwesome
#R> 173                               Amiri-Bold
#R> 174                        Amiri-BoldSlanted
#R> 175                            Amiri-Regular
#R> 176                            Amiri-Slanted
#R> 177                       AmiriQuran-Regular
#R> 178                AmiriQuranColored-Regular
#R> 179                                 FreeMono
#R> 180                             FreeMonoBold
#R> 181                      FreeMonoBoldOblique
#R> 182                          FreeMonoOblique
#R> 183                                 FreeSans
#R> 184                             FreeSansBold
#R> 185                      FreeSansBoldOblique
#R> 186                          FreeSansOblique
#R> 187                                FreeSerif
#R> 188                            FreeSerifBold
#R> 189                      FreeSerifBoldItalic
#R> 190                          FreeSerifItalic
#R> 191                GentiumPlusCompact-Italic
#R> 192                       GentiumPlusCompact
#R> 193                              IPAexGothic
#R> 194                              IPAexMincho
#R> 195                                IPAGothic
#R> 196                               IPAPGothic
#R> 197                                IPAMincho
#R> 198                               IPAPMincho
#R> 199                           LinBiolinumOKb
#R> 200                             LinBiolinumO
#R> 201                            LinBiolinumOB
#R> 202                            LinBiolinumOI
#R> 203                     LinLibertineDisplayO
#R> 204                           LinLibertineIO
#R> 205                           LinLibertineMO
#R> 206                            LinLibertineO
#R> 207                           LinLibertineOB
#R> 208                          LinLibertineOBI
#R> 209                           LinLibertineOI
#R> 210                           LinLibertineOZ
#R> 211                          LinLibertineOZI
#R> 212                    LobsterTwo-BoldItalic
#R> 213                          LobsterTwo-Bold
#R> 214                    LobsterTwo-BoldItalic
#R> 215                        LobsterTwo-Italic
#R> 216                               LobsterTwo
#R> 217                                STIX-Bold
#R> 218                          STIX-BoldItalic
#R> 219                              STIX-Italic
#R> 220                             STIX-Regular
#R> 221                         STIXMath-Regular
#R> 222                         STIXGeneral-Bold
#R> 223                   STIXGeneral-BoldItalic
#R> 224                       STIXGeneral-Italic
#R> 225                      STIXGeneral-Regular
#R> 226                      STIXIntegralsD-Bold
#R> 227                   STIXIntegralsD-Regular
#R> 228                     STIXIntegralsSm-Bold
#R> 229                  STIXIntegralsSm-Regular
#R> 230                     STIXIntegralsUp-Bold
#R> 231                  STIXIntegralsUp-Regular
#R> 232                    STIXIntegralsUpD-Bold
#R> 233                 STIXIntegralsUpD-Regular
#R> 234                   STIXIntegralsUpSm-Bold
#R> 235                STIXIntegralsUpSm-Regular
#R> 236                      STIXNonUnicode-Bold
#R> 237                STIXNonUnicode-BoldItalic
#R> 238                    STIXNonUnicode-Italic
#R> 239                   STIXNonUnicode-Regular
#R> 240                  STIXSizeFiveSym-Regular
#R> 241                     STIXSizeFourSym-Bold
#R> 242                  STIXSizeFourSym-Regular
#R> 243                      STIXSizeOneSym-Bold
#R> 244                   STIXSizeOneSym-Regular
#R> 245                    STIXSizeThreeSym-Bold
#R> 246                 STIXSizeThreeSym-Regular
#R> 247                      STIXSizeTwoSym-Bold
#R> 248                   STIXSizeTwoSym-Regular
#R> 249                        STIXVariants-Bold
#R> 250                     STIXVariants-Regular
#R> 251                              Garuda-Bold
#R> 252                       Garuda-BoldOblique
#R> 253                           Garuda-Oblique
#R> 254                                   Garuda
#R> 255                             Kinnari-Bold
#R> 256                       Kinnari-BoldItalic
#R> 257                      Kinnari-BoldOblique
#R> 258                           Kinnari-Italic
#R> 259                          Kinnari-Oblique
#R> 260                                  Kinnari
#R> 261                            Laksaman-Bold
#R> 262                      Laksaman-BoldItalic
#R> 263                          Laksaman-Italic
#R> 264                                 Laksaman
#R> 265                                Loma-Bold
#R> 266                         Loma-BoldOblique
#R> 267                             Loma-Oblique
#R> 268                                     Loma
#R> 269                              Norasi-Bold
#R> 270                        Norasi-BoldItalic
#R> 271                       Norasi-BoldOblique
#R> 272                            Norasi-Italic
#R> 273                           Norasi-Oblique
#R> 274                                   Norasi
#R> 275                              Purisa-Bold
#R> 276                       Purisa-BoldOblique
#R> 277                           Purisa-Oblique
#R> 278                                   Purisa
#R> 279                            Sawasdee-Bold
#R> 280                     Sawasdee-BoldOblique
#R> 281                         Sawasdee-Oblique
#R> 282                                 Sawasdee
#R> 283                            TlwgMono-Bold
#R> 284                     TlwgMono-BoldOblique
#R> 285                         TlwgMono-Oblique
#R> 286                                 TlwgMono
#R> 287                      TlwgTypewriter-Bold
#R> 288               TlwgTypewriter-BoldOblique
#R> 289                   TlwgTypewriter-Oblique
#R> 290                           TlwgTypewriter
#R> 291                          TlwgTypist-Bold
#R> 292                   TlwgTypist-BoldOblique
#R> 293                       TlwgTypist-Oblique
#R> 294                               TlwgTypist
#R> 295                            TlwgTypo-Bold
#R> 296                     TlwgTypo-BoldOblique
#R> 297                         TlwgTypo-Oblique
#R> 298                                 TlwgTypo
#R> 299                              Umpush-Bold
#R> 300                       Umpush-BoldOblique
#R> 301                             Umpush-Light
#R> 302                      Umpush-LightOblique
#R> 303                           Umpush-Oblique
#R> 304                                   Umpush
#R> 305                               Waree-Bold
#R> 306                        Waree-BoldOblique
#R> 307                            Waree-Oblique
#R> 308                                    Waree
#R> 309                     AccanthisADFStd-Bold
#R> 310               AccanthisADFStd-BoldItalic
#R> 311                   AccanthisADFStd-Italic
#R> 312                  AccanthisADFStd-Regular
#R> 313                  AccanthisADFStdNo2-Bold
#R> 314            AccanthisADFStdNo2-BoldItalic
#R> 315                AccanthisADFStdNo2-Italic
#R> 316               AccanthisADFStdNo2-Regular
#R> 317                  AccanthisADFStdNo3-Bold
#R> 318            AccanthisADFStdNo3-BoldItalic
#R> 319                AccanthisADFStdNo3-Italic
#R> 320               AccanthisADFStdNo3-Regular
#R> 321                       BerenisADFPro-Bold
#R> 322                 BerenisADFPro-BoldItalic
#R> 323                     BerenisADFPro-Italic
#R> 324                    BerenisADFPro-Regular
#R> 325                     BerenisADFProSC-Bold
#R> 326               BerenisADFProSC-BoldItalic
#R> 327                   BerenisADFProSC-Italic
#R> 328                  BerenisADFProSC-Regular
#R> 329                          GilliusADF-Bold
#R> 330                      GilliusADF-BoldCond
#R> 331                GilliusADF-BoldCondItalic
#R> 332                    GilliusADF-BoldItalic
#R> 333                          GilliusADF-Cond
#R> 334                    GilliusADF-CondItalic
#R> 335                        GilliusADF-Italic
#R> 336                       GilliusADF-Regular
#R> 337                       GilliusADFNo2-Bold
#R> 338                   GilliusADFNo2-BoldCond
#R> 339             GilliusADFNo2-BoldCondItalic
#R> 340                 GilliusADFNo2-BoldItalic
#R> 341                       GilliusADFNo2-Cond
#R> 342                 GilliusADFNo2-CondItalic
#R> 343                     GilliusADFNo2-Italic
#R> 344                    GilliusADFNo2-Regular
#R> 345                   UniversalisADFStd-Bold
#R> 346               UniversalisADFStd-BoldCond
#R> 347            UniversalisADFStd-BoldCondObl
#R> 348            UniversalisADFStd-BoldOblique
#R> 349                   UniversalisADFStd-Cond
#R> 350            UniversalisADFStd-CondOblique
#R> 351                UniversalisADFStd-Oblique
#R> 352                UniversalisADFStd-Regular
#R> 353                            ZenKai-Medium
#R> 354                         ShanHeiSun-Light
#R> 355                       BousungEG-Light-GB
#R> 356                          GBZenKai-Medium
#R> 357                     GFSArtemisia-Regular
#R> 358                        GFSArtemisia-Bold
#R> 359                  GFSArtemisia-BoldItalic
#R> 360                      GFSArtemisia-Italic
#R> 361                               Asana-Math
#R> 362                           Baekmuk-Batang
#R> 363                            Baekmuk-Dotum
#R> 364                            Baekmuk-Gulim
#R> 365                         Baekmuk-Headline
#R> 366                   GFSBaskerville-Regular
#R> 367                 GFSBodoniClassic-Regular
#R> 368                           Comfortaa-Bold
#R> 369                          Comfortaa-Light
#R> 370                        Comfortaa-Regular
#R> 371                     GFSComplutum-Regular
#R> 372                               Arimo-Bold
#R> 373                         Arimo-BoldItalic
#R> 374                             Arimo-Italic
#R> 375                                    Arimo
#R> 376                             Cousine-Bold
#R> 377                       Cousine-BoldItalic
#R> 378                           Cousine-Italic
#R> 379                                  Cousine
#R> 380                               Tinos-Bold
#R> 381                         Tinos-BoldItalic
#R> 382                             Tinos-Italic
#R> 383                                    Tinos
#R> 384                             Caladea-Bold
#R> 385                       Caladea-BoldItalic
#R> 386                           Caladea-Italic
#R> 387                          Caladea-Regular
#R> 388                             Carlito-Bold
#R> 389                       Carlito-BoldItalic
#R> 390                           Carlito-Italic
#R> 391                                  Carlito
#R> 392                DejaVuMathTeXGyre-Regular
#R> 393                          DejaVuSans-Bold
#R> 394                   DejaVuSans-BoldOblique
#R> 395                    DejaVuSans-ExtraLight
#R> 396                       DejaVuSans-Oblique
#R> 397                               DejaVuSans
#R> 398                 DejaVuSansCondensed-Bold
#R> 399          DejaVuSansCondensed-BoldOblique
#R> 400              DejaVuSansCondensed-Oblique
#R> 401                      DejaVuSansCondensed
#R> 402                      DejaVuSansMono-Bold
#R> 403               DejaVuSansMono-BoldOblique
#R> 404                   DejaVuSansMono-Oblique
#R> 405                           DejaVuSansMono
#R> 406                         DejaVuSerif-Bold
#R> 407                   DejaVuSerif-BoldItalic
#R> 408                       DejaVuSerif-Italic
#R> 409                              DejaVuSerif
#R> 410                DejaVuSerifCondensed-Bold
#R> 411          DejaVuSerifCondensed-BoldItalic
#R> 412              DejaVuSerifCondensed-Italic
#R> 413                     DejaVuSerifCondensed
#R> 414                  GFSDidotClassic-Regular
#R> 415                         GFSDidot-Regular
#R> 416                            GFSDidot-Bold
#R> 417                      GFSDidot-BoldItalic
#R> 418                          GFSDidot-Italic
#R> 419                        DroidSansFallback
#R> 420                       EBGaramondInitials
#R> 421                     EBGaramondInitialsF1
#R> 422                     EBGaramondInitialsF2
#R> 423                      EBGaramond08-Italic
#R> 424                     EBGaramond08-Regular
#R> 425                       EBGaramond12-AllSC
#R> 426                      EBGaramond12-Italic
#R> 427                     EBGaramond12-Regular
#R> 428                   EBGaramondSC08-Regular
#R> 429                   EBGaramondSC12-Regular
#R> 430                              FontAwesome
#R> 431                              IPAexGothic
#R> 432                              IPAexMincho
#R> 433                                 FreeMono
#R> 434                             FreeMonoBold
#R> 435                      FreeMonoBoldOblique
#R> 436                          FreeMonoOblique
#R> 437                                 FreeSans
#R> 438                             FreeSansBold
#R> 439                      FreeSansBoldOblique
#R> 440                          FreeSansOblique
#R> 441                                FreeSerif
#R> 442                            FreeSerifBold
#R> 443                      FreeSerifBoldItalic
#R> 444                          FreeSerifItalic
#R> 445                         GFSGazis-Regular
#R> 446                        GentiumBasic-Bold
#R> 447                  GentiumBasic-BoldItalic
#R> 448                      GentiumBasic-Italic
#R> 449                             GentiumBasic
#R> 450                    GentiumBookBasic-Bold
#R> 451              GentiumBookBasic-BoldItalic
#R> 452                  GentiumBookBasic-Italic
#R> 453                         GentiumBookBasic
#R> 454                           Gentium-Italic
#R> 455                                  Gentium
#R> 456                        GentiumAlt-Italic
#R> 457                               GentiumAlt
#R> 458                       GentiumPlus-Italic
#R> 459                              GentiumPlus
#R> 460              GLYPHICONSHalflings-Regular
#R> 461                              Inconsolata
#R> 462                            Junicode-Bold
#R> 463                      Junicode-BoldItalic
#R> 464                          Junicode-Italic
#R> 465                                 Junicode
#R> 466                               Lato-Black
#R> 467                         Lato-BlackItalic
#R> 468                                Lato-Bold
#R> 469                          Lato-BoldItalic
#R> 470                            Lato-Hairline
#R> 471                      Lato-HairlineItalic
#R> 472                               Lato-Heavy
#R> 473                         Lato-HeavyItalic
#R> 474                              Lato-Italic
#R> 475                               Lato-Light
#R> 476                         Lato-LightItalic
#R> 477                              Lato-Medium
#R> 478                        Lato-MediumItalic
#R> 479                             Lato-Regular
#R> 480                            Lato-Semibold
#R> 481                      Lato-SemiboldItalic
#R> 482                                Lato-Thin
#R> 483                          Lato-ThinItalic
#R> 484                      LiberationMono-Bold
#R> 485                LiberationMono-BoldItalic
#R> 486                    LiberationMono-Italic
#R> 487                           LiberationMono
#R> 488                      LiberationSans-Bold
#R> 489                LiberationSans-BoldItalic
#R> 490                    LiberationSans-Italic
#R> 491                           LiberationSans
#R> 492                LiberationSansNarrow-Bold
#R> 493          LiberationSansNarrow-BoldItalic
#R> 494              LiberationSansNarrow-Italic
#R> 495                     LiberationSansNarrow
#R> 496                     LiberationSerif-Bold
#R> 497               LiberationSerif-BoldItalic
#R> 498                   LiberationSerif-Italic
#R> 499                          LiberationSerif
#R> 500                      LiberationMono-Bold
#R>  [ reached 'max' / getOption("max.print") -- omitted 454 rows ]
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

<img src="/post/hylianStyle/index_files/figure-html/unnamed-chunk-8-1.png" width="864" style="display: block; margin: auto;" />

<br><br>

#### YEAH! :sunglasses:
