unit UFarbtabelle;

interface

implementation

procedure Farbtabelle;
var Farben: Array[1..63,0..1] of string;       //2D Statisches Array mit 63 Zeilen und 2 Spalten
begin
  Farben[1,0]:='ff0055';  Farben[1,1]:='678.37';
  Farben[2,0]:='ff0041';  Farben[2,1]:='626.39';
  Farben[3,0]:='ff002e';  Farben[3,1]:='617.40';
  Farben[4,0]:='ff001a';  Farben[4,1]:='613.38';
  Farben[5,0]:='ff0006';  Farben[5,1]:='611.71';
  Farben[6,0]:='ff0e00';  Farben[6,1]:='610.51';
  Farben[7,0]:='ff2200';  Farben[7,1]:='608.67';
  Farben[8,0]:='ff3600';  Farben[8,1]:='605.62';
  Farben[9,0]:='ff4a00';  Farben[9,1]:='602.00';
  Farben[10,0]:='ff5e00'; Farben[10,1]:='597.90';
  Farben[11,0]:='ff7200'; Farben[11,1]:='593.67';
  Farben[12,0]:='ff8600'; Farben[12,1]:='589.58';
  Farben[13,0]:='ff9a00'; Farben[13,1]:='585.72';
  Farben[14,0]:='ffae00'; Farben[14,1]:='582.07';
  Farben[15,0]:='ffc100'; Farben[15,1]:='578.88';
  Farben[16,0]:='ffd500'; Farben[16,1]:='575.82';
  Farben[17,0]:='ffe900'; Farben[17,1]:='573.02';
  Farben[18,0]:='fffd00'; Farben[18,1]:='570.59';
  Farben[19,0]:='edff00'; Farben[19,1]:='568.20';
  Farben[20,0]:='d9ff00'; Farben[20,1]:='565.84';
  Farben[21,0]:='c5ff00'; Farben[21,1]:='563.40';
  Farben[22,0]:='b1ff00'; Farben[22,1]:='561.03';
  Farben[23,0]:='9dff00'; Farben[23,1]:='558.72';
  Farben[24,0]:='89ff00'; Farben[24,1]:='556.54';
  Farben[25,0]:='75ff00'; Farben[25,1]:='554.63';
  Farben[26,0]:='61ff00'; Farben[26,1]:='552.84';
  Farben[27,0]:='4dff00'; Farben[27,1]:='551.44';
  Farben[28,0]:='39ff00'; Farben[28,1]:='550.39';
  Farben[29,0]:='25ff00'; Farben[29,1]:='549.64';
  Farben[30,0]:='11ff00'; Farben[30,1]:='549.17';
  Farben[31,0]:='00ff03'; Farben[31,1]:='548.93';
  Farben[32,0]:='00ff17'; Farben[32,1]:='548.63';
  Farben[33,0]:='00ff2b'; Farben[33,1]:='548.02';
  Farben[34,0]:='00ff3f'; Farben[34,1]:='546.97';
  Farben[35,0]:='00ff53'; Farben[35,1]:='545.35';
  Farben[36,0]:='00ff67'; Farben[36,1]:='542.69';
  Farben[37,0]:='00ff7b'; Farben[37,1]:='538.63';
  Farben[38,0]:='00ff8f'; Farben[38,1]:='532.18';
  Farben[39,0]:='00ffa3'; Farben[39,1]:='522.57';
  Farben[40,0]:='00ffb7'; Farben[40,1]:='512.17';
  Farben[41,0]:='00ffcb'; Farben[41,1]:='504.09';
  Farben[42,0]:='00ffdf'; Farben[42,1]:='498.28';
  Farben[43,0]:='00fff3'; Farben[43,1]:='493.63';
  Farben[44,0]:='00f7ff'; Farben[44,1]:='490.27';
  Farben[45,0]:='00e3ff'; Farben[45,1]:='486.80';
  Farben[46,0]:='00cfff'; Farben[46,1]:='484.00';
  Farben[47,0]:='00bbff'; Farben[47,1]:='481.08';
  Farben[48,0]:='00a7ff'; Farben[48,1]:='478.34';
  Farben[49,0]:='0093ff'; Farben[49,1]:='475.78';
  Farben[50,0]:='007fff'; Farben[50,1]:='473.19';
  Farben[51,0]:='006bff'; Farben[51,1]:='470.91';
  Farben[52,0]:='0057ff'; Farben[52,1]:='468.84';
  Farben[53,0]:='0043ff'; Farben[53,1]:='467.00';
  Farben[54,0]:='002fff'; Farben[54,1]:='465.77';
  Farben[55,0]:='001bff'; Farben[55,1]:='465.02';
  Farben[56,0]:='0007ff'; Farben[56,1]:='464.43';
  Farben[57,0]:='0d00ff'; Farben[57,1]:='464.02';
  Farben[58,0]:='2100ff'; Farben[58,1]:='463.30';
  Farben[59,0]:='3500ff'; Farben[59,1]:='461.97';
  Farben[60,0]:='4900ff'; Farben[60,1]:='459.89';
  Farben[61,0]:='5d00ff'; Farben[61,1]:='456.05';
  Farben[62,0]:='7100ff'; Farben[62,1]:='449.60';
  Farben[63,0]:='8500ff'; Farben[63,1]:='435.01';
end;

function Farbe(Wellenlaenge: string): string;
var
  Farbe_gefunden: Boolean;
  Zaehler: Integer;
begin
  //Variablen zurücksetzen
  Farbe_gefunden:= false;
  Zaehler:= 0;

  //Hexcode zur Wellenlaenge ermitteln
  repeat
  Inc(Zaehler);
  if Wellenlaenge= Farben[Zaehler,1] then Farbe_gefunden:= true;
  until (Zaehler= 63) or (Farbe_gefunden= true);

  //Wert an aufrufende Prozedur geben
  if Farbe_gefunden= true
    then Result:= Farben[Zaehler,0]
    else Result:= 'Nein';

end;

end.
