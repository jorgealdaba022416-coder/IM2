using HtmlAgilityPack;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Net;
using System.Net;
using System.Text.Json;
using System.Text.RegularExpressions;
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
var connectionString = "Server=localhost;Database=aldaba_fmarketdirect;User ID=root;Password=0430;";

async Task SyncGiftCardsAsync()
{
    var url = "https://farmersmarketdirect.com/store/gift-baskets";
    var web = new HtmlWeb();
    var doc = await web.LoadFromWebAsync(url);

    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var clearCmd = new MySqlCommand("DELETE FROM GiftCards", connection);
    clearCmd.ExecuteNonQuery();

    var products = doc.DocumentNode.SelectNodes("//section[@itemtype='https://schema.org/Product']");

    Console.WriteLine($"Found {products?.Count ?? 0} gift card products");

    if (products != null)
    {
        foreach (var product in products)
        {
            var nameNode = product.SelectSingleNode(".//*[@itemprop='name']");
            var priceNode = product.SelectSingleNode(".//*[@itemprop='price']");

            Console.WriteLine($"Name: {nameNode?.InnerText}, Price: {priceNode?.InnerText}");

            if (nameNode != null && priceNode != null)
            {
                var name = WebUtility.HtmlDecode(nameNode.InnerText.Trim());
                var priceText = WebUtility.HtmlDecode(priceNode.InnerText).Replace("$", "").Trim();

                if (decimal.TryParse(priceText, out var amount))
                {
                    var insertCmd = new MySqlCommand(
                        "INSERT INTO GiftCards (Name, Amount, Currency) VALUES (@name, @amount, @currency)",
                        connection);

                    insertCmd.Parameters.AddWithValue("@name", name);
                    insertCmd.Parameters.AddWithValue("@amount", amount);
                    insertCmd.Parameters.AddWithValue("@currency", "USD");
                    insertCmd.ExecuteNonQuery();

                    Console.WriteLine($"Inserted: {name} - {amount} USD");
                }
            }
        }
    }
}


async Task SyncBeefAsync()
{
    var url = "https://farmersmarketdirect.com/store/beef";
    var web = new HtmlWeb();
    var doc = await web.LoadFromWebAsync(url);

    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var clearCmd = new MySqlCommand("DELETE FROM Beef", connection);
    clearCmd.ExecuteNonQuery();

    var products = doc.DocumentNode.SelectNodes("//section[@itemscope][@itemtype='https://schema.org/Product']");

    if (products != null)
    {
        foreach (var product in products)
        {

            var nameNode = product.SelectSingleNode(".//h3[@itemprop='name']");
            var priceNode = product.SelectSingleNode(".//span[@itemprop='price']");
            var weightNode = product.SelectSingleNode(".//div[contains(@class,'averageWeight')]");
            var availabilityNode = product.SelectSingleNode(".//link[@itemprop='availability']");

            var name = nameNode != null ? nameNode.InnerText.Trim() : "Unknown";
            var priceText = priceNode != null ? priceNode.InnerText.Trim() : "0.00";
            var weight = weightNode != null ? weightNode.InnerText.Trim() : "N/A";
            var availability = availabilityNode != null &&
                               availabilityNode.GetAttributeValue("href", "").Contains("InStock");

            decimal.TryParse(Regex.Match(priceText, @"[\d\.]+").Value, out decimal amount);

            var insertCmd = new MySqlCommand(
                "INSERT INTO Beef (Name, Amount, Currency, Weight, Availability) " +
                "VALUES (@name, @amount, @currency, @weight, @availability)",
                connection
            );

            insertCmd.Parameters.AddWithValue("@name", name);
            insertCmd.Parameters.AddWithValue("@amount", amount);
            insertCmd.Parameters.AddWithValue("@currency", "USD");
            insertCmd.Parameters.AddWithValue("@weight", weight);
            insertCmd.Parameters.AddWithValue("@availability", availability);

            insertCmd.ExecuteNonQuery();
        }
    }
}

async Task SyncPorkAsync()
{
    var url = "https://farmersmarketdirect.com/store/pork";
    var web = new HtmlWeb();
    var doc = await web.LoadFromWebAsync(url);

    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var clearCmd = new MySqlCommand("DELETE FROM Pork", connection);
    clearCmd.ExecuteNonQuery();

    var products = doc.DocumentNode.SelectNodes("//section[@itemscope][@itemtype='https://schema.org/Product']");

    if (products != null)
    {
        foreach (var product in products)
        {
            var nameNode = product.SelectSingleNode(".//h3[@itemprop='name']");
            var priceNode = product.SelectSingleNode(".//span[@itemprop='price']");
            var weightNode = product.SelectSingleNode(".//div[contains(@class,'averageWeight')]");
            var availabilityNode = product.SelectSingleNode(".//link[@itemprop='availability']");

            var name = nameNode != null ? nameNode.InnerText.Trim() : "Unknown";
            var priceText = priceNode != null ? priceNode.InnerText.Trim() : "0.00";
            var weight = weightNode != null ? weightNode.InnerText.Trim() : "N/A";
            var availability = availabilityNode != null &&
                               availabilityNode.GetAttributeValue("href", "").Contains("InStock");

            decimal.TryParse(Regex.Match(priceText, @"[\d\\.]+").Value, out decimal amount);

            var insertCmd = new MySqlCommand(
                "INSERT INTO Pork (Name, Amount, Currency, Weight, Availability) " +
                "VALUES (@name, @amount, @currency, @weight, @availability)", connection);

            insertCmd.Parameters.AddWithValue("@name", name);
            insertCmd.Parameters.AddWithValue("@amount", amount);
            insertCmd.Parameters.AddWithValue("@currency", "USD");
            insertCmd.Parameters.AddWithValue("@weight", weight);
            insertCmd.Parameters.AddWithValue("@availability", availability);

            insertCmd.ExecuteNonQuery();
        }
    }
}
async Task SyncChickenAsync()
{
    var url = "https://farmersmarketdirect.com/store/chicken";
    var web = new HtmlWeb();
    var doc = await web.LoadFromWebAsync(url);

    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var clearCmd = new MySqlCommand("DELETE FROM Chicken", connection);
    clearCmd.ExecuteNonQuery();

    var products = doc.DocumentNode.SelectNodes("//section[@itemscope][@itemtype='https://schema.org/Product']");

    if (products != null)
    {
        foreach (var product in products)
        {
            var nameNode = product.SelectSingleNode(".//h3[@itemprop='name']");
            var priceNode = product.SelectSingleNode(".//span[@itemprop='price']");
            var weightNode = product.SelectSingleNode(".//div[contains(@class,'averageWeight')]");
            var availabilityNode = product.SelectSingleNode(".//link[@itemprop='availability']");

            var name = nameNode != null ? nameNode.InnerText.Trim() : "Unknown";
            var priceText = priceNode != null ? priceNode.InnerText.Trim() : "0.00";
            var weight = weightNode != null ? weightNode.InnerText.Trim() : "N/A";
            var availability = availabilityNode != null &&
                               availabilityNode.GetAttributeValue("href", "").Contains("InStock");

            decimal.TryParse(Regex.Match(priceText, @"[\d\.]+").Value, out decimal amount);

            var insertCmd = new MySqlCommand(
                "INSERT INTO Chicken (Name, Amount, Currency, Weight, Availability) " +
                "VALUES (@name, @amount, @currency, @weight, @availability)",
                connection
            );

            insertCmd.Parameters.AddWithValue("@name", name);
            insertCmd.Parameters.AddWithValue("@amount", amount);
            insertCmd.Parameters.AddWithValue("@currency", "USD");
            insertCmd.Parameters.AddWithValue("@weight", weight);
            insertCmd.Parameters.AddWithValue("@availability", availability);

            insertCmd.ExecuteNonQuery();
        }
    }
}

async Task SyncBeveragesAsync()
{
    var url = "https://farmersmarketdirect.com/store/beverages";
    var web = new HtmlWeb();
    var doc = await web.LoadFromWebAsync(url);

    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var clearCmd = new MySqlCommand("DELETE FROM Beverages", connection);
    clearCmd.ExecuteNonQuery();

    var products = doc.DocumentNode.SelectNodes("//section[@itemscope][@itemtype='https://schema.org/Product']");

    if (products != null)
    {
        foreach (var product in products)
        {
            var nameNode = product.SelectSingleNode(".//h3[@itemprop='name']");
            var priceNode = product.SelectSingleNode(".//span[@itemprop='price']");
            var volumeNode = product.SelectSingleNode(".//p[@class='tw-m-0 tw-mt-1 tw-text-sm tw-text-gray-500']");
            var availabilityNode = product.SelectSingleNode(".//link[@itemprop='availability']");

            var name = nameNode != null ? nameNode.InnerText.Trim() : "Unknown";
            var priceText = priceNode != null ? priceNode.InnerText.Trim() : "0.00";
            var volume = volumeNode != null ? volumeNode.InnerText.Trim() : "N/A";
            var availability = availabilityNode != null &&
                               availabilityNode.GetAttributeValue("href", "").Contains("InStock");

            decimal.TryParse(Regex.Match(priceText, @"[\d\\.]+").Value, out decimal amount);

            var insertCmd = new MySqlCommand(
                "INSERT INTO Beverages (Name, Amount, Currency, Volume, Availability) " +
                "VALUES (@name, @amount, @currency, @volume, @availability)",
                connection
            );

            insertCmd.Parameters.AddWithValue("@name", name);
            insertCmd.Parameters.AddWithValue("@amount", amount);
            insertCmd.Parameters.AddWithValue("@currency", "USD");
            insertCmd.Parameters.AddWithValue("@volume", volume);
            insertCmd.Parameters.AddWithValue("@availability", availability);

            insertCmd.ExecuteNonQuery();
        }
    }
}

async Task SyncCoffeeAsync()
{
    var url = "https://farmersmarketdirect.com/store/coffee";
    var web = new HtmlWeb();
    var doc = await web.LoadFromWebAsync(url);

    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var clearCmd = new MySqlCommand("DELETE FROM Coffee", connection);
    clearCmd.ExecuteNonQuery();

    var products = doc.DocumentNode.SelectNodes("//section[@itemscope][@itemtype='https://schema.org/Product']");

    if (products != null)
    {
        foreach (var product in products)
        {
            var nameNode = product.SelectSingleNode(".//h3[@itemprop='name']");
            var priceNode = product.SelectSingleNode(".//span[@itemprop='price']");
            var volumeNode = product.SelectSingleNode(".//p[@class='tw-m-0 tw-mt-1 tw-text-sm tw-text-gray-500']");
            var availabilityNode = product.SelectSingleNode(".//link[@itemprop='availability']");

            var name = nameNode != null ? nameNode.InnerText.Trim() : "Unknown";
            var priceText = priceNode != null ? priceNode.InnerText.Trim() : "0.00";
            var volume = volumeNode != null ? volumeNode.InnerText.Trim() : "N/A";
            var availability = availabilityNode != null &&
                               availabilityNode.GetAttributeValue("href", "").Contains("InStock");

            decimal.TryParse(Regex.Match(priceText, @"[\d\\.]+").Value, out decimal amount);

            var insertCmd = new MySqlCommand(
                "INSERT INTO coffee (Name, Amount, Currency, Volume, Availability) " +
                "VALUES (@name, @amount, @currency, @volume, @availability)",
                connection
            );

            insertCmd.Parameters.AddWithValue("@name", name);
            insertCmd.Parameters.AddWithValue("@amount", amount);
            insertCmd.Parameters.AddWithValue("@currency", "USD");
            insertCmd.Parameters.AddWithValue("@volume", volume);
            insertCmd.Parameters.AddWithValue("@availability", availability);

            insertCmd.ExecuteNonQuery();
        }
    }
}


using (var conn = new MySqlConnection(connectionString))
{
    conn.Open();
    var cmd = new MySqlCommand("SELECT DISTINCT name, amount FROM giftcards", conn);
    using (var reader = cmd.ExecuteReader())
    {
        while (reader.Read())
        {
            Console.WriteLine($"{reader["name"]} - {reader["amount"]}");
        }
    }
}

await SyncCoffeeAsync();
await SyncPorkAsync();
await SyncGiftCardsAsync();
await SyncBeefAsync();
await SyncChickenAsync();
await SyncBeveragesAsync();

app.MapGet("/giftcards", () =>
{
    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var command = new MySqlCommand("SELECT name, amount FROM giftcards", connection);
    using var reader = command.ExecuteReader();

    var giftcards = new List<object>();
    while (reader.Read())
    {
        giftcards.Add(new
        {
            name = reader.GetString("name"),
            amount = reader.GetDecimal("amount")
        });
    }

    return Results.Json(giftcards);
});


app.MapGet("/beef", () =>
{
    var beefProducts = new List<object>();
    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var command = new MySqlCommand(
        "SELECT Id, Name, Amount, Currency, Weight, Availability FROM Beef", connection
    );

    using var reader = command.ExecuteReader();
    while (reader.Read())
    {
        beefProducts.Add(new
        {
            id = reader.GetInt32("Id"),
            name = reader.GetString("Name"),
            amount = reader.GetDecimal("Amount"),
            currency = reader.GetString("Currency"),
            weight = reader.GetString("Weight"),
            availability = reader.GetBoolean("Availability")
        });
    }

    return Results.Json(beefProducts);
});

app.MapGet("/pork", () =>
{
    var porkProducts = new List<object>();
    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var command = new MySqlCommand(
        "SELECT Id, Name, Amount, Currency, Weight, Availability FROM Pork", connection);

    using var reader = command.ExecuteReader();
    while (reader.Read())
    {
        porkProducts.Add(new
        {
            id = reader.GetInt32("Id"),
            name = reader.GetString("Name"),
            amount = reader.GetDecimal("Amount"),
            currency = reader.GetString("Currency"),
            weight = reader.GetString("Weight"),
            availability = reader.GetBoolean("Availability")
        });
    }

    return Results.Json(porkProducts);
});

app.MapGet("/chicken", () =>
{
    var chickenProducts = new List<object>();
    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var command = new MySqlCommand(
        "SELECT Id, Name, Amount, Currency, Weight, Availability FROM Chicken", connection
    );

    using var reader = command.ExecuteReader();
    while (reader.Read())
    {
        chickenProducts.Add(new
        {
            id = reader.GetInt32("Id"),
            name = reader.GetString("Name"),
            amount = reader.GetDecimal("Amount"),
            currency = reader.GetString("Currency"),
            weight = reader.GetString("Weight"),
            availability = reader.GetBoolean("Availability")
        });
    }

    return Results.Json(chickenProducts);
});

app.MapGet("/beverages", () =>
{
    var beverageProducts = new List<object>();
    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var command = new MySqlCommand(
        "SELECT Id, Name, Amount, Currency, Volume, Availability FROM Beverages", connection
    );

    using var reader = command.ExecuteReader();
    while (reader.Read())
    {
        beverageProducts.Add(new
        {
            id = reader.GetInt32("Id"),
            name = reader.GetString("Name"),
            amount = reader.GetDecimal("Amount"),
            currency = reader.GetString("Currency"),
            volume = reader.GetString("Volume"),
            availability = reader.GetBoolean("Availability")
        });
    }

    return Results.Json(beverageProducts);
});

app.MapGet("/coffee", () =>
{
    var coffeeProducts = new List<object>();
    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var command = new MySqlCommand(
        "SELECT Id, Name, Amount, Currency, Volume, Availability FROM Coffee", connection
    );

    using var reader = command.ExecuteReader();
    while (reader.Read())
    {
        coffeeProducts.Add(new
        {
            id = reader.GetInt32("id"),
            name = reader.GetString("name"),
            amount = reader.GetDecimal("amount"),
            currency = reader.GetString("currency"),
            volume = reader.GetString("volume"),
            availability = reader.GetBoolean("availability")
        });
    }

    return Results.Json(coffeeProducts);
});

app.MapPost("/purchase", async (HttpContext context) =>
{
    try
    {
        var data = await context.Request.ReadFromJsonAsync<PurchaseRequest>();

        if (data == null)
            return Results.Json(new { success = false, message = "Invalid data" });

        using var connection = new MySqlConnection(connectionString);
        connection.Open();

        var updateCmd = new MySqlCommand($@"
            UPDATE {data.Table}
            SET purchasecount = purchasecount + 1,
                totalsales = totalsales + @amount
            WHERE name = @name", connection);

        updateCmd.Parameters.AddWithValue("@name", data.Name);
        updateCmd.Parameters.AddWithValue("@amount", data.Amount);
        await updateCmd.ExecuteNonQueryAsync();

        return Results.Json(new { success = true });
    }
    catch (Exception ex)
    {
        Console.WriteLine("❌ Purchase error: " + ex.Message);
        return Results.Json(new { success = false, message = ex.Message });
    }
});




app.MapGet("/summary/{table}", (string table) =>
{
    using var connection = new MySqlConnection(connectionString);
    connection.Open();

    var command = new MySqlCommand($@"
        SELECT SUM(purchasecount) AS totalpurchases,
               SUM(totalsales) AS totalsales
        FROM {table}", connection);

    using var reader = command.ExecuteReader();
    if (reader.Read())
    {
        return Results.Json(new
        {
            purchasecount = reader.IsDBNull(0) ? 0 : reader.GetInt32(0),
            totalsales = reader.IsDBNull(1) ? 0.00m : reader.GetDecimal(1)
        });
    }

    return Results.Json(new { purchasecount = 0, totalsales = 0.00 });
});





app.UseStaticFiles();
app.Run();

public class PurchaseRequest
{
    public string Name { get; set; }
    public decimal Amount { get; set; }
    public string Table { get; set; }
}





