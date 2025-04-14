# Construction Wagon

This mod adds a specialized **construction cargo wagon** with **equipment grid** to Factorio, which can be equipped with:
- **Roboport** for mobile construction and repairs
- **Batteries** and **power sources** (solar panels, generators, etc.)

---

### Features:
✅ **Wagon with equipments** - like armor, but for trains  
✅ **Mobile roboport** - build and repair on the move  
✅ **Power equipment support** - solar panels, accumulators, generators  
✅ **Dynamic balancing** - automatically adapts to any modpack  
✅ **Compatibility** - tested with **Pyanodon** and other complex modsets  

---

### Who is this mod for?
🚂 **Logistics enthusiasts** - expands train capabilities  
🏗 **Mega-base builders** - construct remote outposts without manual labor  
⚡ **Modpack players** - works even with **Pyanodon** and other complex mods  

---

### Balance Mechanics:
📌 **Consturction wagon craft cost** =  
`(Base wagon cost + Personal roboport T1 cost) × 2`  

📌 **Research cost** =  
`Highest values between train technologies and personal roboport technologies`  

This ensures the mod **automatically adapts** to any price changes from other mods.  

---

## Construction Wagon Mod Settings

The mod supports **flexible configuration** for different playstyles. All parameters are set **during world creation** and affect the construction wagon's balance.  

---

### Settings:

#### **1. Roboport Construction Radius**  
- **Parameter:** `Construction wagon roboport radius`  
- **Description:** Determines how far construction/repair drones can operate from the wagon.  
- **Values:**  
  - Default: **75** (5x larger than standard personal roboport T1)  
  - Minimum: **15** (same as personal roboport T1)  
  - Maximum: **300** (for massive construction projects)  

#### **2. Drone Limit**  
- **Parameter:** `Construction wagon roboport robot limit`  
- **Description:** How many drones one wagon roboport can support.  
- **Values:**  
  - Default: **10** (same as personal roboport)  
  - Minimum: **10**  
  - Maximum: **100** (for mass construction)  

#### **3. Charging Station Count**  
- **Parameter:** `Construction wagon roboport charging station count`  
- **Description:** How many drones can charge simultaneously.  
- **Values:**  
  - Default: **2** (same as roboport T1)  
  - Minimum: **2**  
  - Maximum: **50** (to prevent drone queues)  

#### **4. Wagon Inventory Size**  
- **Parameter:** `Construction train wagon inventory size`  
- **Description:** Number of item slots (for construction materials, drones, etc.).  
- **Values:**  
  - Default: **40** (same as regular wagon)  
  - Minimum: **40**  
  - Maximum: **1000** (for mega-bases)  

#### **5. Equipment Grid Size (Width × Height)**  
- **Parameters:**  
  - `Construction train wagon grid width`
  - `Construction train wagon grid height`  
- **Description:** Determines how many modules (roboports, batteries, solar panels) can be installed.  
- **Values:**  
  - Default: **12×12** (same as Mk2 armor)  
  - Minimum: **1×1**  
  - Maximum: **50×50** (for super-equipped wagons)  