unit uJvcsToGit;

{ $define UseVCLZIP}
interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, dbisamtb, DB, StdCtrls, Grids, Mask, xprocs,
{$IFDEF UseVCLZIP}vclzip, vclunzip{$ELSE}System.zip{$ENDIF};

type
   TDbIsamToGit = class(TForm)
      tmodules: TDBISAMTable;
      DBISAMDatabase1: TDBISAMDatabase;
      DBISAMSession1: TDBISAMSession;
      DBISAMQuery1: TDBISAMQuery;
      Memo1: TMemo;
      tpjmodule: TDBISAMTable;
      tRevisions: TDBISAMTable;
      tblobs: TDBISAMTable;
      tprojects: TDBISAMTable;
      tUsers: TDBISAMTable;
      tvcslog: TDBISAMTable;
      tlogcomm: TDBISAMTable;
      btAnalysePath: TButton;
      btGetDates: TButton;
      btExportBase: TButton;
      Button1: TButton;
      sgDates: TStringGrid;
      sgpath: TStringGrid;
      sgUsers: TStringGrid;
      cbConvertDfm: TCheckBox;
      edBase: TEdit;
      edPathFilename: TEdit;
      edLineFilename: TEdit;
      edDatabase: TEdit;
      edTrunc: TEdit;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      cbNoBlobs: TCheckBox;
      procedure btAnalysePathClick(Sender: TObject);
      procedure sgpathClick(Sender: TObject);
      procedure btExportBaseClick(Sender: TObject);
      procedure btGetDatesClick(Sender: TObject);
      procedure edBaseChange(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
   private
      tsUsers: tStringList;
      procedure doExport(sPath: string; leftOnly: boolean; outfilename: string);
    { Déclarations privées }
   public
    { Déclarations publiques }
   end;

var
   DbIsamToGit: TDbIsamToGit;

implementation

uses inifiles;

{$R *.dfm}


const
   CRLF = #13 + #10;
   LF = #10;


function Valint(S: string): Integer; overload;
begin
   Result := 0;
   if not Strempty(S) then
   begin
      S := Trim(S);
      if Pos('.', S) > 0 then S := StrToken(S, '.');
      if (Pos('-', S) > 1) or (StrTokenCount(S, '-') > 2) then S := '';
      if isnumeric(S) then
      begin
         try
            Result := StrToInt(S);
         except
            Result := 0;
         end;
      end;
   end;
end;


procedure TDbIsamToGit.btAnalysePathClick(Sender: TObject);
var
   currPath: string;
   tsPath: tStringList;
   tsProjets: tStringList;
   projectid: string;
   I: Integer;
   Author: string;

begin
   DBISAMDatabase1.Directory := edDatabase.text;
   DBISAMDatabase1.Open;
   try
      tModules.Open;

      tModules.first;
      tpjmodule.Open();
      tpjmodule.IndexName := 'Module';
      tsPath := tStringList.Create();
      tsProjets := tStringList.Create();
      while not tModules.eof do
      begin
         currPath := tModules['path'];
         if (tpjmodule.FindKey([tModules['moduleid']])) then
         begin
            projectid := INtTostr(tpjmodule['projectid']);
            tsPath.Values[currPath] := INtTostr(valint(tsPath.Values[currPath]) + 1);
         end
         else
            projectid := '';
         tsProjets.Values[currPath + projectid] := INtTostr(valint(tsProjets.Values[currPath + projectid]) + 1);
         tModules.Next;


      end;

      for I := 0 to tsPath.Count - 1 do
      begin
         sgPath.Cells[0, I + 1] := tsPath.Names[I];
         sgPath.Cells[1, I + 1] := tsPath.Values[tsPath.Names[I]];
      end;
      sgPath.RowCount := tsPath.Count;
   // copygridToClipboard(sgPath);
      tpjmodule.Close;
      tModules.Close;
      sgPathClick(sgPath);
   // complete user list
      tUsers.open;
      tUsers.First;
      while not tUsers.eof do
      begin
         Author := tUsers['login'];
         if not strEmpty(Author) then
         begin
            if sgUsers.Cols[0].IndexOf(Author) < 0 then
            begin
               sgUsers.Cells[0, sgUsers.RowCount] := author;
               sgUsers.RowCount := sgUsers.RowCount + 1
            end;
         end;

         tUsers.Next;
      end;
      tUsers.Close;
   except
      on e: Exception do
      begin
         MessageDlg(e.Message + #13 + 'the database can need to be converted.', mtError, [mbOK], 0);
      end;
   end;
end;

procedure FileDataBlobToStream(ADataSet: TObject; AStream: TStream);
var
   tempStream: TStream;
begin
   tempStream := TDataSet(ADataSet).CreateBlobStream(TDataSet(ADataSet).FieldByName('filedata'), bmRead);
   try
      AStream.Size := tempStream.Size;
      AStream.Position := 0;
      AStream.CopyFrom(tempStream, AStream.Size);
   finally
      tempStream.Free;
   end;
end;

const
   // Sets UnixStartDate to TDateTime of 01/01/1970
   UnixStartDate: TDateTime = 25569.0;

function DateTimeToUnix(ConvDate: TDateTime): Longint;
begin
   // example: DateTimeToUnix(now);
   Result := Round((ConvDate - UnixStartDate) * 86400);
end;

function UnixToDateTime(USec: Longint): TDateTime;
begin
   // Example: UnixToDateTime(1003187418);
   Result := (USec / 86400) + UnixStartDate;
end;

procedure TDbIsamToGit.btExportBaseClick(Sender: TObject);
begin
   doExport(edBase.Text, true, edPathFilename.Text);
end;


procedure TDbIsamToGit.btGetDatesClick(Sender: TObject);
begin
   doExport(sgPath.Cells[0, sgPath.Row], false, edlineFilename.Text);

end;

procedure TDbIsamToGit.Button1Click(Sender: TObject);
begin
   DBISAMDatabase1.Directory := edDatabase.text;
   DBISAMDatabase1.Open;
   DBISAMQuery1.SQL.Text := Memo1.Text;
   DBISAMQuery1.ExecSQL;
   ShowMessage('Database successfully converted');
   DBISAMDatabase1.Close;
end;

procedure TDbIsamToGit.doExport(sPath: string; leftOnly: boolean; outfilename: string);
var
   sDate: string;
   tsDates: tStringList;
   tsComments: tStringList;
   tsCstr: tStringList;
   I: Integer;
   MS, MSdfm: TmemoryStream;
{$IFDEF UseVCLZIP}
   ZipFile: TVCLUNZIP;
{$ELSE}
   ZipHeader: TZipHeader;
   ZipFile: TZipFile;
{$ENDIF}
   revlist: string;
   revid: string;
   filelist: tStrings;
   j: Integer;
   Outfile: TFileStream;
   Author: string;
   markdate: string;
   markstring: string;
   last_mark: string;
   userid: Integer;
   sComment: string;
   MSExp: TStream;
   modulepath: string;
   basePath: string;
   basePathLen: integer;
//   OrigTime: tDateTime;
   LogTime: tDateTime;
   OldDate: string;
   bDoseparateperUser: Boolean;
   sDayComments: string;
   sDayRevisions: string;
   tsDayComments: tStringList;
   tsDayModules: tStringList;
   tsDayRevisionUser: tStringList;
   currUser: string;
   tsDayRevDates: tStringList;
   tsDayUsers: TStringList;
   srevid: string;
   CurrRevDate: string;
   nbEmptyUsers: Integer;

{$IFDEF VER_XE5_UP}
   Utf8Str: AnsiString;
   B: byte;
   TempString: RawByteString;
   MSIntermediate: TMemoryStream;

   procedure gitPrint(Text: string);
   var
      textToWrite: tBytes;

   begin
      textToWrite := tencoding.Default.GetBytes(Text);
      Outfile.write(textToWrite[0], length(textToWrite));
   end;

{$ELSE}
   Utf8Str: string;
   procedure gitPrint(Text: string);

   begin
      OutFile.Write(text[1], length(text));
   end;
{$ENDIF}

   procedure gitPuts(Text: string);
   begin
      gitPrint(Text + LF);
   end;
   procedure export_data(source: string);
   begin
      gitPrint('data ' + INtTostr(length(source)) + LF);
//      OutFile.Write(source[1],length(source));
      gitPrint(source);
      gitPrint(LF);
   end;
   procedure export_dataAnsi(source: Ansistring);
   begin
      gitPrint('data ' + INtTostr(length(source)) + LF);
      OutFile.Write(source[1], length(source));
      //gitPrint(source);
      gitPrint(LF);
   end;

   procedure export_dataMS(source: TStream);
   begin
      gitPrint('data ' + INtTostr(source.Size) + LF);
      source.seek(0, soFromBeginning);
      Outfile.CopyFrom(source, source.Size);
   end;

   function Addcomment(src, comm: string): string;
   begin
      comm := trim(comm);
      while strRight(comm, 2) = #13 + #10 do comm := strleft(comm, length(comm) - 2);
      while strLeft(comm, 2) = #13 + #10 do comm := strRight(comm, length(comm) - 2);
      tsCstr.Clear;
      tsCstr.Text := src;
      tsCstr.Sorted := true;
      tsCstr.Duplicates := dupIgnore;
      tsCstr.Add(comm);
      Result := tsCstr.Text;
   end;

   function PathEqual(src, dst: string; leftOnly: boolean): boolean;
   begin
      if leftOnly then
         Result := copy(strlower(src), 1, length(dst)) = strlower(dst)
      else
         Result := strlower(src) = strlower(dst);
   end;

   procedure doExportCurrentDay;
   var i, j: integer;
   begin
                     // Check the values for the current day, check same file for different users
      sDayRevisions := '';
      sDayComments := '';

      if bDoSeparateperUser then
      begin
         CurrUser := tsDayRevisionUser.ValueFromIndex[0];
         for I := 0 to tsDayRevisionUser.count - 1 do
         begin
            OldDate := copy(OldDate, 1, 10) + '-' + tsDayRevisionUser.Names[i];
            CurrRevDate := tsDayRevDates.values[tsDayRevisionUser.Names[i]];
            if tsDayRevisionUser.ValueFromIndex[i] <> currUser then
            begin
               tsDates.Values[OldDate] := CurrRevDate + sDayRevisions;
               tsComments.Values[OldDate] := sDayComments;
               sDayRevisions := '';
               sDayComments := '';
               CurrUser := tsDayRevisionUser.ValueFromIndex[i];
            end;
            if strempty(sDayRevisions) then
               sDayRevisions := ';' + tsDayRevisionUser.ValueFromIndex[i];
                     //INtTostr(DateTimeToUnix(tBlobs['origtime'])) + ';' + INtTostr(tRevisions['userid']);
            sDayRevisions := sDayRevisions + ';' + tsDayRevisionUser.Names[i];
            sDayComments := Addcomment(sDayComments, tsDayComments.values[tsDayRevisionUser.Names[i]]);
         end;
         tsDates.Values[OldDate] := CurrRevDate + sDayRevisions;
         tsComments.Values[OldDate] := sDayComments;
      end
      else
      begin
         for I := 0 to tsDayUsers.count - 1 do
         begin

            for j := 0 to tsDayRevisionUser.Count - 1 do
            begin
               if tsDayRevisionUser.ValueFromIndex[j] = tsDayUsers.names[i] then
               begin
                  CurrRevDate := tsDayRevDates.values[tsDayRevisionUser.Names[j]];
                  if strempty(sDayRevisions) then
                     sDayRevisions := ';' + tsDayUsers.names[i];
                  sDayRevisions := sDayRevisions + ';' + tsDayRevisionUser.Names[j];
                  sDayComments := Addcomment(sDayComments, tsDayComments.values[tsDayRevisionUser.Names[j]]);
                  OldDate := copy(OldDate, 1, 10) + '-' + tsDayRevisionUser.Names[j]
               end;
            end;
            tsDates.Values[OldDate] := CurrRevDate + sDayRevisions;
            tsComments.Values[OldDate] := sDayComments;
            sDayRevisions := '';
            sDayComments := '';
         end;
      end;
      OldDate := sDate;
      bDoseparateperUser := false;
      sDayRevisions := '';
      sDayComments := '';
      tsDayComments.clear;
      tsDayModules.Clear;
      tsDayRevisionUser.clear;
      tsDayUsers.clear;
      tsDayRevdates.clear;
   end;

begin
   tsDates := tStringList.Create;
   tsComments := tStringList.Create;
   tsDayComments := tStringList.Create;
   tsDayModules := tStringList.Create;
   tsCstr := tStringList.Create;
   tsDayRevisionUser := tStringList.Create;
   tsDayRevDates := tStringList.Create;
   tsDayUsers := tStringList.Create;
   basePath := edTrunc.text;
   basePathLen := length(basePath);
   tModules.Open;
   tModules.first;
   tRevisions.Open();
   //tRevisions.IndexName := 'Module';
   tBlobs.Open();
   tBlobs.IndexName := 'Rev';
   tUsers.Open();
   //tUsers.IndexName := 'PRIMARY';
   tpjmodule.Open();
   tpjmodule.IndexName := 'MODULE';
   tvcsLog.Open();
   tlogcomm.Open();
   tsUsers.Clear;
   nbEmptyUsers := 0;
   for I := 1 to sgUsers.RowCount - 1 do
   begin
      tsUsers.Values[sgUsers.Cells[0, i]] := sgUsers.Cells[1, i];
      if strempty(sgUsers.Cells[1, i]) then
         inc(nbEmptyUsers);
   end;

   if nbEmptyUsers > 0 then
      if MessageDlg('There are ' + IntTOstr(nbEmptyUsers) + ' users without email, continue ', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

   OldDate := '';
   while not tRevisions.eof do
   begin
      if tModules.findkey([tRevisions['moduleid']]) then
      begin
         modulePath := tModules['path'];
         modulePath := strLower(modulePath);
         if strleft(modulepath, basePathLen) = basePath then
            modulePath := strright(modulePath, length(modulepath) - basePathLen);
         modulePath := strReplace(modulePath, '\', '/');

         if PathEqual(tModules['path'], sPath, leftOnly) then
         begin
         // Check if module belongs to a project
            if tpjmodule.FindKey([tModules['moduleid']]) then
            begin


               Logtime := 0;
               sDate := '';
               // Get log date
               if tlogcomm.FindKey([tRevisions['revisionid']]) then
               begin
                  if tvcsLog.FindKey([tlogcomm['logid']]) then
                  begin
                     sDate := INtTostr(dateyear(tvcsLog['tstamp'])) + '-' + strPadZerol(INtTostr(datemonth(tvcsLog['tstamp'])), 2) + '-' +
                        strPadZerol(INtTostr(dateday(tvcsLog['tstamp'])), 2) + '-' + StrPadZerol(INtTostr(tRevisions['revisionid']), 6);
                     LogTime := tvcsLog['tstamp'];
                  end
                  else
                     sDate := '';
               end
               else
                  sDate := '';
               if true then
//                if sDate>'2016-07-01' then
               begin
                  if copy(sDate, 1, 10) <> copy(OldDate, 1, 10) then
                  begin
                     doExportCurrentDay;
                  end;

                  tBlobs.SetRange([tRevisions['revisionid']], [tRevisions['revisionid']]);

                  while not tBlobs.eof do
                  begin
                     if sDate = '' then
                     begin
                        sDate := INtTostr(dateyear(tBlobs['origtime'])) + '-' + strPadZerol(INtTostr(datemonth(tBlobs['origtime'])), 2) + '-' +
                           strPadZerol(INtTostr(dateday(tBlobs['origtime'])), 2) + '-' + INtTostr(tRevisions['userid']);
                     end;
//                     OrigTime := tBlobs['origtime'];
                     tBlobs.Next;
                  end;
                  if strempty(sDayRevisions) then
                     sDayRevisions := INtTostr(DateTimeToUnix(LogTime)) + ';' + INtTostr(tRevisions['userid']);
                     //INtTostr(DateTimeToUnix(tBlobs['origtime'])) + ';' + INtTostr(tRevisions['userid']);
                  sDayRevisions := sDayRevisions + ';' + INtTostr(tRevisions['revisionid']);
                  sDayComments := Addcomment(sDayComments, tRevisions['comment_i']);
                  srevid := strpadzerol(inttostr(tRevisions['revisionid']), 6);
                  tsDayUsers.values[intToStr(tRevisions['userid'])] := '1';
                  tsDayRevDates.values[srevid] := INtTostr(DateTimeToUnix(LogTime));
                  tsDayComments.values[srevid] := tRevisions['comment_i'];
                  tsDayRevisionUser.values[srevid] := intToStr(tRevisions['userid']);
                  if (not strempty(tsDayModules.values[tModules['moduleid']])) and (tsDayModules.values[tModules['moduleid']] <> IntToStr(tRevisions['userid'])) then
                  begin
                  // if the same file has been modified by more than one user the same day
                     bDoseparateperUser := true;
                  end;
                  tsDayModules.values[tModules['moduleid']] := IntToStr(tRevisions['userid']);
               end;
            end;
         end;
      end;
      tRevisions.Next;
   end;
   // Last day
   doExportCurrentDay;

   tsDates.Sort;
   tsComments.Sort;
   for I := 0 to tsDates.Count - 1 do
   begin
      sgDates.Cells[0, I + 1] := tsDates.Names[I];
      sgDates.Cells[1, I + 1] := tsDates.Values[tsDates.Names[I]];
      sgDates.Cells[2, I + 1] := tsComments.Values[tsDates.Names[I]];
   end;
   tRevisions.IndexName := 'Module';
   sgDates.RowCount := tsDates.Count + 1;
   MSExp := TmemoryStream.Create;
   MSDfm := TmemoryStream.create;
   // Get all revisions in the correct order
   filelist := tStringList.Create;
   MS := TmemoryStream.Create;
   Outfile := TFileStream.Create(outfilename, fmOpenWrite or fmCreate);
   tRevisions.IndexName := '';
   tModules.IndexName := ''; // Primary index ?
   for I := 0 to tsDates.Count - 1 do
   begin
      revlist := tsDates.Values[tsDates.Names[I]];
      markdate := strtoken(revlist, ';');
      userid := Strtoint(strtoken(revlist, ';'));
      if tUsers.FindKey([userid]) then
         Author := tUsers['login'];
      Author := Author + ' <' + tsUsers.Values[Author] + '>';
      markstring := INtTostr(I + 1);
      last_mark := INtTostr(I);
      gitPuts('commit refs/heads/master');
      gitPuts('mark :' + markstring);
      gitPuts('committer ' + Author + ' ' + markdate + ' -0700');
      sComment := tsComments.Values[tsDates.Names[I]];
      if strright(sComment, 1) = LF then
         sComment := strLeft(sComment, length(sComment) - 2);
{$IFDEF VER_XE5_UP}
      // special case for utf8
      TempString := UTF8Encode(sComment);
      SetLength(UTF8Str, Length(TempString));
      Move(TempString[1], UTF8Str[1], Length(UTF8Str));
      export_dataAnsi(Utf8Str);
{$ELSE}
      Utf8Str := AnsiToUtf8(scomment);
      export_data(Utf8Str);
{$ENDIF}
      if last_mark > '0' then
         gitPuts('from :' + last_mark); // +' if last_mark
      while not strempty(revlist) do
      begin
         revid := strtoken(revlist, ';');
         if revid > '' then
         begin
            modulePath := '';
            if tRevisions.FindKey([revid]) then
            begin
               if tModules.findkey([tRevisions['moduleid']]) then
               begin
                  modulePath := tModules['path'];
                  modulePath := strLower(modulePath);
                  if strleft(modulepath, basePathLen) = basePath then
                     modulePath := strright(modulePath, length(modulepath) - basePathLen);
                  modulePath := strReplace(modulePath, '\', '/');
               end;
            end;
            tBlobs.SetRange([revid], [revid]);
            while not tBlobs.eof do
            begin
               filelist.Clear;
               MS.Clear;
               FileDataBlobToStream(tBlobs, MS);

               // Get Modules asociated to blob
{$IFDEF UseVCLZIP}
               ZipFile := TVCLUNZIP.Create(Application);
               try
               // Vclunzip using memorystreams
               //(UnCompressString(CompressString(tmp,False,comp))=tmp);

                  ZipFile.ArchiveStream := MS;
                  ZipFile.readzip;
                  for j := 0 to ZipFile.count - 1 do
                  begin
                     msExp := TMemoryStream.create;
                     ZipFile.UnZipToStreamByIndex(MSExp, j);
                     gitPuts('M 644 inline ' + modulePath + ZipFile.Filename[j]);
                     if not cbNoBlobs.checked then
                     begin
                        if (tBlobs['extension'] = '.dfm') and cbConvertDfm.checked then
                        begin
                           MSdfm.clear;
                           try
                              MSExp.Seek(0, soFromBeginning);
                              ObjectResourceToText(MSExp, MSdfm);
                              export_dataMS(MSdfm);
                           except
                              export_dataMS(MSExp);

                           end;
                        end
                        else
                           export_dataMS(MSExp);
                        MSExp.Free;
                     end;

                  end;
{$ELSE}
                // Delphi Xe8 Zip using files
                //MS.SaveToFile('testfile.zip');
               ZipFile := TZipFile.Create; // Zipfile: TZipFile
               try
                  MS.Seek(0, soFromBeginning);
                  ZipFile.Open(MS, zmRead);
                  for j := 0 to ZipFile.FileCount - 1 do
                  begin
                     msExp := TMemoryStream.create;
                     ZipFile.read(j, MSExp, ZipHeader);
                     gitPuts('M 644 inline ' + modulePath + ZipFile.Filename[j]);
                     if not cbNoBlobs.checked then
                     begin
                        if (tBlobs['extension'] = '.dfm') and cbConvertDfm.checked then
                        begin
                           MSExp.Seek(0, soFromBeginning);
                           MSExp.Read(B, 1);
                           if B = $FF then
                           begin
                              MSdfm.clear;
                              try
                                 MSExp.Seek(0, soFromBeginning);
                           // Another TMemory stream needed because the TZipStream from ZipFile.read cannot be used
                           // http://www.delphifeeds.com/go/s/115773
                                 MSIntermediate := TMemoryStream.create;
                                 MSIntermediate.CopyFrom(MSExp, MSExp.Size);
                                 MSIntermediate.Seek(0, soFromBeginning);
                                 ObjectResourceToText(MSIntermediate, MSdfm);
                                 export_dataMS(MSdfm);
                                 MSIntermediate.free
                              except
                                 export_dataMS(MSExp);
                              end;
                           end
                           else
                              export_dataMS(MSExp);
                        end
                        else
                           export_dataMS(MSExp);
                     end;
                     MSExp.Free;
                  end;
                  ZipFile.Close;
{$ENDIF}
               finally
                  ZipFile.Free;
               end;
               tBlobs.Next;
            end;
         end;
      end;
   end;
   msExp := nil;
   msExp.free;
   MSdfm := nil;
   MSdfm.free;
   Outfile.Free;
   tRevisions.Close;
   tBlobs.Close;
   tModules.Close;
   ShowMessage('Export Done');
end;


procedure TDbIsamToGit.edBaseChange(sender: TObject);
var
   sPath: string;
begin
   sPath := edBase.Text;
   sPath := strReplace(sPath, '\', '_');
   sPath := strReplace(sPath, ':', '');
   sPath := strTrimChR(sPath, '_');
   edPathFilename.Text := sPath + '.txt';

end;

procedure TDbIsamToGit.FormActivate(sender: TObject);
begin
   edBaseChange(edBase);
end;

procedure TDbIsamToGit.FormCreate(sender: TObject);
// Load the values from file
var
   paramfile: TIniFile;
   i: Integer;
begin
   // Init the grids
   sgPath.Cells[0, 0] := 'Path';
   sgPath.cells[1, 0] := 'Modules';

   sgDates.Cells[0, 0] := 'Date';
   sgDates.cells[1, 0] := 'Modules';
   sgDates.Cells[2, 0] := 'Comments';

   sgUsers.Cells[0, 0] := 'Login';
   sgUsers.Cells[1, 0] := 'email';

   tsUsers := tStringList.Create;

   // Read the stored values
   paramfile := TIniFile.Create(fileProgramPath + 'Userlist.ini');
   paramfile.ReadSectionValues('Users', tsUsers);
   sgUsers.RowCount := tsUsers.Count + 1;
   for i := 0 to tsUsers.Count - 1 do
   begin
      sgUsers.Cells[0, i + 1] := tsUsers.Names[i];
      sgUsers.Cells[1, i + 1] := tsUsers.ValueFromIndex[i];
   end;
   edTrunc.text := paramfile.ReadString('Directories', 'TruncPath', 'c:\delphi');
   edBase.text := paramfile.ReadString('Directories', 'BasePath', 'c:\delphi');
   edDatabase.text := paramfile.ReadString('Directories', 'DatabasePath', 'd:\DevData\BaseJvcs');
end;

procedure TDbIsamToGit.FormDestroy(Sender: TObject);
var
   paramfile: TIniFile;
   i: Integer;
begin
   paramfile := TIniFile.Create(fileProgramPath + 'Userlist.ini');
   if sgUsers.RowCount > 1 then
   begin
      for i := 1 to sgUsers.rowcount - 1 do
      begin
         if not strEmpty(sgUsers.cells[0, i]) then
            paramfile.WriteString('Users', sgUsers.cells[0, i], sgUsers.cells[1, i]);
      end;
   end;
   paramfile.WriteString('Directories', 'TruncPath', edTrunc.text);
   paramfile.WriteString('Directories', 'BasePath', edBase.text);
   paramfile.WriteString('Directories', 'DatabasePath', edDatabase.text);

end;

procedure TDbIsamToGit.sgPathClick(sender: TObject);
var
   sPath: string;
begin
   sPath := sgPath.Cells[0, sgPath.Row];
   sPath := strReplace(sPath, '\', '_');
   sPath := strReplace(sPath, ':', '');
   sPath := strTrimChR(sPath, '_');
   edLineFilename.Text := sPath + '.txt';
end;

(*
  $stdout.binmode
  $author = "John Doe <john@example.com>"

  $marks = []
  def convert_dir_to_mark(dir)
  if !$marks.include?(dir)
  $marks << dir
  end
  ($marks.index(dir)+1).to_s
  end


  def convert_dir_to_date(dir)
  if dir == 'current'
  return Time.now().to_i
  else
  dir = dir.gsub('back_', '')
  (year, month, day) = dir.split('_')
  return Time.local(year, month, day).to_i
  end
  end

  def export_data(string)
  print "data #{string.size}\n#{string}"
  end

  def inline_data(file, code='M', mode='644')
  content = File.read(file)
  puts "#{code} #{mode} inline #{file}"
  export_data(content)
  end

  def print_export(dir, last_mark)
  date = convert_dir_to_date(dir)
  mark = convert_dir_to_mark(dir)

  puts 'commit refs/heads/master'
  puts "mark :#{mark}"
  puts "committer #{$author} #{date} -0700"
  export_data("imported from #{dir}")
  puts "from :#{last_mark}" if last_mark

  puts 'deleteall'
  Dir.glob("**/*").each do |file|
  next if !File.file?(file)
  inline_data(file)
  end
  mark
  end


  # Loop through the directories
  last_mark = nil
  Dir.chdir(ARGV[0]) do
  Dir.glob("*").each do |dir|
  next if File.file?(dir)

  # move into the target directory
  Dir.chdir(dir) do
  last_mark = print_export(dir, last_mark)
  end
  end
  end
*)


end.

