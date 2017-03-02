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
  Farben[1].Hex:='000061';  Farben[1].WLaenge:= 780;
  Farben[2].Hex:='00006d';  Farben[2].WLaenge:= 775;
  Farben[3].Hex:='000077';  Farben[3].WLaenge:= 770;
  Farben[4].Hex:='000082';  Farben[4].WLaenge:= 765;
  Farben[5].Hex:='00008d';  Farben[5].WLaenge:= 760;
  Farben[6].Hex:='000097';  Farben[6].WLaenge:= 755;
  Farben[7].Hex:='0000a1';  Farben[7].WLaenge:= 750;
  Farben[8].Hex:='0000ab';  Farben[8].WLaenge:= 745;
  Farben[9].Hex:='0000b5';  Farben[9].WLaenge:= 740;
  Farben[10].Hex:='0000be'; Farben[10].WLaenge:= 735;
  Farben[11].Hex:='0000c8'; Farben[11].WLaenge:= 730;
  Farben[12].Hex:='0000d1'; Farben[12].WLaenge:= 725;
  Farben[13].Hex:='0000db'; Farben[13].WLaenge:= 720;
  Farben[14].Hex:='0000e4'; Farben[14].WLaenge:= 715;
  Farben[15].Hex:='0000ed'; Farben[15].WLaenge:= 710;
  Farben[16].Hex:='0000f6'; Farben[16].WLaenge:= 705;
  Farben[17].Hex:='0000ff'; Farben[17].WLaenge:= 700;
  Farben[18].Hex:='0000ff'; Farben[18].WLaenge:= 695;
  Farben[19].Hex:='0000ff'; Farben[19].WLaenge:= 690;
  Farben[20].Hex:='0000ff'; Farben[20].WLaenge:= 685;
  Farben[21].Hex:='0000ff'; Farben[21].WLaenge:= 680;
  Farben[22].Hex:='0000ff'; Farben[22].WLaenge:= 675;
  Farben[23].Hex:='0000ff'; Farben[23].WLaenge:= 670;
  Farben[24].Hex:='0000ff'; Farben[24].Wlaenge:= 665;
  Farben[25].Hex:='0000ff'; Farben[25].Wlaenge:= 660;
  Farben[26].Hex:='0000ff'; Farben[26].Wlaenge:= 655;
  Farben[27].Hex:='0000ff'; Farben[27].Wlaenge:= 650;
  Farben[28].Hex:='0000ff'; Farben[28].Wlaenge:= 645;
  Farben[29].Hex:='0021ff'; Farben[29].Wlaenge:= 640;
  Farben[30].Hex:='0039ff'; Farben[30].Wlaenge:= 635;
  Farben[31].Hex:='004fff'; Farben[31].Wlaenge:= 630;
  Farben[32].Hex:='0063ff'; Farben[32].Wlaenge:= 625;
  Farben[33].Hex:='0077ff'; Farben[33].Wlaenge:= 620;
  Farben[34].Hex:='0089ff'; Farben[34].Wlaenge:= 615;
  Farben[35].Hex:='009bff'; Farben[35].Wlaenge:= 610;
  Farben[36].Hex:='00adff'; Farben[36].Wlaenge:= 605;
  Farben[37].Hex:='00beff'; Farben[37].Wlaenge:= 600;
  Farben[38].Hex:='00cfff'; Farben[38].Wlaenge:= 595;
  Farben[39].Hex:='00dfff'; Farben[39].Wlaenge:= 590;
  Farben[40].Hex:='00efff'; Farben[40].Wlaenge:= 585;
  Farben[41].Hex:='ff00ff'; Farben[41].Wlaenge:= 580;
  Farben[42].Hex:='00fff0'; Farben[42].Wlaenge:= 575;
  Farben[43].Hex:='00ffe1'; Farben[43].Wlaenge:= 570;
  Farben[44].Hex:='00ffd2'; Farben[44].Wlaenge:= 565;
  Farben[45].Hex:='00ffc3'; Farben[45].Wlaenge:= 560;
  Farben[46].Hex:='00ffb3'; Farben[46].Wlaenge:= 555;
  Farben[47].Hex:='00ffa3'; Farben[47].Wlaenge:= 550;
  Farben[48].Hex:='00ff92'; Farben[48].Wlaenge:= 545;
  Farben[49].Hex:='00ff81'; Farben[49].Wlaenge:= 540;
  Farben[50].Hex:='00ff70'; Farben[50].Wlaenge:= 535;
  Farben[51].Hex:='00ff5e'; Farben[51].Wlaenge:= 530;
  Farben[52].Hex:='00ff4a'; Farben[52].Wlaenge:= 525;
  Farben[53].Hex:='00ff36'; Farben[53].Wlaenge:= 520;
  Farben[54].Hex:='00ff1f'; Farben[54].Wlaenge:= 515;
  Farben[55].Hex:='00ff00'; Farben[55].Wlaenge:= 510;
  Farben[56].Hex:='54ff00'; Farben[56].Wlaenge:= 505;
  Farben[57].Hex:='92ff00'; Farben[57].Wlaenge:= 500;
  Farben[58].Hex:='cbff00'; Farben[58].Wlaenge:= 495;
  Farben[59].Hex:='ffff00'; Farben[59].Wlaenge:= 490;
  Farben[60].Hex:='ffea00'; Farben[60].Wlaenge:= 485;
  Farben[61].Hex:='ffd500'; Farben[61].Wlaenge:= 480;
  Farben[62].Hex:='ffc000'; Farben[62].Wlaenge:= 475;
  Farben[63].Hex:='ffa900'; Farben[63].Wlaenge:= 470;
  Farben[64].Hex:='ff9200'; Farben[64].Wlaenge:= 465;
  Farben[65].Hex:='ff7b00'; Farben[65].Wlaenge:= 460;
  Farben[66].Hex:='ff6100'; Farben[66].Wlaenge:= 455;
  Farben[67].Hex:='ff4600'; Farben[67].Wlaenge:= 450;
  Farben[68].Hex:='ff2800'; Farben[68].Wlaenge:= 445;
  Farben[69].Hex:='ff0023'; Farben[69].Wlaenge:= 435;
  Farben[70].Hex:='ff003d'; Farben[70].Wlaenge:= 430;
  Farben[71].Hex:='ff0054'; Farben[71].Wlaenge:= 425;
  Farben[72].Hex:='ff006a'; Farben[72].Wlaenge:= 420;
  Farben[73].Hex:='ed0076'; Farben[73].Wlaenge:= 415;
  Farben[74].Hex:='db007e'; Farben[74].Wlaenge:= 410;
  Farben[75].Hex:='c80082'; Farben[75].Wlaenge:= 405;
  Farben[76].Hex:='b50083'; Farben[76].Wlaenge:= 400;
  Farben[77].Hex:='a10080'; Farben[77].Wlaenge:= 395;
  Farben[78].Hex:='8b0079'; Farben[78].Wlaenge:= 390;
  Farben[79].Hex:='77006f'; Farben[79].Wlaenge:= 385;
  Farben[80].Hex:='610061'; Farben[80].Wlaenge:= 380;
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
    if (Farben[Zaehler].WLaenge >= Round(Wellenlaenge)) and (Farben[Zaehler+1].WLaenge < Round(Wellenlaenge))
          then Farbe_gefunden:= true else Inc(Zaehler);
  until (Zaehler = 80) or (Farbe_gefunden = true);

  //Wert an aufrufende Prozedur geben
  if Farbe_gefunden= true
    then Result:= Farben[Zaehler].Hex
      else Result:= '000000';

end;

end.
