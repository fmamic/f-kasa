object Glavna: TGlavna
  Left = 205
  Top = 240
  Width = 989
  Height = 563
  Caption = 'Fiskal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 981
    Height = 529
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Echo metoda'
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 72
        Height = 13
        Caption = 'Testna poruka:'
      end
      object Edit1: TEdit
        Left = 95
        Top = 13
        Width = 345
        Height = 21
        TabOrder = 0
        Text = 'Testna poruka'
      end
      object Button2: TButton
        Left = 446
        Top = 11
        Width = 75
        Height = 25
        Caption = 'Po'#353'alji Echo'
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Poslovni prostor'
      ImageIndex = 1
      object Label2: TLabel
        Left = 48
        Top = 32
        Width = 133
        Height = 13
        Caption = 'Oznaka poslovnog prostora:'
      end
      object Label10: TLabel
        Left = 111
        Top = 304
        Width = 71
        Height = 13
        Caption = 'Radno vrijeme:'
      end
      object Label11: TLabel
        Left = 64
        Top = 333
        Width = 118
        Height = 13
        Caption = 'Datum po'#269'etka primjene:'
      end
      object Label12: TLabel
        Left = 89
        Top = 358
        Width = 92
        Height = 13
        Caption = 'Oznaka zatvaranja:'
      end
      object Label13: TLabel
        Left = 88
        Top = 385
        Width = 96
        Height = 13
        Caption = 'Specifi'#269'na namjena:'
      end
      object Label3: TLabel
        Left = 48
        Top = 56
        Width = 398
        Height = 13
        Hint = 
          'Ako se radi o fiksnom prostoru onda mora biti upisana adresa a a' +
          'ko se rado o internet, pokretnoj i ostalo onda slobodan unos ??'
        Caption = 
          'Adresni podatak (jedno od ova dva mora biti popunjen (pogledaj h' +
          'int na ovoj labeli)) :'
        ParentShowHint = False
        ShowHint = True
      end
      object VOznakaPP: TEdit
        Left = 190
        Top = 29
        Width = 283
        Height = 21
        Hint = 'Maksimalno 20 znakova'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object vRadnoVrijemePP: TEdit
        Left = 190
        Top = 301
        Width = 667
        Height = 21
        Hint = 'Radno vrijeme poslovnog prostora. Max 1000 znakova.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object vDatumPrimjenePP: TDateTimePicker
        Left = 190
        Top = 328
        Width = 91
        Height = 21
        Hint = 'Datum otkad vrijedi promjena.'
        Date = 41213.657219629630000000
        Time = 41213.657219629630000000
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
      end
      object vOznakaZatvaranjaPP: TComboBox
        Left = 190
        Top = 355
        Width = 51
        Height = 21
        Hint = 
          'Podatak se dostavlja Poreznoj upravi samo ako se trajno zatvara ' +
          'poslovni prostor.'
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Items.Strings = (
          ''
          'Z')
      end
      object vSpecificnaNamjenaPP: TEdit
        Left = 190
        Top = 382
        Width = 507
        Height = 21
        Hint = 
          'Predvi'#273'eno za slu'#269'aj da se naknadno pojavi  potreba za dostavom ' +
          'podataka koji nisu prepoznati tokom analize. Max 1000 znakova.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object PageControl2: TPageControl
        Left = 190
        Top = 88
        Width = 667
        Height = 209
        ActivePage = TabSheet4
        TabOrder = 5
        object TabSheet4: TTabSheet
          Caption = 'Adresa (pogledaj hint na labeli iznad)'
          object Label4: TLabel
            Left = 15
            Top = 16
            Width = 27
            Height = 13
            Caption = 'Ulica:'
          end
          object Label5: TLabel
            Left = 15
            Top = 48
            Width = 50
            Height = 13
            Caption = 'Ku'#263'ni broj:'
          end
          object Label6: TLabel
            Left = 15
            Top = 75
            Width = 111
            Height = 13
            Caption = 'Dodatak ku'#263'nom broju:'
          end
          object Label7: TLabel
            Left = 14
            Top = 102
            Width = 50
            Height = 13
            Caption = 'Broj po'#353'te:'
          end
          object Label8: TLabel
            Left = 14
            Top = 129
            Width = 38
            Height = 13
            Caption = 'Naselje:'
          end
          object Label14: TLabel
            Left = 14
            Top = 156
            Width = 37
            Height = 13
            Caption = 'Op'#263'ina:'
          end
          object vDKBRPP: TEdit
            Left = 132
            Top = 67
            Width = 59
            Height = 21
            Hint = 'Maksimalno 4 znaka'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object vPrBostePP: TEdit
            Left = 132
            Top = 94
            Width = 147
            Height = 21
            Hint = 'Maksimalno 12 znakova'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object vNaseljePP: TEdit
            Left = 132
            Top = 121
            Width = 517
            Height = 21
            Hint = 'Maksimalno 35 znakova'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object vOpcinaPP: TEdit
            Left = 132
            Top = 148
            Width = 517
            Height = 21
            Hint = 'Maksimalno 35 znakova'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object vAdresaPP: TEdit
            Left = 132
            Top = 13
            Width = 517
            Height = 21
            Hint = 'Maksimalno 100 znakova'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object vKbrPP: TEdit
            Left = 132
            Top = 40
            Width = 59
            Height = 21
            Hint = 'Maksimalno 4 znaka'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Ostali tipovi poslovnog prostora'
          ImageIndex = 1
          object Label9: TLabel
            Left = 3
            Top = 11
            Width = 150
            Height = 13
            Caption = 'Ostali tipovi poslovnog prostora:'
          end
          object vOstaliTipoviPP: TEdit
            Left = 3
            Top = 30
            Width = 641
            Height = 21
            Hint = 
              'Predvi'#273'en je slobodan unos za specifi'#269'ne slu'#269'ajeve kada ne posto' +
              'ji adresa poslovnog prostora (Internet trgovina, pokretna trgovi' +
              'na i sl). Max 100 znakova.  '
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
      end
      object Button1: TButton
        Left = 674
        Top = 448
        Width = 179
        Height = 25
        Caption = '&Po'#353'alji poslovni prostor'
        TabOrder = 6
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Ra'#269'uni'
      ImageIndex = 2
      object Label15: TLabel
        Left = 57
        Top = 16
        Width = 96
        Height = 13
        Caption = 'U sustavu PDV-a:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 12
        Top = 46
        Width = 141
        Height = 13
        Caption = 'Datum izdavanja ra'#269'una:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 44
        Top = 70
        Width = 109
        Height = 13
        Caption = 'Oznaka slijedivosti:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 16
        Top = 98
        Width = 38
        Height = 13
        Caption = 'Ra'#269'un:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 152
        Top = 98
        Width = 57
        Height = 13
        Caption = 'Broj ra'#269'una:'
      end
      object Label20: TLabel
        Left = 75
        Top = 125
        Width = 133
        Height = 13
        Caption = 'Oznaka poslovnog prostora:'
      end
      object Label21: TLabel
        Left = 77
        Top = 153
        Width = 132
        Height = 13
        Caption = 'Oznaka naplatnog ure'#273'aja: '
      end
      object Label22: TLabel
        Left = 16
        Top = 178
        Width = 25
        Height = 13
        Caption = 'PDV:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 24
        Top = 326
        Width = 78
        Height = 13
        Caption = 'Ukupan iznos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label39: TLabel
        Left = 19
        Top = 353
        Width = 83
        Height = 13
        Caption = 'OIB operatera:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 19
        Top = 385
        Width = 195
        Height = 13
        Caption = 'Oznaka naknadne dostave ra'#269'una:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label41: TLabel
        Left = 19
        Top = 413
        Width = 137
        Height = 13
        Caption = 'Oznaka paragon ra'#269'una:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label42: TLabel
        Left = 19
        Top = 441
        Width = 137
        Height = 13
        Caption = 'Oznaka paragon ra'#269'una:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label43: TLabel
        Left = 272
        Top = 326
        Width = 84
        Height = 13
        Caption = 'Na'#269'in pla'#263'anja:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object vRacun_SustavPDV: TComboBox
        Left = 160
        Top = 13
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = 'DA'
        Items.Strings = (
          'DA'
          'NE')
      end
      object vRacun_Datum: TDateTimePicker
        Left = 160
        Top = 40
        Width = 91
        Height = 21
        Hint = 'Datum otkad vrijedi promjena.'
        Date = 41213.657219629630000000
        Time = 41213.657219629630000000
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
      end
      object vRacun_Slijedivost: TComboBox
        Left = 160
        Top = 67
        Width = 717
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = 'P - Slijednost ra'#269'una po poslovnom prostoru'
        Items.Strings = (
          'P - Slijednost ra'#269'una po poslovnom prostoru'
          
            'N - Slijedovost po naplatom ure'#273'aju ??? (pogledaj u komentarima ' +
            'fju. CIS_KreirajXMLRacun)'
          '')
      end
      object vRacun_BrojRacuna: TEdit
        Left = 215
        Top = 94
        Width = 206
        Height = 21
        TabOrder = 3
      end
      object vRacun_OznakaPP: TEdit
        Left = 215
        Top = 121
        Width = 206
        Height = 21
        TabOrder = 4
      end
      object vRacun_OznakaNapUredaja: TEdit
        Left = 215
        Top = 148
        Width = 206
        Height = 21
        TabOrder = 5
      end
      object PageControl3: TPageControl
        Left = 59
        Top = 172
        Width = 806
        Height = 145
        ActivePage = TabSheet10
        TabOrder = 6
        object TabSheet10: TTabSheet
          Caption = 'Oslobo'#273'enja'
          ImageIndex = 3
          object Label33: TLabel
            Left = 8
            Top = 8
            Width = 89
            Height = 13
            Caption = 'Iznos oslobo'#273'enja:'
          end
          object Label34: TLabel
            Left = 8
            Top = 36
            Width = 305
            Height = 13
            Caption = 
              'Iznos oslobo'#273'enja (poseban postupak - slike,antikni predmeti ...' +
              '):'
          end
          object Label35: TLabel
            Left = 10
            Top = 64
            Width = 169
            Height = 13
            Caption = 'Iznos koji ne podlije'#382'e oporezivanju:'
          end
        end
      end
      object vRacun_OIBOperatera: TEdit
        Left = 108
        Top = 350
        Width = 149
        Height = 21
        TabOrder = 7
      end
      object vRacun_OznakaNaknadno: TComboBox
        Left = 222
        Top = 381
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 8
        Text = 'NE'
        Items.Strings = (
          'NE'
          'DA')
      end
      object vRacun_OznakaParagon: TEdit
        Left = 162
        Top = 409
        Width = 703
        Height = 21
        TabOrder = 9
      end
      object vRacun_SpecificnaNamjena: TEdit
        Left = 162
        Top = 436
        Width = 703
        Height = 21
        TabOrder = 10
      end
      object Button3: TButton
        Left = 790
        Top = 468
        Width = 75
        Height = 25
        Caption = 'Po'#353'alji ra'#269'un'
        TabOrder = 12
      end
      object vRacun_NacinPlacanja: TComboBox
        Left = 362
        Top = 323
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 11
        Text = 'G - gotovina'
        Items.Strings = (
          'G - gotovina'
          'K - kartice'
          'C - '#269'ek'
          'T - transakcijski ra'#269'un'
          'O - ostalo')
      end
    end
    object TabSheet6: TTabSheet
      Caption = 
        'Obavezni parametri za fiskalizaciju '#353'alje ih se kao parametre u ' +
        'funkcije'
      ImageIndex = 3
      object Label44: TLabel
        Left = 96
        Top = 20
        Width = 116
        Height = 13
        Caption = 'Oib poslovnog korisnika:'
      end
      object Label45: TLabel
        Left = 64
        Top = 44
        Width = 142
        Height = 13
        Caption = 'Privatni klju'#269' sa ext '#39'fiskal.pfx'#39':'
      end
      object Label46: TLabel
        Left = 125
        Top = 72
        Width = 83
        Height = 13
        Caption = 'Password za .pfx:'
      end
      object Label47: TLabel
        Left = 139
        Top = 98
        Width = 69
        Height = 13
        Caption = 'Oib programer:'
      end
      object Label48: TLabel
        Left = 141
        Top = 128
        Width = 70
        Height = 13
        Caption = 'Oib blagajnika:'
      end
      object vOibKorisnika: TEdit
        Left = 218
        Top = 17
        Width = 151
        Height = 21
        TabOrder = 0
      end
      object vFiskalFileName: TEdit
        Left = 218
        Top = 44
        Width = 151
        Height = 21
        TabOrder = 1
        Text = 'fiskal.pfx'
      end
      object vFiskalPassword: TEdit
        Left = 218
        Top = 71
        Width = 151
        Height = 21
        TabOrder = 2
      end
      object vOibProgram: TEdit
        Left = 218
        Top = 98
        Width = 151
        Height = 21
        TabOrder = 3
      end
      object vOIBoperatera: TEdit
        Left = 218
        Top = 125
        Width = 151
        Height = 21
        TabOrder = 4
      end
    end
  end
end