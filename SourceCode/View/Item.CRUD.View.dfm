inherited ItemCRUDView: TItemCRUDView
  Caption = 'Item'
  ClientWidth = 965
  ExplicitWidth = 977
  ExplicitHeight = 561
  TextHeight = 15
  inherited StatusBar1: TStatusBar
    Width = 965
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
    ExplicitHeight = 421
  end
  inherited Panel2: TPanel
    Width = 716
    ExplicitWidth = 710
    inherited PgeCtrView: TPageControl
      Width = 714
      Height = 428
      ActivePage = TabSht_ListRecords
      ExplicitWidth = 708
      inherited TabSht_ListRecords: TTabSheet
        Caption = 'Items'
        ExplicitWidth = 706
        ExplicitHeight = 398
        inherited DBGrid1: TDBGrid
          Width = 706
          Height = 373
          Columns = <
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'cod_product'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Code ID'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
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
              Width = 163
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'description'
              Title.Alignment = taCenter
              Title.Caption = 'Description'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 253
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'price'
              Title.Alignment = taCenter
              Title.Caption = 'Price'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 97
              Visible = True
            end>
        end
        inherited DBNavigator1: TDBNavigator
          Top = 373
          Width = 706
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel]
          Hints.Strings = ()
          ExplicitWidth = 706
        end
      end
      inherited TabSht_ListRecordsMasterDetail: TTabSheet
        ExplicitWidth = 706
        ExplicitHeight = 398
        inherited Splitter1: TSplitter
          Width = 641
          ExplicitWidth = 671
        end
        inherited DBNavCRUDDetail: TDBNavigator
          Width = 641
          Hints.Strings = ()
          ExplicitWidth = 635
        end
        inherited DBGrdCRUDDetail: TDBGrid
          Width = 641
        end
        inherited PnlCRUDMaster: TPanel
          Width = 641
          ExplicitWidth = 635
          inherited DBGrdCRUDMaster: TDBGrid
            Width = 639
          end
          inherited DBNavCRUDMaster: TDBNavigator
            Width = 639
            Hints.Strings = ()
            ExplicitWidth = 633
          end
        end
      end
      inherited TabSht_FileRecord: TTabSheet
        Caption = 'Item Record'
        ExplicitWidth = 706
        ExplicitHeight = 398
      end
    end
  end
  inherited MainMnuModelBase: TMainMenu
    Left = 328
    Top = 176
  end
  inherited ActListModelBase: TActionList
    Top = 200
    inherited ActRecordPrint: TAction
      OnExecute = ActRecordPrintExecute
    end
  end
  inherited DtaSrcModelCRUDView: TDataSource
    Left = 691
    Top = 218
  end
end
