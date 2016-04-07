using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using websiteDBSampleModel;
using System.Data.Entity;
using System.Web.Security;
public partial class CustomerPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
        
    }
    string[] role = Roles.GetRolesForUser();

    public void BindGrid()
    {
        using (websiteDBSampleEntities context = new websiteDBSampleEntities())
        {
            if (context.Customers.Count() > 0)
            {
                gvCustomer.DataSource = context.Customers;
                gvCustomer.DataBind();
            }
            else
            {
                var obj = new List<Customer>();
                obj.Add(new Customer());
                // Bind the DataTable which contain a blank row to the GridView
                gvCustomer.DataSource = obj;
                gvCustomer.DataBind();
                int columnsCount = gvCustomer.Columns.Count;
                gvCustomer.Rows[0].Cells.Clear();// clear all the cells in the row
                gvCustomer.Rows[0].Cells.Add(new TableCell()); //add a new blank cell
                gvCustomer.Rows[0].Cells[0].ColumnSpan = columnsCount; //set the column span to the new added cell

                //You can set the styles here
                gvCustomer.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                gvCustomer.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                gvCustomer.Rows[0].Cells[0].Font.Bold = true;
                //set No Results found to the new added cell
                gvCustomer.Rows[0].Cells[0].Text = "NO RESULT FOUND!";
            }
        }
    }

    protected void gvCustomer_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gvCustomer.Rows[e.RowIndex];
        TextBox txtFirstName = row.FindControl("txtFirstName") as TextBox;
        TextBox txtLastName = row.FindControl("txtLastName") as TextBox;
        if (txtFirstName != null && txtLastName != null)
        {
            using (websiteDBSampleEntities context = new websiteDBSampleEntities())
            {
                if (role[0] == "Administrator")
                {
                    int customerID = Convert.ToInt32(gvCustomer.DataKeys[e.RowIndex].Value);
                    Customer obj = context.Customers.First(x => x.CustomerID == customerID);
                    obj.Name = txtFirstName.Text;
                    obj.Family = txtLastName.Text;

                    context.SaveChanges();
                    lblMessage.Text = "Saved successfully.";
                    gvCustomer.EditIndex = -1;
                    BindGrid();
                }
                else
                    lblMessage.Text = "You have not permission to Update .";
            }
        }
    }

    protected void gvCustomer_RowEditing(object sender, GridViewEditEventArgs e)
    {

        if (role[0] == "Administrator")
        {

            gvCustomer.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        else
        lblMessage.Text = "You have not permission to Edit .";
    }

    protected void gvCustomer_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (role[0] == "Administrator")
        {

            int customerID = Convert.ToInt32(gvCustomer.DataKeys[e.RowIndex].Value);
            using (websiteDBSampleEntities context = new websiteDBSampleEntities())
            {
                Customer obj = context.Customers.First(x => x.CustomerID == customerID);
                context.DeleteObject(obj);
                context.SaveChanges();
                BindGrid();
                lblMessage.Text = "Deleted successfully.";
            }
        }
        else
        lblMessage.Text = "You have not permission to Delete .";
    }

    protected void gvCustomer_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "InsertNew")
        {
            if (role[0] == "Administrator")
            {
                int customerID = Convert.ToInt32(gvCustomer.Rows.Count);
                GridViewRow row = gvCustomer.FooterRow;
                TextBox txtFirstName = row.FindControl("txtFirstNameNew") as TextBox;
                TextBox txtLastName = row.FindControl("txtLastNameNew") as TextBox;
                if (txtFirstName != null && txtLastName != null)
                {
                    using (websiteDBSampleEntities context = new websiteDBSampleEntities())
                    {
                        Customer obj = new Customer();
                        obj.CustomerID = customerID++;
                        //obj.CustomerID = Convert.ToInt32( txtCustomerID.Text);
                        obj.Name = txtFirstName.Text;
                        obj.Family = txtLastName.Text;


                        context.AddToCustomers(obj);
                        context.SaveChanges();
                        lblMessage.Text = "Added successfully.";
                        BindGrid();

                    }
                }
            }
            else
            lblMessage.Text = "You have not permission to Insert .";

        }
    }


    protected void gvCustomer_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvCustomer.EditIndex = -1;
        BindGrid();

    }
}
