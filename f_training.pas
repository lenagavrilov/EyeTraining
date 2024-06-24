unit f_training;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids;

type
  Tfrm_Training = class(TForm)
    sh_circle: TShape;
    PageControl1: TPageControl;
    pnlButtons: TPanel;
    btnStart: TButton;
    btnStop: TButton;
    ts_Ex1: TTabSheet;
    pnlSettings: TPanel;
    line: TShape;
    pnlTimer: TPanel;
    Timer1: TTimer;
    lblTimer: TLabel;
    trackSpeed: TTrackBar;
    lblSpeed: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure trackSpeedTracking(Sender: TObject);
  private
    bMooving: Boolean;
    { Private declarations }
    fDirection: Integer;
    procedure moveBall(var currPoint: integer);
    procedure changeDirection;
    procedure setSpeed;
  public
    { Public declarations }
  end;

var
  frm_Training: Tfrm_Training;

implementation

{$R *.dfm}

procedure Tfrm_Training.btnStartClick(Sender: TObject);
var
  startPoint, endPoint, nowPoint: Integer;

begin
  Timer1.Enabled := True;
  startPoint := line.Left;
  endPoint := line.Left + line.Width;
  nowPoint := startPoint;

  bMooving := True;

  while bMooving do
    begin

      while nowPoint < EndPoint do
       moveBall(nowPoint);

      changeDirection;

      while nowPoint > StartPoint do
       moveBall(nowPoint);

      changeDirection;

    end;

end;


procedure Tfrm_Training.btnStopClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  bMooving := False;

end;

procedure Tfrm_Training.changeDirection;
begin
  fDirection := fDirection * -1;
end;

procedure Tfrm_Training.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bMooving := False;
end;

procedure Tfrm_Training.FormCreate(Sender: TObject);
begin
   sh_circle.Left := line.Left - sh_circle.Height div 2;
   sh_circle.Top := line.Top - sh_Circle.Height  div 2;
   setSpeed;
end;

procedure Tfrm_Training.moveBall(var currPoint: integer);
begin
  currPoint := currPoint + fDirection;
  sh_circle.Left := currPoint;
  Application.ProcessMessages;
  sleep(1)
end;

procedure Tfrm_Training.setSpeed;
begin
   lblSpeed.Caption := 'Speed: ' + IntToStr(trackSpeed.Position);
end;

procedure Tfrm_Training.Timer1Timer(Sender: TObject);
begin

  lblTimer.Caption := IntToStr(StrToInt(lblTimer.Caption)-1);

  if lblTimer.Caption = '0' then
    btnStop.Click;


end;

procedure Tfrm_Training.trackSpeedTracking(Sender: TObject);
begin
   setSpeed;
   fDirection := trackSpeed.Position;
end;

end.
