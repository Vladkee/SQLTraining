using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
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

namespace ShopApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        ObservableCollection<Product> dataCollection;

        public MainWindow()
        {
            InitializeComponent();

            this.dataCollection = new ObservableCollection<Product>();
            this.myDataGrid.ItemsSource = this.dataCollection;
        }

        private void Add_Button(object sender, RoutedEventArgs e)
        {
            if (this.myTextBox.Text == string.Empty)
            {
                MessageBox.Show("Please, enter some data to the text field", "Information", MessageBoxButton.OK, MessageBoxImage.Information, MessageBoxResult.None, MessageBoxOptions.ServiceNotification);

                return;
            }

            string[] textArray = this.myTextBox.Text.Split(',');

            string[] tempArray = new string[4];

            for (int i = 0; i < tempArray.Length; i++)
            {
                if (i < textArray.Length)
                    tempArray[i] = textArray[i];
                else
                    tempArray[i] = string.Empty;
            }
            this.dataCollection.Add(new Product(tempArray[0].Trim(), tempArray[1].Trim(), tempArray[2].Trim(), tempArray[3].Trim()));

            this.myTextBox.Clear();
        }

        private void Remove_Button(object sender, RoutedEventArgs e)
        {
            this.dataCollection.Remove(myDataGrid.SelectedItem as Product);
        }

        private void Clear_Button(object sender, RoutedEventArgs e)
        {
            this.dataCollection.Clear();
        }

        private void Save_Button(object sender, RoutedEventArgs e)
        {
            string[] textArray = this.myTextBox.Text.Split(',');

            string[] tempArray = new string[4];

            for (int i = 0; i < tempArray.Length; i++)
            {
                if (i < textArray.Length)
                    tempArray[i] = textArray[i];
                else
                    tempArray[i] = string.Empty;
            }
            Product tempProduct = new Product(tempArray[0].Trim(), tempArray[1].Trim(), tempArray[2].Trim(), tempArray[3].Trim());
            var collectonIndex = this.myDataGrid.SelectedIndex;
            this.dataCollection[collectonIndex] = tempProduct;

            this.myTextBox.Clear();
        }

        private void MyDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (this.dataCollection.Count == 0)
            {
                return;
            }
            var collectonIndex = this.myDataGrid.SelectedIndex;
            Product tempProduct = this.dataCollection[collectonIndex];
            string stringTempProduct = tempProduct.ToString();
            this.myTextBox.Text = stringTempProduct;
        }

        private void MyTextBox_GotMouseCapture(object sender, MouseEventArgs e)
        {
            this.myTextBox.Clear();
        }
    }
}
