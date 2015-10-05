with
  AWS.Server;
with
  HTTP_Redirector.Handler,
  HTTP_Redirector.Mercurial;

procedure HTTP_Redirector.Server is
   HTTP_Server : AWS.Server.HTTP;
begin
   AWS.Server.Start
     (Web_Server => HTTP_Server,
      Name       => "AWS HTTP Redirector revision " & Mercurial.Revision,
      Port       => 80,
      Callback   => Handler.Callback);

   AWS.Server.Wait (AWS.Server.Q_Key_Pressed);
end HTTP_Redirector.Server;
