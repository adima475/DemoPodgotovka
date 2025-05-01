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
        Database=DemoExamen;
        Username=postgres;
        Password=123;
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


        public static void LoadComboBox(ComboBox pidor)
        {
            Dictionary<string, int> MyComboBox = new Dictionary<string, int>();
            var cmd = DbConnectionManager.Command("SELECT type_id, type_name from car_type");
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                MyComboBox.Add(reader.GetString(1), reader.GetInt32(0));

            }
            pidor.ItemsSource = MyComboBox;
            pidor.DisplayMemberPath = "Key";
            pidor.SelectedValuePath = "Value";
            reader.Close();
        }
    }
}
