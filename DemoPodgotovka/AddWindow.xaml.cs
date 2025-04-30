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
            TypeComboBox.SelectedIndex = -1; // Оставляем поле пустым (по умолчанию)
        }

        private void addButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int index = TypeComboBox.SelectedIndex;
                index++;
                MessageBox.Show(index.ToString());
                /*using var command = DbConnectionManager.Command(
                    @"INSERT INTO public.partners 
                    (partner_name, partner_type, partner_rating, partner_address, 
                    director_name, partner_phone, partner_email, partner_inn)
                    VALUES (@name, @type, @rating, @address, @director, @phone, @email, @inn)"
                );

                command.Parameters.AddWithValue("@name", nameTextBox.Text);
                command.Parameters.AddWithValue("@type", typeComboBox.SelectedItem.ToString()!); // Выбранный тип
                command.Parameters.AddWithValue("@rating", rating);
                command.Parameters.AddWithValue("@address", addressTextBox.Text);
                command.Parameters.AddWithValue("@director", directorTextBox.Text);
                command.Parameters.AddWithValue("@phone", phoneNumber);
                command.Parameters.AddWithValue("@email", emailTextBox.Text);
                command.Parameters.AddWithValue("@inn", inn);
*/
                /*int rowsAffected = command.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    MessageBox.Show("Партнёр успешно добавлен!");
                    OnDataAdded?.Invoke(); // Вызов события обновления списка партнёров
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Ошибка при добавлении партнёра.");
                }*/
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
