unit UFarbtabelle;

interface

function Farbe(Wellenlaenge: extended): string;

type
  TTabelle = Record
    Hex: String;
    WLaenge: Integer;
  End;

var
  Farben: Array[1..80] of TTabelle;

implementation

procedure Farbtabelle;
begin                                                        //Farben mit Wellenlaengen 678.37nm bis 435.01 nm
  Farben[1].Hex:='006100';  Farben[1].WLaenge:= 780;
  Farben[2].Hex:='006d00';  Farben[2].WLaenge:= 775;
  Farben[3].Hex:='007700';  Farben[3].WLaenge:= 770;
  Farben[4].Hex:='008200';  Farben[4].WLaenge:= 765;
  Farben[5].Hex:='008d00';  Farben[5].WLaenge:= 760;
  Farben[6].Hex:='009700';  Farben[6].WLaenge:= 755;
  Farben[7].Hex:='00a100';  Farben[7].WLaenge:= 750;
  Farben[8].Hex:='00ab00';  Farben[8].WLaenge:= 745;
  Farben[9].Hex:='00b500';  Farben[9].WLaenge:= 740;
  Farben[10].Hex:='00be00'; Farben[10].WLaenge:= 735;
  Farben[11].Hex:='00c800'; Farben[11].WLaenge:= 730;
  Farben[12].Hex:='00d100'; Farben[12].WLaenge:= 725;
  Farben[13].Hex:='00db00'; Farben[13].WLaenge:= 720;
  Farben[14].Hex:='00e400'; Farben[14].WLaenge:= 715;
  Farben[15].Hex:='00ed00'; Farben[15].WLaenge:= 710;
  Farben[16].Hex:='00f600'; Farben[16].WLaenge:= 705;
  Farben[17].Hex:='00ff00'; Farben[17].WLaenge:= 700;
  Farben[18].Hex:='00ff00'; Farben[18].WLaenge:= 695;
  Farben[19].Hex:='00ff00'; Farben[19].WLaenge:= 690;
  Farben[20].Hex:='00ff00'; Farben[20].WLaenge:= 685;
  Farben[21].Hex:='00ff00'; Farben[21].WLaenge:= 680;
  Farben[22].Hex:='00ff00'; Farben[22].WLaenge:= 675;
  Farben[23].Hex:='00ff00'; Farben[23].WLaenge:= 670;
  Farben[24].Hex:='00ff00'; Farben[24].Wlaenge:= 665;
  Farben[25].Hex:='00ff00'; Farben[25].Wlaenge:= 660;
  Farben[26].Hex:='00ff00'; Farben[26].Wlaenge:= 655;
  Farben[27].Hex:='00ff00'; Farben[27].Wlaenge:= 650;
  Farben[28].Hex:='00ff00'; Farben[28].Wlaenge:= 645;
  Farben[29].Hex:='00ff21'; Farben[29].Wlaenge:= 640;
  Farben[30].Hex:='00ff39'; Farben[30].Wlaenge:= 635;
  Farben[31].Hex:='00ff4f'; Farben[31].Wlaenge:= 630;
  Farben[32].Hex:='00ff63'; Farben[32].Wlaenge:= 625;
  Farben[33].Hex:='00ff77'; Farben[33].Wlaenge:= 620;
  Farben[34].Hex:='00ff89'; Farben[34].Wlaenge:= 615;
  Farben[35].Hex:='00ff9b'; Farben[35].Wlaenge:= 610;
  Farben[36].Hex:='00ffad'; Farben[36].Wlaenge:= 605;
  Farben[37].Hex:='00ffbe'; Farben[37].Wlaenge:= 600;
  Farben[38].Hex:='00ffcf'; Farben[38].Wlaenge:= 595;
  Farben[39].Hex:='00ffdf'; Farben[39].Wlaenge:= 590;
  Farben[40].Hex:='00ffef'; Farben[40].Wlaenge:= 585;
  Farben[41].Hex:='00ffff'; Farben[41].Wlaenge:= 580;
  Farben[42].Hex:='00f0ff'; Farben[42].Wlaenge:= 575;
  Farben[43].Hex:='00e1ff'; Farben[43].Wlaenge:= 570;
  Farben[44].Hex:='00d2ff'; Farben[44].Wlaenge:= 565;
  Farben[45].Hex:='00c3ff'; Farben[45].Wlaenge:= 560;
  Farben[46].Hex:='00b3ff'; Farben[46].Wlaenge:= 555;
  Farben[47].Hex:='00a3ff'; Farben[47].Wlaenge:= 550;
  Farben[48].Hex:='0092ff'; Farben[48].Wlaenge:= 545;
  Farben[49].Hex:='0081ff'; Farben[49].Wlaenge:= 540;
  Farben[50].Hex:='0070ff'; Farben[50].Wlaenge:= 535;
  Farben[51].Hex:='005eff'; Farben[51].Wlaenge:= 530;
  Farben[52].Hex:='004aff'; Farben[52].Wlaenge:= 525;
  Farben[53].Hex:='0036ff'; Farben[53].Wlaenge:= 520;
  Farben[54].Hex:='001fff'; Farben[54].Wlaenge:= 515;
  Farben[55].Hex:='0000ff'; Farben[55].Wlaenge:= 510;
  Farben[56].Hex:='5400ff'; Farben[56].Wlaenge:= 505;
  Farben[57].Hex:='9200ff'; Farben[57].Wlaenge:= 500;
  Farben[58].Hex:='cb00ff'; Farben[58].Wlaenge:= 495;
  Farben[59].Hex:='ff00ff'; Farben[59].Wlaenge:= 490;
  Farben[60].Hex:='ff00ea'; Farben[60].Wlaenge:= 485;
  Farben[61].Hex:='ff00d5'; Farben[61].Wlaenge:= 480;
  Farben[62].Hex:='ff00c0'; Farben[62].Wlaenge:= 475;
  Farben[63].Hex:='ff00a9'; Farben[63].Wlaenge:= 470;
  Farben[64].Hex:='ff0092'; Farben[64].Wlaenge:= 465;
  Farben[65].Hex:='ff007b'; Farben[65].Wlaenge:= 460;
  Farben[66].Hex:='ff0061'; Farben[66].Wlaenge:= 455;
  Farben[67].Hex:='ff0046'; Farben[67].Wlaenge:= 450;
  Farben[68].Hex:='ff0000'; Farben[68].Wlaenge:= 445;
  Farben[69].Hex:='ff2300'; Farben[69].Wlaenge:= 435;
  Farben[70].Hex:='ff3d00'; Farben[70].Wlaenge:= 430;
  Farben[71].Hex:='ff5400'; Farben[71].Wlaenge:= 425;
  Farben[72].Hex:='ff6a00'; Farben[72].Wlaenge:= 420;
  Farben[73].Hex:='ed7600'; Farben[73].Wlaenge:= 415;
  Farben[74].Hex:='db7e00'; Farben[74].Wlaenge:= 410;
  Farben[75].Hex:='c88200'; Farben[75].Wlaenge:= 405;
  Farben[76].Hex:='b58300'; Farben[76].Wlaenge:= 400;
  Farben[77].Hex:='a18000'; Farben[77].Wlaenge:= 395;
  Farben[78].Hex:='8d7900'; Farben[78].Wlaenge:= 390;
  Farben[79].Hex:='776f00'; Farben[79].Wlaenge:= 385;
  Farben[80].Hex:='616100'; Farben[80].Wlaenge:= 380;
end;

function Farbe(Wellenlaenge: extended): string;
var
  Farbe_gefunden: Boolean;
  Zaehler: Integer;
begin
  Farbtabelle;

  //Variablen zuruecksetzen
  Farbe_gefunden:= false;
  Zaehler:= 0;

  //Hexcode zur Wellenlaenge ermitteln
  repeat
    if (Farben[Zaehler].WLaenge = Round(Wellenlaenge))
          then Farbe_gefunden:= true else Inc(Zaehler);
  until (Zaehler = 80) or (Farbe_gefunden = true);

  //Wert an aufrufende Prozedur geben
  if Farbe_gefunden= true
    then Result:= Farben[Zaehler].Hex
      else Result:= '000000';

end;

end.
