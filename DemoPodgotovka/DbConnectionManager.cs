using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
    }
}
