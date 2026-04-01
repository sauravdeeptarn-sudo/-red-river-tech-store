# Clear all data in correct order
Page.destroy_all
OrderItem.destroy_all
Order.destroy_all
Customer.destroy_all
Product.destroy_all
Category.destroy_all
Province.destroy_all

# Create Pages
Page.create!([
  { title: "About Us", content: "Red River Tech Store is a local technology retail business located in Winnipeg, Manitoba. We have been serving the Winnipeg tech community for over six years. Our store specializes in computer hardware, gaming accessories, and PC components. Our knowledgeable staff is always ready to help you find the perfect product for your needs." },
  { title: "Contact Us", content: "We would love to hear from you! Visit us at our Winnipeg location or reach out through the following channels.\n\nPhone: (204) 555-0123\nEmail: info@redrivertech.com\nAddress: 123 Main Street, Winnipeg, Manitoba, R3C 1A1\n\nStore Hours:\nMonday - Friday: 9am - 6pm\nSaturday: 10am - 5pm\nSunday: Closed" }
])
puts "Created #{Page.count} pages!"

# Create Provinces with tax rates
Province.create!([
  { name: "Alberta", gst: 0.05, pst: 0.00, hst: 0.00 },
  { name: "British Columbia", gst: 0.05, pst: 0.07, hst: 0.00 },
  { name: "Manitoba", gst: 0.05, pst: 0.07, hst: 0.00 },
  { name: "New Brunswick", gst: 0.00, pst: 0.00, hst: 0.15 },
  { name: "Newfoundland and Labrador", gst: 0.00, pst: 0.00, hst: 0.15 },
  { name: "Northwest Territories", gst: 0.05, pst: 0.00, hst: 0.00 },
  { name: "Nova Scotia", gst: 0.00, pst: 0.00, hst: 0.15 },
  { name: "Nunavut", gst: 0.05, pst: 0.00, hst: 0.00 },
  { name: "Ontario", gst: 0.00, pst: 0.00, hst: 0.13 },
  { name: "Prince Edward Island", gst: 0.00, pst: 0.00, hst: 0.15 },
  { name: "Quebec", gst: 0.05, pst: 0.09975, hst: 0.00 },
  { name: "Saskatchewan", gst: 0.05, pst: 0.06, hst: 0.00 },
  { name: "Yukon", gst: 0.05, pst: 0.00, hst: 0.00 }
])
puts "Created #{Province.count} provinces!"

# Create Categories
categories = Category.create!([
  { name: "Graphics Cards" },
  { name: "Processors" },
  { name: "Gaming Keyboards" },
  { name: "Storage Drives" }
])

# Create Products
Product.create!([
  { name: "NVIDIA GeForce RTX 4070", description: "High-performance GPU with 12GB GDDR6X memory, ray tracing support, and DLSS 3.0 for smooth 1440p gaming.", price: 599.99, stock_quantity: 15, category: categories[0] },
  { name: "AMD Radeon RX 7800 XT", description: "Powerful AMD graphics card with 16GB GDDR6 memory, ideal for 1440p gaming with excellent price-to-performance ratio.", price: 499.99, stock_quantity: 10, category: categories[0] },
  { name: "NVIDIA GeForce RTX 4060", description: "Mid-range GPU with 8GB GDDR6 memory, perfect for 1080p gaming with ray tracing and DLSS support.", price: 299.99, stock_quantity: 20, category: categories[0] },
  { name: "Intel Core i9-14900K", description: "Intel's flagship desktop processor with 24 cores, 32 threads, and boost clock up to 6.0GHz for extreme performance.", price: 549.99, stock_quantity: 8, category: categories[1] },
  { name: "AMD Ryzen 7 7700X", description: "High-performance 8-core AMD processor with Zen 4 architecture, 4.5GHz base clock and 5.4GHz boost clock.", price: 349.99, stock_quantity: 12, category: categories[1] },
  { name: "AMD Ryzen 5 7600X", description: "Excellent mid-range 6-core processor with Zen 4 architecture, great for gaming and everyday productivity tasks.", price: 229.99, stock_quantity: 25, category: categories[1] },
  { name: "Corsair K95 RGB Platinum", description: "Premium mechanical gaming keyboard with Cherry MX Speed switches, per-key RGB lighting, and dedicated macro keys.", price: 199.99, stock_quantity: 18, category: categories[2] },
  { name: "Razer BlackWidow V4", description: "Professional gaming keyboard featuring Razer Green mechanical switches, RGB lighting, and multi-function roller.", price: 159.99, stock_quantity: 22, category: categories[2] },
  { name: "SteelSeries Apex Pro", description: "World's first keyboard with adjustable mechanical switches, OLED smart display, and magnetic wrist rest included.", price: 179.99, stock_quantity: 14, category: categories[2] },
  { name: "Samsung 990 Pro 1TB NVMe", description: "Ultra-fast PCIe 4.0 NVMe SSD with read speeds up to 7450MB/s, perfect for gaming and professional workloads.", price: 129.99, stock_quantity: 30, category: categories[3] },
  { name: "WD Black SN850X 2TB", description: "High-performance 2TB NVMe SSD optimized for gaming with PCIe 4.0 interface and read speeds up to 7300MB/s.", price: 189.99, stock_quantity: 20, category: categories[3] },
  { name: "Seagate Barracuda 4TB HDD", description: "Reliable 4TB hard drive with 256MB cache, ideal for mass storage of games, media files, and backups.", price: 89.99, stock_quantity: 35, category: categories[3] }
])

puts "Created #{Category.count} categories and #{Product.count} products!"