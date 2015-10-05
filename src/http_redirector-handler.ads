with
  AWS.Response;

private
with AWS.Status;

package HTTP_Redirector.Handler is
   function Callback return AWS.Response.Callback;
private
   function Response (Request : in AWS.Status.Data) return AWS.Response.Data;
end HTTP_Redirector.Handler;
