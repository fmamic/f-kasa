unit EnterR1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TEnterR1Form=class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    OKButton: TSpeedButton;
    Label3: TLabel;
    Edit2: TEdit;
    SavePartnerButton: TSpeedButton;
    FindPartnerButton: TSpeedButton;
    procedure OKButtonClick(Sender : TObject);
    procedure FormKeyPress(Sender : TObject);
    procedure Edit1KeyUp(Sender : TObject);
    procedure SavePartnerButtonClick(Sender : TObject);
    procedure FindPartnerButtonClick(Sender : TObject);
    procedure FormKeyDown(Sender : TObject);
    procedure _PROC_004C1F8C(Sender : TObject);
    procedure _PROC_004C1FBC(Sender : TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end ;

var
  EnterR1Form: TEnterR1Form;

{This file is generated by DeDe Ver 3.50.02 Copyright (c) 1999-2002 DaFixer}

implementation

{$R *.DFM}

procedure TEnterR1Form.OKButtonClick(Sender : TObject);
begin
(*

* Reference to: forms.TCustomForm.Close(TCustomForm);
|
004C18C0   E82BD4F8FF             call    0044ECF0
004C18C5   C3                     ret

*)
end;

procedure TEnterR1Form.FormKeyPress(Sender : TObject);
begin
(*
004C18C8   55                     push    ebp
004C18C9   8BEC                   mov     ebp, esp
004C18CB   6A00                   push    $00
004C18CD   6A00                   push    $00
004C18CF   6A00                   push    $00
004C18D1   6A00                   push    $00
004C18D3   6A00                   push    $00
004C18D5   6A00                   push    $00
004C18D7   53                     push    ebx
004C18D8   56                     push    esi
004C18D9   57                     push    edi
004C18DA   8BF9                   mov     edi, ecx
004C18DC   8BF0                   mov     esi, eax
004C18DE   33C0                   xor     eax, eax
004C18E0   55                     push    ebp
004C18E1   680B1A4C00             push    $004C1A0B

***** TRY
|
004C18E6   64FF30                 push    dword ptr fs:[eax]
004C18E9   648920                 mov     fs:[eax], esp
004C18EC   803F0D                 cmp     byte ptr [edi], $0D
004C18EF   7545                   jnz     004C1936

* Reference to control TEnterR1Form.Edit1 : TEdit
|
004C18F1   8B86D8020000           mov     eax, [esi+$02D8]

* Possible reference to dynamic method TEdit.OFFS_FFB9
|
004C18F7   66BBB9FF               mov     bx, $FFB9

* Reference to: system.@CallDynaInst;
|
004C18FB   E8CC19F4FF             call    004032CC
004C1900   84C0                   test    al, al
004C1902   7432                   jz      004C1936
004C1904   8D55F8                 lea     edx, [ebp-$08]

* Reference to control TEnterR1Form.Edit1 : TEdit
|
004C1907   8B86D8020000           mov     eax, [esi+$02D8]

* Reference to: controls.TControl.GetText(TControl):TCaption;
|
004C190D   E8C622F7FF             call    00433BD8
004C1912   8B45F8                 mov     eax, [ebp-$08]
004C1915   8D55FC                 lea     edx, [ebp-$04]

* Reference to: Unit_00408BF0.Proc_00409AAC
|
004C1918   E88F81F4FF             call    00409AAC
004C191D   837DFC00               cmp     dword ptr [ebp-$04], +$00
004C1921   7413                   jz      004C1936

* Reference to control TEnterR1Form.Edit2 : TEdit
|
004C1923   8B86EC020000           mov     eax, [esi+$02EC]
004C1929   8B10                   mov     edx, [eax]

* Reference to method TEdit.SetFocus()
|
004C192B   FF92B0000000           call    dword ptr [edx+$00B0]
004C1931   E997000000             jmp     004C19CD
004C1936   803F0D                 cmp     byte ptr [edi], $0D
004C1939   7523                   jnz     004C195E

* Reference to control TEnterR1Form.Edit2 : TEdit
|
004C193B   8B86EC020000           mov     eax, [esi+$02EC]

* Possible reference to dynamic method TEdit.OFFS_FFB9
|
004C1941   66BBB9FF               mov     bx, $FFB9

* Reference to: system.@CallDynaInst;
|
004C1945   E88219F4FF             call    004032CC
004C194A   84C0                   test    al, al
004C194C   7410                   jz      004C195E

* Reference to control TEnterR1Form.Edit3 : TEdit
|
004C194E   8B86E0020000           mov     eax, [esi+$02E0]
004C1954   8B10                   mov     edx, [eax]

* Reference to method TEdit.SetFocus()
|
004C1956   FF92B0000000           call    dword ptr [edx+$00B0]
004C195C   EB6F                   jmp     004C19CD
004C195E   803F0D                 cmp     byte ptr [edi], $0D
004C1961   755B                   jnz     004C19BE

* Reference to control TEnterR1Form.Edit3 : TEdit
|
004C1963   8B86E0020000           mov     eax, [esi+$02E0]

* Possible reference to dynamic method TEdit.OFFS_FFB9
|
004C1969   66BBB9FF               mov     bx, $FFB9

* Reference to: system.@CallDynaInst;
|
004C196D   E85A19F4FF             call    004032CC
004C1972   84C0                   test    al, al
004C1974   7448                   jz      004C19BE
004C1976   8D55F0                 lea     edx, [ebp-$10]

* Reference to control TEnterR1Form.Edit1 : TEdit
|
004C1979   8B86D8020000           mov     eax, [esi+$02D8]

* Reference to: controls.TControl.GetText(TControl):TCaption;
|
004C197F   E85422F7FF             call    00433BD8
004C1984   8B45F0                 mov     eax, [ebp-$10]
004C1987   8D55F4                 lea     edx, [ebp-$0C]

* Reference to: Unit_00408BF0.Proc_00409AAC
|
004C198A   E81D81F4FF             call    00409AAC
004C198F   837DF400               cmp     dword ptr [ebp-$0C], +$00
004C1993   7429                   jz      004C19BE
004C1995   8D55E8                 lea     edx, [ebp-$18]

* Reference to control TEnterR1Form.Edit3 : TEdit
|
004C1998   8B86E0020000           mov     eax, [esi+$02E0]

* Reference to: controls.TControl.GetText(TControl):TCaption;
|
004C199E   E83522F7FF             call    00433BD8
004C19A3   8B45E8                 mov     eax, [ebp-$18]
004C19A6   8D55EC                 lea     edx, [ebp-$14]

* Reference to: Unit_00408BF0.Proc_00409AAC
|
004C19A9   E8FE80F4FF             call    00409AAC
004C19AE   837DEC00               cmp     dword ptr [ebp-$14], +$00
004C19B2   740A                   jz      004C19BE
004C19B4   C60700                 mov     byte ptr [edi], $00
004C19B7   8BC6                   mov     eax, esi

* Reference to: forms.TCustomForm.Close(TCustomForm);
|
004C19B9   E832D3F8FF             call    0044ECF0
004C19BE   803F1B                 cmp     byte ptr [edi], $1B
004C19C1   750A                   jnz     004C19CD
004C19C3   C60700                 mov     byte ptr [edi], $00
004C19C6   8BC6                   mov     eax, esi

* Reference to: forms.TCustomForm.Close(TCustomForm);
|
004C19C8   E823D3F8FF             call    0044ECF0
004C19CD   33C0                   xor     eax, eax
004C19CF   5A                     pop     edx
004C19D0   59                     pop     ecx
004C19D1   59                     pop     ecx
004C19D2   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[��]Í@'
|
004C19D5   68121A4C00             push    $004C1A12
004C19DA   8D45E8                 lea     eax, [ebp-$18]

* Reference to: system.@LStrClr(String;String);
|
004C19DD   E8CE24F4FF             call    00403EB0
004C19E2   8D45EC                 lea     eax, [ebp-$14]

* Reference to: system.@LStrClr(String;String);
|
004C19E5   E8C624F4FF             call    00403EB0
004C19EA   8D45F0                 lea     eax, [ebp-$10]

* Reference to: system.@LStrClr(String;String);
|
004C19ED   E8BE24F4FF             call    00403EB0
004C19F2   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: system.@LStrClr(String;String);
|
004C19F5   E8B624F4FF             call    00403EB0
004C19FA   8D45F8                 lea     eax, [ebp-$08]

* Reference to: system.@LStrClr(String;String);
|
004C19FD   E8AE24F4FF             call    00403EB0
004C1A02   8D45FC                 lea     eax, [ebp-$04]

* Reference to: system.@LStrClr(String;String);
|
004C1A05   E8A624F4FF             call    00403EB0
004C1A0A   C3                     ret


* Reference to: system.@HandleFinally;
|
004C1A0B   E9401EF4FF             jmp     00403850
004C1A10   EBC8                   jmp     004C19DA

****** END
|
004C1A12   5F                     pop     edi
004C1A13   5E                     pop     esi
004C1A14   5B                     pop     ebx
004C1A15   8BE5                   mov     esp, ebp
004C1A17   5D                     pop     ebp
004C1A18   C3                     ret

*)
end;

procedure TEnterR1Form.Edit1KeyUp(Sender : TObject);
begin
(*
004C1A1C   55                     push    ebp
004C1A1D   8BEC                   mov     ebp, esp
004C1A1F   6A00                   push    $00
004C1A21   6A00                   push    $00
004C1A23   53                     push    ebx
004C1A24   8BD8                   mov     ebx, eax
004C1A26   33C0                   xor     eax, eax
004C1A28   55                     push    ebp
004C1A29   68931A4C00             push    $004C1A93

***** TRY
|
004C1A2E   64FF30                 push    dword ptr fs:[eax]
004C1A31   648920                 mov     fs:[eax], esp
004C1A34   8D55F8                 lea     edx, [ebp-$08]

* Reference to control TEnterR1Form.Edit1 : TEdit
|
004C1A37   8B83D8020000           mov     eax, [ebx+$02D8]

* Reference to: controls.TControl.GetText(TControl):TCaption;
|
004C1A3D   E89621F7FF             call    00433BD8
004C1A42   8B45F8                 mov     eax, [ebp-$08]
004C1A45   8D55FC                 lea     edx, [ebp-$04]

* Reference to: Unit_00408BF0.Proc_00409AAC
|
004C1A48   E85F80F4FF             call    00409AAC
004C1A4D   8B45FC                 mov     eax, [ebp-$04]

* Reference to: system.@LStrLen:Integer;
|
004C1A50   E8DB26F4FF             call    00404130
004C1A55   85C0                   test    eax, eax
004C1A57   7E0F                   jle     004C1A68
004C1A59   B201                   mov     dl, $01

* Reference to control TEnterR1Form.SavePartnerButton : TSpeedButton
|
004C1A5B   8B83F0020000           mov     eax, [ebx+$02F0]
004C1A61   8B08                   mov     ecx, [eax]

* Reference to method TSpeedButton.SetEnabled(Boolean)
|
004C1A63   FF515C                 call    dword ptr [ecx+$5C]
004C1A66   EB0D                   jmp     004C1A75
004C1A68   33D2                   xor     edx, edx

* Reference to control TEnterR1Form.SavePartnerButton : TSpeedButton
|
004C1A6A   8B83F0020000           mov     eax, [ebx+$02F0]
004C1A70   8B08                   mov     ecx, [eax]

* Reference to method TSpeedButton.SetEnabled(Boolean)
|
004C1A72   FF515C                 call    dword ptr [ecx+$5C]
004C1A75   33C0                   xor     eax, eax
004C1A77   5A                     pop     edx
004C1A78   59                     pop     ecx
004C1A79   59                     pop     ecx
004C1A7A   648910                 mov     fs:[eax], edx

****** FINALLY
|
004C1A7D   689A1A4C00             push    $004C1A9A
004C1A82   8D45F8                 lea     eax, [ebp-$08]

* Reference to: system.@LStrClr(String;String);
|
004C1A85   E82624F4FF             call    00403EB0
004C1A8A   8D45FC                 lea     eax, [ebp-$04]

* Reference to: system.@LStrClr(String;String);
|
004C1A8D   E81E24F4FF             call    00403EB0
004C1A92   C3                     ret


* Reference to: system.@HandleFinally;
|
004C1A93   E9B81DF4FF             jmp     00403850
004C1A98   EBE8                   jmp     004C1A82

****** END
|
004C1A9A   5B                     pop     ebx
004C1A9B   59                     pop     ecx
004C1A9C   59                     pop     ecx
004C1A9D   5D                     pop     ebp
004C1A9E   C20400                 ret     $0004

*)
end;

procedure TEnterR1Form.SavePartnerButtonClick(Sender : TObject);
begin
(*
004C1AA4   55                     push    ebp
004C1AA5   8BEC                   mov     ebp, esp
004C1AA7   B90C000000             mov     ecx, $0000000C
004C1AAC   6A00                   push    $00
004C1AAE   6A00                   push    $00
004C1AB0   49                     dec     ecx
004C1AB1   75F9                   jnz     004C1AAC
004C1AB3   51                     push    ecx
004C1AB4   53                     push    ebx
004C1AB5   56                     push    esi
004C1AB6   57                     push    edi
004C1AB7   8BD8                   mov     ebx, eax
004C1AB9   33C0                   xor     eax, eax
004C1ABB   55                     push    ebp
004C1ABC   68E81C4C00             push    $004C1CE8

***** TRY
|
004C1AC1   64FF30                 push    dword ptr fs:[eax]
004C1AC4   648920                 mov     fs:[eax], esp
004C1AC7   8D55F8                 lea     edx, [ebp-$08]

* Reference to control TEnterR1Form.Edit1 : TEdit
|
004C1ACA   8B83D8020000           mov     eax, [ebx+$02D8]

* Reference to: controls.TControl.GetText(TControl):TCaption;
|
004C1AD0   E80321F7FF             call    00433BD8
004C1AD5   8B45F8                 mov     eax, [ebp-$08]
004C1AD8   8D55FC                 lea     edx, [ebp-$04]

* Reference to: Unit_00408BF0.Proc_00409AAC
|
004C1ADB   E8CC7FF4FF             call    00409AAC
004C1AE0   A0F81C4C00             mov     al, byte ptr [$004C1CF8]
004C1AE5   50                     push    eax
004C1AE6   8D45E8                 lea     eax, [ebp-$18]
004C1AE9   8B55FC                 mov     edx, [ebp-$04]

* Reference to: system.@VarFromLStr(Variant;Variant;String);
|
004C1AEC   E8773AF4FF             call    00405568
004C1AF1   8D4DE8                 lea     ecx, [ebp-$18]

* Reference to TForm1 instance
|
004C1AF4   A1B4404E00             mov     eax, dword ptr [$004E40B4]
004C1AF9   8B00                   mov     eax, [eax]

* Reference to control TForm1.PartnerTable : TADOTable
|
004C1AFB   8B80BC030000           mov     eax, [eax+$03BC]

* Possible String Reference to: 'Partner_ID'
|
004C1B01   BA041D4C00             mov     edx, $004C1D04
004C1B06   8B30                   mov     esi, [eax]

* Reference to method TADOTable.Locate(string,Variant,TLocateOptions)
|
004C1B08   FF9638020000           call    dword ptr [esi+$0238]
004C1B0E   84C0                   test    al, al
004C1B10   7427                   jz      004C1B39

* Possible String Reference to: 'Kupac '
|
004C1B12   68181D4C00             push    $004C1D18
004C1B17   FF75FC                 push    dword ptr [ebp-$04]

* Possible String Reference to: ' ve� je upisan'
|
004C1B1A   68281D4C00             push    $004C1D28
004C1B1F   8D45E4                 lea     eax, [ebp-$1C]
004C1B22   BA03000000             mov     edx, $00000003

* Reference to: system.@LStrCatN;
|
004C1B27   E8C426F4FF             call    004041F0
004C1B2C   8B45E4                 mov     eax, [ebp-$1C]

* Reference to: MsgDlg.Proc_004A5E8C
|
004C1B2F   E85843FEFF             call    004A5E8C
004C1B34   E939010000             jmp     004C1C72
004C1B39   33C0                   xor     eax, eax
004C1B3B   55                     push    ebp
004C1B3C   683B1C4C00             push    $004C1C3B

***** TRY
|
004C1B41   64FF30                 push    dword ptr fs:[eax]
004C1B44   648920                 mov     fs:[eax], esp

* Reference to TForm1 instance
|
004C1B47   A1B4404E00             mov     eax, dword ptr [$004E40B4]
004C1B4C   8B00                   mov     eax, [eax]

* Reference to control TForm1.PartnerTable : TADOTable
|
004C1B4E   8B80BC030000           mov     eax, [eax+$03BC]

* Reference to: db.TDataSet.Append(TDataSet);
|
004C1B54   E84364FBFF             call    00477F9C
004C1B59   8D45D4                 lea     eax, [ebp-$2C]
004C1B5C   8B55FC                 mov     edx, [ebp-$04]

* Reference to: system.@VarFromLStr(Variant;Variant;String);
|
004C1B5F   E8043AF4FF             call    00405568
004C1B64   8D4DD4                 lea     ecx, [ebp-$2C]

* Reference to TForm1 instance
|
004C1B67   A1B4404E00             mov     eax, dword ptr [$004E40B4]
004C1B6C   8B00                   mov     eax, [eax]

* Reference to control TForm1.PartnerTable : TADOTable
|
004C1B6E   8B80BC030000           mov     eax, [eax+$03BC]

* Possible String Reference to: 'Partner_ID'
|
004C1B74   BA041D4C00             mov     edx, $004C1D04

* Reference to: db.TDataSet.SetFieldValue(TDataSet;AnsiString;Variant;Variant);
|
004C1B79   E8EA4BFBFF             call    00476768
004C1B7E   8D55BC                 lea     edx, [ebp-$44]

* Reference to control TEnterR1Form.Edit2 : TEdit
|
004C1B81   8B83EC020000           mov     eax, [ebx+$02EC]

* Reference to: controls.TControl.GetText(TControl):TCaption;
|
004C1B87   E84C20F7FF             call    00433BD8
004C1B8C   8B45BC                 mov     eax, [ebp-$44]
004C1B8F   8D55C0                 lea     edx, [ebp-$40]

* Reference to: Unit_00408BF0.Proc_00409AAC
|
004C1B92   E8157FF4FF             call    00409AAC
004C1B97   8B55C0                 mov     edx, [ebp-$40]
004C1B9A   8D45C4                 lea     eax, [ebp-$3C]

* Reference to: system.@VarFromLStr(Variant;Variant;String);
|
004C1B9D   E8C639F4FF             call    00405568
004C1BA2   8D4DC4                 lea     ecx, [ebp-$3C]

* Reference to TForm1 instance
|
004C1BA5   A1B4404E00             mov     eax, dword ptr [$004E40B4]
004C1BAA   8B00                   mov     eax, [eax]

* Reference to control TForm1.PartnerTable : TADOTable
|
004C1BAC   8B80BC030000           mov     eax, [eax+$03BC]

* Possible String Reference to: 'Partner_Address'
|
004C1BB2   BA401D4C00             mov     edx, $004C1D40

* Reference to: db.TDataSet.SetFieldValue(TDataSet;AnsiString;Variant;Variant);
|
004C1BB7   E8AC4BFBFF             call    00476768
004C1BBC   8D55A4                 lea     edx, [ebp-$5C]

* Reference to control TEnterR1Form.Edit3 : TEdit
|
004C1BBF   8B83E0020000           mov     eax, [ebx+$02E0]

* Reference to: controls.TControl.GetText(TControl):TCaption;
|
004C1BC5   E80E20F7FF             call    00433BD8
004C1BCA   8B45A4                 mov     eax, [ebp-$5C]
004C1BCD   8D55A8                 lea     edx, [ebp-$58]

* Reference to: Unit_00408BF0.Proc_00409AAC
|
004C1BD0   E8D77EF4FF             call    00409AAC
004C1BD5   8B55A8                 mov     edx, [ebp-$58]
004C1BD8   8D45AC                 lea     eax, [ebp-$54]

* Reference to: system.@VarFromLStr(Variant;Variant;String);
|
004C1BDB   E88839F4FF             call    00405568
004C1BE0   8D4DAC                 lea     ecx, [ebp-$54]

* Reference to TForm1 instance
|
004C1BE3   A1B4404E00             mov     eax, dword ptr [$004E40B4]
004C1BE8   8B00                   mov     eax, [eax]

* Reference to control TForm1.PartnerTable : TADOTable
|
004C1BEA   8B80BC030000           mov     eax, [eax+$03BC]

* Possible String Reference to: 'Partner_VATNumber'
|
004C1BF0   BA581D4C00             mov     edx, $004C1D58

* Reference to: db.TDataSet.SetFieldValue(TDataSet;AnsiString;Variant;Variant);
|
004C1BF5   E86E4BFBFF             call    00476768

* Reference to TForm1 instance
|
004C1BFA   A1B4404E00             mov     eax, dword ptr [$004E40B4]
004C1BFF   8B00                   mov     eax, [eax]

* Reference to control TForm1.PartnerTable : TADOTable
|
004C1C01   8B80BC030000           mov     eax, [eax+$03BC]
004C1C07   8B10                   mov     edx, [eax]

* Reference to method TADOTable.Post()
|
004C1C09   FF9240020000           call    dword ptr [edx+$0240]

* Possible String Reference to: 'Partner '
|
004C1C0F   68741D4C00             push    $004C1D74
004C1C14   FF75FC                 push    dword ptr [ebp-$04]

* Possible String Reference to: ' uspje�no spremljen'
|
004C1C17   68881D4C00             push    $004C1D88
004C1C1C   8D45A0                 lea     eax, [ebp-$60]
004C1C1F   BA03000000             mov     edx, $00000003

* Reference to: system.@LStrCatN;
|
004C1C24   E8C725F4FF             call    004041F0
004C1C29   8B45A0                 mov     eax, [ebp-$60]

* Reference to: MsgDlg.Proc_004A6050
|
004C1C2C   E81F44FEFF             call    004A6050
004C1C31   33C0                   xor     eax, eax
004C1C33   5A                     pop     edx
004C1C34   59                     pop     ecx
004C1C35   59                     pop     ecx
004C1C36   648910                 mov     fs:[eax], edx
004C1C39   EB37                   jmp     004C1C72

* Reference to: system.@HandleAnyException;
|
004C1C3B   E95C19F4FF             jmp     0040359C
004C1C40   8D459C                 lea     eax, [ebp-$64]
004C1C43   8B4DFC                 mov     ecx, [ebp-$04]

* Possible String Reference to: 'Ne mogu zapisati kupca '
|
004C1C46   BAA41D4C00             mov     edx, $004C1DA4

* Reference to: system.@LStrCat3;
|
004C1C4B   E82C25F4FF             call    0040417C
004C1C50   8B459C                 mov     eax, [ebp-$64]

* Reference to: MsgDlg.Proc_004A5E8C
|
004C1C53   E83442FEFF             call    004A5E8C

* Reference to TForm1 instance
|
004C1C58   A1B4404E00             mov     eax, dword ptr [$004E40B4]
004C1C5D   8B00                   mov     eax, [eax]

* Reference to control TForm1.PartnerTable : TADOTable
|
004C1C5F   8B80BC030000           mov     eax, [eax+$03BC]
004C1C65   8B10                   mov     edx, [eax]

* Reference to method TADOTable.Cancel()
|
004C1C67   FF9208020000           call    dword ptr [edx+$0208]

* Reference to: system.@DoneExcept;
|
004C1C6D   E8461DF4FF             call    004039B8

****** END
|
004C1C72   33C0                   xor     eax, eax
004C1C74   5A                     pop     edx
004C1C75   59                     pop     ecx
004C1C76   59                     pop     ecx
004C1C77   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[��]�'
|
004C1C7A   68EF1C4C00             push    $004C1CEF
004C1C7F   8D459C                 lea     eax, [ebp-$64]
004C1C82   BA02000000             mov     edx, $00000002

* Reference to: system.@LStrArrayClr;
|
004C1C87   E84822F4FF             call    00403ED4
004C1C8C   8D45A4                 lea     eax, [ebp-$5C]

* Reference to: system.@LStrClr(String;String);
|
004C1C8F   E81C22F4FF             call    00403EB0
004C1C94   8D45A8                 lea     eax, [ebp-$58]

* Reference to: system.@LStrClr(String;String);
|
004C1C97   E81422F4FF             call    00403EB0
004C1C9C   8D45AC                 lea     eax, [ebp-$54]

* Reference to: system.@VarClr;
|
004C1C9F   E85040F4FF             call    00405CF4
004C1CA4   8D45BC                 lea     eax, [ebp-$44]

* Reference to: system.@LStrClr(String;String);
|
004C1CA7   E80422F4FF             call    00403EB0
004C1CAC   8D45C0                 lea     eax, [ebp-$40]

* Reference to: system.@LStrClr(String;String);
|
004C1CAF   E8FC21F4FF             call    00403EB0
004C1CB4   8D45C4                 lea     eax, [ebp-$3C]

* Reference to object Variant
|
004C1CB7   8B1514114000           mov     edx, [$00401114]
004C1CBD   B902000000             mov     ecx, $00000002

* Reference to: system.@FinalizeArray;
|
004C1CC2   E8492DF4FF             call    00404A10
004C1CC7   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: system.@LStrClr(String;String);
|
004C1CCA   E8E121F4FF             call    00403EB0
004C1CCF   8D45E8                 lea     eax, [ebp-$18]

* Reference to: system.@VarClr;
|
004C1CD2   E81D40F4FF             call    00405CF4
004C1CD7   8D45F8                 lea     eax, [ebp-$08]

* Reference to: system.@LStrClr(String;String);
|
004C1CDA   E8D121F4FF             call    00403EB0
004C1CDF   8D45FC                 lea     eax, [ebp-$04]

* Reference to: system.@LStrClr(String;String);
|
004C1CE2   E8C921F4FF             call    00403EB0
004C1CE7   C3                     ret


* Reference to: system.@HandleFinally;
|
004C1CE8   E9631BF4FF             jmp     00403850
004C1CED   EB90                   jmp     004C1C7F

****** END
|
004C1CEF   5F                     pop     edi
004C1CF0   5E                     pop     esi
004C1CF1   5B                     pop     ebx
004C1CF2   8BE5                   mov     esp, ebp
004C1CF4   5D                     pop     ebp
004C1CF5   C3                     ret

*)
end;

procedure TEnterR1Form.FindPartnerButtonClick(Sender : TObject);
begin
//(*
//004C1DBC   55                     push    ebp
//004C1DBD   8BEC                   mov     ebp, esp
//004C1DBF   B909000000             mov     ecx, $00000009
//004C1DC4   6A00                   push    $00
//004C1DC6   6A00                   push    $00
//004C1DC8   49                     dec     ecx
//004C1DC9   75F9                   jnz     004C1DC4
//004C1DCB   53                     push    ebx
//004C1DCC   8BD8                   mov     ebx, eax
//004C1DCE   33C0                   xor     eax, eax
//004C1DD0   55                     push    ebp
//004C1DD1   68F91E4C00             push    $004C1EF9

//***** TRY
//|
//004C1DD6   64FF30                 push    dword ptr fs:[eax]
//004C1DD9   648920                 mov     fs:[eax], esp

//* Reference to pointer to GlobalVar_004E59B4
//|
//004C1DDC   A1403D4E00             mov     eax, dword ptr [$004E3D40]
//004C1DE1   8B00                   mov     eax, [eax]
//004C1DE3   8B10                   mov     edx, [eax]

//* Possible reference to virtual method TGlobalVar_004E59B4.OFFS_00D8
//|
//004C1DE5   FF92D8000000           call    dword ptr [edx+$00D8]
//004C1DEB   48                     dec     eax
//004C1DEC   0F85BA000000           jnz     004C1EAC
//004C1DF2   8D4DE8                 lea     ecx, [ebp-$18]

//* Reference to TForm1 instance
//|
//004C1DF5   A1B4404E00             mov     eax, dword ptr [$004E40B4]
//004C1DFA   8B00                   mov     eax, [eax]

//* Reference to control TForm1.PartnerTable : TADOTable
//|
//004C1DFC   8B80BC030000           mov     eax, [eax+$03BC]

//* Possible String Reference to: 'Partner_ID'
//|
//004C1E02   BA101F4C00             mov     edx, $004C1F10

//* Reference to: db.TDataSet.GetFieldValue(TDataSet;AnsiString):Variant;
//|
//004C1E07   E84448FBFF             call    00476650
//004C1E0C   8D45E8                 lea     eax, [ebp-$18]
//004C1E0F   8D55F8                 lea     edx, [ebp-$08]

//* Reference to: system.VarToStr(Variant;Variant):String;
//|
//004C1E12   E8393FF4FF             call    00405D50
//004C1E17   8B45F8                 mov     eax, [ebp-$08]
//004C1E1A   8D55FC                 lea     edx, [ebp-$04]

//* Reference to: Unit_00408BF0.Proc_00409AAC
//|
//004C1E1D   E88A7CF4FF             call    00409AAC
//004C1E22   8B55FC                 mov     edx, [ebp-$04]

//* Reference to control TEnterR1Form.Edit1 : TEdit
//|
//004C1E25   8B83D8020000           mov     eax, [ebx+$02D8]

//* Reference to: controls.TControl.SetText(TControl;TCaption);
//|
//004C1E2B   E8D81DF7FF             call    00433C08
//004C1E30   8D4DD0                 lea     ecx, [ebp-$30]

//* Reference to TForm1 instance
//|
//004C1E33   A1B4404E00             mov     eax, dword ptr [$004E40B4]
//004C1E38   8B00                   mov     eax, [eax]

//* Reference to control TForm1.PartnerTable : TADOTable
//|
//004C1E3A   8B80BC030000           mov     eax, [eax+$03BC]

//* Possible String Reference to: 'Partner_Address'
//|
//004C1E40   BA241F4C00             mov     edx, $004C1F24

//* Reference to: db.TDataSet.GetFieldValue(TDataSet;AnsiString):Variant;
//|
//004C1E45   E80648FBFF             call    00476650
//004C1E4A   8D45D0                 lea     eax, [ebp-$30]
//004C1E4D   8D55E0                 lea     edx, [ebp-$20]

//* Reference to: system.VarToStr(Variant;Variant):String;
//|
//004C1E50   E8FB3EF4FF             call    00405D50
//004C1E55   8B45E0                 mov     eax, [ebp-$20]
//004C1E58   8D55E4                 lea     edx, [ebp-$1C]

//* Reference to: Unit_00408BF0.Proc_00409AAC
//|
//004C1E5B   E84C7CF4FF             call    00409AAC
//004C1E60   8B55E4                 mov     edx, [ebp-$1C]

//* Reference to control TEnterR1Form.Edit2 : TEdit
//|
//004C1E63   8B83EC020000           mov     eax, [ebx+$02EC]

//* Reference to: controls.TControl.SetText(TControl;TCaption);
//|
//004C1E69   E89A1DF7FF             call    00433C08
//004C1E6E   8D4DB8                 lea     ecx, [ebp-$48]

//* Reference to TForm1 instance
//|
//004C1E71   A1B4404E00             mov     eax, dword ptr [$004E40B4]
//004C1E76   8B00                   mov     eax, [eax]

//* Reference to control TForm1.PartnerTable : TADOTable
//|
//004C1E78   8B80BC030000           mov     eax, [eax+$03BC]

//* Possible String Reference to: 'Partner_VATNumber'
//|
//004C1E7E   BA3C1F4C00             mov     edx, $004C1F3C

//* Reference to: db.TDataSet.GetFieldValue(TDataSet;AnsiString):Variant;
//|
//004C1E83   E8C847FBFF             call    00476650
//004C1E88   8D45B8                 lea     eax, [ebp-$48]
//004C1E8B   8D55C8                 lea     edx, [ebp-$38]

//* Reference to: system.VarToStr(Variant;Variant):String;
//|
//004C1E8E   E8BD3EF4FF             call    00405D50
//004C1E93   8B45C8                 mov     eax, [ebp-$38]
//004C1E96   8D55CC                 lea     edx, [ebp-$34]

//* Reference to: Unit_00408BF0.Proc_00409AAC
//|
//004C1E99   E80E7CF4FF             call    00409AAC
//004C1E9E   8B55CC                 mov     edx, [ebp-$34]

//* Reference to control TEnterR1Form.Edit3 : TEdit
//|
//004C1EA1   8B83E0020000           mov     eax, [ebx+$02E0]
//
//* Reference to: controls.TControl.SetText(TControl;TCaption);
//|
//004C1EA7   E85C1DF7FF             call    00433C08
//004C1EAC   33C0                   xor     eax, eax
//004C1EAE   5A                     pop     edx
//004C1EAF   59                     pop     ecx
//004C1EB0   59                     pop     ecx
//004C1EB1   648910                 mov     fs:[eax], edx

//****** FINALLY
//|

//* Possible String Reference to: '[��]�'
//|
//004C1EB4   68001F4C00             push    $004C1F00
//004C1EB9   8D45B8                 lea     eax, [ebp-$48]

//* Reference to: system.@VarClr;
//|
//004C1EBC   E8333EF4FF             call    00405CF4
//004C1EC1   8D45C8                 lea     eax, [ebp-$38]
//004C1EC4   BA02000000             mov     edx, $00000002

//* Reference to: system.@LStrArrayClr;
//|
//004C1EC9   E80620F4FF             call    00403ED4
//004C1ECE   8D45D0                 lea     eax, [ebp-$30]

//* Reference to: system.@VarClr;
//|
//004C1ED1   E81E3EF4FF             call    00405CF4
//004C1ED6   8D45E0                 lea     eax, [ebp-$20]
//004C1ED9   BA02000000             mov     edx, $00000002

//* Reference to: system.@LStrArrayClr;
//|
//004C1EDE   E8F11FF4FF             call    00403ED4
//004C1EE3   8D45E8                 lea     eax, [ebp-$18]

//* Reference to: system.@VarClr;
//|
//004C1EE6   E8093EF4FF             call    00405CF4
//004C1EEB   8D45F8                 lea     eax, [ebp-$08]
//004C1EEE   BA02000000             mov     edx, $00000002

//* Reference to: system.@LStrArrayClr;
//|
//004C1EF3   E8DC1FF4FF             call    00403ED4
//004C1EF8   C3                     ret


//* Reference to: system.@HandleFinally;
//|
//004C1EF9   E95219F4FF             jmp     00403850
//004C1EFE   EBB9                   jmp     004C1EB9

//****** END
//|
//004C1F00   5B                     pop     ebx
//004C1F01   8BE5                   mov     esp, ebp
//004C1F03   5D                     pop     ebp
//004C1F04   C3                     ret

//*)
end;

procedure TEnterR1Form.FormKeyDown(Sender : TObject);
begin
(*
004C1F50   55                     push    ebp
004C1F51   8BEC                   mov     ebp, esp
004C1F53   53                     push    ebx
004C1F54   56                     push    esi
004C1F55   57                     push    edi
004C1F56   8BF9                   mov     edi, ecx
004C1F58   8BF0                   mov     esi, eax
004C1F5A   66833F70               cmp     word ptr [edi], +$70
004C1F5E   750F                   jnz     004C1F6F

* Reference to control TEnterR1Form.FindPartnerButton : TSpeedButton
|
004C1F60   8B86F4020000           mov     eax, [esi+$02F4]

* Possible reference to dynamic method TSpeedButton.OFFS_FFEC
|
004C1F66   66BBECFF               mov     bx, $FFEC

* Reference to: system.@CallDynaInst;
|
004C1F6A   E85D13F4FF             call    004032CC
004C1F6F   66833F71               cmp     word ptr [edi], +$71
004C1F73   750F                   jnz     004C1F84

* Reference to control TEnterR1Form.SavePartnerButton : TSpeedButton
|
004C1F75   8B86F0020000           mov     eax, [esi+$02F0]

* Possible reference to dynamic method TSpeedButton.OFFS_FFEC
|
004C1F7B   66BBECFF               mov     bx, $FFEC

* Reference to: system.@CallDynaInst;
|
004C1F7F   E84813F4FF             call    004032CC
004C1F84   5F                     pop     edi
004C1F85   5E                     pop     esi
004C1F86   5B                     pop     ebx
004C1F87   5D                     pop     ebp
004C1F88   C20400                 ret     $0004

*)
end;

procedure TEnterR1Form._PROC_004C1F8C(Sender : TObject);
begin
(*
004C1F8C   55                     push    ebp
004C1F8D   8BEC                   mov     ebp, esp
004C1F8F   33C0                   xor     eax, eax
004C1F91   55                     push    ebp
004C1F92   68B11F4C00             push    $004C1FB1

***** TRY
|
004C1F97   64FF30                 push    dword ptr fs:[eax]
004C1F9A   648920                 mov     fs:[eax], esp
004C1F9D   FF05C0594E00           inc     dword ptr [$004E59C0]
004C1FA3   33C0                   xor     eax, eax
004C1FA5   5A                     pop     edx
004C1FA6   59                     pop     ecx
004C1FA7   59                     pop     ecx
004C1FA8   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: ']Ë��-�YN'
|
004C1FAB   68B81F4C00             push    $004C1FB8
004C1FB0   C3                     ret


* Reference to: system.@HandleFinally;
|
004C1FB1   E99A18F4FF             jmp     00403850
004C1FB6   EBF8                   jmp     004C1FB0

****** END
|
004C1FB8   5D                     pop     ebp
004C1FB9   C3                     ret

*)
end;

procedure TEnterR1Form._PROC_004C1FBC(Sender : TObject);
begin
(*
004C1FBC   832DC0594E0001         sub     dword ptr [$004E59C0], +$01
004C1FC3   C3                     ret

*)
end;

end.