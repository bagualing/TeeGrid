unit Unit_Header_Footer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VCLTee.Control,
  VCLTee.Grid, Vcl.StdCtrls;

type
  TFormHeaderFooter = class(TForm)
    TeeGrid1: TTeeGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHeaderFooter: TFormHeaderFooter;

implementation

{$R *.dfm}

uses
  UITypes,
  Tee.Grid.Bands, Tee.Painter, VCLTee.Editor.Grid.Bands,
  Tee.Format, Tee.Grid.Data.Rtti;

procedure TFormHeaderFooter.Button1Click(Sender: TObject);
var tmp : TTeeGrid;
begin
  tmp:=TTeeGrid.Create(Self);
  tmp.Assign(TeeGrid1);
  tmp.Free;
end;

type
  THouse=record
  public
    Address : String;
    Floors : Integer;
  end;

var
  House : THouse;
  Houses : TArray<THouse>;

procedure TFormHeaderFooter.Button2Click(Sender: TObject);
begin
  TGridBandsEditor.Edit(Self,TeeGrid1.Headers)
end;

procedure TFormHeaderFooter.Button3Click(Sender: TObject);
begin
  TGridBandsEditor.Edit(Self,TeeGrid1.Footer)
end;

procedure TFormHeaderFooter.FormCreate(Sender: TObject);
//var tmp : TBandGroup;
begin
  TeeGrid1.Footer.AddText('Footer 1').Format.Font.Color:=clRed;

  TeeGrid1.Footer.AddText('Footer 2'#13'SubFooter 2');

  TeeGrid1.Footer.AddText('Footer 3').TextRender.TextAlign.Horizontal:=THorizontalAlign.Center;

  with TeeGrid1.Headers.AddText('Header 1').Format.Brush do
  begin
    Show;
    Gradient.Show;
  end;

  TeeGrid1.Headers.AddText('Header 2'); //.Width.Value:=50;

  TeeGrid1.Headers.AddText('Header 3').Format.Stroke.Show;

  House.Address:='123 St';
  House.Floors:=5;

//  TeeGrid1.Data:=TVirtualRecordData<THouse>.Create(House);

  SetLength(Houses,2);
  Houses[0].Address:='123 St';
  Houses[1].Address:='456 St';

  TeeGrid1.Data:=TVirtualData<TArray<THouse>>.Create(Houses);

  {
  tmp:=TBandGroup.Create(TeeGrid1.Headers.Bands,TeeGrid1.Changed);

  TTextBand.Create(tmp.Bands).Text:='SubHeader 1';
  TTextBand.Create(tmp.Bands).Text:='SubHeader 2';
  TTextBand.Create(tmp.Bands).Text:='SubHeader 3';
  }
end;

end.
