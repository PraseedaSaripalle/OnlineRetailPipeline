import pandas as pd
import urllib.parse
from sqlalchemy import create_engine, text

print("Pipeline started...")

df = pd.read_excel("data/OnlineRetail_Final Project Dataset.xlsx")
df["CustomerID"] = df["CustomerID"].fillna(0).astype(int)

password = "Sarang@0808"
encoded_password = urllib.parse.quote_plus(password)

engine = create_engine(
    f"mysql+pymysql://root:{encoded_password}@localhost:3306/retail_pipeline"
)

with engine.connect() as conn:
    df.to_sql("staging_transactions", conn, if_exists="append", index=False)

    conn.execute(text("""
        INSERT INTO pipeline_logs(stage, records_processed, status)
        VALUES ('staging_load', :count, 'SUCCESS')
    """), {"count": len(df)})

print("Pipeline completed successfully!")