program EyesTraining;

uses
  Vcl.Forms,
  f_training in 'f_training.pas' {frm_Training},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Golden Graphite');
  Application.CreateForm(Tfrm_Training, frm_Training);
  Application.Run;
end.
