object Form4: TForm4
  Left = 198
  Top = 106
  Caption = 'Criando Account'
  ClientHeight = 236
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object PaintBox1: TPaintBox
    Left = 7
    Top = 45
    Width = 145
    Height = 145
    Color = clCaptionText
    ParentColor = False
    OnMouseDown = PaintBox1MouseDown
    OnMouseMove = PaintBox1MouseMove
    OnMouseUp = PaintBox1MouseUp
  end
  object Edit1: TEdit
    Left = 44
    Top = 5
    Width = 108
    Height = 21
    MaxLength = 8
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 158
    Top = 5
    Width = 179
    Height = 84
    Caption = 'Selecionar Guild Master'
    TabOrder = 1
    object Label1: TLabel
      Left = 3
      Top = 24
      Width = 43
      Height = 13
      Caption = 'Account:'
    end
    object Label2: TLabel
      Left = 3
      Top = 51
      Width = 52
      Height = 13
      Caption = 'Character:'
    end
    object ComboBox1: TComboBox
      Left = 59
      Top = 21
      Width = 117
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 59
      Top = 48
      Width = 117
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 158
    Top = 95
    Width = 179
    Height = 137
    TabOrder = 2
    object BitBtn5: TBitBtn
      Left = 15
      Top = 33
      Width = 146
      Height = 21
      Caption = 'Criar'
      TabOrder = 0
      OnClick = BitBtn5Click
    end
    object BitBtn1: TBitBtn
      Left = 15
      Top = 60
      Width = 146
      Height = 21
      Caption = 'Criar e Editar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn6: TBitBtn
      Left = 15
      Top = 87
      Width = 146
      Height = 21
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = BitBtn6Click
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 196
    Width = 18
    Height = 18
    Color = 6710886
    TabOrder = 3
    OnClick = Panel1Click
    object PaintBox2: TPaintBox
      Left = 1
      Top = 1
      Width = 16
      Height = 16
      Align = alClient
      Color = clCaptionText
      ParentColor = False
    end
  end
  object Panel2: TPanel
    Left = 26
    Top = 196
    Width = 18
    Height = 18
    Color = clBlack
    TabOrder = 4
    OnClick = Panel1Click
  end
  object Panel3: TPanel
    Left = 44
    Top = 196
    Width = 18
    Height = 18
    Color = 9210509
    TabOrder = 5
    OnClick = Panel1Click
  end
  object Panel4: TPanel
    Left = 62
    Top = 196
    Width = 18
    Height = 18
    Color = clWhite
    TabOrder = 6
    OnClick = Panel1Click
  end
  object Panel5: TPanel
    Left = 26
    Top = 214
    Width = 18
    Height = 18
    Color = 9240321
    TabOrder = 7
    OnClick = Panel1Click
  end
  object Panel6: TPanel
    Left = 44
    Top = 214
    Width = 18
    Height = 18
    Color = clAqua
    TabOrder = 8
    OnClick = Panel1Click
  end
  object Panel7: TPanel
    Left = 62
    Top = 214
    Width = 18
    Height = 18
    Color = 16747008
    TabOrder = 9
    OnClick = Panel1Click
  end
  object Panel8: TPanel
    Left = 80
    Top = 214
    Width = 18
    Height = 18
    Color = 16646144
    TabOrder = 10
    OnClick = Panel1Click
  end
  object Panel9: TPanel
    Left = 98
    Top = 214
    Width = 18
    Height = 18
    Color = 16711820
    TabOrder = 11
    OnClick = Panel1Click
  end
  object Panel10: TPanel
    Left = 116
    Top = 214
    Width = 18
    Height = 18
    Color = 16711934
    TabOrder = 12
    OnClick = Panel1Click
  end
  object Panel11: TPanel
    Left = 134
    Top = 214
    Width = 18
    Height = 18
    Color = 9175295
    TabOrder = 13
    OnClick = Panel1Click
  end
  object Panel12: TPanel
    Left = 80
    Top = 196
    Width = 18
    Height = 18
    Color = 254
    TabOrder = 14
    OnClick = Panel1Click
  end
  object Panel13: TPanel
    Left = 98
    Top = 196
    Width = 18
    Height = 18
    Color = 35583
    TabOrder = 15
    OnClick = Panel1Click
  end
  object Panel14: TPanel
    Left = 116
    Top = 196
    Width = 18
    Height = 18
    Color = clYellow
    TabOrder = 16
    OnClick = Panel1Click
  end
  object Panel15: TPanel
    Left = 134
    Top = 196
    Width = 18
    Height = 18
    Color = 130957
    TabOrder = 17
    OnClick = Panel1Click
  end
  object Panel16: TPanel
    Left = 8
    Top = 214
    Width = 18
    Height = 18
    Color = clLime
    TabOrder = 18
    OnClick = Panel1Click
  end
  object muQuery: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 280
    Top = 32
  end
  object muupdate: TADOCommand
    Parameters = <>
    Left = 248
    Top = 32
  end
  object Muquery2: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 272
    Top = 64
  end
end
