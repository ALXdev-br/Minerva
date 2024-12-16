inherited ModelCRUDView: TModelCRUDView
  Caption = 'ModelCRUDView'
  ClientHeight = 498
  ClientWidth = 974
  Position = poOwnerFormCenter
  ExplicitWidth = 992
  ExplicitHeight = 570
  TextHeight = 15
  object StatusBar1: TStatusBar [0]
    Left = 0
    Top = 479
    Width = 974
    Height = 19
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
    ExplicitTop = 487
    ExplicitWidth = 965
  end
  object TitleBarPanel1: TTitleBarPanel [1]
    Left = 0
    Top = 0
    Width = 974
    Height = 49
    CustomButtons = <>
    ExplicitWidth = 965
    object StatusBar2: TStatusBar
      Left = 0
      Top = 30
      Width = 980
      Height = 19
      Panels = <>
      ExplicitWidth = 965
    end
  end
  object CategoryPanelGroup1: TCategoryPanelGroup [2]
    Left = 0
    Top = 49
    Width = 249
    Height = 430
    VertScrollBar.Tracking = True
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -15
    HeaderFont.Name = 'Segoe UI'
    HeaderFont.Style = []
    TabOrder = 2
    ExplicitHeight = 439
    object CategoryPanel1: TCategoryPanel
      Top = 0
      Height = 353
      Caption = 'File'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 245
      object BtnRecordUpdate: TButton
        Left = 0
        Top = 130
        Width = 222
        Height = 41
        Action = ActRecordUpdate
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 222
        Height = 89
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 222
          Height = 17
          Align = alTop
          AutoSize = False
          Caption = 'Value to search'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 1
          ExplicitTop = -5
          ExplicitWidth = 220
        end
        object Edit1: TEdit
          Left = 0
          Top = 17
          Width = 222
          Height = 23
          Align = alTop
          Color = 13303807
          TabOrder = 0
          OnExit = Edit1Exit
          OnKeyPress = Edit1KeyPress
        end
        object BtnRecordFind: TButton
          Left = 0
          Top = 40
          Width = 222
          Height = 41
          Action = ActRecordFind
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object BtnClose: TButton
        Left = 0
        Top = 286
        Width = 222
        Height = 41
        Action = ActClose
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object CatPnGrpPnlDelete: TPanel
        Left = 0
        Top = 227
        Width = 222
        Height = 59
        Align = alBottom
        TabOrder = 2
        object BtnRecordDelete: TButton
          Left = 1
          Top = 1
          Width = 220
          Height = 41
          Action = ActRecordDelete
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object BtnRecordSave: TButton
        Left = 0
        Top = 171
        Width = 222
        Height = 41
        Action = ActRecordSave
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object BtnRecordNew: TButton
        Left = 0
        Top = 89
        Width = 222
        Height = 41
        Action = ActRecordNew
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
    end
    object CategoryPanel2: TCategoryPanel
      Top = 353
      Caption = 'Report'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 245
      object BtnPrint: TButton
        Left = 0
        Top = 0
        Width = 222
        Height = 41
        Action = ActRecordPrint
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel [3]
    Left = 249
    Top = 49
    Width = 725
    Height = 430
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 3
    ExplicitWidth = 716
    ExplicitHeight = 438
    object PgeCtrView: TPageControl
      Left = 1
      Top = 1
      Width = 729
      Height = 437
      ActivePage = TabSht_ListRecordsMasterDetail
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 6
      ExplicitWidth = 651
      ExplicitHeight = 424
      object TabSht_ListRecords: TTabSheet
        Caption = 'List Records'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 721
          Height = 382
          Align = alClient
          DataSource = DtaSrcModelCRUDView
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnKeyDown = DBGrid1KeyDown
          OnTitleClick = DBGrid1TitleClick
        end
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 382
          Width = 721
          Height = 25
          DataSource = DtaSrcModelCRUDView
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
          Align = alBottom
          TabOrder = 1
          ExplicitTop = 378
          ExplicitWidth = 666
        end
      end
      object TabSht_ListRecordsMasterDetail: TTabSheet
        Caption = 'List Records Master Detail'
        ImageIndex = 2
        object Splitter1: TSplitter
          Left = 0
          Top = 173
          Width = 721
          Height = 9
          Cursor = crVSplit
          Align = alTop
          ExplicitLeft = -10
          ExplicitTop = 195
          ExplicitWidth = 677
        end
        object DBNavCRUDDetail: TDBNavigator
          Left = 0
          Top = 382
          Width = 721
          Height = 25
          DataSource = DtaSrcCRUDDetail
          Align = alBottom
          TabOrder = 0
          ExplicitTop = 369
          ExplicitWidth = 643
        end
        object DBGrdCRUDDetail: TDBGrid
          Left = 0
          Top = 182
          Width = 721
          Height = 200
          Align = alClient
          BorderStyle = bsNone
          DataSource = DtaSrcCRUDDetail
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnKeyDown = DBGrdCRUDDetailKeyDown
          OnTitleClick = DBGrdCRUDDetailTitleClick
        end
        object PnlCRUDMaster: TPanel
          Left = 0
          Top = 0
          Width = 721
          Height = 173
          Align = alTop
          BevelOuter = bvSpace
          TabOrder = 2
          ExplicitWidth = 643
          object DBGrdCRUDMaster: TDBGrid
            Left = 1
            Top = 1
            Width = 719
            Height = 146
            Align = alClient
            BorderStyle = bsNone
            DataSource = DtaSrcCRUDMaster
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnKeyDown = DBGrdCRUDMasterKeyDown
            OnTitleClick = DBGrdCRUDMasterTitleClick
          end
          object DBNavCRUDMaster: TDBNavigator
            Left = 1
            Top = 147
            Width = 719
            Height = 25
            DataSource = DtaSrcCRUDMaster
            Align = alBottom
            TabOrder = 1
            ExplicitWidth = 641
          end
        end
      end
      object TabSht_FileRecord: TTabSheet
        Caption = 'File Record'
        ImageIndex = 2
      end
    end
  end
  inherited MainMnuModelBase: TMainMenu
    Left = 320
    inherited MnuFile: TMenuItem
      object Action11: TMenuItem [0]
        Action = ActRecordNew
      end
      object Find1: TMenuItem [1]
        Action = ActRecordFind
      end
      object Update1: TMenuItem [2]
        Action = ActRecordUpdate
      end
      object N1: TMenuItem [3]
        Caption = '-'
      end
      object Delete1: TMenuItem [4]
        Action = ActRecordDelete
      end
      object N2: TMenuItem [5]
        Caption = '-'
      end
    end
    object Print1: TMenuItem
      Action = ActRecordPrint
      Caption = 'Report'
      object Print2: TMenuItem
        Action = ActRecordPrint
      end
    end
  end
  inherited ActListModelBase: TActionList
    Left = 568
    Top = 112
    inherited ActRecordNew: TAction
      OnExecute = ActRecordNewExecute
    end
    inherited ActRecordUpdate: TAction
      OnExecute = ActRecordUpdateExecute
    end
    inherited ActRecordFind: TAction
      OnExecute = ActRecordFindExecute
    end
    inherited ActRecordDelete: TAction
      OnExecute = ActRecordDeleteExecute
    end
    object Action1: TAction
      Caption = 'Action1'
    end
    object ActRecordSave: TAction
      Category = 'Database'
      Caption = 'Save'
      OnExecute = ActRecordSaveExecute
    end
  end
  object DtaSrcModelCRUDView: TDataSource
    AutoEdit = False
    Left = 307
    Top = 162
  end
  object DtaSrcCRUDDetail: TDataSource
    AutoEdit = False
    Left = 865
    Top = 369
  end
  object DtaSrcCRUDMaster: TDataSource
    OnDataChange = DtaSrcCRUDMasterDataChange
    Left = 853
    Top = 129
  end
end
