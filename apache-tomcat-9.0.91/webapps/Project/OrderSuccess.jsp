<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Order Placed | Mommy's Kitchen</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    *, *::before, *::after{margin:0;padding:0;box-sizing:border-box;}
    :root{--bg:#0d0d0d;--surface:#1a1a1a;--border:rgba(255,255,255,0.08);--accent:#e8943a;--text:#f0f0f0;--muted:#777;}
    body{font-family:'Poppins',sans-serif;background:var(--bg);color:var(--text);min-height:100vh;display:flex;align-items:center;justify-content:center;padding:20px;}
    .card{background:var(--surface);border:1px solid var(--border);border-radius:24px;padding:48px 40px;width:100%;max-width:420px;text-align:center;box-shadow:0 30px 80px rgba(0,0,0,0.5);}
    .icon{width:80px;height:80px;background:rgba(46,213,115,0.1);border:1px solid rgba(46,213,115,0.25);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 20px;font-size:2rem;animation:pop 0.4s ease;}
    @keyframes pop{0%{transform:scale(0.5);opacity:0}100%{transform:scale(1);opacity:1}}
    h2{font-family:'Playfair Display',serif;font-size:1.6rem;margin-bottom:10px;}
    h2 span{color:#2ed573;}
    .order-box{background:rgba(46,213,115,0.06);border:1px solid rgba(46,213,115,0.15);border-radius:12px;padding:16px;margin:20px 0;text-align:left;}
    .order-box p{font-size:0.85rem;color:var(--muted);margin-bottom:6px;}
    .order-box strong{color:var(--text);}
    .btn{display:inline-flex;align-items:center;gap:8px;padding:13px 32px;border-radius:50px;background:linear-gradient(135deg,var(--accent),#d4782a);color:#0d0d0d;font-family:'Poppins',sans-serif;font-size:0.9rem;font-weight:700;text-decoration:none;transition:all 0.25s;box-shadow:0 4px 20px rgba(232,148,58,0.3);}
    .btn:hover{transform:translateY(-2px);}
  </style>
</head>
<body>
<% String dname=(String)request.getAttribute("dname"); String dprice=(String)request.getAttribute("dprice"); %>
  <div class="card">
    <div class="icon">🎉</div>
    <h2>Order <span>Placed!</span></h2>
    <p style="color:var(--muted);font-size:0.85rem;">Your order has been placed successfully!</p>
    <div class="order-box">
      <p>Dish: <strong><%= dname %></strong></p>
      <p>Price: <strong>Rs. <%= dprice %></strong></p>
      <p>Status: <strong style="color:#2ed573;">Confirmed ✓</strong></p>
    </div>
    <a href="viewdish" class="btn"><i class="fa fa-utensils"></i> Order More</a>
  </div>
</body>
</html>
