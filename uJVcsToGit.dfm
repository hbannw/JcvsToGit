object DbIsamToGit: TDbIsamToGit
  Left = 0
  Top = 0
  Caption = 'DbIsamToGit'
  ClientHeight = 690
  ClientWidth = 1128
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 36
    Top = 11
    Width = 71
    Height = 13
    Caption = 'Database path'
  end
  object Label2: TLabel
    Left = 36
    Top = 69
    Width = 118
    Height = 13
    Caption = 'Beginning of path to skip'
  end
  object Label3: TLabel
    Left = 36
    Top = 206
    Width = 48
    Height = 13
    Caption = 'Base path'
  end
  object Label4: TLabel
    Left = 402
    Top = 117
    Width = 42
    Height = 13
    Caption = 'Filename'
  end
  object Label5: TLabel
    Left = 402
    Top = 184
    Width = 42
    Height = 13
    Caption = 'Filename'
  end
  object Label6: TLabel
    Left = 608
    Top = 20
    Width = 80
    Height = 13
    Caption = 'Users and emails'
  end
  object Memo1: TMemo
    Left = 960
    Top = 39
    Width = 152
    Height = 187
    Lines.Strings = (
      'upgrade table blobs;'
      'upgrade table bugs;'
      'upgrade table '
      'DBARCHIVEVERSION;'
      'upgrade table FFAMILY;'
      'upgrade table groups;'
      'upgrade table labels;'
      'upgrade table logcomm;'
      'upgrade table mdbugs;'
      'upgrade table modules;'
      'upgrade table mstones;'
      'upgrade table pjbugs;'
      'upgrade table pjgroups;'
      'upgrade table pjmodule;'
      'upgrade table pjmstone;'
      'upgrade table pjref;'
      'upgrade table pjusers;'
      'upgrade table projects;'
      'upgrade table revision;'
      'upgrade table rvlabels;'
      'upgrade table todo;'
      'upgrade table transact;'
      'upgrade table users;'
      'upgrade table vcslog;')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btAnalysePath: TButton
    Left = 251
    Top = 8
    Width = 145
    Height = 25
    Caption = 'get all module path from DB'
    TabOrder = 1
    OnClick = btAnalysePathClick
  end
  object btGetDates: TButton
    Left = 251
    Top = 134
    Width = 145
    Height = 25
    Caption = 'export current line'
    TabOrder = 2
    OnClick = btGetDatesClick
  end
  object btExportBase: TButton
    Left = 251
    Top = 201
    Width = 145
    Height = 25
    Caption = 'Export base path'
    TabOrder = 4
    OnClick = btExportBaseClick
  end
  object Button1: TButton
    Left = 960
    Top = 8
    Width = 160
    Height = 25
    Caption = 'Convert Database'
    TabOrder = 10
    OnClick = Button1Click
  end
  object sgDates: TStringGrid
    Left = 319
    Top = 248
    Width = 801
    Height = 434
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
    TabOrder = 7
    ColWidths = (
      185
      231
      332)
  end
  object sgpath: TStringGrid
    Left = 8
    Top = 248
    Width = 305
    Height = 434
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    TabOrder = 8
    OnClick = sgpathClick
    ColWidths = (
      193
      77)
  end
  object sgUsers: TStringGrid
    Left = 608
    Top = 39
    Width = 346
    Height = 187
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 12
    OnClick = sgpathClick
    ColWidths = (
      87
      224)
  end
  object cbConvertDfm: TCheckBox
    Left = 402
    Top = 41
    Width = 151
    Height = 17
    Caption = 'Convert history Dfm to text '
    Checked = True
    State = cbChecked
    TabOrder = 13
  end
  object edBase: TEdit
    Left = 113
    Top = 203
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'c:\delphi\'
    OnChange = edBaseChange
  end
  object edPathFilename: TEdit
    Left = 402
    Top = 203
    Width = 193
    Height = 21
    TabOrder = 5
  end
  object edLineFilename: TEdit
    Left = 402
    Top = 136
    Width = 193
    Height = 21
    TabOrder = 6
  end
  object edDatabase: TEdit
    Left = 113
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'd:\DevData\BaseJvcs'
    OnChange = edBaseChange
  end
  object edTrunc: TEdit
    Left = 113
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 11
    Text = 'c:\delphi\'
    OnChange = edBaseChange
  end
  object cbNoBlobs: TCheckBox
    Left = 402
    Top = 64
    Width = 200
    Height = 17
    Caption = 'Do not export the blobs (Testing only)'
    TabOrder = 14
  end
  object tmodules: TDBISAMTable
    DatabaseName = 'Test'
    SessionName = 'Default'
    EngineVersion = '4.43 Build 1'
    TableName = 'modules'
    Left = 344
    Top = 552
  end
  object DBISAMDatabase1: TDBISAMDatabase
    EngineVersion = '4.43 Build 1'
    DatabaseName = 'test'
    Directory = 'D:\DevData\jvcsServer'
    SessionName = 'Default'
    Left = 344
    Top = 344
  end
  object DBISAMSession1: TDBISAMSession
    EngineVersion = '4.43 Build 1'
    PrivateDir = 'C:\Users\hb\AppData\Local\Temp\'
    RemoteEncryptionPassword = 'elevatesoft'
    RemoteAddress = '127.0.0.1'
    Left = 392
    Top = 344
  end
  object DBISAMQuery1: TDBISAMQuery
    DatabaseName = 'test'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      '')
    Params = <>
    Left = 344
    Top = 624
  end
  object tpjmodule: TDBISAMTable
    DatabaseName = 'Test'
    SessionName = 'Default'
    EngineVersion = '4.43 Build 1'
    TableName = 'pjmodule'
    Left = 392
    Top = 504
  end
  object tRevisions: TDBISAMTable
    DatabaseName = 'Test'
    SessionName = 'Default'
    EngineVersion = '4.43 Build 1'
    TableName = 'revision'
    Left = 392
    Top = 456
  end
  object tblobs: TDBISAMTable
    DatabaseName = 'Test'
    SessionName = 'Default'
    EngineVersion = '4.43 Build 1'
    TableName = 'blobs'
    Left = 392
    Top = 408
  end
  object tprojects: TDBISAMTable
    DatabaseName = 'Test'
    SessionName = 'Default'
    EngineVersion = '4.43 Build 1'
    TableName = 'projects'
    Left = 344
    Top = 408
  end
  object tUsers: TDBISAMTable
    DatabaseName = 'Test'
    SessionName = 'Default'
    EngineVersion = '4.43 Build 1'
    TableName = 'users'
    Left = 344
    Top = 456
  end
  object tvcslog: TDBISAMTable
    DatabaseName = 'Test'
    SessionName = 'Default'
    EngineVersion = '4.43 Build 1'
    TableName = 'vcslog'
    Left = 344
    Top = 504
  end
  object tlogcomm: TDBISAMTable
    DatabaseName = 'Test'
    SessionName = 'Default'
    EngineVersion = '4.43 Build 1'
    TableName = 'logcomm'
    Left = 392
    Top = 552
  end
end
