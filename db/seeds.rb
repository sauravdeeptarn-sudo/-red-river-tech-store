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
  # Graphics Cards (25 products)
  { name: "NVIDIA GeForce RTX 4090", description: "Flagship GPU with 24GB GDDR6X memory, the most powerful consumer graphics card ever made for 4K gaming.", price: 1599.99, stock_quantity: 5, category: categories[0] },
  { name: "NVIDIA GeForce RTX 4080 Super", description: "High-end GPU with 16GB GDDR6X memory, excellent for 4K gaming and content creation.", price: 999.99, stock_quantity: 8, category: categories[0] },
  { name: "NVIDIA GeForce RTX 4070 Ti", description: "Premium GPU with 12GB GDDR6X memory, perfect for high-refresh 1440p and entry-level 4K gaming.", price: 799.99, stock_quantity: 10, category: categories[0] },
  { name: "NVIDIA GeForce RTX 4070", description: "High-performance GPU with 12GB GDDR6X memory, ray tracing support, and DLSS 3.0 for smooth 1440p gaming.", price: 599.99, stock_quantity: 15, category: categories[0] },
  { name: "NVIDIA GeForce RTX 4060 Ti", description: "Mid-high range GPU with 16GB GDDR6 memory, great for 1080p and 1440p gaming with ray tracing.", price: 449.99, stock_quantity: 18, category: categories[0] },
  { name: "NVIDIA GeForce RTX 4060", description: "Mid-range GPU with 8GB GDDR6 memory, perfect for 1080p gaming with ray tracing and DLSS support.", price: 299.99, stock_quantity: 20, category: categories[0] },
  { name: "NVIDIA GeForce RTX 3080", description: "Previous generation flagship with 10GB GDDR6X, still excellent for 4K gaming at a reduced price.", price: 499.99, stock_quantity: 12, category: categories[0] },
  { name: "AMD Radeon RX 7900 XTX", description: "AMD's flagship GPU with 24GB GDDR6 memory, competing directly with NVIDIA's top offerings.", price: 999.99, stock_quantity: 6, category: categories[0] },
  { name: "AMD Radeon RX 7900 XT", description: "High-end AMD GPU with 20GB GDDR6 memory, excellent for 4K gaming and creative workloads.", price: 799.99, stock_quantity: 9, category: categories[0] },
  { name: "AMD Radeon RX 7800 XT", description: "Powerful AMD graphics card with 16GB GDDR6 memory, ideal for 1440p gaming with excellent price-to-performance ratio.", price: 499.99, stock_quantity: 10, category: categories[0] },
  { name: "AMD Radeon RX 7700 XT", description: "Mid-range AMD GPU with 12GB GDDR6 memory, great value for 1080p and 1440p gaming.", price: 449.99, stock_quantity: 15, category: categories[0] },
  { name: "AMD Radeon RX 7600", description: "Budget-friendly AMD GPU with 8GB GDDR6 memory, perfect entry point for modern gaming.", price: 269.99, stock_quantity: 25, category: categories[0] },
  { name: "NVIDIA GeForce RTX 4050", description: "Entry-level RTX GPU with 6GB GDDR6 memory, brings ray tracing to budget gaming builds.", price: 249.99, stock_quantity: 30, category: categories[0] },
  { name: "AMD Radeon RX 6800 XT", description: "Previous gen high-end AMD GPU with 16GB GDDR6, great performance at a discounted price.", price: 399.99, stock_quantity: 8, category: categories[0] },
  { name: "NVIDIA GeForce GTX 1660 Super", description: "Budget gaming GPU with 6GB GDDR6 memory, solid 1080p performance for casual gamers.", price: 199.99, stock_quantity: 20, category: categories[0] },
  { name: "AMD Radeon RX 6600", description: "Efficient mid-range GPU with 8GB GDDR6, excellent 1080p gaming performance.", price: 229.99, stock_quantity: 18, category: categories[0] },
  { name: "NVIDIA GeForce RTX 3060", description: "Popular mid-range GPU with 12GB GDDR6, great for 1080p and entry-level 1440p gaming.", price: 329.99, stock_quantity: 15, category: categories[0] },
  { name: "AMD Radeon Pro W7800", description: "Professional workstation GPU with 32GB GDDR6 ECC memory for CAD and 3D rendering.", price: 2499.99, stock_quantity: 3, category: categories[0] },
  { name: "NVIDIA RTX 4000 Ada", description: "Professional GPU with 20GB GDDR6 ECC memory for professional visualization workloads.", price: 1249.99, stock_quantity: 4, category: categories[0] },
  { name: "AMD Radeon RX 7500 XT", description: "Entry-level GPU with 8GB GDDR6 memory, brings modern features to budget gaming builds.", price: 199.99, stock_quantity: 22, category: categories[0] },
  { name: "NVIDIA GeForce RTX 3070", description: "Excellent previous gen GPU with 8GB GDDR6, still handles most games at 1440p with ease.", price: 399.99, stock_quantity: 10, category: categories[0] },
  { name: "AMD Radeon RX 6700 XT", description: "Solid mid-range GPU with 12GB GDDR6, great 1080p and capable 1440p gaming performance.", price: 349.99, stock_quantity: 12, category: categories[0] },
  { name: "NVIDIA GeForce RTX 4070 Super", description: "Updated mid-high range GPU with 12GB GDDR6X, improved performance over standard 4070.", price: 599.99, stock_quantity: 14, category: categories[0] },
  { name: "AMD Radeon RX 7600 XT", description: "Updated budget GPU with 16GB GDDR6, great value for 1080p gaming enthusiasts.", price: 329.99, stock_quantity: 20, category: categories[0] },
  { name: "NVIDIA GeForce RTX 3090", description: "Previous gen flagship with 24GB GDDR6X, still excellent for content creation and 4K gaming.", price: 699.99, stock_quantity: 5, category: categories[0] },

  # Processors (25 products)
  { name: "Intel Core i9-14900K", description: "Intel's flagship desktop processor with 24 cores, 32 threads, and boost clock up to 6.0GHz for extreme performance.", price: 549.99, stock_quantity: 8, category: categories[1] },
  { name: "Intel Core i9-14900KF", description: "Same as i9-14900K but without integrated graphics, slightly lower price for dedicated GPU users.", price: 529.99, stock_quantity: 7, category: categories[1] },
  { name: "Intel Core i7-14700K", description: "High-performance 20-core processor with boost speeds up to 5.6GHz, excellent for gaming and productivity.", price: 419.99, stock_quantity: 10, category: categories[1] },
  { name: "Intel Core i5-14600K", description: "Popular mid-range processor with 14 cores and boost up to 5.3GHz, great gaming performance per dollar.", price: 299.99, stock_quantity: 15, category: categories[1] },
  { name: "Intel Core i5-14400", description: "Budget-friendly 10-core processor with 4.7GHz boost, solid performance for everyday computing.", price: 199.99, stock_quantity: 20, category: categories[1] },
  { name: "Intel Core i3-14100", description: "Entry-level quad-core processor with 4.7GHz boost, perfect for budget builds and office work.", price: 129.99, stock_quantity: 25, category: categories[1] },
  { name: "AMD Ryzen 9 7950X", description: "AMD's flagship 16-core processor with 5.7GHz boost, ultimate choice for content creators and professionals.", price: 699.99, stock_quantity: 6, category: categories[1] },
  { name: "AMD Ryzen 9 7900X", description: "12-core AMD processor with 5.6GHz boost, excellent multi-threaded performance for creators.", price: 449.99, stock_quantity: 8, category: categories[1] },
  { name: "AMD Ryzen 7 7700X", description: "High-performance 8-core AMD processor with Zen 4 architecture, 4.5GHz base clock and 5.4GHz boost clock.", price: 349.99, stock_quantity: 12, category: categories[1] },
  { name: "AMD Ryzen 7 7700", description: "Efficient 8-core processor with 5.3GHz boost, great balance of performance and power consumption.", price: 299.99, stock_quantity: 15, category: categories[1] },
  { name: "AMD Ryzen 5 7600X", description: "Excellent mid-range 6-core processor with Zen 4 architecture, great for gaming and everyday productivity tasks.", price: 229.99, stock_quantity: 25, category: categories[1] },
  { name: "AMD Ryzen 5 7600", description: "6-core processor with 5.1GHz boost, great gaming performance at an accessible price point.", price: 199.99, stock_quantity: 22, category: categories[1] },
  { name: "AMD Ryzen 5 5600X", description: "Previous gen 6-core processor, still excellent value for gaming builds on AM4 platform.", price: 149.99, stock_quantity: 20, category: categories[1] },
  { name: "Intel Core i9-13900K", description: "Previous gen flagship with 24 cores, still extremely capable for all workloads at a reduced price.", price: 449.99, stock_quantity: 8, category: categories[1] },
  { name: "AMD Ryzen 9 7950X3D", description: "16-core processor with 3D V-Cache technology, unmatched gaming and productivity performance.", price: 799.99, stock_quantity: 5, category: categories[1] },
  { name: "AMD Ryzen 7 7800X3D", description: "8-core processor with 3D V-Cache, currently one of the best gaming CPUs available.", price: 449.99, stock_quantity: 10, category: categories[1] },
  { name: "Intel Core i7-13700K", description: "Previous gen 16-core processor, excellent performance for gaming and content creation.", price: 349.99, stock_quantity: 10, category: categories[1] },
  { name: "AMD Ryzen 3 4100", description: "Budget quad-core processor, perfect for entry-level gaming and everyday computing tasks.", price: 89.99, stock_quantity: 30, category: categories[1] },
  { name: "Intel Core i5-13400F", description: "10-core budget processor without integrated graphics, great value for dedicated GPU gaming builds.", price: 179.99, stock_quantity: 18, category: categories[1] },
  { name: "AMD Ryzen 9 5900X", description: "Previous gen 12-core powerhouse, still excellent for content creation at a significantly reduced price.", price: 249.99, stock_quantity: 10, category: categories[1] },
  { name: "Intel Core i9-14900HX", description: "Mobile flagship processor with 24 cores for high-performance laptops and workstations.", price: 599.99, stock_quantity: 6, category: categories[1] },
  { name: "AMD Ryzen 7 5800X3D", description: "Previous gen 8-core with 3D V-Cache, exceptional gaming performance on AM4 platform.", price: 299.99, stock_quantity: 8, category: categories[1] },
  { name: "Intel Core i5-14500", description: "14-core mid-range processor with 5.0GHz boost, excellent for gaming and moderate workloads.", price: 239.99, stock_quantity: 15, category: categories[1] },
  { name: "AMD Ryzen 5 8600G", description: "6-core processor with integrated Radeon 760M graphics, perfect for builds without dedicated GPU.", price: 229.99, stock_quantity: 12, category: categories[1] },
  { name: "Intel Core i7-14700KF", description: "20-core processor without integrated graphics, excellent performance for dedicated gaming builds.", price: 399.99, stock_quantity: 9, category: categories[1] },

  # Gaming Keyboards (25 products)
  { name: "Corsair K95 RGB Platinum", description: "Premium mechanical gaming keyboard with Cherry MX Speed switches, per-key RGB lighting, and dedicated macro keys.", price: 199.99, stock_quantity: 18, category: categories[2] },
  { name: "Razer BlackWidow V4", description: "Professional gaming keyboard featuring Razer Green mechanical switches, RGB lighting, and multi-function roller.", price: 159.99, stock_quantity: 22, category: categories[2] },
  { name: "SteelSeries Apex Pro", description: "World's first keyboard with adjustable mechanical switches, OLED smart display, and magnetic wrist rest included.", price: 179.99, stock_quantity: 14, category: categories[2] },
  { name: "Logitech G915 TKL", description: "Slim wireless mechanical keyboard with GL switches, RGB lighting, and ultra-long 40-hour battery life.", price: 229.99, stock_quantity: 12, category: categories[2] },
  { name: "Corsair K70 RGB MK.2", description: "Classic gaming keyboard with Cherry MX Red switches, aircraft-grade aluminum frame, and USB passthrough.", price: 159.99, stock_quantity: 20, category: categories[2] },
  { name: "Razer Huntsman Elite", description: "Optical-mechanical gaming keyboard with Razer Clicky Optical switches for ultra-fast actuation.", price: 199.99, stock_quantity: 15, category: categories[2] },
  { name: "HyperX Alloy FPS Pro", description: "Compact TKL mechanical keyboard with Cherry MX Red switches, red LED backlighting, and detachable cable.", price: 89.99, stock_quantity: 25, category: categories[2] },
  { name: "Ducky One 3", description: "Premium 60% mechanical keyboard with hot-swap sockets, PBT keycaps, and customizable RGB lighting.", price: 129.99, stock_quantity: 16, category: categories[2] },
  { name: "Keychron K2 Pro", description: "Compact wireless mechanical keyboard with hot-swap sockets, Mac/Windows compatibility, and RGB backlight.", price: 99.99, stock_quantity: 20, category: categories[2] },
  { name: "ASUS ROG Claymore II", description: "Modular gaming keyboard with detachable numpad, ROG RX switches, and up to 100-hour battery life.", price: 249.99, stock_quantity: 8, category: categories[2] },
  { name: "SteelSeries Apex 7", description: "Gaming keyboard with OLED smart display, QX2 mechanical switches, and USB passthrough port.", price: 139.99, stock_quantity: 18, category: categories[2] },
  { name: "Corsair K65 RGB Mini", description: "Compact 60% gaming keyboard with Cherry MX Speed switches, RGB per-key lighting, and double-shot PBT keycaps.", price: 109.99, stock_quantity: 22, category: categories[2] },
  { name: "Razer BlackWidow Lite", description: "Silent mechanical keyboard with Razer Orange switches, white backlighting, and minimal design.", price: 99.99, stock_quantity: 20, category: categories[2] },
  { name: "Logitech G Pro X", description: "Professional gaming keyboard with swappable switches, detachable cable, and compact tenkeyless layout.", price: 149.99, stock_quantity: 14, category: categories[2] },
  { name: "Anne Pro 2", description: "Popular 60% wireless mechanical keyboard with hot-swap PCB and Bluetooth connectivity.", price: 79.99, stock_quantity: 28, category: categories[2] },
  { name: "Corsair K100 RGB", description: "Ultra-premium gaming keyboard with optical-mechanical switches, iCUE control wheel, and per-key RGB.", price: 229.99, stock_quantity: 10, category: categories[2] },
  { name: "Razer Cynosa V2", description: "Budget membrane gaming keyboard with per-key RGB lighting, spill-resistant design, and gaming-grade anti-ghosting.", price: 59.99, stock_quantity: 30, category: categories[2] },
  { name: "SteelSeries Apex 3", description: "Water-resistant gaming keyboard with whisper-quiet switches and 10-zone RGB illumination.", price: 49.99, stock_quantity: 35, category: categories[2] },
  { name: "ASUS ROG Strix Scope RX", description: "Optical mechanical gaming keyboard with ROG RX Red switches, aluminum top plate, and stealth key.", price: 139.99, stock_quantity: 16, category: categories[2] },
  { name: "Glorious GMMK Pro", description: "Premium 75% gasket-mounted keyboard with hot-swap PCB and south-facing RGB LEDs.", price: 169.99, stock_quantity: 12, category: categories[2] },
  { name: "HyperX Alloy Origins", description: "Full-size gaming keyboard with HyperX Red mechanical switches, aircraft-grade aluminum body, and detachable USB-C cable.", price: 109.99, stock_quantity: 20, category: categories[2] },
  { name: "Logitech G613", description: "Wireless mechanical keyboard with Romer-G Tactile switches and 18-month battery life.", price: 99.99, stock_quantity: 15, category: categories[2] },
  { name: "Razer Ornata V3", description: "Mecha-membrane keyboard combining mechanical feel with membrane cushioning and per-key RGB.", price: 79.99, stock_quantity: 25, category: categories[2] },
  { name: "Corsair K55 RGB Pro", description: "Budget gaming keyboard with dynamic per-key RGB, six dedicated macro keys, and spill resistance.", price: 59.99, stock_quantity: 30, category: categories[2] },
  { name: "Wooting 60HE", description: "Analog optical keyboard with hall effect switches, rapid trigger technology, and full 60% layout.", price: 174.99, stock_quantity: 10, category: categories[2] },

  # Storage Drives (25 products)
  { name: "Samsung 990 Pro 1TB NVMe", description: "Ultra-fast PCIe 4.0 NVMe SSD with read speeds up to 7450MB/s, perfect for gaming and professional workloads.", price: 129.99, stock_quantity: 30, category: categories[3] },
  { name: "Samsung 990 Pro 2TB NVMe", description: "2TB version of the flagship NVMe SSD with PCIe 4.0 interface and consistent high performance.", price: 229.99, stock_quantity: 20, category: categories[3] },
  { name: "WD Black SN850X 1TB", description: "High-performance 1TB NVMe SSD optimized for gaming with PCIe 4.0 and read speeds up to 7300MB/s.", price: 109.99, stock_quantity: 25, category: categories[3] },
  { name: "WD Black SN850X 2TB", description: "High-performance 2TB NVMe SSD optimized for gaming with PCIe 4.0 interface and read speeds up to 7300MB/s.", price: 189.99, stock_quantity: 20, category: categories[3] },
  { name: "Seagate Barracuda 4TB HDD", description: "Reliable 4TB hard drive with 256MB cache, ideal for mass storage of games, media files, and backups.", price: 89.99, stock_quantity: 35, category: categories[3] },
  { name: "Seagate Barracuda 8TB HDD", description: "Large capacity 8TB hard drive for extensive media libraries and backup storage solutions.", price: 149.99, stock_quantity: 20, category: categories[3] },
  { name: "WD Blue 2TB HDD", description: "Reliable everyday hard drive with 2TB capacity, 7200RPM speed, and 256MB cache.", price: 59.99, stock_quantity: 40, category: categories[3] },
  { name: "Samsung 870 EVO 1TB SATA", description: "Top-performing SATA SSD with 1TB capacity, 560MB/s read speeds, and 5-year warranty.", price: 89.99, stock_quantity: 25, category: categories[3] },
  { name: "Crucial MX500 2TB SATA", description: "Reliable 2TB SATA SSD with AES 256-bit encryption and integrated power loss immunity.", price: 149.99, stock_quantity: 18, category: categories[3] },
  { name: "Kingston KC3000 2TB NVMe", description: "High-performance PCIe 4.0 NVMe SSD with read speeds up to 7000MB/s for demanding workloads.", price: 179.99, stock_quantity: 15, category: categories[3] },
  { name: "Sabrent Rocket 4 Plus 1TB", description: "PCIe 4.0 NVMe SSD with read speeds up to 7100MB/s, great performance at competitive pricing.", price: 99.99, stock_quantity: 22, category: categories[3] },
  { name: "WD Red Pro 4TB NAS HDD", description: "NAS-optimized hard drive with 4TB capacity, designed for 24/7 operation in RAID environments.", price: 129.99, stock_quantity: 15, category: categories[3] },
  { name: "Seagate IronWolf 8TB NAS", description: "8TB NAS hard drive with IronWolf Health Management for continuous reliability monitoring.", price: 219.99, stock_quantity: 10, category: categories[3] },
  { name: "Samsung 980 Pro 1TB NVMe", description: "Previous gen PCIe 4.0 NVMe SSD with excellent performance at a reduced price point.", price: 89.99, stock_quantity: 28, category: categories[3] },
  { name: "Crucial P3 Plus 1TB NVMe", description: "Budget PCIe 4.0 NVMe SSD with decent performance for everyday computing tasks.", price: 69.99, stock_quantity: 35, category: categories[3] },
  { name: "WD Black 6TB HDD", description: "High-performance desktop hard drive with 6TB capacity optimized for gaming storage.", price: 139.99, stock_quantity: 15, category: categories[3] },
  { name: "Seagate FireCuda 530 2TB", description: "Premium PCIe 4.0 NVMe SSD with read speeds up to 7300MB/s and included heatsink.", price: 199.99, stock_quantity: 12, category: categories[3] },
  { name: "Samsung T7 Portable SSD 1TB", description: "Fast portable SSD with USB 3.2 Gen 2 interface and read speeds up to 1050MB/s.", price: 99.99, stock_quantity: 25, category: categories[3] },
  { name: "WD My Passport 4TB Portable", description: "Compact portable hard drive with 4TB capacity, password protection, and hardware encryption.", price: 109.99, stock_quantity: 20, category: categories[3] },
  { name: "Seagate Expansion 8TB Desktop", description: "Simple plug-and-play external hard drive with 8TB capacity for desktop backup and storage.", price: 159.99, stock_quantity: 15, category: categories[3] },
  { name: "Samsung 870 QVO 4TB SATA", description: "High-capacity QLC SATA SSD with 4TB storage, ideal for bulk storage with SSD speeds.", price: 299.99, stock_quantity: 10, category: categories[3] },
  { name: "Corsair MP600 Pro 2TB NVMe", description: "High-performance PCIe 4.0 NVMe SSD with aluminum heatspreader and read speeds up to 7000MB/s.", price: 189.99, stock_quantity: 12, category: categories[3] },
  { name: "Kingston A2000 1TB NVMe", description: "Budget-friendly NVMe SSD with PCIe 3.0 interface and read speeds up to 2200MB/s.", price: 79.99, stock_quantity: 30, category: categories[3] },
  { name: "Toshiba X300 4TB HDD", description: "High-performance desktop hard drive with 4TB capacity, 7200RPM speed, and 128MB cache.", price: 99.99, stock_quantity: 18, category: categories[3] },
  { name: "ADATA Legend 960 2TB NVMe", description: "PCIe 4.0 NVMe SSD with read speeds up to 7400MB/s and excellent value for performance.", price: 149.99, stock_quantity: 15, category: categories[3] }
])

puts "Created #{Category.count} categories and #{Product.count} products!"