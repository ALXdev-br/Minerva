inherited OrderCRUDView: TOrderCRUDView
  Caption = 'OrderCRUDView'
  ClientHeight = 700
  ClientWidth = 949
  OnDestroy = FormDestroy
  ExplicitTop = -202
  ExplicitWidth = 961
  ExplicitHeight = 763
  TextHeight = 15
  inherited StatusBar1: TStatusBar
    Top = 681
    Width = 949
    ExplicitTop = 672
    ExplicitWidth = 943
  end
  inherited TitleBarPanel1: TTitleBarPanel
    Width = 949
    ExplicitWidth = 943
    inherited StatusBar2: TStatusBar
      Width = 949
      ExplicitWidth = 943
    end
  end
  inherited CategoryPanelGroup1: TCategoryPanelGroup
    Height = 632
    ExplicitHeight = 623
    object CategoryPanel3: TCategoryPanel [0]
      Top = 428
      Caption = 'File Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 224
      object Button1: TButton
        Left = 0
        Top = 0
        Width = 243
        Height = 41
        Action = ActRecordItemNew
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 222
      end
      object Button2: TButton
        Left = 0
        Top = 41
        Width = 243
        Height = 41
        Action = ActRecordItemUpdate
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 222
      end
      object Button3: TButton
        Left = 0
        Top = 82
        Width = 243
        Height = 41
        Action = ActRecordItemSave
        Align = alTop
        TabOrder = 2
        ExplicitWidth = 222
      end
      object Button4: TButton
        Left = 0
        Top = 133
        Width = 243
        Height = 41
        Action = ActRecordItemDelete
        Align = alBottom
        TabOrder = 3
        ExplicitWidth = 222
      end
    end
    inherited CategoryPanel2: TCategoryPanel [1]
      Height = 75
      ExplicitHeight = 75
      inherited BtnPrint: TButton
        Width = 243
      end
    end
    inherited CategoryPanel1: TCategoryPanel [2]
      Caption = 'File Order'
      TabOrder = 2
      inherited BtnRecordUpdate: TButton
        Width = 243
      end
      inherited Panel1: TPanel
        Width = 243
        inherited Label1: TLabel
          Width = 243
          ExplicitWidth = 243
        end
        inherited Edit1: TEdit
          Width = 243
        end
        inherited BtnRecordFind: TButton
          Width = 243
        end
      end
      inherited BtnClose: TButton
        Width = 243
      end
      inherited CatPnGrpPnlDelete: TPanel
        Width = 243
        inherited BtnRecordDelete: TButton
          Width = 241
        end
      end
      inherited BtnRecordSave: TButton
        Width = 243
      end
      inherited BtnRecordNew: TButton
        Width = 243
      end
    end
  end
  inherited Panel2: TPanel
    Width = 700
    Height = 632
    ExplicitWidth = 694
    ExplicitHeight = 623
    inherited PgeCtrView: TPageControl
      Width = 698
      Height = 630
      ExplicitLeft = 1
      ExplicitWidth = 692
      ExplicitHeight = 621
      inherited TabSht_ListRecords: TTabSheet
        Caption = 'Orders'
        ExplicitWidth = 690
        ExplicitHeight = 600
        inherited DBGrid1: TDBGrid
          Width = 690
          Height = 575
        end
        inherited DBNavigator1: TDBNavigator
          Top = 575
          Width = 690
          Hints.Strings = ()
          ExplicitTop = 575
          ExplicitWidth = 690
        end
      end
      inherited TabSht_ListRecordsMasterDetail: TTabSheet
        Caption = 'Orders Items'
        ExplicitWidth = 690
        ExplicitHeight = 600
        inherited Splitter1: TSplitter
          Top = 389
          Width = 690
          ExplicitTop = 389
          ExplicitWidth = 685
        end
        inherited DBNavCRUDDetail: TDBNavigator
          Top = 575
          Width = 690
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel]
          Hints.Strings = ()
          ExplicitTop = 566
          ExplicitWidth = 684
        end
        inherited DBGrdCRUDDetail: TDBGrid
          Top = 398
          Width = 690
          Height = 177
          Columns = <
            item
              Alignment = taCenter
              Color = cl3DLight
              Expanded = False
              FieldName = 'cod_order'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Order Id'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Alignment = taCenter
              Color = cl3DLight
              Expanded = False
              FieldName = 'cod_item_order'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Id'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'cod_product'
              Title.Alignment = taCenter
              Title.Caption = 'Product Id'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Alignment = taCenter
              Color = cl3DLight
              Expanded = False
              FieldName = 'name'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Product'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 313
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'quantity'
              Title.Alignment = taCenter
              Title.Caption = 'Quantity'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 78
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'unit_price'
              Title.Alignment = taCenter
              Title.Caption = 'Unit Price'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 74
              Visible = True
            end
            item
              Alignment = taRightJustify
              Color = cl3DLight
              Expanded = False
              FieldName = 'total_item'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Total item'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 90
              Visible = True
            end>
        end
        inherited PnlCRUDMaster: TPanel
          Width = 690
          Height = 389
          ExplicitWidth = 684
          ExplicitHeight = 389
          inherited DBGrdCRUDMaster: TDBGrid
            Width = 688
            Height = 362
            Columns = <
              item
                Color = cl3DLight
                Expanded = False
                FieldName = 'cod_order'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Order Id'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'order_date'
                Title.Alignment = taCenter
                Title.Caption = 'Date'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cod_client'
                Title.Alignment = taCenter
                Title.Caption = 'Client Id'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 56
                Visible = True
              end
              item
                Color = cl3DLight
                Expanded = False
                FieldName = 'name'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Name'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 330
                Visible = True
              end
              item
                Color = cl3DLight
                Expanded = False
                FieldName = 'total_order'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Total'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 95
                Visible = True
              end>
          end
          inherited DBNavCRUDMaster: TDBNavigator
            Top = 363
            Width = 688
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel]
            Hints.Strings = ()
            ExplicitTop = 363
            ExplicitWidth = 682
          end
        end
      end
      inherited TabSht_FileRecord: TTabSheet
        Caption = 'Order Record'
        ExplicitWidth = 690
        ExplicitHeight = 600
      end
    end
  end
  inherited MainMnuModelBase: TMainMenu
    Left = 328
    Top = 152
    object este1: TMenuItem
      Caption = 'Teste'
      object Conectar1: TMenuItem
        Caption = 'Conectar'
      end
    end
  end
  inherited ActListModelBase: TActionList
    Top = 152
    inherited ActRecordPrint: TAction
      OnExecute = ActRecordPrintExecute
    end
    object ActRecordItemNew: TAction
      Category = 'Database Detail'
      Caption = 'New'
      OnExecute = ActRecordItemNewExecute
    end
    object ActRecordItemUpdate: TAction
      Category = 'Database Detail'
      Caption = 'Update'
      OnExecute = ActRecordItemUpdateExecute
    end
    object ActRecordItemSave: TAction
      Category = 'Database Detail'
      Caption = 'Save'
      OnExecute = ActRecordItemSaveExecute
    end
    object ActRecordItemDelete: TAction
      Category = 'Database Detail'
      Caption = 'Delete'
      OnExecute = ActRecordItemDeleteExecute
    end
  end
  inherited DtaSrcModelCRUDView: TDataSource
    Left = 323
    Top = 330
  end
  inherited DtaSrcCRUDDetail: TDataSource
    OnStateChange = DtaSrcCRUDDetailStateChange
    Left = 697
    Top = 537
  end
  inherited DtaSrcCRUDMaster: TDataSource
    OnStateChange = DtaSrcCRUDMasterStateChange
  end
end
