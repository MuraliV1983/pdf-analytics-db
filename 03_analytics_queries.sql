-- =========================
-- 1. Total Views Per PDF
-- =========================
SELECT 
    f.pdf_id,
    f.pdf_title,
    COUNT(v.pgvw_id) AS total_views
FROM 
	pdfa_pdf_files f
	LEFT JOIN pdfa_pdf_page_views v ON f.pdf_id = v.pgvw_pdf_id
GROUP BY f.pdf_id, f.pdf_title
ORDER BY total_views DESC;

-- =========================
-- 2. Views Per Day (Using Generated Column)
-- =========================
SELECT 
    pgvw_pdf_id,
    pgvw_viewed,
    COUNT(*) AS total_views
FROM 
	pdfa_pdf_page_views
GROUP BY pgvw_pdf_id, pgvw_viewed
ORDER BY pgvw_viewed DESC;

-- =========================
-- 3. Page-wise Analytics
-- =========================
SELECT 
    pgvw_pdf_id,
    pgvw_page_no,
    COUNT(*) AS total_views
FROM 
	pdfa_pdf_page_views
GROUP BY pgvw_pdf_id, pgvw_page_no
ORDER BY total_views DESC;

-- =========================
-- 4. Unique Sessions Per PDF
-- =========================
SELECT 
    pdfs_pdf_id,
    COUNT(*) AS total_sessions
FROM 
	pdfa_pdf_sessions
GROUP BY pdfs_pdf_id;

-- =========================
-- 5. Avg Pages Viewed Per Session
-- =========================
SELECT 
    pgvw_pdfs_id,
    COUNT(pgvw_page_no) AS pages_viewed
FROM 
	pdfa_pdf_page_views
GROUP BY pgvw_pdfs_id;

-- =========================
-- 6. Drop-off Analysis (Important Insight)
-- =========================
SELECT 
    pgvw_page_no,
    COUNT(*) AS views
FROM 
	pdfa_pdf_page_views
WHERE 
	pgvw_pdf_id = 1
GROUP BY pgvw_page_no
ORDER BY pgvw_page_no;

-- =========================
-- 7. Top Active Sessions
-- =========================
SELECT 
    pgvw_pdfs_id,
    COUNT(*) AS total_views
FROM 
	pdfa_pdf_page_views
GROUP BY pgvw_pdfs_id
ORDER BY total_views DESC
LIMIT 5;

-- =========================
-- 8. Real-Time Active Sessions (Last 5 mins)
-- =========================
SELECT 
    pdfs_session_id,
    MAX(pgvw_viewed_at) AS last_activity
FROM 
	pdfa_pdf_page_views v
	INNER JOIN pdfa_pdf_sessions s ON v.pgvw_pdfs_id = s.pdfs_id
GROUP BY pdfs_session_id
HAVING last_activity >= NOW() - INTERVAL 5 MINUTE;

-- =========================
-- 9. Aggregated (FAST Dashboard Query)
-- =========================
SELECT 
    pdst_pdf_id,
    pdst_pdf_page_no,
    pdst_viewed_date,
    pdst_total_views
FROM 
	pdfa_pdf_page_daily_stats
ORDER BY pdst_viewed_date DESC;

-- =========================
-- 10. Full Join (Clean Reporting)
-- =========================
SELECT 
    f.pdf_title,
    v.pgvw_page_no,
    COUNT(*) AS views
FROM 
	pdfa_pdf_page_views v
	INNER JOIN pdfa_pdf_files f ON f.pdf_id = v.pgvw_pdf_id
GROUP BY f.pdf_title, v.pgvw_page_no
ORDER BY views DESC;

