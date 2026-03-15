<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Dashboard | Mommy's Kitchen</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
    :root { --bg:#0d0d0d; --surface:#1a1a1a; --border:rgba(255,255,255,0.08); --accent:#e8943a; --text:#f0f0f0; --muted:#777; }
    body { font-family:'Poppins',sans-serif; background:var(--bg); color:var(--text); min-height:100vh; position:relative; overflow-x:hidden; }
    body::before, body::after { content:''; position:fixed; border-radius:50%; filter:blur(100px); opacity:0.12; pointer-events:none; z-index:0; }
    body::before { width:600px; height:600px; background:var(--accent); top:-200px; left:-200px; }
    body::after  { width:500px; height:500px; background:#c0392b; bottom:-150px; right:-150px; }
    nav { position:fixed; top:0; width:100%; z-index:100; display:flex; justify-content:space-between; align-items:center; padding:16px 6%; background:rgba(13,13,13,0.88); backdrop-filter:blur(14px); border-bottom:1px solid var(--border); }
    .logo { font-family:'Playfair Display',serif; font-size:1.4rem; font-weight:700; color:var(--accent); text-decoration:none; }
    .logo span { color:var(--text); }
    .nav-right { display:flex; align-items:center; gap:16px; }
    .nav-badge { background:rgba(232,148,58,0.12); color:var(--accent); border:1px solid rgba(232,148,58,0.25); border-radius:20px; padding:4px 12px; font-size:0.72rem; font-weight:600; }
    .nav-logout { color:var(--muted); text-decoration:none; font-size:0.82rem; display:flex; align-items:center; gap:6px; transition:color 0.2s; }
    .nav-logout:hover { color:var(--accent); }
    .main { padding:100px 6% 60px; position:relative; z-index:1; }
    .welcome-banner { background:linear-gradient(135deg,rgba(232,148,58,0.12),rgba(192,57,43,0.06)); border:1px solid rgba(232,148,58,0.2); border-radius:20px; padding:32px 36px; display:flex; align-items:center; gap:24px; margin-bottom:36px; position:relative; overflow:hidden; }
    .welcome-banner::before { content:'🍛'; position:absolute; right:24px; top:50%; transform:translateY(-50%); font-size:4rem; opacity:0.15; }
    .welcome-avatar { width:60px; height:60px; border-radius:16px; background:linear-gradient(135deg,var(--accent),#c0392b); display:flex; align-items:center; justify-content:center; font-size:1.5rem; flex-shrink:0; box-shadow:0 8px 20px rgba(232,148,58,0.3); }
    .welcome-text h2 { font-family:'Playfair Display',serif; font-size:1.5rem; }
    .welcome-text h2 span { color:var(--accent); }
    .welcome-text p { color:var(--muted); font-size:0.85rem; margin-top:4px; }
    .section-title { font-size:0.72rem; font-weight:600; letter-spacing:1px; text-transform:uppercase; color:var(--muted); margin-bottom:16px; display:flex; align-items:center; gap:8px; }
    .section-title::after { content:''; flex:1; height:1px; background:var(--border); }
    .action-grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(220px,1fr)); gap:16px; }
    .action-card { background:var(--surface); border:1px solid var(--border); border-radius:16px; padding:24px; text-decoration:none; color:var(--text); display:flex; flex-direction:column; gap:14px; transition:transform 0.25s,box-shadow 0.25s,border-color 0.25s; }
    .action-card:hover { transform:translateY(-4px); box-shadow:0 16px 40px rgba(0,0,0,0.4); border-color:rgba(232,148,58,0.3); }
    .action-card-icon { width:44px; height:44px; border-radius:12px; display:flex; align-items:center; justify-content:center; font-size:1.1rem; }
    .icon-orange{background:rgba(232,148,58,0.12);} .icon-red{background:rgba(192,57,43,0.12);} .icon-green{background:rgba(46,213,115,0.1);} .icon-blue{background:rgba(52,152,219,0.1);}
    .c-orange{color:#e8943a;} .c-red{color:#e74c3c;} .c-green{color:#2ed573;} .c-blue{color:#3498db;}
    .action-card h4 { font-size:0.95rem; font-weight:600; }
    .action-card p  { font-size:0.78rem; color:var(--muted); line-height:1.5; }
    .action-card .arrow { font-size:0.75rem; color:var(--muted); display:flex; align-items:center; gap:4px; margin-top:auto; transition:color 0.2s; }
    .action-card:hover .arrow { color:var(--accent); }
  </style>
</head>
<body>
<%
// Get name from request attribute first, then fallback to cookie
String cfName = (String) request.getAttribute("cfname");
if (cfName == null) {
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("cname")) {
                cfName = c.getValue();
                break;
            }
        }
    }
}
if (cfName == null) cfName = "Guest";
%>
  <nav>
    <a href="welcome.html" class="logo">Mommy's<span> Kitchen</span></a>
    <div class="nav-right">
      <span class="nav-badge"><i class="fa fa-user"></i> &nbsp;CUSTOMER</span>
      <a href="welcome.html" class="nav-logout"><i class="fa fa-right-from-bracket"></i> Logout</a>
    </div>
  </nav>
  <div class="main">
    <div class="welcome-banner">
      <div class="welcome-avatar">🍛</div>
      <div class="welcome-text">
        <h2>Welcome, <span><%= cfName %>!</span></h2>
        <p>What would you like to do today?</p>
      </div>
    </div>
    <div class="section-title"><i class="fa fa-bolt"></i> Quick Actions</div>
    <div class="action-grid">
      <jsp:include page="CLink.html"/>
    </div>
  </div>
</body>
</html>
