unit about;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellAPI, jpeg;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    OKButton: TButton;
    Label77: TLabel;
    Label78: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblSerial: TLabel;
    Label3: TLabel;
    procedure Label78Click(Sender: TObject);
    procedure ProgramIconClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}

procedure TAboutBox.Label78Click(Sender: TObject);
begin
   ShellExecute(0, Nil, 'http://dekatmu.tripod.com', Nil, Nil, SW_NORMAL)
end;

procedure TAboutBox.ProgramIconClick(Sender: TObject);
begin
   ShellExecute(0, Nil, 'http://nugraha.dhs.org/', Nil, Nil, SW_NORMAL)
end;

end.

