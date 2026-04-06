<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GLP-1 Guide</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,700;1,400&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --g1:#0a0f0a;
  --g2:#0d1f15;
  --em:#00ff88;
  --em2:#00d4ff;
  --em3:#7fff6e;
  --glass:rgba(255,255,255,0.04);
  --glass-border:rgba(255,255,255,0.08);
  --glass-hover:rgba(255,255,255,0.08);
  --text:#e8f5e8;
  --muted:rgba(232,245,232,0.5);
}
html{scroll-behavior:smooth}
body{
  background:var(--g1);
  color:var(--text);
  font-family:'Space Grotesk',sans-serif;
  overflow-x:hidden;
}

/* CANVAS BG */
#bg-canvas{
  position:fixed;top:0;left:0;width:100%;height:100%;
  z-index:0;pointer-events:none;
}

/* ORBS */
.orb{
  position:fixed;border-radius:50%;filter:blur(80px);
  pointer-events:none;z-index:1;opacity:0.35;
  animation:orbFloat 20s ease-in-out infinite alternate;
}
.orb1{width:600px;height:600px;background:radial-gradient(circle,#00ff4420,transparent);top:-200px;left:-100px;animation-delay:0s}
.orb2{width:500px;height:500px;background:radial-gradient(circle,#00aaff18,transparent);top:20%;right:-150px;animation-delay:-7s;animation-duration:25s}
.orb3{width:400px;height:400px;background:radial-gradient(circle,#88ff0015,transparent);bottom:10%;left:20%;animation-delay:-13s;animation-duration:18s}

@keyframes orbFloat{
  0%{transform:translate(0,0) scale(1)}
  100%{transform:translate(40px,-60px) scale(1.15)}
}

/* GRID OVERLAY */
body::after{
  content:'';position:fixed;inset:0;z-index:1;pointer-events:none;
  background-image:
    linear-gradient(rgba(0,255,136,0.03) 1px,transparent 1px),
    linear-gradient(90deg,rgba(0,255,136,0.03) 1px,transparent 1px);
  background-size:60px 60px;
}

/* NAVBAR */
nav{
  position:fixed;top:20px;left:50%;transform:translateX(-50%);
  z-index:100;display:flex;gap:4px;padding:6px;
  background:rgba(10,15,10,0.7);
  backdrop-filter:blur(20px);-webkit-backdrop-filter:blur(20px);
  border:1px solid var(--glass-border);border-radius:100px;
}
nav a{
  color:var(--muted);text-decoration:none;font-size:13px;font-weight:500;
  padding:8px 18px;border-radius:100px;transition:all .3s ease;letter-spacing:0.03em;
}
nav a:hover{color:var(--em);background:rgba(0,255,136,0.08)}

/* SECTIONS */
section{position:relative;z-index:10;min-height:100vh;display:flex;align-items:center;justify-content:center;padding:120px 40px}

/* ── HERO ── */
.hero{flex-direction:column;text-align:center;gap:0}

.hero-eyebrow{
  display:inline-flex;align-items:center;gap:10px;
  border:1px solid rgba(0,255,136,0.2);border-radius:100px;
  padding:8px 20px;margin-bottom:48px;
  background:rgba(0,255,136,0.05);
  font-size:12px;letter-spacing:0.15em;text-transform:uppercase;color:var(--em);
  animation:fadeDown .8s ease both;
}
.hero-eyebrow-dot{width:6px;height:6px;border-radius:50%;background:var(--em);animation:pulse 2s ease infinite}

@keyframes pulse{0%,100%{opacity:1;transform:scale(1)}50%{opacity:0.4;transform:scale(0.8)}}

.hero-title{
  font-family:'Playfair Display',serif;
  font-size:clamp(3.5rem,8vw,8rem);
  line-height:1.0;
  font-weight:700;
  margin-bottom:12px;
  animation:fadeUp .9s .1s ease both;
}
.hero-title-line2{
  font-style:italic;font-weight:400;
  background:linear-gradient(135deg,var(--em),var(--em2));
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;
}
.hero-sub{
  font-size:1.1rem;color:var(--muted);max-width:500px;margin:0 auto 64px;line-height:1.7;
  animation:fadeUp .9s .2s ease both;
}

@keyframes fadeUp{from{opacity:0;transform:translateY(30px)}to{opacity:1;transform:translateY(0)}}
@keyframes fadeDown{from{opacity:0;transform:translateY(-20px)}to{opacity:1;transform:translateY(0)}}

.hero-cards{
  display:grid;grid-template-columns:repeat(4,1fr);gap:16px;max-width:900px;width:100%;
  animation:fadeUp .9s .3s ease both;
}
.hero-card{
  background:var(--glass);border:1px solid var(--glass-border);border-radius:20px;
  padding:24px 20px;text-align:left;transition:all .4s ease;cursor:default;
  backdrop-filter:blur(10px);-webkit-backdrop-filter:blur(10px);
}
.hero-card:hover{
  background:var(--glass-hover);border-color:rgba(0,255,136,0.2);
  transform:translateY(-6px);box-shadow:0 20px 60px rgba(0,255,136,0.05);
}
.hc-icon{font-size:1.6rem;margin-bottom:14px;display:block}
.hc-title{font-size:.85rem;font-weight:600;color:var(--text);margin-bottom:6px}
.hc-sub{font-size:.78rem;color:var(--muted);line-height:1.5}

.scroll-cue{
  margin-top:80px;display:flex;flex-direction:column;align-items:center;gap:8px;
  color:var(--muted);font-size:.75rem;letter-spacing:.1em;text-transform:uppercase;
  animation:fadeUp .9s .5s ease both;
}
.scroll-mouse{
  width:24px;height:38px;border:1.5px solid rgba(255,255,255,0.15);border-radius:12px;
  display:flex;align-items:flex-start;justify-content:center;padding-top:6px;
}
.scroll-wheel{
  width:3px;height:8px;background:var(--em);border-radius:2px;
  animation:scrollAnim 1.8s ease-in-out infinite;
}
@keyframes scrollAnim{0%{transform:translateY(0);opacity:1}80%{transform:translateY(14px);opacity:0}100%{transform:translateY(0);opacity:0}}

/* ── GLASS CARD BASE ── */
.glass-card{
  background:rgba(255,255,255,0.03);
  border:1px solid rgba(255,255,255,0.07);
  border-radius:28px;
  backdrop-filter:blur(20px);-webkit-backdrop-filter:blur(20px);
  transition:all .4s ease;
}
.glass-card:hover{
  background:rgba(255,255,255,0.06);
  border-color:rgba(0,255,136,0.15);
  box-shadow:0 0 60px rgba(0,255,136,0.04),0 30px 60px rgba(0,0,0,0.3);
}

/* ── LABEL ── */
.label{
  font-size:11px;font-weight:600;letter-spacing:.2em;text-transform:uppercase;
  color:var(--em);display:flex;align-items:center;gap:10px;margin-bottom:20px;
}
.label::before{content:'';display:block;width:20px;height:1px;background:var(--em)}

/* ── SECTION TITLE ── */
.s-title{
  font-family:'Playfair Display',serif;
  font-size:clamp(2.2rem,4vw,3.8rem);
  line-height:1.05;font-weight:700;margin-bottom:16px;
}
.s-title i{font-style:italic;font-weight:400;color:var(--em)}

/* ── HOW IT WORKS ── */
.how-layout{display:grid;grid-template-columns:1fr 1fr;gap:80px;align-items:center;max-width:1100px;width:100%}
.how-body{color:var(--muted);font-size:1rem;line-height:1.85}
.how-body p{margin-bottom:18px}

.meds{display:flex;flex-direction:column;gap:14px}
.med{
  padding:22px 26px;display:flex;align-items:flex-start;gap:18px;
  background:rgba(0,255,136,0.03);border:1px solid rgba(0,255,136,0.08);border-radius:18px;
  transition:all .3s ease;
}
.med:hover{background:rgba(0,255,136,0.06);border-color:rgba(0,255,136,0.2)}
.med-num{
  font-family:'Playfair Display',serif;font-style:italic;
  font-size:2rem;line-height:1;color:rgba(0,255,136,0.25);flex-shrink:0;width:36px;
}
.med-info{}
.med-name{font-size:.9rem;font-weight:600;color:var(--text);margin-bottom:5px}
.med-desc{font-size:.82rem;color:var(--muted);line-height:1.5}
.med-tag{
  display:inline-block;margin-top:8px;font-size:.72rem;font-weight:500;
  color:var(--em);background:rgba(0,255,136,0.08);
  border:1px solid rgba(0,255,136,0.15);border-radius:100px;padding:3px 10px;
}

/* ── SYMPTOMS ── */
.symp-layout{max-width:1100px;width:100%;display:flex;flex-direction:column;gap:60px}
.symp-top{display:grid;grid-template-columns:1fr 1fr;gap:60px;align-items:start}

.symp-list{list-style:none}
.symp-list li{
  padding:12px 0;border-bottom:1px solid rgba(255,255,255,0.05);
  font-size:.9rem;color:var(--muted);display:flex;align-items:center;gap:12px;
}
.symp-list li::before{content:'';width:6px;height:6px;border-radius:50%;background:var(--em);flex-shrink:0}

.symp-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:16px}
.symp-card{padding:28px 24px;border-radius:22px}
.symp-card .si{font-size:1.8rem;margin-bottom:16px;display:block}
.symp-card h4{font-size:.88rem;font-weight:600;margin-bottom:10px;color:var(--text)}
.symp-card p{font-size:.8rem;color:var(--muted);line-height:1.6}

/* ── MEALS ── */
.meals-layout{max-width:1000px;width:100%;display:flex;flex-direction:column;gap:60px}
.meals-head{display:grid;grid-template-columns:1.3fr 1fr;gap:60px;align-items:start}
.meals-note{
  padding:28px;border-radius:20px;
  background:linear-gradient(135deg,rgba(0,255,136,0.05),rgba(0,212,255,0.05));
  border:1px solid rgba(0,255,136,0.1);
}
.meals-note-q{font-family:'Playfair Display',serif;font-style:italic;font-size:1.05rem;line-height:1.6;color:var(--text);margin-bottom:20px}
.pill-row{display:flex;flex-wrap:wrap;gap:8px}
.pill{
  font-size:.75rem;font-weight:500;padding:6px 14px;border-radius:100px;
  border:1px solid rgba(255,255,255,0.1);color:var(--muted);
  background:rgba(255,255,255,0.03);
}

.meal-timeline{display:flex;flex-direction:column;gap:0}
.meal-row{display:grid;grid-template-columns:80px 1px 1fr;gap:0 28px;position:relative}
.meal-time{
  font-size:.75rem;font-weight:600;color:var(--em);letter-spacing:.05em;
  text-align:right;padding-top:26px;
}
.meal-line-col{display:flex;flex-direction:column;align-items:center;position:relative}
.meal-dot{
  width:12px;height:12px;border-radius:50%;
  background:var(--em);margin-top:30px;flex-shrink:0;
  box-shadow:0 0 12px var(--em),0 0 30px rgba(0,255,136,0.3);
}
.meal-connector{width:1px;flex:1;background:linear-gradient(to bottom,rgba(0,255,136,0.3),rgba(0,255,136,0.03));margin-top:4px}
.meal-card{padding:24px 28px;border-radius:20px;margin-bottom:20px}
.meal-emoji{font-size:1.5rem;margin-bottom:10px;display:block}
.meal-title{font-size:.95rem;font-weight:600;margin-bottom:12px}
.meal-opts{list-style:none}
.meal-opts li{
  font-size:.82rem;color:var(--muted);padding:6px 0;
  border-bottom:1px solid rgba(255,255,255,0.04);
  display:flex;gap:8px;line-height:1.4;
}
.meal-opts li:last-child{border:none}
.meal-opts li::before{content:'→';color:var(--em2);flex-shrink:0;font-size:.75rem;margin-top:2px}
.meal-tip{
  margin-top:12px;padding:10px 14px;border-radius:10px;
  background:rgba(0,212,255,0.06);border:1px solid rgba(0,212,255,0.12);
  font-size:.78rem;color:rgba(0,212,255,0.8);line-height:1.5;
}

/* ── MUSCLE ── */
.muscle-layout{max-width:1100px;width:100%;display:grid;grid-template-columns:1fr 1fr;gap:80px;align-items:start}
.protein-hero{
  padding:40px;border-radius:28px;text-align:center;
  background:linear-gradient(135deg,rgba(0,255,136,0.07),rgba(0,212,255,0.04));
  border:1px solid rgba(0,255,136,0.12);margin-bottom:24px;
}
.protein-big{
  font-family:'Playfair Display',serif;font-size:5rem;font-weight:700;
  background:linear-gradient(135deg,var(--em),var(--em2));
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;
  line-height:1;margin-bottom:8px;
}
.protein-unit{font-size:.85rem;color:var(--muted);margin-bottom:16px}
.protein-note{font-size:.82rem;color:var(--muted);line-height:1.6}

.muscle-tips{display:flex;flex-direction:column;gap:16px}
.mtip{
  padding:22px 24px;border-radius:18px;display:flex;gap:18px;align-items:flex-start;
  transition:all .3s ease;
}
.mtip:hover{background:rgba(255,255,255,0.04);transform:translateX(6px)}
.mtip-n{
  font-family:'Playfair Display',serif;font-size:2.5rem;font-style:italic;
  color:rgba(0,255,136,0.12);flex-shrink:0;line-height:1;width:44px;text-align:right;
}
.mtip-title{font-size:.9rem;font-weight:600;margin-bottom:6px}
.mtip-body{font-size:.82rem;color:var(--muted);line-height:1.6}

/* ── TABLE ── */
.compare-layout{max-width:900px;width:100%;display:grid;grid-template-columns:1fr 1fr;gap:24px}
.cmp{padding:36px;border-radius:26px}
.cmp-header{display:flex;align-items:center;gap:14px;margin-bottom:28px}
.cmp-icon{
  width:38px;height:38px;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:1rem;
}
.yes-icon{background:rgba(0,255,136,0.1);color:var(--em)}
.no-icon{background:rgba(255,80,80,0.1);color:#ff5050}
.cmp-title{font-size:1rem;font-weight:600}
.cmp-list{list-style:none}
.cmp-list li{
  font-size:.85rem;color:var(--muted);padding:10px 0;
  border-bottom:1px solid rgba(255,255,255,0.04);
  display:flex;gap:10px;align-items:flex-start;line-height:1.4;
}
.cmp-list li:last-child{border:none}
.cmp-list.yes li::before{content:'✓';color:var(--em);flex-shrink:0;font-weight:700}
.cmp-list.no li::before{content:'✕';color:#ff5050;flex-shrink:0;font-weight:700}

/* ── NUTRIENTS ── */
.nut-layout{max-width:1000px;width:100%;display:grid;grid-template-columns:repeat(2,1fr);gap:20px}
.nut-card{padding:32px;border-radius:24px;display:grid;grid-template-columns:56px 1fr;gap:20px;align-items:start;transition:all .4s ease}
.nut-card:hover{transform:translateY(-4px)}
.nut-icon{
  width:52px;height:52px;border-radius:14px;display:flex;align-items:center;justify-content:center;font-size:1.4rem;
}
.n1{background:rgba(0,255,136,0.1)}
.n2{background:rgba(0,212,255,0.1)}
.n3{background:rgba(127,255,110,0.1)}
.n4{background:rgba(255,200,80,0.1)}
.nut-title{font-size:.95rem;font-weight:600;margin-bottom:8px}
.nut-body{font-size:.82rem;color:var(--muted);line-height:1.65}

/* ── LIFESTYLE ── */
.life-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:16px;max-width:1000px;width:100%}
.life-card{
  padding:32px 28px;border-radius:22px;text-align:center;
  transition:all .4s cubic-bezier(.25,1,.5,1);
}
.life-card:hover{transform:translateY(-10px);box-shadow:0 30px 60px rgba(0,0,0,0.4)}
.life-icon{font-size:2.2rem;margin-bottom:18px;display:block}
.life-title{font-size:.9rem;font-weight:600;margin-bottom:10px}
.life-body{font-size:.8rem;color:var(--muted);line-height:1.6}

/* ── FOOTER ── */
footer{
  position:relative;z-index:10;text-align:center;padding:80px 40px;
  border-top:1px solid rgba(255,255,255,0.05);
}
.footer-logo{
  font-family:'Playfair Display',serif;font-size:2rem;font-style:italic;
  background:linear-gradient(135deg,var(--em),var(--em2));
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;
  margin-bottom:16px;
}
.footer-note{font-size:.85rem;color:var(--muted);line-height:1.8;max-width:500px;margin:0 auto}

/* ── SECTION SPACING ── */
.section-inner{display:flex;flex-direction:column;align-items:center;width:100%}

/* ── REVEAL ANIMATIONS ── */
.reveal{opacity:0;transform:translateY(40px);transition:opacity .8s ease,transform .8s ease}
.reveal.on{opacity:1;transform:translateY(0)}
.reveal-left{opacity:0;transform:translateX(-40px);transition:opacity .8s ease,transform .8s ease}
.reveal-left.on{opacity:1;transform:translateX(0)}
.reveal-right{opacity:0;transform:translateX(40px);transition:opacity .8s ease,transform .8s ease}
.reveal-right.on{opacity:1;transform:translateX(0)}

/* ── RESPONSIVE ── */
@media(max-width:900px){
  nav{display:none}
  .hero-cards{grid-template-columns:1fr 1fr}
  .how-layout,.symp-top,.meals-head,.muscle-layout,.compare-layout{grid-template-columns:1fr}
  .symp-grid,.life-grid{grid-template-columns:1fr 1fr}
  .nut-layout{grid-template-columns:1fr}
  section{padding:80px 24px}
}
@media(max-width:600px){
  .hero-cards,.symp-grid,.life-grid{grid-template-columns:1fr}
}
</style>
</head>
<body>

<canvas id="bg-canvas"></canvas>
<div class="orb orb1"></div>
<div class="orb orb2"></div>
<div class="orb orb3"></div>

<nav>
  <a href="#como">Como funciona</a>
  <a href="#sintomas">Sintomas</a>
  <a href="#refeicoes">Refeições</a>
  <a href="#musculos">Músculos</a>
  <a href="#nutri">Nutrientes</a>
</nav>

<!-- ═══════════════════ HERO ═══════════════════ -->
<section class="hero" id="hero">
  <div class="hero-eyebrow">
    <span class="hero-eyebrow-dot"></span>
    Guia para usuários de GLP-1
  </div>
  <h1 class="hero-title">
    Sua caneta,<br>
    <span class="hero-title-line2">seu prato.</span>
  </h1>
  <p class="hero-sub">O remédio faz parte — mas a comida é o que sustenta. Aqui você aprende a comer bem mesmo com menos fome.</p>

  <div class="hero-cards">
    <div class="hero-card glass-card">
      <span class="hc-icon">🧬</span>
      <div class="hc-title">Como funciona</div>
      <div class="hc-sub">Entenda o que muda no seu corpo</div>
    </div>
    <div class="hero-card glass-card">
      <span class="hc-icon">🤢</span>
      <div class="hc-title">Enjoos e sintomas</div>
      <div class="hc-sub">Como amenizar do dia 1</div>
    </div>
    <div class="hero-card glass-card">
      <span class="hc-icon">🥗</span>
      <div class="hc-title">O que comer</div>
      <div class="hc-sub">Do café até a ceia, de verdade</div>
    </div>
    <div class="hero-card glass-card">
      <span class="hc-icon">💪</span>
      <div class="hc-title">Preservar músculo</div>
      <div class="hc-sub">Proteína certa, na hora certa</div>
    </div>
  </div>

  <div class="scroll-cue">
    <div class="scroll-mouse"><div class="scroll-wheel"></div></div>
    role para baixo
  </div>
</section>

<!-- ═══════════════════ COMO FUNCIONA ═══════════════════ -->
<section id="como">
  <div class="section-inner">
    <div class="how-layout">
      <div class="reveal-left">
        <div class="label">entendendo o remédio</div>
        <h2 class="s-title">Seu corpo<br>agora fala<br><i>diferente.</i></h2>
        <div class="how-body">
          <p>As canetas de GLP-1 imitam um hormônio que seu corpo já produz naturalmente — aquele que avisa o cérebro: "já chega". O resultado é saciedade mais rápida, fome reduzida e digestão mais lenta.</p>
          <p>Isso é ótimo para emagrecer. Mas exige atenção: com menos apetite, você precisa garantir que o que você come valha muito cada garfada.</p>
          <p>A alimentação certa potencializa o remédio. A alimentação errada sabota tudo — e ainda piora os enjoos.</p>
        </div>
      </div>
      <div class="reveal-right">
        <div class="meds">
          <div class="med">
            <div class="med-num">01</div>
            <div class="med-info">
              <div class="med-name">Semaglutida</div>
              <div class="med-desc">Age no pâncreas e no cérebro ao mesmo tempo — libera insulina, freia o glucagon e reduz o apetite direto na fonte.</div>
              <span class="med-tag">Ozempic · Wegovy</span>
            </div>
          </div>
          <div class="med">
            <div class="med-num">02</div>
            <div class="med-info">
              <div class="med-name">Liraglutida</div>
              <div class="med-desc">Mesmo mecanismo da semaglutida, com aplicação diária. Forte controle glicêmico e redução de fome.</div>
              <span class="med-tag">Saxenda · Victoza</span>
            </div>
          </div>
          <div class="med">
            <div class="med-num">03</div>
            <div class="med-info">
              <div class="med-name">Tirzepatida</div>
              <div class="med-desc">Agonista duplo: age nos receptores GLP-1 e GIP ao mesmo tempo. Efeitos metabólicos potencializados.</div>
              <span class="med-tag">Mounjaro · Zepbound</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ═══════════════════ SINTOMAS ═══════════════════ -->
<section id="sintomas">
  <div class="section-inner">
    <div class="symp-layout">
      <div class="symp-top">
        <div class="reveal-left">
          <div class="label">efeitos colaterais</div>
          <h2 class="s-title">Os enjoos<br>são normais.<br><i>Dá pra domar.</i></h2>
          <div class="how-body" style="margin-top:20px">
            <p>A maioria dos sintomas aparece nas primeiras semanas ou quando a dose sobe. Eles tendem a sumir — e a alimentação certa acelera isso muito.</p>
          </div>
          <ul class="symp-list" style="margin-top:24px">
            <li>Náuseas, especialmente de manhã</li>
            <li>Vômitos após refeições grandes</li>
            <li>Prisão de ventre ou diarreia</li>
            <li>Barriga cheia rapidinho</li>
            <li>Arrotos e distensão abdominal</li>
            <li>Refluxo, azia, cansaço</li>
          </ul>
        </div>
        <div class="reveal-right" style="padding-top:80px">
          <div style="background:rgba(0,255,136,0.03);border:1px solid rgba(0,255,136,0.1);border-radius:22px;padding:28px">
            <p style="font-family:'Playfair Display',serif;font-style:italic;font-size:1.1rem;line-height:1.6;color:var(--text);margin-bottom:18px">"Pouco e frequente é a regra de ouro."</p>
            <p style="font-size:.85rem;color:var(--muted);line-height:1.7">Refeições pequenas a cada 3–4h funcionam muito melhor do que duas refeições grandes. O estômago está trabalhando mais devagar — não force.</p>
          </div>
        </div>
      </div>

      <div class="symp-grid reveal">
        <div class="symp-card glass-card">
          <span class="si">🌅</span>
          <h4>Enjoo matinal</h4>
          <p>Comece com algo pequeno antes de ficar em jejum longo. Um biscoito integral ou fruta já ajudam. Pular o café da manhã piora.</p>
        </div>
        <div class="symp-card glass-card">
          <span class="si">🍵</span>
          <h4>Chás que aliviam</h4>
          <p>Gengibre e erva-cidreira têm evidência de alívio de náuseas. Uma xícara morna antes das refeições faz diferença real.</p>
        </div>
        <div class="symp-card glass-card">
          <span class="si">🔄</span>
          <h4>Prisão de ventre</h4>
          <p>Aumente frutas com casca, vegetais e água gradualmente. Muita proteína de uma vez piora. Magnésio pode ajudar nos casos persistentes.</p>
        </div>
        <div class="symp-card glass-card">
          <span class="si">🚫</span>
          <h4>O que piora tudo</h4>
          <p>Gordura excessiva, álcool, refeições volumosas e jejum prolongado são os principais gatilhos. Menos e mais frequente sempre ganha.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ═══════════════════ REFEIÇÕES ═══════════════════ -->
<section id="refeicoes">
  <div class="section-inner">
    <div class="meals-layout">
      <div class="meals-head">
        <div class="reveal-left">
          <div class="label">seu dia alimentar</div>
          <h2 class="s-title">Do café<br>até a ceia,<br><i>do zero.</i></h2>
          <div class="how-body" style="margin-top:16px">
            <p>Com o apetite reduzido, cada garfada precisa trabalhar por você. Opções reais, adaptáveis ao seu gosto e rotina.</p>
          </div>
        </div>
        <div class="meals-note reveal-right" style="margin-top:80px">
          <p class="meals-note-q">"A meta não é comer pouco. É comer <strong style="color:var(--em)">bem</strong>, mesmo com o apetite menor."</p>
          <div class="pill-row">
            <span class="pill">A cada 3–4h</span>
            <span class="pill">Proteína sempre</span>
            <span class="pill">Volumes menores</span>
            <span class="pill">Água constante</span>
          </div>
        </div>
      </div>

      <div class="meal-timeline reveal">

        <div class="meal-row">
          <div class="meal-time">7h–8h</div>
          <div class="meal-line-col"><div class="meal-dot"></div><div class="meal-connector"></div></div>
          <div class="meal-card glass-card">
            <span class="meal-emoji">☕</span>
            <div class="meal-title">Café da manhã</div>
            <ul class="meal-opts">
              <li>Iogurte grego natural + granola sem açúcar + fruta pequena</li>
              <li>Omelete de 2 ovos com cottage e tomate + pão integral</li>
              <li>Vitamina de proteína + banana + cacau + castanhas</li>
              <li>Tapioca com frango desfiado ou ricota + suco natural coado</li>
            </ul>
            <div class="meal-tip">💡 Comece pela proteína. Com o estômago ficando cheio rápido, ela precisa entrar primeiro.</div>
          </div>
        </div>

        <div class="meal-row">
          <div class="meal-time">10h–11h</div>
          <div class="meal-line-col"><div class="meal-dot"></div><div class="meal-connector"></div></div>
          <div class="meal-card glass-card">
            <span class="meal-emoji">🍎</span>
            <div class="meal-title">Lanche da manhã</div>
            <ul class="meal-opts">
              <li>1 fruta + punhado de amêndoas ou nozes</li>
              <li>Cottage com pepino em fatias e azeite</li>
              <li>Barra de proteína (pouco açúcar) + chá morno</li>
              <li>Iogurte grego simples com chia</li>
            </ul>
            <div class="meal-tip">💡 Se não estiver com fome, não force. Mas tente comer algo pequeno para não chegar no almoço descontrolado.</div>
          </div>
        </div>

        <div class="meal-row">
          <div class="meal-time">12h–13h</div>
          <div class="meal-line-col"><div class="meal-dot"></div><div class="meal-connector"></div></div>
          <div class="meal-card glass-card">
            <span class="meal-emoji">🥗</span>
            <div class="meal-title">Almoço</div>
            <ul class="meal-opts">
              <li>Frango grelhado + arroz integral + feijão + salada de folhas</li>
              <li>Tilápia assada + batata-doce + brócolis no vapor</li>
              <li>Ovo cozido + lentilha temperada + legumes + quinoa</li>
              <li>Sopa cremosa de frango com cenoura (ótima para dias de enjoo)</li>
            </ul>
            <div class="meal-tip">💡 Fórmula: ½ prato de vegetais · ¼ proteína · ¼ carboidrato. Simples e muito eficiente.</div>
          </div>
        </div>

        <div class="meal-row">
          <div class="meal-time">15h–16h</div>
          <div class="meal-line-col"><div class="meal-dot"></div><div class="meal-connector"></div></div>
          <div class="meal-card glass-card">
            <span class="meal-emoji">🥛</span>
            <div class="meal-title">Lanche da tarde</div>
            <ul class="meal-opts">
              <li>Shake proteico + frutas vermelhas + aveia</li>
              <li>Pão integral com pasta de amendoim + banana</li>
              <li>Ovo mexido leve + queijo + fruta</li>
              <li>Edamame com limão (proteico, rápido, saboroso)</li>
            </ul>
            <div class="meal-tip">💡 Momento ideal para o shake se você ainda não bateu a meta de proteína do dia.</div>
          </div>
        </div>

        <div class="meal-row">
          <div class="meal-time">19h–20h</div>
          <div class="meal-line-col"><div class="meal-dot"></div><div class="meal-connector"></div></div>
          <div class="meal-card glass-card">
            <span class="meal-emoji">🍽️</span>
            <div class="meal-title">Jantar</div>
            <ul class="meal-opts">
              <li>Salmão assado com azeite + couve-flor gratinada + salada</li>
              <li>Frango desfiado + abobrinha recheada + arroz integral</li>
              <li>Omelete de claras com espinafre + pão integral tostado</li>
              <li>Caldo de feijão com legumes + frango cozido desfiado</li>
            </ul>
            <div class="meal-tip">💡 Evite gordura excessiva à noite. O estômago já está mais lento e isso causa desconforto para dormir.</div>
          </div>
        </div>

        <div class="meal-row">
          <div class="meal-time">21h–22h</div>
          <div class="meal-line-col"><div class="meal-dot"></div></div>
          <div class="meal-card glass-card">
            <span class="meal-emoji">🌙</span>
            <div class="meal-title">Ceia — só se precisar</div>
            <ul class="meal-opts">
              <li>Iogurte grego com mel e noz</li>
              <li>Chá de camomila + biscoito integral</li>
              <li>Cottage com pepino ou cenoura baby</li>
            </ul>
            <div class="meal-tip">💡 Não force. Se precisar, seja leve. O objetivo é só não ir dormir com o estômago vazio demais.</div>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>

<!-- ═══════════════════ NUTRIENTES ═══════════════════ -->
<section id="nutri">
  <div class="section-inner">
    <div style="max-width:1000px;width:100%">
      <div class="reveal" style="text-align:center;margin-bottom:60px">
        <div class="label" style="justify-content:center">atenção nutricional</div>
        <h2 class="s-title" style="text-align:center">O que pode<br>estar <i>faltando</i></h2>
      </div>
      <div class="nut-layout reveal">
        <div class="nut-card glass-card">
          <div class="nut-icon n1">☀️</div>
          <div>
            <div class="nut-title">Vitamina D</div>
            <p class="nut-body">Com a alimentação reduzida, fontes de vitamina D caem drasticamente. A suplementação quase sempre é indicada — converse com seu nutricionista sobre a dose.</p>
          </div>
        </div>
        <div class="nut-card glass-card">
          <div class="nut-icon n2">🦴</div>
          <div>
            <div class="nut-title">Cálcio</div>
            <p class="nut-body">Perda de peso rápida pode comprometer a densidade óssea. Laticínios magros, tofu, gergelim e vegetais verde-escuros são aliados. Em alguns casos a suplementação entra.</p>
          </div>
        </div>
        <div class="nut-card glass-card">
          <div class="nut-icon n3">🔋</div>
          <div>
            <div class="nut-title">Vitamina B12</div>
            <p class="nut-body">Importante para energia e sistema nervoso. Com menos comida, ela pode faltar — especialmente em quem já tinha ingestão baixa. Ovos, carnes magras e laticínios ajudam.</p>
          </div>
        </div>
        <div class="nut-card glass-card">
          <div class="nut-icon n4">⚡</div>
          <div>
            <div class="nut-title">Proteína</div>
            <p class="nut-body">A mais crítica. Com menos apetite, é fácil não comer o suficiente — e o corpo usa músculo como energia. Isso precisa ser evitado ativamente.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ═══════════════════ MÚSCULO ═══════════════════ -->
<section id="musculos">
  <div class="section-inner">
    <div class="muscle-layout">
      <div class="reveal-left">
        <div class="label">preservação muscular</div>
        <h2 class="s-title">Perder peso<br>sem perder<br><i>músculo.</i></h2>
        <div class="how-body" style="margin:20px 0">
          <p>A perda de músculo não acontece por causa do remédio em si. Acontece quando a redução do apetite leva a pouca proteína — e o corpo recorre às reservas musculares.</p>
          <p>Mulheres na menopausa, pessoas mais velhas e quem não faz musculação têm risco maior. Mas dá para se proteger de forma bastante direta.</p>
        </div>
        <div class="protein-hero">
          <div class="protein-big">1,2–1,6</div>
          <div class="protein-unit">gramas de proteína por kg de peso / dia</div>
          <div class="protein-note">Exemplo: 70kg → 84g a 112g de proteína por dia.<br>Distribua em pelo menos 4 refeições.</div>
        </div>
      </div>
      <div class="muscle-tips reveal-right">
        <div class="mtip">
          <div class="mtip-n">01</div>
          <div>
            <div class="mtip-title">Comece a refeição pela proteína</div>
            <p class="mtip-body">Com o estômago ficando cheio rapidinho, se deixar a proteína pro final você vai acabar pulando. Frango, peixe, ovo, cottage — eles entram primeiro.</p>
          </div>
        </div>
        <div class="mtip">
          <div class="mtip-n">02</div>
          <div>
            <div class="mtip-title">Fontes compactas são suas aliadas</div>
            <p class="mtip-body">Peixe, ovos, iogurte grego, cottage e nozes têm muito nutriente em pouco volume. Perfeito para quando o apetite está baixo mas a meta precisa ser atingida.</p>
          </div>
        </div>
        <div class="mtip">
          <div class="mtip-n">03</div>
          <div>
            <div class="mtip-title">Shake proteico não é trapaça</div>
            <p class="mtip-body">Se não está conseguindo bater a meta pela comida, um shake é uma solução legítima. Misture com fruta e leite — vira uma refeição completa e fácil de consumir.</p>
          </div>
        </div>
        <div class="mtip">
          <div class="mtip-n">04</div>
          <div>
            <div class="mtip-title">Musculação + proteína = o combo real</div>
            <p class="mtip-body">Proteína sem estímulo de força não preserva músculo. A musculação diz pro corpo: "esse músculo é necessário." Mesmo 2x por semana já muda o jogo.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ═══════════════════ DO / DON'T ═══════════════════ -->
<section>
  <div class="section-inner">
    <div style="text-align:center;margin-bottom:60px;max-width:500px" class="reveal">
      <div class="label" style="justify-content:center">guia rápido</div>
      <h2 class="s-title">O que entra<br>no prato — e o<br>que <i>fica de fora.</i></h2>
    </div>
    <div class="compare-layout reveal">
      <div class="cmp glass-card">
        <div class="cmp-header">
          <div class="cmp-icon yes-icon">✓</div>
          <div class="cmp-title">Priorize</div>
        </div>
        <ul class="cmp-list yes">
          <li>Grãos integrais: aveia, quinoa, arroz integral, pão integral</li>
          <li>Frutas in natura: maçã, banana, uva, abacate, cítricas</li>
          <li>Vegetais: brócolis, cenoura, espinafre, abobrinha, tomate</li>
          <li>Proteínas magras: frango sem pele, peixes, ovos, leguminosas</li>
          <li>Laticínios light: iogurte grego, cottage, ricota</li>
          <li>Gorduras boas: azeite, abacate, amêndoas, chia</li>
          <li>Chás: gengibre, cidreira, hortelã-pimenta</li>
          <li>Refeições pequenas com horários regulares</li>
        </ul>
      </div>
      <div class="cmp glass-card">
        <div class="cmp-header">
          <div class="cmp-icon no-icon">✕</div>
          <div class="cmp-title">Evite</div>
        </div>
        <ul class="cmp-list no">
          <li>Carboidratos refinados: pão branco, farinha, açúcar adicionado</li>
          <li>Ultraprocessados: salgadinhos, congelados, fast food, doces</li>
          <li>Excesso de carne vermelha e embutidos</li>
          <li>Bebidas açucaradas: refri, sucos de caixinha, energéticos</li>
          <li>Bebidas alcoólicas (pioram náusea e refluxo)</li>
          <li>Fritos e gordura saturada em excesso</li>
          <li>Refeições muito volumosas de uma vez</li>
          <li>Ficar horas sem comer — piora tudo</li>
        </ul>
      </div>
    </div>
  </div>
</section>

<!-- ═══════════════════ LIFESTYLE ═══════════════════ -->
<section>
  <div class="section-inner">
    <div style="text-align:center;margin-bottom:60px" class="reveal">
      <div class="label" style="justify-content:center">além da comida</div>
      <h2 class="s-title">O tratamento<br><i>completo.</i></h2>
    </div>
    <div class="life-grid reveal">
      <div class="life-card glass-card">
        <span class="life-icon">🏋️</span>
        <div class="life-title">Força antes de cardio</div>
        <p class="life-body">Musculação 2–3x/semana é a melhor defesa contra perda muscular. Não precisa ser pesado — o movimento regular já ativa os mecanismos de preservação.</p>
      </div>
      <div class="life-card glass-card">
        <span class="life-icon">😴</span>
        <div class="life-title">Sono de qualidade</div>
        <p class="life-body">Sono ruim eleva o cortisol, que quebra músculo. 7–9h por noite ajudam o tratamento a funcionar muito melhor.</p>
      </div>
      <div class="life-card glass-card">
        <span class="life-icon">🧘</span>
        <div class="life-title">Atenção plena</div>
        <p class="life-body">Comer devagar, sem tela, prestando atenção em cada garfada melhora a digestão e reduz sintomas. O cérebro precisa de tempo para registrar a saciedade.</p>
      </div>
      <div class="life-card glass-card">
        <span class="life-icon">💬</span>
        <div class="life-title">Rede de apoio</div>
        <p class="life-body">Contar para família e amigos facilita muito a adesão. Mudança de hábito é mais fácil quando o ambiente social apoia — e não sabota.</p>
      </div>
      <div class="life-card glass-card">
        <span class="life-icon">🚭</span>
        <div class="life-title">Menos nocivos</div>
        <p class="life-body">Álcool, tabaco e outras substâncias interferem no remédio e pioram os efeitos colaterais. Cada um que sai, o tratamento melhora.</p>
      </div>
      <div class="life-card glass-card">
        <span class="life-icon">📓</span>
        <div class="life-title">Diário alimentar</div>
        <p class="life-body">Registrar o que come ajuda a identificar o que causa sintomas e o que faz bem. Não precisa ser perfeito — só consistente.</p>
      </div>
    </div>
  </div>
</section>

<!-- ═══════════════════ FOOTER ═══════════════════ -->
<footer>
  <div class="footer-logo">webdiet</div>
  <p class="footer-note">Este guia apoia pacientes em uso de análogos de GLP-1/GIP.<br>
  <em>Não substitui o acompanhamento do seu nutricionista ou médico.</em></p>
  <p style="margin-top:20px;font-size:.75rem;color:rgba(232,245,232,0.2)">Baseado em evidências científicas atualizadas · 2025</p>
</footer>

<script>
// ── PARTICLE CANVAS ──
const canvas=document.getElementById('bg-canvas');
const ctx=canvas.getContext('2d');
let W,H,particles=[];

function resize(){W=canvas.width=window.innerWidth;H=canvas.height=window.innerHeight}
resize();window.addEventListener('resize',resize);

function Particle(){
  this.x=Math.random()*W;
  this.y=Math.random()*H;
  this.r=Math.random()*1.5+0.3;
  this.dx=(Math.random()-.5)*0.3;
  this.dy=(Math.random()-.5)*0.3;
  this.alpha=Math.random()*0.4+0.05;
  this.color=Math.random()>.5?'0,255,136':'0,212,255';
}

for(let i=0;i<120;i++)particles.push(new Particle());

function drawParticles(){
  ctx.clearRect(0,0,W,H);
  particles.forEach(p=>{
    ctx.beginPath();
    ctx.arc(p.x,p.y,p.r,0,Math.PI*2);
    ctx.fillStyle=`rgba(${p.color},${p.alpha})`;
    ctx.fill();
    p.x+=p.dx;p.y+=p.dy;
    if(p.x<0||p.x>W)p.dx*=-1;
    if(p.y<0||p.y>H)p.dy*=-1;
  });

  // draw connections
  for(let i=0;i<particles.length;i++){
    for(let j=i+1;j<particles.length;j++){
      const a=particles[i],b=particles[j];
      const d=Math.hypot(a.x-b.x,a.y-b.y);
      if(d<120){
        ctx.beginPath();
        ctx.moveTo(a.x,a.y);ctx.lineTo(b.x,b.y);
        ctx.strokeStyle=`rgba(0,255,136,${0.06*(1-d/120)})`;
        ctx.lineWidth=0.5;ctx.stroke();
      }
    }
  }
  requestAnimationFrame(drawParticles);
}
drawParticles();

// ── SCROLL REVEAL ──
const obs=new IntersectionObserver(entries=>{
  entries.forEach(e=>{
    if(e.isIntersecting){e.target.classList.add('on')}
  });
},{threshold:0.1,rootMargin:'0px 0px -50px 0px'});

document.querySelectorAll('.reveal,.reveal-left,.reveal-right').forEach((el,i)=>{
  el.style.transitionDelay=`${(i%4)*0.08}s`;
  obs.observe(el);
});

// ── MOUSE PARALLAX ORBS ──
document.addEventListener('mousemove',e=>{
  const x=(e.clientX/window.innerWidth-.5)*20;
  const y=(e.clientY/window.innerHeight-.5)*20;
  document.querySelector('.orb1').style.transform=`translate(${x*.8}px,${y*.8}px)`;
  document.querySelector('.orb2').style.transform=`translate(${-x*.5}px,${-y*.5}px)`;
  document.querySelector('.orb3').style.transform=`translate(${x*.3}px,${y*.6}px)`;
});

// ── NAV HIGHLIGHT ──
const sections=document.querySelectorAll('section[id]');
const navLinks=document.querySelectorAll('nav a');
window.addEventListener('scroll',()=>{
  let cur='';
  sections.forEach(s=>{if(window.scrollY>=s.offsetTop-200)cur=s.id});
  navLinks.forEach(a=>{
    a.style.color=a.getAttribute('href')==='#'+cur?'var(--em)':'';
    a.style.background=a.getAttribute('href')==='#'+cur?'rgba(0,255,136,0.08)':'';
  });
});
</script>
</body>
</html>
