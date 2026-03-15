# 🍛 Mommy's Kitchen — Restaurant Food Ordering App

A full-stack Java Web Application built with **JSP, Servlets, MySQL** and deployed on **Apache Tomcat 9** on **AWS EC2 Ubuntu**.

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | HTML5, CSS3, JavaScript |
| Backend | Java Servlets, JSP |
| Database | MySQL 8.0 |
| Server | Apache Tomcat 9.0.91 |
| Cloud | AWS EC2 (Ubuntu) |
| JDBC Driver | MySQL Connector/J 8.0.33 |

---

## 📁 Project Structure

```
Project/
├── src/test/               # Java Servlet source files
├── build/classes/test/     # Compiled .class files
├── WebContent/             # All HTML, JSP, CSS files
│   ├── welcome.html        # Landing page
│   ├── welcome.css         # Global dark theme CSS
│   ├── Clogin.html         # Customer login
│   ├── Mlogin.html         # Manager login
│   ├── cinput1.html        # Customer registration step 1
│   ├── cinput2.html        # Customer registration step 2
│   ├── input1.html         # Manager registration step 1
│   ├── input2.html         # Manager registration step 2
│   ├── CView.jsp           # Customer review page
│   ├── View.jsp            # Manager review page
│   ├── CViewMsg.jsp        # Customer details verified
│   ├── ViewMsg.jsp         # Manager details verified
│   ├── clogin_success.jsp  # Customer dashboard
│   ├── login_Success.jsp   # Manager dashboard
│   ├── login_error.jsp     # Login error page
│   ├── Dish.html           # Add dish page
│   ├── ViewDish.jsp        # Menu/dish view page
│   ├── CustomerProfile.jsp # Customer profile
│   ├── ManagerProfile.jsp  # Manager profile
│   ├── OrderSuccess.jsp    # Order placed success
│   ├── CLink.html          # Customer nav fragment
│   ├── link.html           # Manager nav fragment
│   └── WEB-INF/
│       └── web.xml         # App config
└── apache-tomcat-9.0.91/   # Tomcat server
```

---

## 🗄️ Database Setup (MySQL)

```sql
-- Create database
CREATE DATABASE mommyskitchen;
USE mommyskitchen;

-- Manager table
CREATE TABLE Momchef (
  UNAME VARCHAR(50), PWORD VARCHAR(50),
  FNAME VARCHAR(50), LNAME VARCHAR(50),
  ADDR VARCHAR(200), MID VARCHAR(100),
  LOC VARCHAR(100), MOB VARCHAR(15),
  ACCNO VARCHAR(20), IFSC VARCHAR(20)
);

-- Customer table
CREATE TABLE Client19 (
  CUNAME VARCHAR(50), CPWORD VARCHAR(50),
  CFNAME VARCHAR(50), CLNAME VARCHAR(50),
  CADDR VARCHAR(200), CMID VARCHAR(100),
  CLOC VARCHAR(100), CMOB VARCHAR(15)
);

-- Dish table
CREATE TABLE Dish19 (
  DNAME VARCHAR(100), DPRICE VARCHAR(20),
  TPA VARCHAR(100), DELIVERY VARCHAR(10),
  PHNO VARCHAR(15), AVAILABILITY VARCHAR(10)
);

-- Orders table
CREATE TABLE Orders (
  OID INT AUTO_INCREMENT PRIMARY KEY,
  CUNAME VARCHAR(50), DNAME VARCHAR(100),
  DPRICE VARCHAR(20),
  ORDER_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create DB user
CREATE USER 'system'@'localhost' IDENTIFIED BY 'manager';
GRANT ALL PRIVILEGES ON mommyskitchen.* TO 'system'@'localhost';
FLUSH PRIVILEGES;
```

---

## 🔗 Servlet URL Mappings

| URL Pattern | Servlet Class | Purpose |
|-------------|--------------|---------|
| `/creg1` | `CRegServlet1` | Customer reg step 1 |
| `/creg2` | `CRegServlet2` | Customer reg step 2 |
| `/cfinal` | `CFinalRegServlet` | Save customer to DB |
| `/clog` | `CLoginServlet` | Customer login |
| `/reg1` | `RegServlet1` | Manager reg step 1 |
| `/reg2` | `RegServlet12` | Manager reg step 2 |
| `/final` | `FinalRegServlet` | Save manager to DB |
| `/log` | `LoginServlet` | Manager login |
| `/finaldish` | `AddDishServlet` | Add dish to menu |
| `/viewdish` | `CViewProductsServlet` | View menu |
| `/placeorder` | `OrderServlet` | Place order |
| `/logout` | `LogoutServlet` | Logout |

---

## 🚀 Deployment Steps

### 1. Clone / Upload Project
```bash
cd ~/Project
```

### 2. Install MySQL
```bash
sudo apt update && sudo apt install mysql-server -y
sudo systemctl start mysql && sudo systemctl enable mysql
```

### 3. Set up Database
```bash
sudo mysql < setup.sql
```

### 4. Download MySQL JDBC Driver
```bash
mkdir -p ~/Project/apache-tomcat-9.0.91/webapps/Project/WEB-INF/lib/
cd ~/Project/apache-tomcat-9.0.91/webapps/Project/WEB-INF/lib/
wget https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar
```

### 5. Compile Java Source Files
```bash
cd ~/Project
javac -cp apache-tomcat-9.0.91/lib/servlet-api.jar:apache-tomcat-9.0.91/webapps/Project/WEB-INF/lib/mysql-connector-j-8.0.33.jar \
  -d build/classes src/test/*.java
```

### 6. Deploy Files
```bash
# Copy classes
cp ~/Project/build/classes/test/*.class \
  ~/Project/apache-tomcat-9.0.91/webapps/Project/WEB-INF/classes/test/

# Copy web files
cp -r ~/Project/WebContent/* \
  ~/Project/apache-tomcat-9.0.91/webapps/Project/
```

### 7. Start Tomcat
```bash
cd ~/Project/apache-tomcat-9.0.91/bin
./startup.sh
```

### 8. Access App
```
http://<your-ec2-ip>:8080/Project/welcome.html
```

---

## 🔁 Redeploy After Changes

```bash
# Quick redeploy alias (run once to activate)
alias redeploy="cp -r ~/Project/WebContent/* ~/Project/apache-tomcat-9.0.91/webapps/Project/ && echo '✅ Deployed!'"

# For Java changes — recompile + redeploy
cd ~/Project
javac -cp apache-tomcat-9.0.91/lib/servlet-api.jar:apache-tomcat-9.0.91/webapps/Project/WEB-INF/lib/mysql-connector-j-8.0.33.jar \
  -d build/classes src/test/*.java
cp build/classes/test/*.class apache-tomcat-9.0.91/webapps/Project/WEB-INF/classes/test/
cd apache-tomcat-9.0.91/bin && ./shutdown.sh && sleep 3 && ./startup.sh
```

---

## 🌊 User Flow

### Customer Flow
```
welcome.html
  → Clogin.html (login) or cinput1.html (register)
  → cinput1.html → cinput2.html → CViewMsg.jsp → CView.jsp → cfinal
  → clogin_success.jsp (dashboard)
  → viewdish (browse menu) → placeorder → OrderSuccess.jsp
```

### Manager Flow
```
welcome.html
  → Mlogin.html (login) or input1.html (register)
  → input1.html → input2.html → ViewMsg.jsp → View.jsp → final
  → login_Success.jsp (dashboard)
  → Dish.html (add dish) → finaldish
  → viewdish (view menu)
```

---

# Check all customers
sudo mysql -e "USE mommyskitchen; SELECT CUNAME, CFNAME, CLNAME, CMID, CMOB FROM Client19;"

# Check all managers
sudo mysql -e "USE mommyskitchen; SELECT UNAME, FNAME, LNAME, MID, MOB FROM Momchef;"

# Check all dishes
sudo mysql -e "USE mommyskitchen; SELECT * FROM Dish19;"

# Check all orders
sudo mysql -e "USE mommyskitchen; SELECT * FROM Orders;"

## ⚠️ Common Issues & Fixes

| Issue | Fix |
|-------|-----|
| 404 on servlet | Check `@WebServlet` annotation matches form action |
| Blank page after submit | Check `catalina.out` for exceptions |
| DB not saving | Check table name case (Linux is case-sensitive) |
| `null` username on dashboard | Cookie fallback added in JSP |
| Duplicate servlet mapping error | Remove manual mappings from `web.xml` — use `@WebServlet` only |
| Port 8080 not accessible | Add inbound rule in AWS Security Group |

---

## 🔑 EC2 Security Group Rules

| Type | Port | Source |
|------|------|--------|
| SSH | 22 | Your IP |
| Custom TCP | 8080 | 0.0.0.0/0 |
| HTTP | 80 | 0.0.0.0/0 |

---

## Screenshots

<img width="1892" height="940" alt="Image" src="https://github.com/user-attachments/assets/42a71744-bfe4-42dc-8785-2d13b0ed50a9" />

## 👩‍💻 Author
**Juhi Sinha** — DevOps Engineer 

Deployed on AWS EC2 | Apache Tomcat 9 | MySQL 8
