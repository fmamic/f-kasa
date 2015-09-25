unit RacunData;

interface

  Type
    TRacunData = class

    private
      { private declaration }
      FName : String;
      FID : String;
      FNumber : Double;
      FPrice : Double;
      FSum : Double;
      FTax : Double;
      FTaxPNP : Double;
      FNaknada : Double;
      FMjera : String;
      Fpopust : Double;
      FiznosPocetni : Double;
      FiznosPoreza : Double;
      Fiznospnp : Double;
      FiznosUkupno : Double;
      Fvrsta : String;
      Fnacin : String;
      FDobavljac : String;
      FPromjena : String;
      FpriceChange : Boolean;
      Frow : String;

    protected
      { protected declaration }
    public
      { public declaration }
      property iznosPocetni : Double read FiznosPocetni write FiznosPocetni;
      property iznosPoreza : Double read FiznosPoreza write FiznosPoreza;
      property iznospnp : Double read Fiznospnp write Fiznospnp;
      property iznosUkupno : Double read FiznosUkupno write FiznosUkupno;
      property Popust : Double read Fpopust write Fpopust;
      property Mjera : String read FMjera write FMjera;
      property Name : String read FName write FName;
      property ID : String read FID write FID;
      property Number : Double read FNumber write FNumber;
      property Price : Double read FPrice write FPrice;
      property Sum : Double read FSum write FSum;
      property Tax : Double read FTax write FTax;
      property TaxPNP : Double read FTaxPNP write FTaxPNP;
      property Naknada : Double read FNaknada write FNaknada;
      property Nacin : String read Fnacin write Fnacin;
      property Vrsta : String read Fvrsta write Fvrsta;
      property Promjena : String read FPromjena write FPromjena;
      property Dobavljac : String read FDobavljac write FDobavljac;
      property priceChange : Boolean read FpriceChange write FpriceChange;
      property row : String read Frow write Frow;

    published
      { published declaration }
  end;

implementation

end.
 