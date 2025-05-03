using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using Npgsql;

namespace DemoPodgotovka
{
    public class DbConnectionManager
    {
        public static NpgsqlConnection Connection = new NpgsqlConnection(@"
        Host=localhost;
        Port=5432;
        Database=DemoExam;
        Username=postgres;
        Password=1234;
        ");

        public static void Initialize()
        {
            if(Connection.State!=System.Data.ConnectionState.Open)
            Connection.Open();
        }

        public static NpgsqlCommand Command(string sql)
        {
            return new NpgsqlCommand(sql, Connection);
        }

        public static NpgsqlDataAdapter DataAdapter(string sql)
        {
            return new NpgsqlDataAdapter(sql, Connection);
        }


        public static void LoadComboBox(ComboBox combobox)
        {
            var items = new List<object>();

            var cmd = Command(@"SELECT type_id, type_name
	                            FROM car_type;");
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                items.Add(new { Key = reader.GetInt32(0), Value = reader.GetString(1) });
            }
            combobox.ItemsSource = items;
            combobox.DisplayMemberPath = "Value";
            combobox.SelectedValuePath = "Key";

            reader.Close();
        }
    }
}
