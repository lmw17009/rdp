object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'RDP-V0.1'
  ClientHeight = 292
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 107
    Width = 48
    Height = 13
    Caption = #21407#22987#23494#30721
  end
  object lbl2: TLabel
    Left = 8
    Top = 161
    Width = 43
    Height = 13
    Caption = 'EDP'#23494#30721
  end
  object lbl3: TLabel
    Left = 215
    Top = 2
    Width = 72
    Height = 13
    Caption = #28857#25105#26174#31034#26126#25991
    OnMouseDown = lbl3MouseDown
    OnMouseUp = lbl3MouseUp
    OnMouseEnter = lbl3MouseEnter
  end
  object lbl4: TLabel
    Left = 8
    Top = 134
    Width = 34
    Height = 13
    Caption = 'IP'#22320#22336
  end
  object lbl5: TLabel
    Left = 8
    Top = 24
    Width = 36
    Height = 13
    Caption = #29992#25143#21517
  end
  object lbl6: TLabel
    Left = 8
    Top = 56
    Width = 24
    Height = 13
    Caption = #22495#21517
  end
  object lbl7: TLabel
    Left = 72
    Top = 80
    Width = 89
    Height = 13
    Caption = #40664#35748#22495#21517#20026'PROQ'
  end
  object lbl8: TLabel
    Left = 72
    Top = 261
    Width = 3
    Height = 13
  end
  object edt1: TEdit
    Left = 72
    Top = 104
    Width = 361
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object edt2: TEdit
    Left = 72
    Top = 158
    Width = 361
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object btn2: TButton
    Left = 72
    Top = 225
    Width = 361
    Height = 30
    Caption = #23548#20986'RDP'
    TabOrder = 5
    OnClick = btn2Click
  end
  object edt3: TEdit
    Left = 72
    Top = 131
    Width = 361
    Height = 21
    TabOrder = 3
  end
  object edt4: TEdit
    Left = 72
    Top = 21
    Width = 361
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnChange = edt4Change
  end
  object edt5: TEdit
    Left = 72
    Top = 53
    Width = 361
    Height = 21
    TabOrder = 1
    Text = 'PROQ'
  end
  object rb1: TRadioButton
    Left = 72
    Top = 185
    Width = 113
    Height = 17
    Caption = 'XP'
    TabOrder = 6
  end
  object rb2: TRadioButton
    Left = 240
    Top = 185
    Width = 113
    Height = 17
    Caption = 'Win7-10'
    TabOrder = 7
  end
  object dlgSave1: TSaveDialog
    Filter = '|.rdp'
    Left = 136
    Top = 96
  end
end
