uses
  Windows, Messages, SysUtils, Variants, Controls, Forms, Dialogs, ToolWin, UPaths, OpenDialog;

var
  f: TextFile;
  str, FileName: string;
  ParameterName, ParameterValue: array[1..100] of string;
  Project: IProject;
  Parameter: IParameter;
  i, c, seppos: Integer;
  notFound: Boolean;
  openDialog: TOpenDialog;

begin
  // Create open file dialog
  openDialog := TOpenDialog.Create(nil); // Use nil instead of 'self'
  openDialog.InitialDir := GetCurrentDir;
  openDialog.Filter := 'Project Parameters File|*.txt';
  openDialog.FilterIndex := 1;

  // If user selects a file
  if openDialog.Execute then
  begin
    FileName := openDialog.FileName;
    AssignFile(f, FileName);
    Reset(f);
    c := 0;

    // Get focused project
    Project := GetWorkspace.DM_FocusedProject;
    if Project = nil then
    begin
      ShowMessage('No project is currently focused.');
      Exit;
    end;

    // Read and parse each line
    while not Eof(f) do
    begin
      ReadLn(f, str);
      inc(c);
      seppos := Pos(';', str);

      // Ensure line is valid
      if seppos > 0 then
      begin
        ParameterName[c] := Copy(str, 1, seppos - 1);
        Delete(str, 1, seppos);
        ParameterValue[c] := Trim(str);

        notFound := True;

        // Check if parameter exists
        for i := 0 to Project.DM_ParameterCount - 1 do
        begin
          if Project.DM_Parameters(i).DM_Name = ParameterName[c] then
          begin
            Parameter := Project.DM_Parameters(i);
            if Parameter.DM_Value <> ParameterValue[c] then
            begin
              Parameter.DM_SetValue(ParameterValue[c]);
              ShowMessage('Updated: ' + ParameterName[c] + ' = ' + ParameterValue[c]);
            end;
            notFound := False;
            Break;
          end;
        end;

        // Add new parameter if not found
        if notFound then
        begin
          Project.DM_AddParameter(ParameterName[c], ParameterValue[c]);
          ShowMessage('Added: ' + ParameterName[c] + ' = ' + ParameterValue[c]);
        end;
      end;
    end;

    CloseFile(f);
    ShowMessage('Project parameters updated successfully.');
  end
  else
    ShowMessage('Open file was cancelled.');

  openDialog.Free;
end;