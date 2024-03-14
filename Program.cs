using System;
using System.Data;
using System.Data.SqlClient;

namespace TeaShopApp
{
    class Program
    {
        static string connectionString = "Data Source=(local);Initial Catalog=TEST4;Integrated Security=True";
        static SqlDataAdapter adapter;

        static void Main(string[] args)
        {
            DataSet dataSet = new DataSet();
            adapter = new SqlDataAdapter("SELECT * FROM Tea", connectionString);
            adapter.Fill(dataSet, "Tea");

            dataSet.Tables["Tea"].PrimaryKey = new DataColumn[] { dataSet.Tables["Tea"].Columns["id"] };

            while (true)
            {
                Console.WriteLine("Выбирай:");
                Console.WriteLine("1. Добавить чаю");
                Console.WriteLine("2. Изменитть чай");
                Console.WriteLine("3. Удалитт чай");
                Console.WriteLine("4. Выйти");
                Console.Write("Твой выбор: ");
                string choice = Console.ReadLine();

                switch (choice)
                {
                    case "1":
                        AddTea(dataSet);
                        break;
                    case "2":
                        EditTea(dataSet);
                        break;
                    case "3":
                        DeleteTea(dataSet);
                        break;
                    case "4":
                        Environment.Exit(0);
                        break;
                    default:
                        Console.WriteLine("Всё фигня, давай по новй");
                        break;
                }
            }
        }

        static void AddTea(DataSet dataSet)
        {
            Console.WriteLine("Добавление нового чая:");
            Console.Write("ID: ");
            int id = int.Parse(Console.ReadLine());
            Console.Write("Название: ");
            string name = Console.ReadLine();
            Console.Write("Описание: ");
            string description = Console.ReadLine();
            Console.Write("Страна: ");
            string originCountry = Console.ReadLine();
            Console.Write("Цена: ");
            decimal price = decimal.Parse(Console.ReadLine());
            Console.Write("Кол-во: ");
            int quantity = int.Parse(Console.ReadLine());
            Console.Write("Вес (грам): ");
            int weightGrams = int.Parse(Console.ReadLine());
            Console.Write("Тип чая: ");
            string teaType = Console.ReadLine();

            AddTea(dataSet, id, name, description, originCountry, price, quantity, weightGrams, teaType);
        }

        static void EditTea(DataSet dataSet)
        {
            Console.WriteLine("Изменение чая:");
            Console.Write("ID: ");
            int id = int.Parse(Console.ReadLine());

            DataRow row = dataSet.Tables["Tea"].Rows.Find(id);
            if (row != null)
            {
                Console.Write("Новое название: ");
                string name = Console.ReadLine();
                Console.Write("Описание: ");
                string description = Console.ReadLine();
                Console.Write("Страна: ");
                string originCountry = Console.ReadLine();
                Console.Write("Цена: ");
                decimal price = decimal.Parse(Console.ReadLine());
                Console.Write("Кол-во: ");
                int quantity = int.Parse(Console.ReadLine());
                Console.Write("Вес (грам): ");
                int weightGrams = int.Parse(Console.ReadLine());
                Console.Write("Тип чая: ");
                string teaType = Console.ReadLine();

                EditTea(dataSet, id, name, description, originCountry, price, quantity, weightGrams, teaType);
            }
            else
            {
                Console.WriteLine("По этому айди ничего не найдено.");
            }
        }

        static void DeleteTea(DataSet dataSet)
        {
            Console.WriteLine("Удаление чая:");
            Console.Write("ID: ");
            int id = int.Parse(Console.ReadLine());

            DeleteTea(dataSet, id);
        }

        static void AddTea(DataSet dataSet, int id, string name, string description, string originCountry, decimal price, int quantity, int weightGrams, string teaType)
        {
            DataRow newRow = dataSet.Tables["Tea"].NewRow();
            newRow["id"] = id;
            newRow["name"] = name;
            newRow["description"] = description;
            newRow["origin_country"] = originCountry;
            newRow["price"] = price;
            newRow["quantity"] = quantity;
            newRow["weight_grams"] = weightGrams;
            newRow["tea_type"] = teaType;

            dataSet.Tables["Tea"].Rows.Add(newRow);

            SqlCommandBuilder commandBuilder = new SqlCommandBuilder(adapter);
            adapter.Update(dataSet, "Tea");
        }

        static void EditTea(DataSet dataSet, int teaId, string name, string description, string originCountry, decimal price, int quantity, int weightGrams, string teaType)
        {
            DataRow row = dataSet.Tables["Tea"].Rows.Find(teaId);
            if (row != null)
            {
                row["name"] = name;
                row["description"] = description;
                row["origin_country"] = originCountry;
                row["price"] = price;
                row["quantity"] = quantity;
                row["weight_grams"] = weightGrams;
                row["tea_type"] = teaType;

                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(adapter);
                adapter.Update(dataSet, "Tea");
            }
            else
            {
                Console.WriteLine("Не тот айди.");
            }
        }

        static void DeleteTea(DataSet dataSet, int teaId)
        {
            DataRow row = dataSet.Tables["Tea"].Rows.Find(teaId);
            if (row != null)
            {
                row.Delete();

                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(adapter);
                adapter.Update(dataSet, "Tea");
            }
            else
            {
                Console.WriteLine("Не тот айди.");
            }
        }
    }
}
