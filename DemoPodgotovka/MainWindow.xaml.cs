using System.Collections.ObjectModel;
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
                                                            title, 
                                                            kind, 
                                                            valuebenzin, 
                                                            vmestimost, 
                                                            ruletype, 
                                                            priceday
	                                                            FROM public.avto;");
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string urlbool = "/Resource/Cars/" + reader["title"].ToString()! + ".png";
                    if(!ResourceExists(urlbool))
                    {
                        urlbool = "/Resource/noimage.png";
                    }

                    Cars.Add(new Car
                    {
                        Name = reader["title"].ToString()!,
                        Kind = reader["kind"].ToString()!,
                        Valuebenzin = reader["valuebenzin"].ToString()!,
                        Vmestimost = reader["vmestimost"].ToString()!,
                        Ruletype = reader["ruletype"].ToString()!,
                        Price = "$" + reader["priceday"].ToString()! + "/",
                        Url = urlbool
                    }); 
                }
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
            addWindow.ShowDialog();
        }

        private void change_button_click(object sender, RoutedEventArgs e)
        {
            ChangeWindow changeWindow = new ChangeWindow();
            changeWindow.ShowDialog();
        }
    }
}