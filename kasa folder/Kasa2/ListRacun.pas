unit ListRacun;

interface

  uses Classes, RacunData, Dialogs;

  Type
  TListRacun = class

  private
    FListRacuni : TList;
  protected
  public
    constructor Create;
    procedure Add(pRacunData : TRacunData);
    procedure Remove(Index : Integer);
    function Count : Integer;
    function GetData(Index : Integer) : TRacunData;
  published

  end;

implementation

uses SysUtils;

constructor TListRacun.Create;
begin
  inherited Create;
  FListRacuni := TList.Create;
end;

function TListRacun.Count : Integer;
begin
  Result := FListRacuni.Count;
end;

procedure TListRacun.Add(pRacunData: TRacunData);
begin
  FListRacuni.Add(pRacunData);
end;

procedure TListRacun.Remove(Index : Integer);
begin
  if Index < Count then
    FListRacuni.Delete(Index)
  else
    ShowMessage('Error : TListRacuni');
end;

function TListRacun.GetData(Index : Integer) : TRacunData;
begin
  Result := FListRacuni[Index];
end;


end.
