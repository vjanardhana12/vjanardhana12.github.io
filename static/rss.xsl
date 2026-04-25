<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" encoding="UTF-8" indent="yes"
              doctype-system="about:legacy-compat" />

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title><xsl:value-of select="/rss/channel/title" /> &#8212; RSS Feed</title>
        <style>
          :root {
            --bg: #0d1b22;
            --card: #122430;
            --text: #e2e8f0;
            --muted: #94a3b8;
            --accent: #22d3ee;
            --border: #1f3a4a;
          }
          * { box-sizing: border-box; }
          body {
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background: var(--bg);
            color: var(--text);
            line-height: 1.6;
          }
          .wrap {
            max-width: 760px;
            margin: 0 auto;
            padding: 2rem 1.5rem 4rem;
          }
          .badge {
            display: inline-block;
            background: rgba(34, 211, 238, 0.15);
            color: var(--accent);
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            padding: 4px 10px;
            border-radius: 999px;
            margin-bottom: 1rem;
          }
          h1 {
            font-size: 1.8rem;
            margin: 0 0 0.5rem 0;
            color: #fff;
          }
          .desc {
            color: var(--muted);
            margin: 0 0 1.5rem 0;
          }
          .info {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 1rem 1.25rem;
            margin-bottom: 2rem;
            font-size: 0.9rem;
            color: var(--muted);
          }
          .info strong { color: var(--text); }
          .info a { color: var(--accent); text-decoration: none; }
          .info a:hover { text-decoration: underline; }
          h2 {
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: var(--muted);
            margin: 2rem 0 1rem 0;
          }
          .item {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 1.25rem 1.5rem;
            margin-bottom: 1rem;
            transition: border-color 0.2s;
          }
          .item:hover { border-color: var(--accent); }
          .item a {
            color: #fff;
            text-decoration: none;
            font-size: 1.15rem;
            font-weight: 600;
            display: block;
            margin-bottom: 0.35rem;
          }
          .item a:hover { color: var(--accent); }
          .item .meta {
            color: var(--muted);
            font-size: 0.85rem;
          }
          .item .summary {
            color: var(--text);
            font-size: 0.95rem;
            margin-top: 0.5rem;
            opacity: 0.85;
          }
          .footer {
            text-align: center;
            color: var(--muted);
            font-size: 0.85rem;
            margin-top: 2rem;
          }
          .footer a { color: var(--accent); text-decoration: none; }
        </style>
      </head>
      <body>
        <div class="wrap">
          <span class="badge">RSS Feed</span>
          <h1><xsl:value-of select="/rss/channel/title" /></h1>
          <p class="desc"><xsl:value-of select="/rss/channel/description" /></p>

          <div class="info">
            <strong>This is a web feed.</strong> Subscribe by pasting this page's URL into a feed reader
            (Feedly, Inoreader, NetNewsWire, etc.). Or just
            <a>
              <xsl:attribute name="href"><xsl:value-of select="/rss/channel/link" /></xsl:attribute>
              visit the site &#8594;
            </a>
          </div>

          <h2>Recent posts</h2>
          <xsl:for-each select="/rss/channel/item">
            <div class="item">
              <a target="_blank">
                <xsl:attribute name="href"><xsl:value-of select="link" /></xsl:attribute>
                <xsl:value-of select="title" />
              </a>
              <div class="meta"><xsl:value-of select="pubDate" /></div>
              <xsl:if test="description != ''">
                <div class="summary"><xsl:value-of select="description" /></div>
              </xsl:if>
            </div>
          </xsl:for-each>

          <div class="footer">
            <a>
              <xsl:attribute name="href"><xsl:value-of select="/rss/channel/link" /></xsl:attribute>
              &#8592; Back to <xsl:value-of select="/rss/channel/title" />
            </a>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
