using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DemoPodgotovka
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static ObservableCollection<Car> Cars { get; set; }

        public MainWindow()
        {
            Cars = new ObservableCollection<Car>();
            InitializeComponent();
            DataContext = this;
            DbConnectionManager.Initialize();
            LoadData();

        }

        public static void LoadData()
        {
            Cars.Clear();

            try
            {
                var cmd = DbConnectionManager.Command(@"SELECT
                    car_id,
                    car_name,
                    type_name, 
                    car_km, 
                    image_url, 
                    car_value,
                    car_steering, 
                    car_price 
                    FROM avto_import ai JOIN car_type ct ON ct.type_id = ai.car_type
                    Order by car_name");
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string urlbool = "/Resource/Cars/" + reader["car_name"].ToString()! + ".png";
                    if(!ResourceExists(urlbool))
                    {
                        urlbool = "/Resource/noimage.png";
                    }

                    Cars.Add(new Car
                    {
                        Id = Convert.ToInt32(reader["car_id"]),
                        Name = reader["car_name"].ToString()!,
                        Kind = reader["type_name"].ToString()!,
                        Valuebenzin = reader["car_km"].ToString()!,
                        Vmestimost = reader["car_value"].ToString()!,
                        Ruletype = reader["car_steering"].ToString()!,
                        Price = "$" + reader["car_price"].ToString()! + "/",
                        Url = urlbool
                    }); 

                }
                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка загрузки данных" + ex.Message);
            }
        }

        public static bool ResourceExists(string relativeUri)
        {
            try
            {
                var resourceInfo = Application.GetResourceStream(new Uri(relativeUri, UriKind.Relative));
                return resourceInfo != null;
            }
            catch
            {
                return false;
            }
        }

        public class Car
        {
            public int Id {  get; set; }
            public string Name { get; set; }
            public string Kind { get; set; }
            public string Valuebenzin { get; set; }
            public string Vmestimost { get; set; }
            public string Ruletype { get; set; }
            public string Price { get; set; }
            public string Url { get; set; }
        }


        private void Heart_Click(object sender, RoutedEventArgs e)
        {
            var clickedButton = sender as Button;
            var parent = (StackPanel)clickedButton.Parent;
            
            foreach (var child in parent.Children)
            {
                if (child is Button btn)
                {
                    if (btn.Name == "Heart" ||  btn.Name =="RedHeart")
                    {
                        if(btn == clickedButton)
                        {
                            btn.Visibility = Visibility.Collapsed;
                        }
                        else
                        {
                            btn.Visibility = Visibility.Visible;
                        }
                    }
                }
            }
        }

        private void add_button_click(object sender, RoutedEventArgs e)
        {
            AddWindow addWindow = new AddWindow();
            addWindow.OnDataAdded += LoadData; // Подписка на событие обновления данных
            addWindow.ShowDialog();
        }

        private void CarsBox_DoubleClick(object sender, MouseButtonEventArgs e)
        {
            if(CarsBox.SelectedItem is Car selectedItem)
            {
                int id = selectedItem.Id;

                ChangeWindow changeWindow = new ChangeWindow(id);
                changeWindow.OnDataChange += LoadData;
                changeWindow.ShowDialog();
            }
        }
    }
}