object frmConsultaPedido: TfrmConsultaPedido
  Left = 0
  Top = 0
  Caption = 'Consulta de pedidos'
  ClientHeight = 251
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object dbgrdCliente: TDBGrid
    Left = 0
    Top = 69
    Width = 399
    Height = 182
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'numeropedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataemissao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valortotal'
        Visible = True
      end>
  end
  object btnInserir: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 1
    OnClick = btnInserirClick
  end
  object btnPesquisa: TButton
    Left = 316
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btnPesquisaClick
  end
  object edtConsulta: TEdit
    Left = 120
    Top = 39
    Width = 194
    Height = 23
    TabOrder = 3
  end
  object btnVisualizar: TButton
    Left = 89
    Top = 8
    Width = 104
    Height = 25
    Caption = 'VisualizarPedido'
    TabOrder = 4
    OnClick = btnVisualizarClick
  end
  object cbbTipoConsulta: TComboBox
    Left = 9
    Top = 39
    Width = 105
    Height = 23
    ItemIndex = 0
    TabOrder = 5
    Text = 'C'#243'digo'
    Items.Strings = (
      'C'#243'digo'
      'Cliente')
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 52
    Top = 107
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 52
    Top = 147
    object FDMemTable1numeropedido: TIntegerField
      FieldName = 'numeropedido'
    end
    object FDMemTable1codigocliente: TIntegerField
      FieldName = 'codigocliente'
    end
    object FDMemTable1nome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object FDMemTable1dataemissao: TDateTimeField
      FieldName = 'dataemissao'
    end
    object FDMemTable1valortodal: TCurrencyField
      FieldName = 'valortotal'
    end
  end
end
