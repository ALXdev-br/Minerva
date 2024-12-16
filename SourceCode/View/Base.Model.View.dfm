inherited BaseModelView: TBaseModelView
  Caption = 'BaseModelView'
  ClientHeight = 442
  ClientWidth = 616
  Menu = MainMnuModelBase
  ExplicitWidth = 628
  ExplicitHeight = 505
  TextHeight = 15
  object MainMnuModelBase: TMainMenu
    Left = 288
    Top = 88
    object MnuFile: TMenuItem
      Caption = 'File'
      object MnuFileClose: TMenuItem
        Action = ActClose
      end
    end
  end
  object ActListModelBase: TActionList
    Left = 456
    Top = 88
    object ActClose: TAction
      Category = 'File'
      Caption = 'Close'
      OnExecute = ActCloseExecute
    end
    object ActRecordNew: TAction
      Category = 'Database'
      Caption = 'New'
    end
    object ActRecordUpdate: TAction
      Category = 'Database'
      Caption = 'Update'
    end
    object ActRecordFind: TAction
      Category = 'Database'
      Caption = 'Find'
    end
    object ActRecordDelete: TAction
      Category = 'Database'
      Caption = 'Delete'
    end
    object ActRecordPrint: TAction
      Category = 'Report'
      Caption = 'Print'
    end
  end
end
