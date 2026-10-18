# MakeMyTrip Hotel & Travel Analytics

## Project scope
This project analyzes the supplied hotel-listing data for Bangalore, Chennai, Delhi, Hyderabad, Kolkata and Mumbai using Python, SQL and Power BI.

**Dataset limitation:** The supplied files contain hotel listing attributes (hotel name, rating, reviews, star rating, location, landmark, listed price and tax). They do not contain booking-level transactions, booking dates, cancellations, customer records or realized revenue. Therefore, the current analysis focuses on hotel pricing and listing competitiveness. Add a separate verified booking dataset before making booking/revenue claims.

## Folder structure
- `data/raw/` — original CSV files, kept unchanged
- `data/cleaned/` — output CSVs created by the notebook
- `notebooks/MakeMyTrip_Analysis.ipynb` — cleaning, EDA, charts and business observations
- `graphs/` — charts exported by the notebook
- `sql/` — starter SQL queries
- `requirements.txt` — Python libraries

## Run in VS Code
1. Extract this ZIP.
2. Open the extracted `MakeMyTrip_Travel_Analytics_Project` folder in VS Code.
3. Install the Python and Jupyter extensions if needed.
4. Open a terminal in VS Code and run:
   ```bash
   python -m pip install -r requirements.txt
   ```
5. Open `notebooks/MakeMyTrip_Analysis.ipynb`.
6. Select your Python kernel and click **Run All**.
7. Check the `data/cleaned/` and `graphs/` folders for generated outputs.

If the notebook cannot find `data/raw/`, open the notebook from the project folder or its `notebooks` subfolder and keep the folder structure unchanged.

## Notebook deliverables
- Combined dataset with source city and source filename
- Cleaned numeric price, tax, rating, review and distance fields
- Missing-value and duplicate checks
- 10 saved EDA charts
- City-level summary CSVs for Power BI
- Potential price outlier flags (records are not automatically deleted)

## Suggested Power BI visuals
- KPI cards: number of hotel listings, average listed price, median listed price, average rating
- Bar charts: average price and rating by city
- Scatter plot: listed price vs rating
- Price distribution / price by star rating
- Hotel details table
- Slicers: city, star rating, rating description, location

## SQL
The `sql/` folder contains example MySQL table creation and analysis queries. Load the cleaned CSV into MySQL after running the notebook, or adapt the schema to your local setup.
