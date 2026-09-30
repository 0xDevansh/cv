#let ink = rgb("#1c1c1c")
#let accent = rgb("#1c3148")
#let muted = rgb("#5c6570")
#let head = "Liberation Sans"

#set page(
  paper: "a4",
  margin: (x: 1.1cm, y: 0.55cm),
)

#set text(font: "Noto Sans", size: 9.5pt, fill: ink, hyphenate: false)
#set par(leading: 0.45em, spacing: 0.45em, justify: false)
#set list(
  marker: text(fill: accent)[•],
  indent: 0.45em,
  body-indent: 0.32em,
  spacing: 0.35em,
)

#let section(title) = {
  v(0.38em)
  block(
    width: 100%,
    fill: rgb("#e4e8ed"),
    inset: (y: 2.4pt),
    align(center, text(
      font: head,
      weight: "bold",
      size: 9.5pt,
      fill: accent,
      tracking: 0.7pt,
      title,
    )),
  )
  v(0.16em)
}

#let ongoing = "---"

// Dates stay on the right, in black. Extra space below the heading
// so the first bullet does not sit on the title.
#let entry(title, meta: none, dates: none) = {
  block(above: 0.48em, below: 0.36em)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 1em,
      align: (left + top, right + top),
      {
        text(font: head, weight: "bold", fill: accent, title)
        if meta != none {
          h(0.35em)
          text(fill: muted)[#sym.dot.c #meta]
        }
      },
      if dates != none {
        text(fill: black, dates)
      },
    )
  ]
}

#let por(role, body) = {
  block(above: 0.45em, below: 0.06em)[
    #text(font: head, weight: "bold", fill: accent, role)
    #h(0.45em)
    #body
  ]
}

#let fa-brand(glyph) = text(
  font: "Font Awesome 7 Brands",
  size: 6.5pt,
  baseline: 0.05em,
  glyph,
)
#let fa-solid(glyph) = text(
  font: "Font Awesome 7 Free",
  weight: 900,
  size: 6.5pt,
  baseline: 0.05em,
  glyph,
)
#let contact(icon, label, dest) = {
  link(dest)[#icon #h(0.28em) #label]
}

#grid(
  columns: (1.15cm, 1fr, auto),
  align: horizon,
  column-gutter: 0.6em,
  image("assets/iitd-logo.png", height: 1.12cm),
  align(center)[
    #text(font: head, size: 16pt, weight: "bold", fill: accent, tracking: 0.3pt)[
      DEVANSH KANDPAL
    ]
  ],
  align(right)[
    #set text(size: 7pt, fill: ink)
    #set par(leading: 0.15em, spacing: 0.28em)
    #contact(fa-brand("\u{f09b}"), [0xDevansh], "https://github.com/0xDevansh") \
    #contact(fa-brand("\u{f08c}"), [devanshkd], "https://linkedin.com/in/devanshkd") \
    #contact(fa-solid("\u{f0e0}"), [devanshkandpal54], "mailto:devanshkandpal54@gmail.com") \
    #contact(fa-solid("\u{f095}"), [+91 92443 52208], "tel:+919244352208")
  ],
)

#line(length: 100%, stroke: 0.7pt + black)
#v(-0.15em)

#section[ACADEMIC DETAILS]

#table(
  columns: (1.15cm, 1.45fr, 1.15fr, auto),
  align: (left + horizon, left + horizon, left + horizon, right + horizon),
  stroke: none,
  inset: (x: 0pt, y: 1pt),
  column-gutter: 0.65em,
  table.header(
    text(weight: "bold")[Year],
    text(weight: "bold")[Degree / Board],
    text(weight: "bold")[Institute],
    text(weight: "bold")[GPA / Marks(%)],
  ),
  [#ongoing],
  [B.Tech in Production & Industrial Engineering],
  [Indian Institute of Technology Delhi],
  [9.03],
  [2024], [CBSE], [GVN the Global School], [97%],
  [2022], [CBSE], [Delhi Public School Bhopal], [96%],
)

#section[SCHOLASTIC ACHIEVEMENTS]

- *Department Rank 4:* Based on CGPA at the end of Sem 4, among 80+ students in Production and Industrial Engg.
- *Semester Merit:* Received the Semester Merit Award (Top 7%) for the third semester based on semester GPA.
- *Summer Undergraduate Research Award:* Research proposal selected from 40+ applicants in the CSE department.
- *IMC Prosperity 2026:* Ranked *\#146 in India* and *\#68 global (manual)* in a trading competition with 18,000 teams.

#section[INTERNSHIPS]

#entry(
  [Cloudflare],
  meta: [Software Engineer Intern, Bengaluru],
  dates: [(May -- July, 2026)],
)
- Worked on Statusflare, a *status monitoring service and public status page on the Workers platform* with automatic health checks, New Relic/DataDog integrations, and *email notifications* for incidents and maintenance.
- Built Continual Learning to review AI Gateway logs: clustered conversations by intent with embeddings, wrote a rubric per cluster, and ran automatic evaluations on real conversations, revealing which requests the product missed.
- Implemented *GEPA* to study those failures, revise prompts, and keep the best-scoring versions, and built the dashboard plus a reproducible test bench that saves every prompt version side by side for comparison afterwards.

#section[PROJECTS]

#entry(
  link("https://lapis.dvenom.in")[Lapis],
  meta: [Self Project · TypeScript, Cloudflare Workers, React],
  dates: [(Jun, 2026 -- Ongoing)],
)
- Built *Lapis*, a private web vault for Obsidian notes, with browser editing, wikilinks and backlinks synced both ways by an Obsidian plugin.
- Kept each vault consistent with a *Durable Object* that applies text patches and writes conflict notes, with offline replay, sealed Git history, and MCP access only for opted-in vaults.

#entry(
  [BitTorrent CLI Client],
  meta: [Self Project · Rust, TCP, Concurrency],
  dates: [(May -- June, 2026)],
)
- Built a BitTorrent *file-sharing client in Rust with a custom bencode parser for .torrent files and SHA-1 verified piece reassembly.*
- Implemented rarest-first piece selection, tracking availability with *bitfields*; implemented a choke algorithm to prioritize altruistic peers.
- Refactored the sequential actors to *async Tokio tasks with a sliding window of in-flight requests (8 peers #sym.times 12 requests)* to overlap network latency across peers, improving throughput from *12.08 MiB/s to 622 MiB/s (51.5#sym.times)*.

#entry(
  [Jamming Attacks on RAG Systems],
  meta: [SURA, Prof Vireshwar Kumar · RAG, Black-box optimization],
  dates: [(Apr, 2026 -- Ongoing)],
)
- Extended the single-query jamming attack on Retrieval-Augmented Generation (RAG) systems to wider class attacks.
- Characterised a *geometric bound on single-document attacks*, proving the bound is structural to the query embedding geometry.
- Quantified multi-document attack complexity via a clean set-cover formulation, showing that the number of required blocker documents scales linearly with the within-class query diversity and matches PCA-predicted dimensionality.

#entry(
  [TouristGPT: Algorithmic reasoning in small models],
  meta: [ARIES Freshers Project · PyTorch, TRL],
  dates: [(Feb, 2026 -- Ongoing)],
)
- Led an effort to *SFT and GRPO* fine tune a small language model (8B) for algorithmic reasoning in C++ at par with frontier models.
- Worked on a pipeline for generating CoT traces that explore more diverse solutions, published on Huggingface.

#entry(
  [FinTerminal: Multi-Agent Portfolio Manager],
  meta: [Inter IIT Tech · LangGraph, Next.JS, FastAPI, Docker],
  dates: [(Oct -- Dec, 2025)],
)
- Contributed to a reactive *portfolio management engine*, integrating insights from technical, fundamental, and live news *AI agents*.
- Built the Fundamental Analysis *multi-agent flow in LangGraph* evaluating financial health from SEC filings, including Forensic, Credit, and Equity analysts, achieving *62% directional accuracy* against subsequent-quarter.
- Worked on Omnus, an agent with portfolio and market context + tools, adding a natural interaction layer.

#entry(
  [ChatIITD + Degree Planner],
  meta: [ARIES, Devclub · Agentic AI, AWS Bedrock, Google OR-Tools],
  dates: [(Jun, 2025 -- Mar, 2026)],
)
- Created an *agentic chatbot* for academic queries, leveraging data sources on courses, departments and boards.
- Contributed to a *CP-SAT based degree planner* to create course plans, enforcing prerequisites and slot constraints.

#section[TECHNICAL SKILLS]

- *Programming and Systems:* C++, Python, Typescript, Javascript, Rust, SQL, Shell, Linux (arch btw), git, Docker, Nginx
- *Full stack + AI development:* Node.js, fastapi, NestJS, React, TanStack, Flue, LangChain, MCP, API Design, Cloudflare
- *Data analysis and machine learning -- Python:* pytorch, scikit-learn, xgboost, pandas, numpy, matplotlib, optuna

#section[EXTRA CURRICULAR ACTIVITIES]

- *Winner, BlackRock HackKnight 2026:* Built an explainable asset trader, placed first among 40 teams, won Rs.90,000.
- *Winner, CyberPeace x Cloudflare Buildathon:* Built a multilingual voice-assisted PDF form filling application.
- *Inter-IIT Tech Meet 14.0:* Worked on the *Pathway: Agentic AI* problem statement | Awarded Best High Prep Team
- *Second Runner Up, Claw & Shield, Cognizance IITR:* Added safe personal information handling to OpenClaw.

#section[POSITIONS OF RESPONSIBILITY]

#por(
  [Coordinator, ARIES],
  [Organised Tryst events, Shipathon, led freshers' projects, awarded Backbone of ARIES.],
)
#por(
  [Coordinator, DevClub],
  [Contributed to Projects Portal, ChatIITD & IITD Wiki, contingent member to Cognizance IITR.],
)
