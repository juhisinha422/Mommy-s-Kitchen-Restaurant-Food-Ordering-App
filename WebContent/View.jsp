<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.RegBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Review Registration | Mommy's Kitchen</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }
    :root {
      --bg:      #0d0d0d;
      --surface: #1a1a1a;
      --surface2:#222;
      --border:  rgba(255,255,255,0.08);
      --accent:  #e8943a;
      --red:     #c0392b;
      --text:    #f0f0f0;
      --muted:   #777;
    }
    body {
      font-family: 'Poppins', sans-serif;
      background: var(--bg); color: var(--text);
      min-height: 100vh;
      display: flex; align-items: center; justify-content: center;
      padding: 30px 20px; position: relative; overflow: hidden;
    }
    body::before, body::after {
      content: ''; position: fixed; border-radius: 50%;
      filter: blur(90px); opacity: 0.13; pointer-events: none; z-index: 0;
    }
    body::before {
      width: 500px; height: 500px; background: var(--red);
      top: -160px; right: -160px;
    }
    body::after {
      width: 400px; height: 400px; background: var(--accent);
      bottom: -120px; left: -120px;
    }

    .card {
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 24px; padding: 44px 40px;
      width: 100%; max-width: 520px;
      position: relative; z-index: 1;
      box-shadow: 0 30px 80px rgba(0,0,0,0.5);
    }

    /* Header */
    .page-header { text-align: center; margin-bottom: 32px; }
    .header-icon {
      width: 64px; height: 64px;
      background: linear-gradient(135deg, var(--accent), #c0392b);
      border-radius: 18px;
      display: flex; align-items: center; justify-content: center;
      font-size: 1.6rem; margin: 0 auto 14px;
      box-shadow: 0 8px 24px rgba(232,148,58,0.3);
    }
    .page-header h2 {
      font-family: 'Playfair Display', serif;
      font-size: 1.6rem; font-weight: 700;
    }
    .page-header h2 span { color: var(--accent); }
    .page-header p { color: var(--muted); font-size: 0.82rem; margin-top: 6px; }

    /* Alert banner */
    .review-alert {
      background: rgba(232,148,58,0.08);
      border: 1px solid rgba(232,148,58,0.2);
      border-radius: 12px; padding: 12px 16px;
      display: flex; align-items: center; gap: 10px;
      margin-bottom: 28px; font-size: 0.82rem; color: var(--accent);
    }

    /* Section label */
    .section-label {
      font-size: 0.68rem; font-weight: 600; letter-spacing: 1px;
      text-transform: uppercase; color: var(--muted);
      margin: 22px 0 12px;
      display: flex; align-items: center; gap: 8px;
    }
    .section-label::after { content: ''; flex: 1; height: 1px; background: var(--border); }
    .section-label i { color: var(--accent); }

    /* Detail rows */
    .detail-grid {
      display: flex; flex-direction: column; gap: 2px;
      background: var(--surface2);
      border: 1px solid var(--border);
      border-radius: 14px; overflow: hidden;
      margin-bottom: 4px;
    }
    .detail-row {
      display: flex; align-items: center;
      padding: 12px 16px; gap: 12px;
      border-bottom: 1px solid var(--border);
      transition: background 0.2s;
    }
    .detail-row:last-child { border-bottom: none; }
    .detail-row:hover { background: rgba(255,255,255,0.02); }
    .detail-icon {
      width: 32px; height: 32px; border-radius: 8px;
      background: rgba(232,148,58,0.1);
      display: flex; align-items: center; justify-content: center;
      flex-shrink: 0;
    }
    .detail-icon i { color: var(--accent); font-size: 0.78rem; }
    .detail-content { flex: 1; min-width: 0; }
    .detail-label {
      font-size: 0.68rem; color: var(--muted);
      text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 2px;
    }
    .detail-value {
      font-size: 0.9rem; font-weight: 500; color: var(--text);
      white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
    }
    .detail-value.masked { letter-spacing: 3px; color: var(--muted); }

    /* Action buttons */
    .actions { display: flex; gap: 12px; margin-top: 28px; }
    .btn-back {
      flex: 1; padding: 14px;
      background: transparent;
      border: 1.5px solid var(--border);
      border-radius: 12px; color: var(--muted);
      font-family: 'Poppins', sans-serif;
      font-size: 0.88rem; font-weight: 500;
      cursor: pointer; text-decoration: none;
      display: flex; align-items: center; justify-content: center; gap: 8px;
      transition: all 0.25s;
    }
    .btn-back:hover { border-color: var(--accent); color: var(--accent); }
    .btn-confirm {
      flex: 2; padding: 14px;
      background: linear-gradient(135deg, #2ed573, #1abc9c);
      color: #0d0d0d;
      font-family: 'Poppins', sans-serif;
      font-size: 0.95rem; font-weight: 700;
      border: none; border-radius: 12px;
      cursor: pointer; letter-spacing: 0.4px;
      transition: opacity 0.25s, transform 0.2s, box-shadow 0.25s;
      box-shadow: 0 6px 20px rgba(46,213,117,0.25);
      display: flex; align-items: center; justify-content: center; gap: 8px;
    }
    .btn-confirm:hover {
      opacity: 0.9; transform: translateY(-2px);
      box-shadow: 0 10px 28px rgba(46,213,117,0.4);
    }

    @media (max-width: 480px) {
      .card { padding: 32px 18px; }
      .actions { flex-direction: column; }
    }
  </style>
</head>
<body>
<%
RegBean rb = (RegBean) application.getAttribute("beanRef");
%>
  <div class="card">

    <div class="page-header">
      <div class="header-icon">📋</div>
      <h2>Review Your <span>Details</span></h2>
      <p>Please confirm everything looks correct before registering</p>
    </div>

    <div class="review-alert">
      <i class="fa fa-circle-info"></i>
      Double-check your details below. Click <strong>&nbsp;Confirm & Register&nbsp;</strong> when ready.
    </div>

    <!-- Personal Info -->
    <div class="section-label"><i class="fa fa-user"></i> Personal Information</div>
    <div class="detail-grid">
      <div class="detail-row">
        <div class="detail-icon"><i class="fa fa-user"></i></div>
        <div class="detail-content">
          <div class="detail-label">Username</div>
          <div class="detail-value"><%= rb.getuName() %></div>
        </div>
      </div>
      <div class="detail-row">
        <div class="detail-icon"><i class="fa fa-lock"></i></div>
        <div class="detail-content">
          <div class="detail-label">Password</div>
          <div class="detail-value masked">••••••••</div>
        </div>
      </div>
      <div class="detail-row">
        <div class="detail-icon"><i class="fa fa-id-card"></i></div>
        <div class="detail-content">
          <div class="detail-label">Full Name</div>
          <div class="detail-value"><%= rb.getfName() %> <%= rb.getlName() %></div>
        </div>
      </div>
    </div>

    <!-- Contact Info -->
    <div class="section-label"><i class="fa fa-address-book"></i> Contact Information</div>
    <div class="detail-grid">
      <div class="detail-row">
        <div class="detail-icon"><i class="fa fa-envelope"></i></div>
        <div class="detail-content">
          <div class="detail-label">Email</div>
          <div class="detail-value"><%= rb.getMid() %></div>
        </div>
      </div>
      <div class="detail-row">
        <div class="detail-icon"><i class="fa fa-phone"></i></div>
        <div class="detail-content">
          <div class="detail-label">Phone</div>
          <div class="detail-value"><%= rb.getMob() %></div>
        </div>
      </div>
      <div class="detail-row">
        <div class="detail-icon"><i class="fa fa-map-pin"></i></div>
        <div class="detail-content">
          <div class="detail-label">Location</div>
          <div class="detail-value"><%= rb.getLoc() %></div>
        </div>
      </div>
      <div class="detail-row">
        <div class="detail-icon"><i class="fa fa-location-dot"></i></div>
        <div class="detail-content">
          <div class="detail-label">Address</div>
          <div class="detail-value"><%= rb.getAddr() %></div>
        </div>
      </div>
    </div>

    <!-- Bank Info -->
    <div class="section-label"><i class="fa fa-building-columns"></i> Bank Details</div>
    <div class="detail-grid">
      <div class="detail-row">
        <div class="detail-icon"><i class="fa fa-credit-card"></i></div>
        <div class="detail-content">
          <div class="detail-label">Account Number</div>
          <div class="detail-value"><%= rb.getAccno() %></div>
        </div>
      </div>
      <div class="detail-row">
        <div class="detail-icon"><i class="fa fa-hashtag"></i></div>
        <div class="detail-content">
          <div class="detail-label">IFSC Code</div>
          <div class="detail-value"><%= rb.getIfsc() %></div>
        </div>
      </div>
    </div>

    <!-- Actions -->
    <div class="actions">
      <a href="input2.html" class="btn-back">
        <i class="fa fa-arrow-left"></i> Edit
      </a>
      <form action="final" method="post" style="flex:2;display:flex;">
        <button type="submit" class="btn-confirm" style="flex:1;">
          <i class="fa fa-check-circle"></i> Confirm & Register
        </button>
      </form>
    </div>

  </div>
</body>
</html>
