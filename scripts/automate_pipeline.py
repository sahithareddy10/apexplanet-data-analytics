import pandas as pd
import os

# ==========================
# File Paths
# ==========================
RAW_DATA = "data/superstore.csv"
CLEANED_DATA = "data/cleaned_superstore.csv"
KPI_REPORT = "reports/kpi_report.xlsx"

# Create folders if they don't exist
os.makedirs("data", exist_ok=True)
os.makedirs("reports", exist_ok=True)

# ==========================
# Load Dataset
# ==========================
print("Loading dataset...")
df = pd.read_csv(RAW_DATA, encoding="latin1")

# ==========================
# Data Cleaning
# ==========================
print("Cleaning data...")

# Remove duplicates
df.drop_duplicates(inplace=True)

# Handle missing values
df.fillna(method="ffill", inplace=True)

# Convert date columns
if "Order Date" in df.columns:
    df["Order Date"] = pd.to_datetime(df["Order Date"])

if "Ship Date" in df.columns:
    df["Ship Date"] = pd.to_datetime(df["Ship Date"])

# ==========================
# Save Cleaned Dataset
# ==========================
df.to_csv(CLEANED_DATA, index=False)

# ==========================
# Calculate KPIs
# ==========================
print("Calculating KPIs...")

total_sales = round(df["Sales"].sum(), 2)
total_profit = round(df["Profit"].sum(), 2)
total_orders = df["Order ID"].nunique()

if "Customer ID" in df.columns:
    total_customers = df["Customer ID"].nunique()
else:
    total_customers = "N/A"

top_category = (
    df.groupby("Category")["Sales"]
    .sum()
    .sort_values(ascending=False)
    .index[0]
)

kpi_df = pd.DataFrame({
    "Metric": [
        "Total Sales",
        "Total Profit",
        "Total Orders",
        "Total Customers",
        "Top Category"
    ],
    "Value": [
        total_sales,
        total_profit,
        total_orders,
        total_customers,
        top_category
    ]
})

# ==========================
# Export KPI Report
# ==========================
kpi_df.to_excel(KPI_REPORT, index=False)

# ==========================
# Console Output
# ==========================
print("\n===== KPI SUMMARY =====")
print(f"Total Sales      : {total_sales}")
print(f"Total Profit     : {total_profit}")
print(f"Total Orders     : {total_orders}")
print(f"Total Customers  : {total_customers}")
print(f"Top Category     : {top_category}")

print("\nPipeline executed successfully!")
print(f"Cleaned dataset saved to: {CLEANED_DATA}")
print(f"KPI report saved to: {KPI_REPORT}")