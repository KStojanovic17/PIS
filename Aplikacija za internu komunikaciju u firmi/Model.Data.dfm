object ModelData: TModelData
  OldCreateOrder = False
  Height = 327
  Width = 486
  object FDConnection: TFDConnection
    ConnectionName = 'IBLiteAppWiz'
    Params.Strings = (
      'DriverID=IBLite'
      'Password=masterkey'
      'User_Name=sysdba'
      'ExtendedMetadata=True'
      'CharacterSet=NONE')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 232
    Top = 24
  end
  object FDQueryGrid: TFDQuery
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexesActive = False
    ConnectionName = 'IBLiteAppWiz'
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE')
    Left = 140
    Top = 86
  end
  object BindSourceDB2: TBindSourceDB
    DataSet = FDQueryListView
    ScopeMappings = <>
    Left = 136
    Top = 152
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = FDQueryGrid
    ScopeMappings = <>
    Left = 56
    Top = 152
  end
  object FDQueryListView: TFDQuery
    IndexesActive = False
    ConnectionName = 'IBLiteAppWiz'
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE')
    Left = 220
    Top = 86
  end
end
