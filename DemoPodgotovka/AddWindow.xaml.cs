using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

namespace DemoPodgotovka
{
    /// <summary>
    /// Логика взаимодействия для AddWindow.xaml
    /// </summary>
    public partial class AddWindow : Window
    {
        public event Action OnDataAdded;

        public AddWindow()
        {
            InitializeComponent();

            LoadPartnerTypes();
        }


        private void LoadPartnerTypes()
        {
            DbConnectionManager.LoadComboBox(TypeComboBox);

            TypeComboBox.SelectedIndex = -1; // Оставляем поле пустым (по умолчанию)

            TypeRyleBox.Items.Add("Правый");
            TypeRyleBox.Items.Add("Левый");
            TypeRyleBox.SelectedIndex = -1;

        }

        private void addButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var index = TypeComboBox.SelectedItem;
                using var command = DbConnectionManager.Command(
                    @"INSERT INTO public.avto_import 
                    (car_name, car_type, car_year, car_km, 
                    car_value, car_steering, car_price, car_desc)
                    VALUES (@car_name, @car_type, @car_year, @car_km, @car_value, @car_steering, @car_price, @car_desc)"
                );

                command.Parameters.AddWithValue("@car_name", TitleTextBox.Text);
                command.Parameters.AddWithValue("@car_type", ((dynamic)index).Value); // Выбранный тип
                command.Parameters.AddWithValue("@car_year", Convert.ToInt32(YearTextBox.Text));
                command.Parameters.AddWithValue("@car_km", TankValueTextBox.Text);
                command.Parameters.AddWithValue("@car_value", Convert.ToInt32(PeoplesTextBox.Text));
                command.Parameters.AddWithValue("@car_steering", TypeRyleBox.Text);
                command.Parameters.AddWithValue("@car_price", Convert.ToInt32(PriceTextBox.Text));
                command.Parameters.AddWithValue("@car_desc", DescriptionTextBox.Text);

                int rowsAffected = command.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    MessageBox.Show("Партнёр успешно добавлен!");
                    OnDataAdded?.Invoke(); // Вызов события обновления списка партнёров
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Ошибка при добавлении партнёра.");
                }
            }

            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка сохранения данных: {ex.Message}");
            }
        }
    }
}
