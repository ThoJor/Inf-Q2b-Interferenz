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

  //Schriftgroesse/ -art/ -farbe
  Ueberschrift= 20;
  Schrift= 12;
  Schriftart= 'Arial';
  Schriftfarbe= clBlack;


  KCheckBoxHoehe= 20;
  KCheckBoxWidth= 300;
  KAnzahlCheckboxen= 4;

  KLabelHoehe= 20;
  KLabelLeft= 10;
  KEditHoehe= 20;
  KEditLeft= 0;
  KPanelHoehe= 50;


implementation


end.
