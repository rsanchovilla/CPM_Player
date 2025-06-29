                          SCHEDULE v1.0

                 Personaì Dailù Schedulå Handler

                               by

                         Noriaké Hosoya
                         
                         1600 W. Plum 23-D
                         Fort Collins, CO 80521
                         (303) 491-8825

                         July 20, 1986



INTRODUCTION

     SCHEDULÅ  ió á simple¬  light-dutù personaì schedulå handleò 
writteî iî Pascal®   Thå prograí waó designeä tï ruî specificallù 
oî Kayproó witè graphics®   SCHEDULÅ haó beeî compileä witè Turbï 
Pascaì 3.° tï fiô 48Ë RAÍ space®   Iî thió brieæ document¬ É wilì 
describå  thå usagå oæ SCHEDULÅ althougè iô waó mù  intentioî  tï 
makå thå prograí easù tï uså foò firsô timå users.

     Iî  thå  librarù  filå  SCHEDULE.LBR¬   yoõ  wilì  finä  thå 
followinç subfiles:

     SCHEDULE.WÓ    º Thió documenô filå foò SCHEDULE.
     SCHEDULE.COÍ   º Compileä prograí SCHEDULE.
     SCHEDULE.PAÓ   º Pascaì sourcå oæ SCHEDULE.COM.
     SCH1.INÃ       º INCLUDÅ filå foò SCHEDULE.PAS.

Firsô  yoõ musô extracô theså individuaì fileó froí  SCHEDULE.LBÒ 
filå  usinç  á librarù utilitù prograí sucè aó  NULU®    Aô  thió 
poinô  therå  ió nï neeä tï modifù oò initializå SCHEDULE.COÍ  tï 
ruî  it®    However¬  iæ  yoõ wanô tï improvå  SCHEDULÅ  oò  youò 
terminaì  useó  graphiã characteò sequenceó differenô froí  thoså 
foò  neweò  Kaypros¬  yoõ  arå encourageä tï  modifù  thå  sourcå 
prograí  SCHEDULE.PAS®    Thå  nexô  sectioî  showó  ho÷  tï  uså 
SCHEDULÅ steð bù step.


RUNNINÇ SCHEDULE

1© Sign-On

     Tï ruî SCHEDULE¬ type:

     A>SCHEDULE

     SCHEDULÅ welcomeó yoõ witè á sign-oî message®   Iæ yoõ feel¬ 
aó É sometimeó do¬ thaô thå sign-oî routinå ió ratheò lengthy¬ iô 
caî bå suppresseä bù patchinç SCHEDULE.COM®    Thió procedurå  ió 
demonstrateä aô thå enä oæ thió document.Š

2© Schedulå File

     Afteò  signinç  on¬  SCHEDULÅ askó yoõ thå namå oæ  Schedulå 
Filå yoõ wanô tï worë oî oò creatå oî disk®    Regulaò CP/Í  filå 
namå  conventioî applieó here®    Botè loweò anä uppeò characteró 
arå  acceptablå foò thå filå name®    Personallù É prefeò á  namå 
sucè  aó  JUL86.SCÈ tï indicatå á schedulå filå  foò  Julù  1986®   
Yoõ  maù keeð dailù scheduleó foò aî entirå yeaò iî á singlå filå 
(iô  ió  limiteä  bù availablå spacå oî  youò  disk)®    Buô  foò 
conveniencå  anä practicalitù É woulä recommenä thaô  yoõ  creatå 
fileó oî á monthlù base.



3© Enterinç á Date

     SCHEDULÅ  needó  tï kno÷ thå datå yoõ wanô tï dï  schedulinç 
for®    SCHEDULÅ askó yoõ Month(1-12)¬  Daù anä Year(80-99©  witè 
valiä  inputó iî parentheses®    Iæ SCHEDULÅ doeó noô  understanä 
youò  response¬  iô  wilì beeð anä yoõ musô re-enteò thå  correcô 
date.


4© Screeî Arrangement

     Oncå á valiä datå ió entered¬  SCHEDULÅ displayó á  calendaò 
oæ  thå montè witè thå daù yoõ specifieä highlighteä aô thå uppeò 
lefô corneò oæ youò screen» á simulateä notepaä oî thå righô halæ 
oæ youò screen»  anä Commanä Summarù aô thå loweò lefô corneò  oæ 
youò  screen®    Thå  23rä linå ió exclusivelù useä aó á  commanä 
linå bù SCHEDULÅ foò useò input.
   
     Thå  notepaä  caî holä á dailù schedulå froí · aí tï  µ  pm®   
Thå sloô aô · aí wilì bå initiallù highlighteä witè á dií reverså 
video®    Aô  eacè  slot¬  yoõ  caî enteò á texô notå  uð  tï  4° 
characteró long®      


5© Commanä Summary

     Thió versioî oæ SCHEDULÅ supportó 1° commandó tï handlå youò 
schedules®   Theù are:

     [^EÝ  º Uð Hour
     [^XÝ  º Dowî Hour
     [ESCÝ º Enteò Note
     [^CÝ  º Canceì Note
     [^SÝ  º Save/Resume
     [^TÝ  º Deletå Record
     [^DÝ  º Displaù Dates
     [^PÝ  º Save/Print
     [^FÝ  º Save/Opeî File
     [^QÝ  º Save/QuitŠ
Thå  up-arrowó (^© indicatå á CTRÌ key®    Anù oæ theså  commandó 
caî  bå issueä wheneveò thå statuó linå showó "Youò  Commanä  ?"®   
Thå functionó oæ thå commandó arå aó followsº 

[^EÝ moveó thå highlighteä sloô oî thå notepaä uð onå space®  

[^XÝ moveó thå highlighteä sloô oî thå notepaä dowî onå space.

[ESCÝ moveó thå cursoò tï thå currentlù highlighteä schedulå sloô 
anä  initializeó  á notå entrù oî thå notepad®    Thå notå  entrù 
musô bå endeä bù á carriagå return.

[^CÝ deleteó thå notå aô thå currentlù highlighteä slot.

[^SÝ  saveó  thå  schedulå  displayeä oî  thå  notepaä  ontï  thå 
schedulå filå anä allowó yoõ tï continuå scheduling.
 
[^TÝ  deleteó  thå  schedulå displayeä oî thå  notepaä  froí  thå 
schedulå file.

[^DÝ displayó alì thå scheduleä dateó saveä oî thå schedulå file.

[^PÝ  saveó  thå  schedulå  oî thå notepaä anä  printó  iô  oî  á 
printer.

[^FÝ  saveó thå schedulå oî thå notepaä oî thå schedulå filå  anä 
openó anotheò schedulå file.

[^QÝ  saveó thå schedulå oî thå notepaä oî thå schedulå filå  anä 
terminateó SCHEDULE.



SUGGESTEÄ PATCH

     Thå sign-oî messagå oæ SCHEDULÅ caî bå totallù eliminateä bù 
patchinç  SCHEDULE.COÍ  usinç DDT®    Iæ yoõ decidå  tï  dï  thió 
patch¬  É  stronglù  suggesô  thaô  yoõ makå  á  backuð  copù  oæ 
SCHEDULE.COÍ beforå proceeding®    Á sessioî witè DDÔ shoulä looë 
likå this:

A>DDÔ SCHEDULE.COM
DDÔ VERÓ 2.2
NEXÔ  PC
3C8° 0100
-S221F
221Æ 0± 00
222° CÄ .
-G0

A>SAVÅ 6° SCHEDULE.COM


Enä oæ SCHEDULE.WSŠ