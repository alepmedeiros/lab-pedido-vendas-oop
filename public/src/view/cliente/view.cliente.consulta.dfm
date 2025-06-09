object frmConsultaCliente: TfrmConsultaCliente
  Left = 0
  Top = 0
  Caption = 'Consulta cliente'
  ClientHeight = 239
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 13
  object dbgrdCliente: TDBGrid
    Left = 0
    Top = 39
    Width = 408
    Height = 200
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgrdClienteDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf'
        Width = 22
        Visible = True
      end>
  end
  object btnEditar: TButton
    Left = 170
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 1
    OnClick = btnEditarClick
  end
  object btnInserir: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 2
    OnClick = btnInserirClick
  end
  object btnPesquisa: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 3
    OnClick = btnPesquisaClick
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 52
    Top = 107
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'codigocidade'
        DataType = ftInteger
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'uf'
        DataType = ftString
        Size = 2
      end>
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
    Content = {
      414442531000000044020000FF00010001FF02FF03040016000000460044004D
      0065006D005400610062006C0065003100050016000000460044004D0065006D
      005400610062006C0065003100060000000000070000080032000000090000FF
      0AFF0B04000C00000063006F006400690067006F0005000C00000063006F0064
      00690067006F000C00010000000E000D000F0001100001110001120001130001
      14000115000C00000063006F006400690067006F00FEFF0B0400080000006E00
      6F006D0065000500080000006E006F006D0065000C00020000000E0016001700
      640000000F00011000011100011200011300011400011500080000006E006F00
      6D006500180064000000FEFF0B04001800000063006F006400690067006F0063
      006900640061006400650005001800000063006F006400690067006F00630069
      0064006100640065000C00030000000E000D000F000110000111000112000113
      000114000115001800000063006F006400690067006F00630069006400610064
      006500FEFF0B04000C00000063006900640061006400650005000C0000006300
      690064006100640065000C00040000000E0016001700640000000F0001100001
      11000112000113000114000115000C0000006300690064006100640065001800
      64000000FEFF0B04000400000075006600050004000000750066000C00050000
      000E0016001700020000000F0001100001110001120001130001140001150004
      00000075006600180002000000FEFEFF19FEFF1AFEFF1BFEFEFEFF1CFEFF1DFF
      1EFEFEFE0E004D0061006E0061006700650072001E0055007000640061007400
      650073005200650067006900730074007200790012005400610062006C006500
      4C006900730074000A005400610062006C00650008004E0061006D0065001400
      53006F0075007200630065004E0061006D0065000A0054006100620049004400
      240045006E0066006F0072006300650043006F006E0073007400720061006900
      6E00740073001E004D0069006E0069006D0075006D0043006100700061006300
      690074007900180043006800650063006B004E006F0074004E0075006C006C00
      140043006F006C0075006D006E004C006900730074000C0043006F006C007500
      6D006E00100053006F007500720063006500490044000E006400740049006E00
      7400330032001000440061007400610054007900700065001400530065006100
      720063006800610062006C006500120041006C006C006F0077004E0075006C00
      6C000800420061007300650014004F0041006C006C006F0077004E0075006C00
      6C0012004F0049006E0055007000640061007400650010004F0049006E005700
      68006500720065001A004F0072006900670069006E0043006F006C004E006100
      6D00650018006400740041006E007300690053007400720069006E0067000800
      530069007A006500140053006F007500720063006500530069007A0065001C00
      43006F006E00730074007200610069006E0074004C0069007300740010005600
      6900650077004C006900730074000E0052006F0077004C006900730074001800
      520065006C006100740069006F006E004C006900730074001C00550070006400
      61007400650073004A006F00750072006E0061006C000E004300680061006E00
      670065007300}
    object FDMemTable1codigo: TIntegerField
      FieldName = 'codigo'
    end
    object FDMemTable1nome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object FDMemTable1codigocidade: TIntegerField
      FieldName = 'codigocidade'
    end
    object FDMemTable1cidade: TStringField
      FieldName = 'cidade'
      Size = 100
    end
    object FDMemTable1uf: TStringField
      FieldName = 'uf'
      Size = 2
    end
  end
end
