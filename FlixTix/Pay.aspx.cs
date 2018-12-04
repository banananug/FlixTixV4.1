using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pay : System.Web.UI.Page
{
    SqlCommand sqlCommand1;//will be available for all functions
    SqlConnection sqlConnection1;//will be available for all functions
    string  SeatesInfoStr; int counter ;
    static string snackStr;
    bool[,] seatesData = new bool[5, 5];
    const int moviePrice= 30,popcornPrice=15,nachosPrice=10,drinkPrice=8;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UniqueID"] == null)
            Response.Redirect("Home.aspx");
        if (Session["FilmName"] != null && Session["SeatsInfo"]!=null)
        {
            string FilmName = (string)Session["FilmName"];
            SeatesInfoStr = (string)Session["SeatsInfo"];
            if (SeatesInfoStr != null)
            {
                var data = SeatesInfoStr.Split(',');
                int _row = 0;
                counter = 0;
                for (int i = 0; i < data.Length; i++)
                {
                    seatesData[_row, i % 5] = Convert.ToBoolean(data[i]);
                    if (i % 5 == 4)
                        _row++;
                }
                SeatesInfoStr = "";
                for (int row = 0; row < 5; row++)
                {
                    string RowStr = "";
                    for (int col = 0; col < 5; col++)
                    {
                        if (seatesData[row, col])
                        {
                            if (RowStr != "")
                                RowStr += ", ";
                            RowStr += "<a class=\"Pay_SeatStyle\">Seat: " + (col + 1) + "</a>";
                            counter++;
                        }
                    }
                    if (RowStr != "")
                    {
                        if (SeatesInfoStr != "")
                            SeatesInfoStr += "<br />";
                        SeatesInfoStr += "<u><b> Row: " + (row + 1) + " </b> > " + RowStr + "</u>";
                    }
                }
                SeatesInfoStr += "<br />";
                SeatesInfoStr += "Total <u>" + counter * moviePrice + "</u>$" + " for your ticket(s)";
            }
            lblTransactionInfo.InnerHtml = "You're paying for " + FilmName + "<br />" + SeatesInfoStr;
            DD_CardType.Enabled = true;
            TxtCardNumber.Enabled = true;
            txtPhoneNumber.Enabled = true;
   
        }
    }
    protected void ddl_Change(object sender, EventArgs e)
    {
       
        
        {
           
            
        }
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        string Seats, Payment, DateNTime;
        int FilmId, UserId;
        System.Data.SqlClient.SqlDataReader SqlDataReader1;
        string constr = @"Data Source=DESKTOP-2JDMA37\SQLEXPRESS;Initial Catalog=FlixTix;Integrated Security=True";
        sqlConnection1 = new System.Data.SqlClient.SqlConnection(constr);			//the command object
        //get filmId
        sqlCommand1 = new SqlCommand("SELECT Id FROM Films WHERE Title=@Title", sqlConnection1);
        sqlCommand1.Parameters.AddWithValue("@Title", (string)Session["FilmName"]);
        sqlCommand1.Connection.Open();					//open the command connection
        SqlDataReader1 = sqlCommand1.ExecuteReader();	//the Reader gets the selected records
        SqlDataReader1.Read();
        FilmId = Int32.Parse(SqlDataReader1["Id"].ToString());
        sqlCommand1.Connection.Close();         //close the command object
        SqlDataReader1.Close();
        UserId = Int32.Parse(Session["UserId"].ToString()); //get user id
        //get the rest
        Seats = (string)Session["SeatsInfo"];
        Payment = DD_CardType.Text;
        DateNTime= DateTime.Now.ToString();
        //insert to orders table
        sqlCommand1 = new SqlCommand("INSERT Orders (FilmId,UserId,Seats,Payment,DateNTime) VALUES (@FilmId,@UserId,@Seats,@Payment,@DateNTime) SELECT SCOPE_IDENTITY() ", sqlConnection1);
        sqlCommand1.Parameters.AddWithValue("@FilmId", FilmId);
        sqlCommand1.Parameters.AddWithValue("@UserId", UserId);
        sqlCommand1.Parameters.AddWithValue("@Seats", Seats);
        sqlCommand1.Parameters.AddWithValue("@Payment", Payment);
        sqlCommand1.Parameters.AddWithValue("@DateNTime", DateNTime);
        sqlCommand1.Connection.Open();                  //open the command connection
        int OrderId = Convert.ToInt32(sqlCommand1.ExecuteScalar());
        sqlCommand1.Connection.Close();         //close the command object
        SqlDataReader1.Close();
        //insert to Food table
        
        Session["PhoneNumber"] = txtPhoneNumber.Text;
        Session["UserId"] = UserId;
        Response.Redirect("Orders.aspx");
    }
}