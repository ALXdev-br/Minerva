object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'Minerva - AJCP'
  ClientHeight = 511
  ClientWidth = 770
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMnu
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 492
    Width = 770
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Teste de Alexandre Pedro'
    ExplicitTop = 483
    ExplicitWidth = 764
  end
  object MainMnu: TMainMenu
    Left = 224
    Top = 40
    object MnuFile: TMenuItem
      Caption = 'File'
      object MnuFileClose: TMenuItem
        Caption = 'Close'
        OnClick = MnuFileCloseClick
      end
    end
    object MnuRecord: TMenuItem
      Caption = 'Record'
      object MnuRecordClient: TMenuItem
        Caption = 'Client'
        OnClick = MnuRecordClientClick
      end
      object MnuRecordProduct: TMenuItem
        Caption = 'Product'
        OnClick = MnuRecordProductClick
      end
    end
    object MnuInvoice: TMenuItem
      Caption = 'Invoice'
      object MnuInvoiceOrder: TMenuItem
        Caption = 'Order'
        OnClick = MnuInvoiceOrderClick
      end
    end
    object MnuReport: TMenuItem
      Caption = 'Report'
      object MnuRptClient: TMenuItem
        Caption = 'Client'
        OnClick = MnuRptClientClick
      end
    end
  end
end
