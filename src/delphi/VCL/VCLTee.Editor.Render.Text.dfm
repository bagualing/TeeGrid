object TextRenderEditor: TTextRenderEditor
  Left = 0
  Top = 0
  Caption = 'Text Render Editor'
  ClientHeight = 484
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageSelected: TPageControl
    Left = 0
    Top = 0
    Width = 431
    Height = 484
    ActivePage = TabAlign
    Align = alClient
    TabOrder = 0
    OnChange = PageSelectedChange
    object TabFormat: TTabSheet
      Caption = 'Format'
    end
    object TabBorders: TTabSheet
      Caption = 'Borders'
      ImageIndex = 1
    end
    object TabMargins: TTabSheet
      Caption = 'Margins'
      ImageIndex = 2
    end
    object TabAlign: TTabSheet
      Caption = 'Text Align'
      ImageIndex = 3
    end
  end
end
