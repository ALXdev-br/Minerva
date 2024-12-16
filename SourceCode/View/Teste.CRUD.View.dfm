inherited TesteCRUDView: TTesteCRUDView
  Caption = 'TesteCRUDView'
  ClientWidth = 965
  ExplicitWidth = 977
  ExplicitHeight = 561
  TextHeight = 15
  inherited StatusBar1: TStatusBar
    Width = 965
  end
  inherited TitleBarPanel1: TTitleBarPanel
    Width = 965
    inherited StatusBar2: TStatusBar
      Width = 965
    end
  end
  inherited CategoryPanelGroup1: TCategoryPanelGroup
    ExplicitHeight = 421
  end
  inherited Panel2: TPanel
    Width = 716
    inherited PgeCtrView: TPageControl
      Width = 714
      Height = 428
      ExplicitWidth = 708
      inherited TabSht_ListRecords: TTabSheet
        ExplicitWidth = 706
        ExplicitHeight = 398
        inherited DBGrid1: TDBGrid
          Width = 677
        end
        inherited DBNavigator1: TDBNavigator
          Width = 677
          Hints.Strings = ()
          ExplicitWidth = 671
        end
      end
      inherited TabSht_ListRecordsMasterDetail: TTabSheet
        ExplicitWidth = 706
        ExplicitHeight = 398
        inherited Splitter1: TSplitter
          Width = 706
        end
        inherited DBNavCRUDDetail: TDBNavigator
          Top = 373
          Width = 706
          Hints.Strings = ()
        end
        inherited DBGrdCRUDDetail: TDBGrid
          Width = 706
          Height = 191
        end
        inherited PnlCRUDMaster: TPanel
          Width = 706
          inherited DBNavCRUDMaster: TDBNavigator
            Hints.Strings = ()
          end
        end
      end
      inherited TabSht_FileRecord: TTabSheet
        ExplicitWidth = 706
        ExplicitHeight = 398
      end
    end
  end
end
