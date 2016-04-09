using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using websiteDBSampleModel;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        if (Membership.ValidateUser(UserName.Text, Password.Text))
        {

            // Create the cookie that contains the forms authentication ticket
            HttpCookie authCookie = FormsAuthentication.GetAuthCookie(UserName.Text, RememberMe.Checked);

            // Get the FormsAuthenticationTicket out of the encrypted cookie
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

            //// Create a new FormsAuthenticationTicket that includes our custom User Data
            //FormsAuthenticationTicket newTicket = new FormsAuthenticationTicket(ticket.Version, ticket.Name, ticket.IssueDate, ticket.Expiration, ticket.IsPersistent);

            // Update the authCookie's Value to use the encrypted version of newTicket
           /* authCookie.Value = FormsAuthentication.Encrypt(newTicket)*/;

            // Manually add the authCookie to the Cookies collection
            Response.Cookies.Add(authCookie);

            // Determine redirect URL and send user there
            string redirUrl = FormsAuthentication.GetRedirectUrl(UserName.Text, RememberMe.Checked);
            Response.Redirect(redirUrl);
        }

        // If we reach here, the user's credentials were invalid
        InvalidCredentialsMessage.Visible = true;
        
    }
}
