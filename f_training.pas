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
    btnReset: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure trackSpeedTracking(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
  private
    bMooving: Boolean;
    startPoint, endPoint, nowPoint: Integer;

    { Private declarations }
    fDirection: Integer;
    procedure moveBall(var nowPoint: integer);
    procedure changeDirection;
    procedure setSpeed;
    procedure resetControls;
  public
    { Public declarations }
  end;

var
  frm_Training: Tfrm_Training;

implementation

{$R *.dfm}

procedure Tfrm_Training.btnResetClick(Sender: TObject);
begin
  resetControls;
end;

procedure Tfrm_Training.btnStartClick(Sender: TObject);
begin
  Timer1.Enabled := True;
  startPoint := line.Left;
  endPoint := line.Left + line.Width - sh_circle.Width div 2;
  nowPoint := startPoint;

  bMooving := True;

  while bMooving do
    begin

      repeat
        moveBall(nowPoint)
      until nowPoint = EndPoint;



      changeDirection;

      repeat
        moveBall(nowPoint)
      until nowPoint = startPoint;

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
  resetControls;
end;

procedure Tfrm_Training.moveBall(var nowPoint: integer);
begin
  nowPoint := nowPoint + fDirection;
  if nowPoint > endPoint then
    nowPoint := endPoint
  else
    if nowPoint < startPoint then
      nowPoint := startPoint;

  sh_circle.Left := nowPoint;
  Application.ProcessMessages;
  sleep(1)
end;

procedure Tfrm_Training.resetControls;
begin
  bMooving := False;
  sh_circle.Left := line.Left - sh_circle.Height div 2;
  sh_circle.Top := line.Top - sh_Circle.Height  div 2;
  setSpeed;

  //Set timer
end;

procedure Tfrm_Training.setSpeed;
begin
   lblSpeed.Caption := 'Speed: ' + IntToStr(trackSpeed.Position);
   fDirection := trackSpeed.Position;
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
end;

end.
