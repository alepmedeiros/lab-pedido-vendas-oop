object DataModuleConnection: TDataModuleConnection
  Height = 262
  Width = 225
  object FDMConnection: TFDConnection
    Params.Strings = (
      'Database=C:\CursosDelphi\lab-pedido-vendas-oop\project\DB\OOP.db'
      'DriverID=SQLite')
    Left = 40
    Top = 30
  end
  object FDMTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 128
    Top = 33
  end
  object FDataSource: TDataSource
    Left = 37
    Top = 106
  end
  object FDquery2: TFDQuery
    Connection = FDMConnection
    Left = 154
    Top = 147
  end
end
