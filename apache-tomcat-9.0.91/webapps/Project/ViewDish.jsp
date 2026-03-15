<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Our Menu | Mommy's Kitchen</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
    :root { --bg:#0d0d0d; --surface:#1a1a1a; --surface2:#222; --border:rgba(255,255,255,0.08); --accent:#e8943a; --text:#f0f0f0; --muted:#777; }
    body { font-family:'Poppins',sans-serif; background:var(--bg); color:var(--text); min-height:100vh; }
    body::before, body::after { content:''; position:fixed; border-radius:50%; filter:blur(100px); opacity:0.1; pointer-events:none; z-index:0; }
    body::before { width:600px; height:600px; background:var(--accent); top:-200px; left:-200px; }
    body::after  { width:500px; height:500px; background:#c0392b; bottom:-150px; right:-150px; }
    nav {
      position:fixed; top:0; width:100%; z-index:100;
      display:flex; justify-content:space-between; align-items:center;
      padding:16px 6%; background:rgba(13,13,13,0.88);
      backdrop-filter:blur(14px); border-bottom:1px solid var(--border);
    }
    .logo { font-family:'Playfair Display',serif; font-size:1.4rem; font-weight:700; color:var(--accent); text-decoration:none; }
    .logo span { color:var(--text); }
    .nav-right { display:flex; align-items:center; gap:16px; }
    .nav-badge { background:rgba(232,148,58,0.12); color:var(--accent); border:1px solid rgba(232,148,58,0.25); border-radius:20px; padding:4px 12px; font-size:0.72rem; font-weight:600; }
    .nav-back { color:var(--muted); text-decoration:none; font-size:0.82rem; display:flex; align-items:center; gap:6px; transition:color 0.2s; }
    .nav-back:hover { color:var(--accent); }
    .main { padding:100px 6% 60px; position:relative; z-index:1; }
    .page-header { margin-bottom:36px; }
    .page-header h1 { font-family:'Playfair Display',serif; font-size:2.2rem; margin-bottom:8px; }
    .page-header h1 span { color:var(--accent); }
    .page-header p { color:var(--muted); font-size:0.88rem; }
    /* Empty state */
    .empty-state { text-align:center; padding:80px 20px; }
    .empty-icon { font-size:4rem; margin-bottom:16px; }
    .empty-state h3 { font-family:'Playfair Display',serif; font-size:1.4rem; margin-bottom:8px; color:var(--muted); }
    /* Menu grid */
    .menu-grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(280px,1fr)); gap:24px; }
    .dish-card { background:var(--surface); border:1px solid var(--border); border-radius:20px; overflow:hidden; transition:transform 0.3s,box-shadow 0.3s; }
    .dish-card:hover { transform:translateY(-6px); box-shadow:0 20px 50px rgba(0,0,0,0.4); }
    .dish-img { height:160px; background:linear-gradient(135deg,rgba(232,148,58,0.15),rgba(192,57,43,0.1)); display:flex; align-items:center; justify-content:center; font-size:3.5rem; border-bottom:1px solid var(--border); }
    .dish-body { padding:20px; }
    .dish-name { font-size:1.05rem; font-weight:600; margin-bottom:6px; }
    .dish-price { font-size:1.2rem; font-weight:700; color:var(--accent); margin-bottom:12px; }
    .dish-meta { display:flex; flex-wrap:wrap; gap:8px; margin-bottom:14px; }
    .meta-tag { display:inline-flex; align-items:center; gap:5px; padding:3px 10px; border-radius:20px; font-size:0.7rem; font-weight:500; }
    .tag-time  { background:rgba(52,152,219,0.1);  color:#3498db; }
    .tag-avail { background:rgba(46,213,115,0.1);  color:#2ed573; }
    .tag-stock { background:rgba(232,148,58,0.1);  color:var(--accent); }
    .tag-no    { background:rgba(231,76,60,0.1);   color:#e74c3c; }
    .btn-order { width:100%; padding:11px; background:linear-gradient(135deg,var(--accent),#d4782a); color:#0d0d0d; font-family:'Poppins',sans-serif; font-size:0.85rem; font-weight:700; border:none; border-radius:10px; cursor:pointer; transition:opacity 0.25s,transform 0.2s; display:flex; align-items:center; justify-content:center; gap:6px; }
    .btn-order:hover { opacity:0.9; transform:translateY(-1px); }
    @media(max-width:600px) { .menu-grid{grid-template-columns:1fr;} }
  </style>
</head>
<body>
<%
List<String[]> dishes = (List<String[]>) request.getAttribute("dishes");
%>
  <nav>
    <a href="clogin_success.jsp" class="logo">Mommy's<span> Kitchen</span></a>
    <div class="nav-right">
      <span class="nav-badge"><i class="fa fa-bowl-food"></i> &nbsp;MENU</span>
      <a href="clogin_success.jsp" class="nav-back"><i class="fa fa-arrow-left"></i> Dashboard</a>
    </div>
  </nav>

  <div class="main">
    <div class="page-header">
      <h1>Our <span>Menu</span></h1>
      <p>Fresh dishes prepared with love — order your favourite!</p>
    </div>

    <% if (dishes == null || dishes.isEmpty()) { %>
    <div class="empty-state">
      <div class="empty-icon">🍽️</div>
      <h3>No dishes available yet</h3>
      <p style="color:var(--muted);font-size:0.85rem;margin-top:8px;">Check back soon — the chef is cooking!</p>
    </div>
    <% } else { %>
    <div class="menu-grid">
      <% for (String[] d : dishes) {
           String dname  = d[0] != null ? d[0] : "";
           String dprice = d[1] != null ? d[1] : "";
           String tpa    = d[2] != null ? d[2] : "";
           String deliv  = d[3] != null ? d[3] : "";
           String phno   = d[4] != null ? d[4] : "";
           String avail  = d[5] != null ? d[5] : "";
           String emoji  = dname.toLowerCase().contains("chicken") ? "🍗" :
                           dname.toLowerCase().contains("rice")    ? "🍚" :
                           dname.toLowerCase().contains("pizza")   ? "🍕" :
                           dname.toLowerCase().contains("burger")  ? "🍔" :
                           dname.toLowerCase().contains("dal")     ? "🍲" :
                           dname.toLowerCase().contains("paneer")  ? "🧀" : "🍛";
      %>
      <div class="dish-card">
        <div class="dish-img"><%= emoji %></div>
        <div class="dish-body">
          <div class="dish-name"><%= dname %></div>
          <div class="dish-price">₹<%= dprice %></div>
          <div class="dish-meta">
            <span class="meta-tag tag-time"><i class="fa fa-clock"></i> <%= tpa %></span>
            <span class="meta-tag <%= avail.equalsIgnoreCase("yes") ? "tag-avail" : "tag-no" %>">
              <i class="fa fa-circle"></i> <%= avail.equalsIgnoreCase("yes") ? "In Stock" : "Out of Stock" %>
            </span>
            <span class="meta-tag <%= deliv.equalsIgnoreCase("yes") ? "tag-stock" : "tag-no" %>">
              <i class="fa fa-truck"></i> <%= deliv.equalsIgnoreCase("yes") ? "Delivery" : "No Delivery" %>
            </span>
          </div>
          <form action="placeorder" method="post" style="margin:0"><input type="hidden" name="dname" value="<%= dname %>"/><input type="hidden" name="dprice" value="<%= dprice %>"/><input type="hidden" name="cuname" value="customer"/><button type="submit" class="btn-order"><i class="fa fa-cart-plus"></i> Order Now</button></form>
        </div>
      </div>
      <% } %>
    </div>
    <% } %>
  </div>
</body>
</html>
