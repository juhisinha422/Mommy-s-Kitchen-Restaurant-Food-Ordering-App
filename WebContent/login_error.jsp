<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login Failed | Mommy's Kitchen</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
    :root { --bg:#0d0d0d; --surface:#1a1a1a; --border:rgba(255,255,255,0.08); --accent:#e8943a; --red:#c0392b; --text:#f0f0f0; --muted:#777; }
    body { font-family:'Poppins',sans-serif; background:var(--bg); color:var(--text); min-height:100vh; display:flex; align-items:center; justify-content:center; padding:20px; position:relative; overflow:hidden; }
    body::before, body::after { content:''; position:fixed; border-radius:50%; filter:blur(90px); opacity:0.15; pointer-events:none; z-index:0; }
    body::before { width:500px; height:500px; background:var(--red); top:-160px; right:-160px; }
    body::after  { width:400px; height:400px; background:var(--accent); bottom:-120px; left:-120px; }
    .card { background:var(--surface); border:1px solid var(--border); border-radius:24px; padding:48px 40px; width:100%; max-width:420px; position:relative; z-index:1; box-shadow:0 30px 80px rgba(0,0,0,0.5); text-align:center; }
    .error-icon { width:72px; height:72px; background:rgba(192,57,43,0.12); border:1px solid rgba(192,57,43,0.25); border-radius:50%; display:flex; align-items:center; justify-content:center; margin:0 auto 20px; font-size:1.8rem; }
    h2 { font-family:'Playfair Display',serif; font-size:1.6rem; margin-bottom:10px; }
    h2 span { color:#e74c3c; }
    .error-msg { background:rgba(192,57,43,0.08); border:1px solid rgba(192,57,43,0.2); border-radius:12px; padding:14px 18px; color:#e74c3c; font-size:0.88rem; margin:20px 0 28px; display:flex; align-items:center; gap:10px; text-align:left; }
    .btn-back { display:inline-flex; align-items:center; gap:8px; padding:13px 32px; border-radius:50px; background:linear-gradient(135deg,var(--accent),#d4782a); color:#0d0d0d; font-family:'Poppins',sans-serif; font-size:0.9rem; font-weight:600; text-decoration:none; transition:all 0.25s; box-shadow:0 4px 20px rgba(232,148,58,0.3); }
    .btn-back:hover { transform:translateY(-2px); box-shadow:0 8px 28px rgba(232,148,58,0.45); }
    .links { margin-top:20px; font-size:0.82rem; color:var(--muted); }
    .links a { color:var(--accent); text-decoration:none; font-weight:500; }
    .links a:hover { text-decoration:underline; }
  </style>
</head>
<body>
<% String msg = (String) request.getAttribute("msg"); %>
  <div class="card">
    <div class="error-icon">❌</div>
    <h2>Login <span>Failed</span></h2>
    <p style="color:var(--muted);font-size:0.85rem;">We couldn't verify your credentials</p>
    <div class="error-msg">
      <i class="fa fa-circle-exclamation"></i>
      <%= msg != null ? msg : "Invalid username or password. Please try again." %>
    </div>
    <a href="javascript:history.back()" class="btn-back">
      <i class="fa fa-arrow-left"></i> Try Again
    </a>
    <div class="links">
      <p style="margin-top:14px;">Go back to <a href="welcome.html">Home</a></p>
    </div>
  </div>
</body>
</html>
