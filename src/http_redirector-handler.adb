with
  Ada.Strings.Unbounded,
  Ada.Text_IO;

with
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
      else
         return AWS.Response.URL
                  (Location => "http://www.jacob-sparre.dk/ny-forside");
      end if;
   end Response;
end HTTP_Redirector.Handler;
