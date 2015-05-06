object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 161
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 72
    Height = 13
    Caption = 'Ingrese su DNI'
  end
  object Edit1: TEdit
    Left = 48
    Top = 56
    Width = 121
    Height = 21
    MaxLength = 8
    NumbersOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 192
    Top = 41
    Width = 105
    Height = 51
    Caption = 'Ingresar al sistema'
    TabOrder = 1
    OnClick = Button1Click
  end
end
