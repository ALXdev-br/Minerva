inherited ClientViewPrototype: TClientViewPrototype
  Caption = 'Client'
  ClientWidth = 1064
  ExplicitWidth = 1076
  TextHeight = 15
  object Panel1: TPanel [0]
    Left = 8
    Top = 8
    Width = 1033
    Height = 401
    Caption = 'Panel1'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 32
      Top = 56
      Width = 793
      Height = 289
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object Edit1: TEdit
      Left = 32
      Top = 29
      Width = 121
      Height = 23
      TabOrder = 1
      Text = '*'
    end
    object Button2: TButton
      Left = 159
      Top = 27
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 750
      Top = 351
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 3
      OnClick = Button1Click
    end
    object DBNavigator1: TDBNavigator
      Left = 32
      Top = 351
      Width = 240
      Height = 25
      DataSource = DataSource1
      TabOrder = 4
    end
  end
  inherited MainMnuModelBase: TMainMenu
    Left = 920
    Top = 16
    inherited MnuFile: TMenuItem
      object New1: TMenuItem [0]
        Caption = 'New'
      end
      object Update1: TMenuItem [1]
        Caption = 'Update'
      end
      object Find1: TMenuItem [2]
        Caption = 'Find'
      end
      object Delete2: TMenuItem [3]
        Caption = '-'
      end
      object Delete1: TMenuItem [4]
        Caption = 'Delete'
      end
      object N1: TMenuItem [5]
        Caption = '-'
      end
    end
  end
  object DataSource1: TDataSource
    Left = 600
    Top = 64
  end
end
