# 🖼️ Museum Dataset Analysis using SQL

## 📌 Project Overview

This project focuses on analyzing a museum artwork dataset using SQL to uncover meaningful insights about:

- Artwork collections
- Museum performance
- Artist popularity
- Painting styles
- Pricing trends
- Data quality issues
- Business opportunities

The goal of this project is not only to solve SQL problems but also to translate data findings into actionable business insights for improving museum operations, visitor engagement, and revenue opportunities.

---

# 🛠️ Tools & Technologies Used

- SQL Server
- SQL Queries
- Data Cleaning
- Exploratory Data Analysis
- Business Analysis

---

# 🎯 Business Objectives

The analysis aims to answer questions such as:

- Which artworks are not currently displayed in museums?
- Which museums have the largest collections?
- Which artists have the highest representation?
- What painting styles are most popular?
- How can pricing strategies be improved?
- How can museums optimize exhibitions and visitor engagement?

---

# 🧹 Data Cleaning & Quality Analysis

Before performing analysis, several data quality issues were identified:

## Duplicate Records

**Problem:**
Duplicate records existed across artwork-related tables.

**Impact:**
- Incorrect counts
- Inflated analysis results
- Reduced data reliability

**Solution:**
Removed duplicate records and improved data consistency.

---

## Invalid Museum Information

**Problem:**
Invalid city information and incorrect museum hour entries were identified.

**Impact:**
- Incorrect geographical analysis
- Poor reporting accuracy

**Solution:**
Validated and cleaned location and operating hour data.

---

# 📊 Key Analysis & Insights

## 1. Artwork Availability Analysis

### Finding:
Identified paintings that are not currently assigned to any museum.

### Possible Reasons:
- Artwork stored temporarily
- Museum renovation
- Collection planning decisions
- Missing museum mapping

### Business Recommendation:
Museums should review unused artwork assets and optimize exhibition planning.

---

# 🏛️ Top Museums by Artwork Collection

### Finding:

Top museums based on number of paintings:

| Museum | Number of Paintings |
|---|---:|
| The Metropolitan Museum of Art | 939 |
| Rijksmuseum | 452 |
| National Gallery | 423 |
| National Gallery of Art | 375 |
| The Barnes Foundation | 350 |

### Business Insight:

Museums with larger collections represent strong cultural assets and have higher opportunities for exhibitions and visitor engagement.

### Recommendation:

- Promote major collections
- Create special exhibitions
- Introduce premium visitor experiences

---

# 🎨 Top Artists Analysis

### Finding:

Top artists based on number of paintings:

| Artist | Paintings |
|---|---:|
| Pierre-Auguste Renoir | 469 |
| Claude Monet | 378 |
| Vincent Van Gogh | 308 |
| Maurice Utrillo | 253 |
| Albert Marquet | 233 |

### Business Insight:

Artists with high representation can be leveraged for targeted exhibitions and marketing campaigns.

### Recommendation:

- Artist-focused exhibitions
- Workshops
- Visitor engagement programs

---

# 🎭 Painting Style Analysis

### Finding:

The Metropolitan Museum of Art has the highest representation of Impressionism paintings.

Style:

**Impressionism**

Number of paintings:

**244**

### Recommendation:

- Organize style-based exhibitions
- Promote popular art movements
- Create educational workshops

---

# 💰 Pricing Analysis

## Premium Artwork Analysis

Identified paintings where:

**Asking Price > Regular Price**

### Possible Reasons:
- High demand
- Rare artwork
- Artist reputation
- Pricing strategy

### Recommendation:

Analyze market demand and optimize pricing strategies.

---

## Discounted Artwork Analysis

Identified paintings where:

**Asking Price < 50% of Regular Price**

### Possible Reasons:

- Low demand
- Long inventory holding period
- Incorrect valuation
- Changing market trends

### Recommendation:

Review pricing, promotion strategies, and inventory management.

---

# 🖌️ Canvas Analysis

## Most Expensive Canvas Size

Analysis helps identify premium canvas categories.

Possible factors:

- Material cost
- Quality
- Artist preference
- Market demand

Recommendation:

Use bundling strategies with related art supplies to increase average order value.

Example:

Canvas + Paint Set + Brushes = Premium Art Package

---

# 🏢 Museum Operations Analysis

Analyzed museums operating:

- Sunday & Monday
- Every day of the week

### Insight:

Operating patterns can help understand visitor accessibility and revenue opportunities.

### Recommendation:

- Optimize staffing
- Introduce special events
- Create premium visitor experiences

---

# 🌎 International Artist Analysis

Identified artists whose paintings are displayed across multiple countries.

### Insight:

These artists have strong global representation.

### Recommendation:

- International exhibitions
- Artist-focused campaigns
- Museum collaborations

---

# 📈 Business Recommendations Summary

## Revenue Growth

- Premium exhibitions
- Auctions
- Membership programs
- Special experiences

## Visitor Engagement

- Workshops
- Artist events
- Digital marketing campaigns

## Inventory Optimization

- Promote unused artwork
- Manage slow-moving assets
- Improve artwork allocation

## Data Improvement

- Validation rules
- Duplicate prevention
- Regular data audits

---

# 📌 Conclusion

This SQL project demonstrates how raw museum data can be transformed into meaningful business insights.

Through data cleaning, exploratory analysis, and business interpretation, the project highlights opportunities to:

- Improve museum operations
- Increase visitor engagement
- Optimize artwork management
- Improve revenue strategies

---

## 👩‍💻 Author

**Meenakshi Rajpurohit**

Aspiring Data Analyst | SQL | Power BI | Business Analytics