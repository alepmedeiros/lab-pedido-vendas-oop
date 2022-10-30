object DataModuleConexao: TDataModuleConexao
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object FDConexao: TFDConnection
    ConnectionName = 'SQLite'
    Params.Strings = (
      
        'Database=C:\Users\bruno\Documentos\Meus Projetos\lab-pedido-vend' +
        'as-oop\_LabPedidoOOP_OLD\db\lab_pedido_loja.db'
      'LockingMode=Normal'
      'User_Name=silvab'
      'DriverID=SQLite')
    Left = 72
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
  object FDScriptCarregaTabelas: TFDScript
    SQLScripts = <
      item
      end>
    Connection = FDConexao
    Params = <>
    Macros = <>
    Left = 208
    Top = 96
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
end
