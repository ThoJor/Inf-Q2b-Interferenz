unit Konstantenbox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Math;

const
  KLichtgeschwindigkeit= 299792458;

  //Feste Wellenlaengenzuordnung fuer bestimmte Farben
  KViolett= 0.00000041;
  KBlau= 0.00000046;
  KGruen= 0.00000053;
  KGelb= 0.000000585;
  KOrange= 0.00000062;
  KRot= 0.000000705;

  //Objekte
  KAnzahlCheckboxen= 4;
  KEditLeft= 0;

  //Schrift
  Schriftart= 'Arial';
  Schriftfarbe= clBlack;

var
  //Objekte
  KCheckBoxHoehe: ShortInt; //Screen.Height div 54;
  KCheckBoxWidth: ShortInt; //Screen.Width div 6;
  KLabelHoehe: ShortInt; //Screen.Height div 54;
  KLabelLeft: ShortInt; //Screen.Width div 192;
  KEditHoehe: ShortInt; //Screen.Height div 54;
  KPanelHoehe: ShortInt; //Screen.Height div 22;

  //Schrift
  Ueberschrift: ShortInt; //Screen.Width div 96;
  Schrift: ShortInt; //Screen.Width div 160;


implementation


end.
