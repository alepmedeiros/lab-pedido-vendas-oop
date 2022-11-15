object DataModuleUnit: TDataModuleUnit
  OldCreateOrder = True
  Height = 480
  Width = 640
  object FDConexao: TFDConnection
    ConnectionName = 'SQLite'
    Params.Strings = (
      'LockingMode=Normal'
      'User_Name=silvab'
      
        'Database=Z:\Bruno\Documentos\Meus Projetos\lab-pedido-vendas-oop' +
        '\db\lab_pedido_loja.db'
      'DriverID=SQLite')
    Left = 56
    Top = 88
  end
  object DataSource: TDataSource
    DataSet = FDMemTable
    Left = 192
    Top = 328
  end
  object FDMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 192
    Top = 224
  end
  object FDMemTableAux: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 296
    Top = 224
  end
  object DataSourceAux: TDataSource
    DataSet = FDMemTableAux
    Left = 288
    Top = 336
  end
  object FDQuery: TFDQuery
    Connection = FDConexao
    Left = 56
    Top = 160
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 328
    Top = 112
  end
end
