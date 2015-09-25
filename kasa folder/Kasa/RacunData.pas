unit RacunData;

interface

  Type
    TRacunData = class

    private
    FName : String;
    FID : Double;
    FNumber : Integer;
    FPrice : Double;
    FSum : Double;
    FTax : Double;
    FTaxPNP : Double;

      { private declaration }
    protected
      { protected declaration }
    public
      { public declaration }
      property Name : String read FName write FName;
      property ID : Double read FID write FID;
      property Number : Integer read FNumber write FNumber;
      property Price : Double read FPrice write FPrice;
      property Sum : Double read FSum write FSum;
      property Tax : Double read FTax write FTax;
      property TaxPNP : Double read FTaxPNP write FTaxPNP;

    published
      { published declaration }
  end;

implementation

end.
 