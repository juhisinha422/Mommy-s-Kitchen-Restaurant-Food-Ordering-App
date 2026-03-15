<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="test.RegBean"%>
<%
RegBean rb = (RegBean) application.getAttribute("beanRef");
if (rb == null) { response.sendRedirect("Mlogin.html"); return; }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manager Profile | Mommy's Kitchen</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
    :root { --bg:#0d0d0d; --surface:#1a1a1a; --surface2:#222; --border:rgba(255,255,255,0.08); --accent:#e8943a; --red:#c0392b; --text:#f0f0f0; --muted:#777; }
    body { font-family:'Poppins',sans-serif; background:var(--bg); color:var(--text); min-height:100vh; display:flex; align-items:center; justify-content:center; padding:30px 20px; position:relative; overflow:hidden; }
    body::before, body::after { content:''; position:fixed; border-radius:50%; filter:blur(90px); opacity:0.13; pointer-events:none; z-index:0; }
    body::before { width:500px; height:500px; background:var(--red); top:-160px; right:-160px; }
    body::after  { width:400px; height:400px; background:var(--accent); bottom:-120px; left:-120px; }
    .back-link { position:fixed; top:24px; left:28px; z-index:10; color:var(--muted); text-decoration:none; font-size:0.85rem; display:flex; align-items:center; gap:6px; transition:color 0.2s; }
    .back-link:hover { color:var(--accent); }
    .card { background:var(--surface); border:1px solid var(--border); border-radius:24px; padding:44px 40px; width:100%; max-width:500px; position:relative; z-index:1; box-shadow:0 30px 80px rgba(0,0,0,0.5); }
    .profile-header { text-align:center; margin-bottom:32px; }
    .avatar { width:80px; height:80px; background:linear-gradient(135deg,var(--red),#922b21); border-radius:50%; display:flex; align-items:center; justify-content:center; font-size:2rem; margin:0 auto 14px; box-shadow:0 8px 24px rgba(192,57,43,0.3); }
    .profile-header h2 { font-family:'Playfair Display',serif; font-size:1.5rem; }
    .profile-header h2 span { color:var(--accent); }
    .role-badge { display:inline-flex; align-items:center; gap:6px; background:rgba(192,57,43,0.12); color:#e74c3c; border:1px solid rgba(192,57,43,0.25); border-radius:20px; padding:4px 14px; font-size:0.72rem; font-weight:600; margin-bottom:10px; }
    .section-label { font-size:0.68rem; font-weight:600; letter-spacing:1px; text-transform:uppercase; color:var(--muted); margin:20px 0 12px; display:flex; align-items:center; gap:8px; }
    .section-label::after { content:''; flex:1; height:1px; background:var(--border); }
    .section-label i { color:var(--accent); }
    .detail-grid { background:var(--surface2); border:1px solid var(--border); border-radius:14px; overflow:hidden; }
    .detail-row { display:flex; align-items:center; padding:12px 16px; gap:12px; border-bottom:1px solid var(--border); }
    .detail-row:last-child { border-bottom:none; }
    .detail-icon { width:32px; height:32px; border-radius:8px; background:rgba(192,57,43,0.1); display:flex; align-items:center; justify-content:center; flex-shrink:0; }
    .detail-icon i { color:#e74c3c; font-size:0.78rem; }
    .detail-label { font-size:0.68rem; color:var(--muted); text-transform:uppercase; letter-spacing:0.5px; margin-bottom:2px; }
    .detail-value { font-size:0.9rem; font-weight:500; }
    .btn-back { display:flex; align-items:center; justify-content:center; gap:8px; width:100%; padding:14px; background:linear-gradient(135deg,var(--red),#922b21); color:#fff; font-family:'Poppins',sans-serif; font-size:0.92rem; font-weight:700; border:none; border-radius:12px; cursor:pointer; margin-top:28px; text-decoration:none; transition:all 0.25s; box-shadow:0 4px 20px rgba(192,57,43,0.3); }
    .btn-back:hover { transform:translateY(-2px); }
  </style>
</head>
<body>
  <a href="login_Success.jsp" class="back-link"><i class="fa fa-arrow-left"></i> Dashboard</a>
  <div class="card">
    <div class="profile-header">
      <div class="avatar">👨‍🍳</div>
      <div class="role-badge"><i class="fa fa-user-tie"></i> &nbsp;MANAGER</div>
      <h2>Manager <span>Profile</span></h2>
      <p>Your account details</p>
    </div>
    <div class="section-label"><i class="fa fa-user"></i> Personal Info</div>
    <div class="detail-grid">
      <div class="detail-row"><div class="detail-icon"><i class="fa fa-user"></i></div><div><div class="detail-label">Username</div><div class="detail-value"><%= rb.getuName() %></div></div></div>
      <div class="detail-row"><div class="detail-icon"><i class="fa fa-id-card"></i></div><div><div class="detail-label">Full Name</div><div class="detail-value"><%= rb.getfName() %> <%= rb.getlName() %></div></div></div>
    </div>
    <div class="section-label"><i class="fa fa-address-book"></i> Contact</div>
    <div class="detail-grid">
      <div class="detail-row"><div class="detail-icon"><i class="fa fa-envelope"></i></div><div><div class="detail-label">Email</div><div class="detail-value"><%= rb.getMid() %></div></div></div>
      <div class="detail-row"><div class="detail-icon"><i class="fa fa-phone"></i></div><div><div class="detail-label">Phone</div><div class="detail-value"><%= rb.getMob() %></div></div></div>
      <div class="detail-row"><div class="detail-icon"><i class="fa fa-map-pin"></i></div><div><div class="detail-label">Location</div><div class="detail-value"><%= rb.getLoc() %></div></div></div>
      <div class="detail-row"><div class="detail-icon"><i class="fa fa-location-dot"></i></div><div><div class="detail-label">Address</div><div class="detail-value"><%= rb.getAddr() %></div></div></div>
    </div>
    <div class="section-label"><i class="fa fa-building-columns"></i> Bank Details</div>
    <div class="detail-grid">
      <div class="detail-row"><div class="detail-icon"><i class="fa fa-credit-card"></i></div><div><div class="detail-label">Account No</div><div class="detail-value"><%= rb.getAccno() %></div></div></div>
      <div class="detail-row"><div class="detail-icon"><i class="fa fa-hashtag"></i></div><div><div class="detail-label">IFSC</div><div class="detail-value"><%= rb.getIfsc() %></div></div></div>
    </div>
    <a href="login_Success.jsp" class="btn-back"><i class="fa fa-arrow-left"></i> Back to Dashboard</a>
  </div>
</body>
</html>
