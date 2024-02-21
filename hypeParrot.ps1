Param([int]$FrameDelay=100, [int]$loops=0, [switch]$profileload)

#To avoid cursor blinking while rendering frames, we disable the cursor. Dont worry, it will return upon script exit :)
[console]::CursorVisible = $false


if ($profileload) {
    #It is highly recommended to dot-source party-parrot in your PowerShell-profile. Life quality will drastically imnprove. Instantly. Yes.
    Get-PSBreakpoint | Remove-PSBreakpoint
    [int]$loops = 2
    $global:reEvaluatedFrame = ("
                .ckx;'........':c.                
             .,:c:::::oxxocoo::::,',.             
            .odc'..:lkkoolllllo;..;d,             
            ;c..:o:..;:..',;'.......;.            
           ,c..:0Xx::o:.,cllc:,'::,.,c.           
           ;c;lkXKXXXXl.;lllll;lKXOo;':c.         
         ,dc.oXXXXXXXXl.,lllll;lXXXXx,c0:         
         ;Oc.oXXXXXXXXo.':ll:;'oXXXXO;,l'           $("$(($env:username).Tolower())@$((hostname).Tolower())")
         'l;;kXXXXXXXXd'.'::'..dXXXXO;,l'           $(Get-Date -Format "yyyy-MM-dd")
         'l;:0XXXXXXXX0x:...,:o0XXXXx,:x,         
         'l;;kXXXXXXXXXKkol;oXXXXXXXO;oNc         
        ,c'..ckk0XXXXXXXXXX00XXXXXXX0:;o:.        
      .':;..:do::ooookXXXXXXXXXXXXXXXo..c;        
    .',',:co0XX0kkkxxOXXXXXXXXXXXXXXXOc..;l.      
  .:;'..oXXXXXXXXXXXXXXXXXXXXXXXXXXXXXko;';:.     
.ldc..:oOXKXXXXXXKXXKXXXXXXXXXXXXXXXXXXXo..oc     
:0o...:dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxo,.:,     
cNo........................................;'     
")
}
else {
    #Trick PS to re-evaluate variable content each time the value is read (ie. update date and time dynamically).
    Get-PSBreakpoint | Remove-PSBreakpoint
    $global:reEvaluatedFrame = Set-PSBreakpoint -Variable reEvaluatedFrame -Mode read -Action {
    $global:reEvaluatedFrame = ("
                .ckx;'........':c.                
             .,:c:::::oxxocoo::::,',.             
            .odc'..:lkkoolllllo;..;d,             
            ;c..:o:..;:..',;'.......;.            
           ,c..:0Xx::o:.,cllc:,'::,.,c.           
           ;c;lkXKXXXXl.;lllll;lKXOo;':c.         
         ,dc.oXXXXXXXXl.,lllll;lXXXXx,c0:         
         ;Oc.oXXXXXXXXo.':ll:;'oXXXXO;,l'           $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
         'l;;kXXXXXXXXd'.'::'..dXXXXO;,l'         
         'l;:0XXXXXXXX0x:...,:o0XXXXx,:x,         
         'l;;kXXXXXXXXXKkol;oXXXXXXXO;oNc         
        ,c'..ckk0XXXXXXXXXX00XXXXXXX0:;o:.        
      .':;..:do::ooookXXXXXXXXXXXXXXXo..c;        
    .',',:co0XX0kkkxxOXXXXXXXXXXXXXXXOc..;l.      
  .:;'..oXXXXXXXXXXXXXXXXXXXXXXXXXXXXXko;';:.     
.ldc..:oOXKXXXXXXKXXKXXXXXXXXXXXXXXXXXXXo..oc     
:0o...:dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxo,.:,     
cNo........................................;'     
    ")
    }
}

#Add 9 frames to an array
$Script:frames = @()
$Script:frames += ("
                .ckx;'........':c.                
             .,:c:::::oxxocoo::::,',.             
            .odc'..:lkkoolllllo;..;d,             
            ;c..:o:..;:..',;'.......;.            
           ,c..:0Xx::o:.,cllc:,'::,.,c.           
           ;c;lkXKXXXXl.;lllll;lKXOo;':c.         
         ,dc.oXXXXXXXXl.,lllll;lXXXXx,c0:         
         ;Oc.oXXXXXXXXo.':ll:;'oXXXXO;,l'         
         'l;;kXXXXXXXXd'.'::'..dXXXXO;,l'         
         'l;:0XXXXXXXX0x:...,:o0XXXXx,:x,         
         'l;;kXXXXXXXXXKkol;oXXXXXXXO;oNc         
        ,c'..ckk0XXXXXXXXXX00XXXXXXX0:;o:.        
      .':;..:do::ooookXXXXXXXXXXXXXXXo..c;        
    .',',:co0XX0kkkxxOXXXXXXXXXXXXXXXOc..;l.      
  .:;'..oXXXXXXXXXXXXXXXXXXXXXXXXXXXXXko;';:.     
.ldc..:oOXKXXXXXXKXXKXXXXXXXXXXXXXXXXXXXo..oc     
:0o...:dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxo,.:,     
cNo........................................;'     
")
$Script:frames += ("
            .cc;.  ...  .;c.                      
         .,,cc:cc:lxxxl:ccc:;,.                   
        .lo;...lKKklllookl..cO;                   
      .cl;.,:'.okl;..''.;,..';:.                  
     .:o;;dkd,.ll..,cc::,..,'.;:,.                
     co..lKKKkokl.':lloo;''ol..;dl.               
   .,c;.,xKKKKKKo.':llll;.'oOxl,.cl,.             
   cNo..lKKKKKKKo'';llll;;okKKKl..oNc             
   cNo..lKKKKKKKko;':c:,'lKKKKKo'.oNc             
   cNo..lKKKKKKKKKl.....'dKKKKKxc,l0:             
   .c:'.lKKKKKKKKKk;....lKKKKKKo'.oNc             
     ,:.'oxOKKKKKKKOxxxxOKKKKKKxc,;ol:.           
     ;c..'':oookKKKKKKKKKKKKKKKKKk:.'clc.         
   ,xl'.,oxo;'';oxOKKKKKKKKKKKKKKKOxxl:::;,.      
  .dOc..lKKKkoooookKKKKKKKKKKKKKKKKKKKxl,;ol.     
  cx,';okKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKl..;lc.   
  co..:dddddddddddddddddddddddddddddddddl::',::.  
  co...........................................   
")
$Script:frames += ("
           .ccccccc.                              
      .,,,;cooolccoo;;,,.                         
     .dOx;..;lllll;..;xOd.                        
   .cdo;',loOXXXXXkll;';odc.                      
  ,ol:;c,':oko:cccccc,...ckl.                     
  ;c.;kXo..::..;c::'.......oc                     
,dc..oXX0kk0o.':lll;..cxxc.,ld,                   
kNo.'oXXXXXXo',:lll;..oXXOo;cOd.                  
KOc;oOXXXXXXo.':lol;..dXXXXl';xc                  
Ol,:k0XXXXXX0c.,clc'.:0XXXXx,.oc                  
KOc;dOXXXXXXXl..';'..lXXXXXo..oc                  
dNo..oXXXXXXXOx:..'lxOXXXXXk,.:; ..               
cNo..lXXXXXXXXXOolkXXXXXXXXXkl,..;:';.            
.,;'.,dkkkkk0XXXXXXXXXXXXXXXXXOxxl;,;,;l:.        
  ;c.;:''''':doOXXXXXXXXXXXXXXXXXXOdo;';clc.      
  ;c.lOdood:'''oXXXXXXXXXXXXXXXXXXXXXk,..;ol.     
  ';.:xxxxxocccoxxxxxxxxxxxxxxxxxxxxxxl::'.';;.   
  ';........................................;l'   
")
$Script:frames += ("
                                                  
        .;:;;,.,;;::,.                            
     .;':;........'co:.                           
   .clc;'':cllllc::,.':c.                         
  .lo;;o:coxdllllllc;''::,,.                      
.c:'.,cl,.'l:',,;;'......cO;                      
do;';oxoc;:l;;llllc'.';;'.,;.                     
c..ckkkkkkkd,;llllc'.:kkd;.':c.                   
'.,okkkkkkkkc;lllll,.:kkkdl,cO;                   
..;xkkkkkkkkc,ccll:,;okkkkk:,co,                  
..,dkkkkkkkkc..,;,'ckkkkkkkc;ll.                  
..'okkkkkkkko,....'okkkkkkkc,:c.                  
c..ckkkkkkkkkdl;,:okkkkkkkkd,.',';.               
d..':lxkkkkkkkkxxkkkkkkkkkkkdoc;,;'..'.,.         
o...'';llllldkkkkkkkkkkkkkkkkkkdll;..'cdo.        
o..,l;'''''';dkkkkkkkkkkkkkkkkkkkkdlc,..;lc.      
o..;lc;;;;;;,,;clllllllllllllllllllllc'..,:c.     
o..........................................;'     
")
$Script:frames += ("
                                                  
           .,,,,,,,,,.                            
         .ckKxodooxOOdcc.                         
      .cclooc'....';;cool.                        
     .loc;;;;clllllc;;;;;:;,.                     
   .c:'.,okd;;cdo:::::cl,..oc                     
  .:o;';okkx;';;,';::;'....,:,.                   
  co..ckkkkkddkc,cclll;.,c:,:o:.                  
  co..ckkkkkkkk:,cllll;.:kkd,.':c.                
.,:;.,okkkkkkkk:,cclll;.ckkkdl;;o:.               
cNo..ckkkkkkkkko,.;loc,.ckkkkkc..oc               
,dd;.:kkkkkkkkkx;..;:,.'lkkkkko,.:,               
  ;:.ckkkkkkkkkkc.....;ldkkkkkk:.,'               
,dc..'okkkkkkkkkxoc;;cxkkkkkkkkc..,;,.            
kNo..':lllllldkkkkkkkkkkkkkkkkkdcc,.;l.           
KOc,c;''''''';lldkkkkkkkkkkkkkkkkkc..;lc.         
xx:':;;;;,.,,...,;;cllllllllllllllc;'.;od,        
cNo.....................................oc        
")
$Script:frames += ("
                                                  
                                                  
                   .ccccccc.                      
               .ccckNKOOOOkdcc.                   
            .;;cc:ccccccc:,:c::,,.                
         .c;:;.,cccllxOOOxlllc,;ol.               
        .lkc,coxo:;oOOxooooooo;..:,               
      .cdc.,dOOOc..cOd,.',,;'....':l.             
      cNx'.lOOOOxlldOc..;lll;.....cO;             
     ,do;,:dOOOOOOOOOl'':lll;..:d:''c,            
     co..lOOOOOOOOOOOl'':lll;.'lOd,.cd.           
     co.'dOOOOOOOOOOOo,.;llc,.,dOOc..dc           
     co..lOOOOOOOOOOOOc.';:,..cOOOl..oc           
   .,:;.'::lxOOOOOOOOOo:'...,:oOOOc.'dc           
   ;Oc..cl'':lldOOOOOOOOdcclxOOOOx,.cd.           
  .:;';lxl''''':lldOOOOOOOOOOOOOOc..oc            
,dl,.'cooc:::,....,::coooooooooooc'.c:            
cNo.................................oc            
")
$Script:frames += ("
                                                  
                                                  
                                                  
                        .cccccccc.                
                  .,,,;;cc:cccccc:;;,.            
                .cdxo;..,::cccc::,..;l.           
               ,do:,,:c:coxxdllll:;,';:,.         
             .cl;.,oxxc'.,cc,.';;;'...oNc         
             ;Oc..cxxxc'.,c;..;lll;...cO;         
           .;;',:ldxxxdoldxc..;lll:'...'c,        
           ;c..cxxxxkxxkxxxc'.;lll:'','.cdc.      
         .c;.;odxxxxxxxxxxxd;.,cll;.,l:.'dNc      
        .:,''ccoxkxxkxxxxxxx:..,:;'.:xc..oNc      
      .lc,.'lc':dxxxkxxxxxxxol,...',lx:..dNc      
     .:,',coxoc;;ccccoxxxxxxxxo:::oxxo,.cdc.      
  .;':;.'oxxxxxc''''';cccoxxxxxxxxxxxc..oc        
,do:'..,:llllll:;;;;;;,..,;:lllllllll;..oc        
cNo.....................................oc        
")
$Script:frames += ("
                                                  
                                                  
                              .ccccc.             
                         .cc;'coooxkl;.           
                     .:c:::c:,,,,,;c;;,.'.        
                   .clc,',:,..:xxocc;'..c;        
                  .c:,';:ox:..:c,,,,,,...cd,      
                .c:'.,oxxxxl::l:.,loll;..;ol.     
                ;Oc..:xxxxxxxxx:.,llll,....oc     
             .,;,',:loxxxxxxxxx:.,llll;.,,.'ld,   
            .lo;..:xxxxxxxxxxxx:.'cllc,.:l:'cO;   
           .:;...'cxxxxxxxxxxxxoc;,::,..cdl;;l'   
         .cl;':,'';oxxxxxxdxxxxxx:....,cooc,cO;   
     .,,,::;,lxoc:,,:lxxxxxxxxxxxo:,,;lxxl;'oNc   
   .cdxo;':lxxxxxxc'';cccccoxxxxxxxxxxxxo,.;lc.   
  .loc'.'lxxxxxxxxocc;''''';ccoxxxxxxxxx:..oc     
olc,..',:cccccccccccc:;;;;;;;;:ccccccccc,.'c,     
Ol;......................................;l'      
")
$Script:frames += ("
                                                  
                              ,ddoodd,            
                         .cc' ,ooccoo,'cc.        
                      .ccldo;...',,...;oxdc.      
                   .,,:cc;.,'..;lol;;,'..lkl.     
                  .dOc';:ccl;..;dl,.''.....oc     
                .,lc',cdddddlccld;.,;c::'..,cc:.  
                cNo..:ddddddddddd;':clll;,c,';xc  
               .lo;,clddddddddddd;':clll;:kc..;'  
             .,c;..:ddddddddddddd:';clll,;ll,..   
             ;Oc..';:ldddddddddddl,.,c:;';dd;..   
           .''',:c:,'cdddddddddddo:,''..'cdd;..   
         .cdc';lddd:';lddddddddddddd;.';lddl,..   
      .,;::;,cdddddol;;lllllodddddddlcldddd:.'l;  
     .dOc..,lddddddddlcc:;'';cclddddddddddd;;ll.  
   .coc,;::ldddddddddddddlcccc:ldddddddddl:,cO;   
,xl::,..,cccccccccccccccccccccccccccccccc:;':xx,  
cNd.........................................;lOc  
")

#Add some colors to an array
$colors = @(
    'Green',
    'Yellow',
    'Red',
    'Blue',
    'Cyan',
    'Magenta',
    'White'
)

#Taking note of the cursor position when script is started. We need to move the cursor back to this position before printing each ASCII frame (overwrite)
$curCursorPos = New-Object System.Management.Automation.Host.Coordinates
$curCursorPos.X = $host.ui.rawui.CursorPosition.X
$curCursorPos.Y = $host.ui.rawui.CursorPosition.Y

$frameCount = 0
$timesLooped = 0

#Loop of infinite party!
while ($timesLooped -le $loops -or $loops -eq 0) {
    
    #Reset cursor position, so that last frame will be replaced by new one
    $host.ui.rawui.CursorPosition = $curCursorPos            
    
    #Render next frame and pick a random color
    Write-Host "$([string]$Frames[$frameCount])"-NoNewline -ForegroundColor $Colors[(Get-Random -Minimum 0 -Maximum 7)]

    #Wait a specified number of millisecounds after displaying each frame. Will wait 100ms unless otherwise is specified in framedelay parameter
    Start-Sleep -Milliseconds $FrameDelay        

    #Increase framcount number, so that next frame in array will be renderes on next loop
    $frameCount++

    #At last frame of animation ...
    if ($frameCount -eq 9) {
        
        #Update the contents of first frame
        $script:frames[0] = $global:reEvaluatedFrame

        #Reset frame back to zero, so that animation starts over
        $frameCount = 0

        #Increase number of times played, in case the loop-parameter has been used, so that we can stop after the correct number of playthrougs
        $timesLooped++
    }
}