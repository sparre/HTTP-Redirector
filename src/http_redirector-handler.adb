with
  Ada.Strings.Fixed,
  Ada.Strings.Unbounded,
  Ada.Text_IO;

with
  AWS.Messages,
  AWS.Parameters,
  AWS.URL;

package body HTTP_Redirector.Handler is
   function Callback return AWS.Response.Callback is
   begin
      return Response'Access;
   end Callback;

   function Response (Request : in AWS.Status.Data) return AWS.Response.Data is
      Host       : String renames AWS.Status.Host (Request);
      Parameters : AWS.Parameters.List renames AWS.Status.Parameters (Request);
   begin
      Log :
      declare
         use Ada.Strings.Unbounded, Ada.Text_IO;
         use AWS.Status;
         Buffer : Unbounded_String;
      begin
         Append (Buffer, """" & URL (Request) & """ ");

         Append (Buffer, "{");
         for Index in 1 .. Parameters.Count loop
            if Index > 1 then
               Append (Buffer, ", ");
            end if;

            Append (Buffer, String'(Parameters.Get_Name  (Index)));
            Append (Buffer, "=");
            Append (Buffer, String'(Parameters.Get_Value (Index)));
         end loop;
         Append (Buffer, "}");

         Put_Line (File => Standard_Error,
                   Item => To_String (Buffer));
      end Log;

      if Host = "dr.peytzmail.com" then
         return AWS.Response.URL
                  (Location => AWS.URL.Decode (Parameters.Get ("t")));
      elsif Host = "universitetsavisen.nyhedsbrev.f2.peytz.dk" then
         declare
            use Ada.Strings.Fixed;
            With_ID : String renames Parameters.Get_Name (1);
            Cut     : Natural renames Index (With_ID, "-http");
         begin
            return AWS.Response.URL
                     (Location => With_ID (Cut + 1 .. With_ID'Last));
         end;
      else
         return AWS.Response.Build
                  (Content_Type  => "text/plain",
                   Message_Body  => "Untracked.",
                   Cache_Control => AWS.Messages.Prevent_Cache);
      end if;
   end Response;
end HTTP_Redirector.Handler;
