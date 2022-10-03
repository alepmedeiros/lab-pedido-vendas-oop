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
    Left = 200
    Top = 112
  end
  object DataSource: TDataSource
    DataSet = FDMemTable
    Left = 200
    Top = 336
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
    Left = 328
    Top = 184
  end
end
