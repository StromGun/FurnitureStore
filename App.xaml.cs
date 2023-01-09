using System.Windows;

namespace FurnitureStore
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static Entities.FurnitureStoreEntities Context { get; } = new Entities.FurnitureStoreEntities();

        public static Entities.Account CurrentUser = null;
    }
}
