object frmConsultaCidade: TfrmConsultaCidade
  Left = 0
  Top = 0
  Caption = 'Consulta cidade'
  ClientHeight = 240
  ClientWidth = 406
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
    Width = 406
    Height = 201
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
        FieldName = 'cidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf'
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
      414442531000000076010000FF00010001FF02FF03040016000000460044004D
      0065006D005400610062006C0065003100050016000000460044004D0065006D
      005400610062006C0065003100060000000000070000080032000000090000FF
      0AFF0B04000C00000063006F006400690067006F0005000C00000063006F0064
      00690067006F000C00010000000E000D000F0001100001110001120001130001
      14000115000C00000063006F006400690067006F00FEFF0B04000C0000006300
      6900640061006400650005000C0000006300690064006100640065000C000200
      00000E0016001700640000000F00011000011100011200011300011400011500
      0C000000630069006400610064006500180064000000FEFF0B04000400000075
      006600050004000000750066000C00030000000E0016001700020000000F0001
      10000111000112000113000114000115000400000075006600180002000000FE
      FEFF19FEFF1AFEFF1BFEFEFEFF1CFEFF1DFF1EFEFEFE0E004D0061006E006100
      6700650072001E00550070006400610074006500730052006500670069007300
      74007200790012005400610062006C0065004C006900730074000A0054006100
      62006C00650008004E0061006D006500140053006F0075007200630065004E00
      61006D0065000A0054006100620049004400240045006E0066006F0072006300
      650043006F006E00730074007200610069006E00740073001E004D0069006E00
      69006D0075006D00430061007000610063006900740079001800430068006500
      63006B004E006F0074004E0075006C006C00140043006F006C0075006D006E00
      4C006900730074000C0043006F006C0075006D006E00100053006F0075007200
      63006500490044000E006400740049006E007400330032001000440061007400
      610054007900700065001400530065006100720063006800610062006C006500
      120041006C006C006F0077004E0075006C006C00080042006100730065001400
      4F0041006C006C006F0077004E0075006C006C0012004F0049006E0055007000
      640061007400650010004F0049006E00570068006500720065001A004F007200
      6900670069006E0043006F006C004E0061006D00650018006400740041006E00
      7300690053007400720069006E0067000800530069007A006500140053006F00
      7500720063006500530069007A0065001C0043006F006E007300740072006100
      69006E0074004C00690073007400100056006900650077004C00690073007400
      0E0052006F0077004C006900730074001800520065006C006100740069006F00
      6E004C006900730074001C0055007000640061007400650073004A006F007500
      72006E0061006C000E004300680061006E00670065007300}
    object FDMemTable1codigo: TIntegerField
      FieldName = 'codigo'
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
