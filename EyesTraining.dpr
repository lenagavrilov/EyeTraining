program EyesTraining;

uses
  Vcl.Forms,
  f_training in 'f_training.pas' {frm_Training};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Training, frm_Training);
  Application.Run;
end.
