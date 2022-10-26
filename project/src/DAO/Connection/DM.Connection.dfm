object DataModuleConnection: TDataModuleConnection
  Height = 328
  Width = 281
  PixelsPerInch = 120
  object FDMConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\cursosDev\lab-alex\lab-pedido-vendas-oop\project\DB\' +
        'OOP.db'
      'DriverID=SQLite')
    Left = 50
    Top = 38
  end
  object FDMTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 41
  end
  object FDataSource: TDataSource
    Left = 46
    Top = 132
  end
end
