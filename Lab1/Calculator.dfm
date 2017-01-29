object Form1: TForm1
  Left = 321
  Top = 178
  Width = 220
  Height = 280
  Caption = 'Calculator'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 5
    Top = 2
    Width = 188
    Height = 33
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 5
    Top = 190
    Width = 90
    Height = 40
    Caption = '0'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 105
    Top = 190
    Width = 40
    Height = 40
    Caption = ','
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 155
    Top = 190
    Width = 40
    Height = 40
    Caption = 'C'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 155
    Top = 140
    Width = 40
    Height = 40
    Caption = '='
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 155
    Top = 95
    Width = 40
    Height = 40
    Caption = '-'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 155
    Top = 50
    Width = 40
    Height = 40
    Caption = '+'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 5
    Top = 140
    Width = 40
    Height = 40
    Caption = '1'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 55
    Top = 140
    Width = 40
    Height = 40
    Caption = '2'
    TabOrder = 8
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 105
    Top = 140
    Width = 40
    Height = 40
    Caption = '3'
    TabOrder = 9
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 5
    Top = 95
    Width = 40
    Height = 40
    Caption = '4'
    TabOrder = 10
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 55
    Top = 95
    Width = 40
    Height = 40
    Caption = '5'
    TabOrder = 11
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 105
    Top = 95
    Width = 40
    Height = 40
    Caption = '6'
    TabOrder = 12
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 5
    Top = 50
    Width = 40
    Height = 40
    Caption = '7'
    TabOrder = 13
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 55
    Top = 50
    Width = 40
    Height = 40
    Caption = '8'
    TabOrder = 14
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 105
    Top = 50
    Width = 40
    Height = 40
    Caption = '9'
    TabOrder = 15
    OnClick = Button15Click
  end
end
