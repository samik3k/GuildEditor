object CfgForm: TCfgForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configuration Form'
  ClientHeight = 219
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 83
    Top = 110
    Width = 16
    Height = 16
    Picture.Data = {
      07544269746D617036030000424D360300000000000036000000280000001000
      0000100000000100180000000000000300000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF00808000FFFF
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686860080
      80008080FFFFFF008080FFFFFF00808000FFFF008080000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF86868600808000FFFFFFFFFFFFFFFF00808000FFFF
      008080008080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686860080
      80008080FFFFFF008080FFFFFF00808000FFFF008080000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF86868600808000FFFFFFFFFFFFFFFF00808000FFFF
      008080008080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686860080
      80008080FFFFFF008080FFFFFF00808000FFFF008080000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF86868600808000FFFFFFFFFFFFFFFF00808000FFFF
      008080008080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686860080
      80008080FFFFFF008080FFFFFF00808000FFFF008080000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF86868600808000FFFFFFFFFFFFFFFF00808000FFFF
      008080008080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686860080
      80008080FFFFFF008080FFFFFF008080FFFFFF008080000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF868686008080FFFFFF00FFFFFFFFFF00FFFFFFFFFF
      00FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686FFFF
      FF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF868686FFFFFF00FFFFFFFFFF00FFFFFFFFFF
      00FFFF868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF868686868686868686868686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF}
    Visible = False
  end
  object GroupBox2: TGroupBox
    Left = 127
    Top = 2
    Width = 299
    Height = 181
    Caption = 'Config Outras'
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Vers'#227'o:'
    end
    object Label6: TLabel
      Left = 8
      Top = 85
      Width = 98
      Height = 13
      Caption = 'Ancient +5 Stamina:'
    end
    object Label7: TLabel
      Left = 8
      Top = 50
      Width = 55
      Height = 13
      Caption = 'Max Guilds:'
    end
    object Label8: TLabel
      Left = 159
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Vers'#227'o:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label9: TLabel
      Left = 159
      Top = 40
      Width = 71
      Height = 13
      Caption = 'MG para 1.02d'
    end
    object Label10: TLabel
      Left = 159
      Top = 28
      Width = 126
      Height = 13
      Caption = 'WZ,CMT para 1.0n \ mods'
    end
    object Label11: TLabel
      Left = 159
      Top = 52
      Width = 66
      Height = 13
      Caption = 'MX para 1.02i'
    end
    object Label12: TLabel
      Left = 159
      Top = 64
      Width = 106
      Height = 13
      Caption = 'Outras para as outras'
    end
    object Label13: TLabel
      Left = 8
      Top = 153
      Width = 40
      Height = 13
      Caption = 'Ancient:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 159
      Top = 91
      Width = 55
      Height = 13
      Caption = 'Max Guilds:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 159
      Top = 104
      Width = 137
      Height = 33
      AutoSize = False
      Caption = 'Numero m'#225'ximo de guilds para o Guild Editor '
      WordWrap = True
    end
    object Label14: TLabel
      Left = 8
      Top = 119
      Width = 128
      Height = 13
      Caption = 'Ancient +10 Stamina Num:'
    end
    object Label18: TLabel
      Left = 54
      Top = 153
      Width = 99
      Height = 25
      AutoSize = False
      Caption = 'Valor no item pra ser Ancient +X Stamina'
      WordWrap = True
    end
    object ComboBox2: TComboBox
      Left = 8
      Top = 30
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'WZ,CMT'
      Items.Strings = (
        'WZ,CMT'
        'MG'
        'MX')
    end
    object Edit4: TEdit
      Left = 8
      Top = 99
      Width = 145
      Height = 21
      MaxLength = 2
      TabOrder = 1
      Text = '05'
    end
    object Edit5: TEdit
      Left = 8
      Top = 64
      Width = 145
      Height = 21
      TabOrder = 2
      Text = '10000'
    end
    object Button3: TButton
      Left = 159
      Top = 143
      Width = 130
      Height = 29
      Caption = 'Configurar'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Edit6: TEdit
      Left = 8
      Top = 133
      Width = 145
      Height = 21
      MaxLength = 2
      TabOrder = 4
      Text = '09'
    end
  end
  object GroupBox3: TGroupBox
    Left = 127
    Top = 4
    Width = 299
    Height = 181
    TabOrder = 3
    object Label17: TLabel
      Left = 20
      Top = 57
      Width = 261
      Height = 70
      AutoSize = False
      Caption = 'Escolha o que voc'#234' vai configurar ao lado!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
  end
  object GroupBox1: TGroupBox
    Left = 127
    Top = 4
    Width = 299
    Height = 181
    Caption = 'Config DNS'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 24
      Height = 13
      Caption = 'DNS:'
    end
    object Label2: TLabel
      Left = 8
      Top = 128
      Width = 50
      Height = 13
      Caption = 'Database:'
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 101
      Height = 13
      Caption = 'Usu'#225'rio(Padr'#227'o=sa):'
    end
    object Label4: TLabel
      Left = 160
      Top = 56
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object Edit1: TEdit
      Left = 8
      Top = 32
      Width = 281
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 43
      Top = 99
      Width = 209
      Height = 25
      Caption = 'Ler Databases do DNS'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Edit2: TEdit
      Left = 8
      Top = 72
      Width = 129
      Height = 21
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 160
      Top = 72
      Width = 129
      Height = 21
      TabOrder = 3
    end
    object Button2: TButton
      Left = 159
      Top = 143
      Width = 130
      Height = 29
      Caption = 'Configurar'
      TabOrder = 4
      OnClick = Button2Click
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 147
      Width = 145
      Height = 24
      Style = csOwnerDrawVariable
      Enabled = False
      ItemHeight = 18
      TabOrder = 5
      OnDrawItem = ComboBox1DrawItem
      OnMeasureItem = ComboBox1MeasureItem
    end
  end
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 113
    Height = 177
    ItemHeight = 13
    Items.Strings = (
      'MuOnline'
      'Me_MuOnline')
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object Button4: TButton
    Left = 269
    Top = 189
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    Visible = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 350
    Top = 189
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 5
    OnClick = Button5Click
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 32
    Top = 112
  end
end
