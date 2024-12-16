inherited ClientCRUDView: TClientCRUDView
  Caption = 'Client'
  ClientWidth = 965
  ExplicitWidth = 977
  ExplicitHeight = 552
  TextHeight = 15
  inherited StatusBar1: TStatusBar
    Width = 965
    ExplicitTop = 461
    ExplicitWidth = 959
  end
  inherited TitleBarPanel1: TTitleBarPanel
    Width = 965
    ExplicitWidth = 959
    inherited StatusBar2: TStatusBar
      Width = 965
      ExplicitWidth = 959
    end
  end
  inherited CategoryPanelGroup1: TCategoryPanelGroup
    ExplicitHeight = 412
    inherited CategoryPanel1: TCategoryPanel
      ExplicitWidth = 224
    end
    inherited CategoryPanel2: TCategoryPanel
      ExplicitWidth = 224
    end
  end
  inherited Panel2: TPanel
    Width = 716
    ExplicitWidth = 710
    ExplicitHeight = 412
    inherited PgeCtrView: TPageControl
      Width = 714
      Height = 419
      ExplicitWidth = 708
      ExplicitHeight = 410
      inherited TabSht_ListRecords: TTabSheet
        Caption = 'Clients'
        ExplicitWidth = 706
        ExplicitHeight = 389
        inherited DBGrid1: TDBGrid
          Width = 706
          Height = 364
          Columns = <
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'cod_client'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Code ID'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'name'
              Title.Alignment = taCenter
              Title.Caption = 'Name'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 219
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'email'
              Title.Alignment = taCenter
              Title.Caption = 'e-Mail'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 175
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'phone'
              Title.Alignment = taCenter
              Title.Caption = 'Telephone'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'address'
              Title.Alignment = taCenter
              Title.Caption = 'Address'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 354
              Visible = True
            end>
        end
        inherited DBNavigator1: TDBNavigator
          Top = 364
          Width = 706
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel]
          Hints.Strings = ()
          ExplicitTop = 355
          ExplicitWidth = 700
        end
      end
      inherited TabSht_ListRecordsMasterDetail: TTabSheet
        ExplicitWidth = 706
        ExplicitHeight = 389
        inherited Splitter1: TSplitter
          Width = 706
          ExplicitWidth = 653
        end
        inherited DBNavCRUDDetail: TDBNavigator
          Top = 364
          Width = 706
          Hints.Strings = ()
          ExplicitWidth = 706
        end
        inherited DBGrdCRUDDetail: TDBGrid
          Width = 706
          Height = 182
        end
        inherited PnlCRUDMaster: TPanel
          Width = 706
          ExplicitWidth = 706
          inherited DBGrdCRUDMaster: TDBGrid
            Width = 704
          end
          inherited DBNavCRUDMaster: TDBNavigator
            Width = 704
            Hints.Strings = ()
            ExplicitWidth = 704
          end
        end
      end
      inherited TabSht_FileRecord: TTabSheet
        Caption = 'Client Record'
        ExplicitWidth = 706
        ExplicitHeight = 389
      end
    end
  end
  inherited MainMnuModelBase: TMainMenu
    Left = 328
    Top = 184
  end
  inherited ActListModelBase: TActionList
    Top = 152
    inherited ActRecordPrint: TAction
      OnExecute = ActRecordPrintExecute
    end
  end
  inherited DtaSrcModelCRUDView: TDataSource
    Left = 691
    Top = 186
  end
end
