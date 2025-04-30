using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DemoPodgotovka
{
    /// <summary>
    /// Логика взаимодействия для ChangeWindow.xaml
    /// </summary>
    public partial class ChangeWindow : Window
    {
        public event Action OnDataChange;

        public static int id_cars;

        public ChangeWindow(int id)
        {
            id_cars = id;
            InitializeComponent();
            LoadPartnerTypes();
        }

        private void LoadPartnerTypes()
        {

            // Добавляем фиксированные типы организаций в ComboBox
            TypeComboBox.Items.Add("Седан");
            TypeComboBox.Items.Add("Хэтчбек");
            TypeComboBox.Items.Add("Внедорожник");
            TypeComboBox.Items.Add("Кроссовер");
            TypeComboBox.Items.Add("Лифтбек");
            TypeComboBox.Items.Add("Спорткар");
            TypeComboBox.Items.Add("Суперкар");
            TypeComboBox.Items.Add("Гран Туризмо");
            TypeComboBox.Items.Add("Мускулкар");
            TypeComboBox.Items.Add("Электрокар");
            TypeComboBox.Items.Add("Люкс-седан");
            TypeComboBox.Items.Add("Пикап");

            TypeRyleComboBox.Items.Add("Праый");
            TypeRyleComboBox.Items.Add("Левый");

            try
            {
                using var command = DbConnectionManager.Command(@"SELECT
                    car_id,
                    car_name,
                    car_year,
                    car_type, 
                    car_km, 
                    car_desc,
                    car_value,
                    car_steering, 
                    car_price
                    FROM avto_import ai
                    WHERE car_id = @id");

                command.Parameters.AddWithValue("@id", id_cars);

                using var reader = command.ExecuteReader();
                reader.Read();

                    TitleTextBox.Text = reader["car_name"].ToString();
                    TypeComboBox.SelectedIndex = Convert.ToInt32(reader["car_type"]) - 1;
                    YearTextBox.Text = reader["car_year"].ToString();
                    TankValueTextBox.Text = reader["car_km"].ToString();
                    PeoplesTextBox.Text = reader["car_value"].ToString();
                    TypeRyleComboBox.Text = reader["car_steering"].ToString();
                    PriceTextBox.Text = reader["car_price"].ToString();
                    DescriptionTextBox.Text = reader["car_desc"].ToString(); 
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка загрузки данных: " + ex.Message);
            }
        }



        private void editButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int index = TypeComboBox.SelectedIndex;
                index++;
                using var command = DbConnectionManager.Command(
                    @"UPDATE public.avto_import SET
                    car_name = @car_name, car_type = @car_type, car_year = @car_year, car_km = @car_km, 
                    car_value =  @car_value, car_steering = @car_steering, car_price = @car_price, car_desc = @car_desc
                    WHERE car_id = @id"
                );

                command.Parameters.AddWithValue("@id", id_cars);
                command.Parameters.AddWithValue("@car_name", TitleTextBox.Text);
                command.Parameters.AddWithValue("@car_type", index); // Выбранный тип
                command.Parameters.AddWithValue("@car_year", Convert.ToInt32(YearTextBox.Text));
                command.Parameters.AddWithValue("@car_km", TankValueTextBox.Text);
                command.Parameters.AddWithValue("@car_value", Convert.ToInt32(PeoplesTextBox.Text));
                command.Parameters.AddWithValue("@car_steering", TypeRyleComboBox.Text);
                command.Parameters.AddWithValue("@car_price", Convert.ToInt32(PriceTextBox.Text));
                command.Parameters.AddWithValue("@car_desc", DescriptionTextBox.Text);

                int rowsAffected = command.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    MessageBox.Show("Партнёр успешно добавлен!");
                    OnDataChange?.Invoke(); // Вызов события обновления списка партнёров
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Ошибка при добавлении партнёра.");
                }
            }

            catch (Exception ex)
            {
                if (ex.Message.Contains("23505")) // PostgreSQL сообщает об ошибке уникальности
                {
                    MessageBox.Show("Ошибка: ИНН уже существует в базе данных.");
                }
                else
                {
                    MessageBox.Show($"Ошибка сохранения данных: {ex.Message}");
                }
            }
        }
    }
}
