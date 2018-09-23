unit hideme;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmHideMe = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHideMe: TfrmHideMe;

implementation

{$R *.DFM}

procedure TfrmHideMe.FormCreate(Sender: TObject);
begin
   Left := 0;
   Top := 0;
   Width := Screen.Width;
   Height := Screen.Height;
   Visible := False;
end;

procedure TfrmHideMe.FormActivate(Sender: TObject);
begin
   Left := 0;
   Top := 0;
   Width := Screen.Width;
   Height := Screen.Height;
end;

procedure TfrmHideMe.FormResize(Sender: TObject);
begin
   Left := 0;
   Top := 0;
   Width := Screen.Width;
   Height := Screen.Height;
end;

procedure TfrmHideMe.FormShow(Sender: TObject);
begin
   Left := 0;
   Top := 0;
   Width := Screen.Width;
   Height := Screen.Height;
end;

end.
