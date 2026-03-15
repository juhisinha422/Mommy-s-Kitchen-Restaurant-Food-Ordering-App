<%-- ══ ViewMsg.jsp (Manager) ══ --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Details Valid | Mommy's Kitchen</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
    :root { --bg:#0d0d0d; --surface:#1a1a1a; --border:rgba(255,255,255,0.08); --accent:#e8943a; --text:#f0f0f0; --muted:#777; }
    body { font-family:'Poppins',sans-serif; background:var(--bg); color:var(--text); min-height:100vh; display:flex; align-items:center; justify-content:center; padding:20px; position:relative; overflow:hidden; }
    body::before, body::after { content:''; position:fixed; border-radius:50%; filter:blur(90px); opacity:0.15; pointer-events:none; z-index:0; }
    body::before { width:500px; height:500px; background:var(--accent); top:-160px; left:-160px; }
    body::after  { width:400px; height:400px; background:#2ed573; bottom:-120px; right:-120px; }
    .card { background:var(--surface); border:1px solid var(--border); border-radius:24px; padding:48px 40px; width:100%; max-width:440px; position:relative; z-index:1; box-shadow:0 30px 80px rgba(0,0,0,0.5); text-align:center; }
    .success-icon { width:80px; height:80px; background:rgba(46,213,115,0.1); border:1px solid rgba(46,213,115,0.25); border-radius:50%; display:flex; align-items:center; justify-content:center; margin:0 auto 20px; font-size:2rem; animation:pop 0.4s ease; }
    @keyframes pop { 0%{transform:scale(0.5);opacity:0} 100%{transform:scale(1);opacity:1} }
    h2 { font-family:'Playfair Display',serif; font-size:1.6rem; margin-bottom:10px; }
    h2 span { color:#2ed573; }
    p.sub { color:var(--muted); font-size:0.85rem; margin-bottom:28px; line-height:1.6; }
    .info-box { background:rgba(46,213,115,0.06); border:1px solid rgba(46,213,115,0.15); border-radius:12px; padding:14px 18px; color:#2ed573; font-size:0.85rem; margin-bottom:28px; display:flex; align-items:center; gap:10px; text-align:left; }
    .btn-review { display:inline-flex; align-items:center; gap:8px; padding:14px 36px; border-radius:50px; background:linear-gradient(135deg,var(--accent),#d4782a); color:#0d0d0d; font-family:'Poppins',sans-serif; font-size:0.92rem; font-weight:700; text-decoration:none; transition:all 0.25s; box-shadow:0 4px 20px rgba(232,148,58,0.3); }
    .btn-review:hover { transform:translateY(-2px); box-shadow:0 8px 28px rgba(232,148,58,0.45); }
  </style>
</head>
<body>
  <div class="card">
    <div class="success-icon">✅</div>
    <h2>Details <span>Verified!</span></h2>
    <p class="sub">Your registration details have been validated successfully. Please review everything before confirming.</p>
    <div class="info-box">
      <i class="fa fa-circle-check"></i>
      All fields are valid and ready to be saved.
    </div>
    <a href="View.jsp" class="btn-review">
      <i class="fa fa-eye"></i> Review & Confirm
    </a>
  </div>
</body>
</html>
