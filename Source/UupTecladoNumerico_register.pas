unit UupTecladoNumerico_register;

interface

uses UupTecladoNumerico, System.Classes;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('upTecladoNumerico', [TupTecladoNumerico]);
end;

end.
