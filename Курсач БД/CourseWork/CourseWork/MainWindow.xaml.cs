using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Lab4BD
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        SqlConnection con;
        DataSet ds;
        public MainWindow()
        {
            InitializeComponent();
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect1"].ConnectionString);
            ds = new DataSet();
        }

        private void Table_Selected(object sender, RoutedEventArgs e)
        {
            SqlCommand s = new SqlCommand();
            TreeViewItem t = (TreeViewItem)sender;
            t.Items.Clear();

            if(t.Header.ToString() == "Таблиці")
            {
                s.CommandText = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES where Not(TABLE_NAME like 'sysdiagrams')";
                s.Connection = con;
            }
            if(t.Header.ToString() == "Процедури")
            {
                s.CommandText = "SELECT name FROM sys.objects o WHERE o.[Type] = 'P' and not(name like 'sp%')";
                s.Connection = con;
            }

            con.Open();

            SqlDataReader R = s.ExecuteReader();
            if(R.HasRows & (t.Header.ToString() == "Таблиці"))
            {
                while(R.Read())
                {
                    TreeViewItem ts = new TreeViewItem();
                    ts.Header = R[0].ToString();
                    ts.Selected += Table_Selected1;
                    t.Items.Add(ts);

                }
            }
            if (R.HasRows & (t.Header.ToString() == "Процедури"))
            {
                while (R.Read())
                {
                    TreeViewItem ts = new TreeViewItem();
                    ts.Header = R[0].ToString();
                    ts.Selected += Proc_Selected;
                    t.Items.Add(ts);

                }
            }
            con.Close();
        }

        private void Table_Selected1(object sender, RoutedEventArgs e)
        {
            TreeViewItem t = (TreeViewItem)sender;

            SqlCommand s = new SqlCommand("SELECT * FROM " + t.Header.ToString(), con);
            con.Open();
            SqlDataAdapter DA = new SqlDataAdapter(s);
            DA.Fill(ds, t.Header.ToString());
            DataGrid d = new DataGrid();

            d.AutoGenerateColumns = true;
            d.ItemsSource = ds.Tables[t.Header.ToString()].DefaultView;
            ContextMenu c = new ContextMenu();
            MenuItem m = new MenuItem();
            m.Header = "Закрити";
            m.Click += MenuItem_Click;
            c.Items.Add(m);
            tabs.Items.Add(
                new TabItem
                {
                    Header = t.Header.ToString(),
                    Content = d,
                    ContextMenu = c

                });
            con.Close();
            Status.Text = "Завантажено таблицю " + t.Header.ToString();
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            tabs.Items.RemoveAt(tabs.SelectedIndex);
        }

        private void Proc_Selected(object sender, RoutedEventArgs e)
        {
            TreeViewItem t = (TreeViewItem)sender;
            SqlCommand s = new SqlCommand();
            s.CommandType = CommandType.StoredProcedure;
            s.CommandText = "Procedure_1";
            s.Connection = con;
            con.Open();
            SqlDataAdapter DA = new SqlDataAdapter(s);
            DA.Fill(ds, "Procedure_1");
            DataGrid d = new DataGrid();

            d.AutoGenerateColumns = true;
            d.ItemsSource = ds.Tables["Procedure_1"].DefaultView;
            ContextMenu c = new ContextMenu();
            MenuItem m = new MenuItem();;
            m.Header = "Закрити";
            m.Click += MenuItem_Click;
            c.Items.Add(m);
            tabs.Items.Add(
                new TabItem
                {
                    Header = t.Header.ToString(),
                    Content = d,
                    ContextMenu = c
                });
            
            con.Close();
            Status.Text = "Завантажено таблицю " + t.Header.ToString();

        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            string phrase = Convert.ToString(Status.Text);
            string[] words = phrase.Split(',');
            con.Open();
            SqlCommand s = new SqlCommand("del_DOC1", con);
            s.CommandType = CommandType.StoredProcedure;
            s.Parameters.Add("@Кількістьчасу", SqlDbType.Int, 14, "Кількість часу");
            s.Parameters["@Кількістьчасу"].Value = Convert.ToInt32(words[0]);
            SqlDataAdapter DA = new SqlDataAdapter(s);
            SqlDataReader reader = s.ExecuteReader();
            while (reader.Read())
            {
               
                MessageBox.Show(reader.GetString(0), "Результат виконання тріггера");
            }
            
            DA.DeleteCommand = s;
            DA.Update(ds, "Procedure_1");
            DataTable st = ds.Tables["Procedure_1"];
            ds.AcceptChanges();
            con.Close();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            string phrase = Convert.ToString(Status.Text);
            string[] words = phrase.Split(',');
            con.Open();
            SqlCommand s = new SqlCommand("ins_DOC", con);
            s.CommandType = CommandType.StoredProcedure;
            s.Parameters.Add("@Назвацеху", SqlDbType.VarChar, 100, "Profile_Shop");
            s.Parameters.Add("@Назваобладнання", SqlDbType.VarChar, 100, "Ustavnoy_Kapital");
            s.Parameters.Add("@Кількістьчасу", SqlDbType.VarChar, 100, "named");
            s.Parameters.Add("@Місяць", SqlDbType.VarChar, 100, "number");
            s.Parameters["@Назвацеху"].Value = words[0];
            s.Parameters["@Назваобладнання"].Value = words[1];
            s.Parameters["@Кількістьчасу"].Value = words[2];
            s.Parameters["@Місяць"].Value = words[3];
            SqlDataAdapter DA = new SqlDataAdapter(s);
            DA.InsertCommand = s;
            //DA.InsertCommand.ExecuteNonQuery();
            SqlDataReader reader1 = s.ExecuteReader();
            while (reader1.Read())
            {
                MessageBox.Show(reader1.GetString(0), "Результат виконання тріггера");
            }
            
            DA.Update(ds, "Procedure_1");
            DataTable st = ds.Tables["Procedure_1"];
            ds.AcceptChanges();
            con.Close();
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string phrase = Convert.ToString(Status.Text);
            string[] words = phrase.Split(',');
            con.Open();
            SqlCommand s = new SqlCommand("upd_DOC", con);
            s.CommandType = CommandType.StoredProcedure;
            s.Parameters.Add("@Назвацеху", SqlDbType.VarChar, 100, "Profile_Shop");
            s.Parameters.Add("@Назваобладнання", SqlDbType.VarChar, 100, "Ustavnoy_Kapital");
            s.Parameters.Add("@Кількістьчасу", SqlDbType.VarChar, 100, "named");
            s.Parameters.Add("@Місяць", SqlDbType.VarChar, 100, "number");
            s.Parameters["@Назвацеху"].Value = words[0];
            s.Parameters["@Назваобладнання"].Value = words[1];
            s.Parameters["@Кількістьчасу"].Value = words[2];
            s.Parameters["@Місяць"].Value = words[3];
            SqlDataAdapter DA = new SqlDataAdapter(s);
            SqlDataReader reader = s.ExecuteReader();
            while (reader.Read())
            {

                MessageBox.Show(reader.GetString(0), "Результат виконання тріггера");
            }
            DA.UpdateCommand = s;
            DA.Update(ds, "Procedure_1");
            DataTable st = ds.Tables["Procedure_1"];
            ds.AcceptChanges();
            con.Close();
        }
    }

}

