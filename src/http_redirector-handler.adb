with
  Ada.Strings.Unbounded,
  Ada.Text_IO;

package body HTTP_Redirector.Handler is
   function Callback return AWS.Response.Callback is
   begin
      return Response'Access;
   end Callback;

   function Response (Request : in AWS.Status.Data) return AWS.Response.Data is
   begin
      Log :
      declare
         use Ada.Strings.Unbounded, Ada.Text_IO;
         use AWS.Status;
         Buffer : Unbounded_String;
      begin
         Append (Buffer, """" & URI (Request) & """ ");
         Append (Buffer, """" & URL (Request) & """ ");

         Append (Buffer, "{");
         for Index in 1 .. Parameters (Request).Count loop
            if Index > 1 then
               Append (Buffer, ", ");
            end if;

            Append (Buffer, String'(Parameters (Request).Get_Name  (Index)));
            Append (Buffer, "=");
            Append (Buffer, String'(Parameters (Request).Get_Value (Index)));
         end loop;
         Append (Buffer, "}");

         Put_Line (File => Standard_Error,
                   Item => To_String (Buffer));
      end Log;

      return
        AWS.Response.URL (Location => "http://www.jacob-sparre.dk/ny-forside");
   end Response;
end HTTP_Redirector.Handler;
