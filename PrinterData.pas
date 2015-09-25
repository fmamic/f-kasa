unit PrinterData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, RacunData, Unit16, StrUtils, Printers, WinSpool;

  Type
    TPrinterData = class

    private
      { private declaration }
      Fprinter : String;
      Ftitle1 : String;
      Fplacanje : String;
      Ftitle2 : String;
      Ftitle3 : String;
      Ffooter1 : String;
      Ffooter2 : String;
      Fdatum1 : String;
      Fdatum2 : String;
      Foib : String;
      FracunID : String;
      Fprostor : String;
      FnaplatniUr : String;
      Fukupno : String;
      Fname : String;
      Fvrsta : String;
      Fjir : String;
      Fzki : String;
      Ftotalnum : String;
      Fpetnum : String;
      Fstaklonum : String;
      Falfenum : String;
      Falfesum : String;
      Fpetsum : String;
      Fstaklosum : String;
      Ftotalsum : String;
      FracunList : TList;
      Fkupac : String;
      FkupacOIB : String;
      FkupacAdresa : String;

    protected
      { protected declaration }
    public
      { public declaration }
      property placanje : String read Fplacanje write Fplacanje;
      property printer : String read Fprinter write Fprinter;
      property title1 : String read Ftitle1 write Ftitle1;
      property title2 : String read Ftitle2 write Ftitle2;
      property title3 : String read Ftitle3 write Ftitle3;
      property datum1 : String read Fdatum1 write Fdatum1;
      property datum2 : String read Fdatum2 write Fdatum2;
      property oib : String read Foib write Foib;
      property racunID : String read FracunID write FracunID;
      property prostor : String read Fprostor write Fprostor;
      property naplatniUr : String read FnaplatniUr write FnaplatniUr;
      property ukupno : String read Fukupno write Fukupno;
      property name : String read Fname write Fname;
      property vrsta : String read Fvrsta write Fvrsta;
      property jir : String read Fjir write Fjir;
      property zki : String read Fzki write Fzki;
      property footer1 : String read Ffooter1 write Ffooter1;
      property footer2 : String read Ffooter2 write Ffooter2;
      property totalnum : String read Ftotalnum write Ftotalnum;
      property petnum : String read Fpetnum write Fpetnum;
      property alfenum : String read Falfenum write Falfenum;
      property staklonum : String read Fstaklonum write Fstaklonum;
      property staklosum : String read Fstaklosum write Fstaklosum;
      property alfesum : String read Falfesum write Falfesum;
      property petsum : String read Fpetsum write Fpetsum;
      property totalsum : String read Ftotalsum write Ftotalsum;
      property racunList : TList read FracunList write FracunList;
      property kupac : String read Fkupac write Fkupac;
      property kupacAdresa : String read FkupacAdresa write FkupacAdresa;
      property kupacOIB : String read FkupacOIB write FkupacOIB;

    published
      { published declaration }
  end;

implementation

end.

