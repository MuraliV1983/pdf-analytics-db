USE pdf_analytics;

-- =========================
-- PDF FILES
-- =========================
INSERT INTO pdfa_pdf_files 
(pdf_title, pdf_filename, pdf_size, pdf_upload_by)
VALUES
('Analytics Report', '20260415-Analytics.pdf', 5375306, 1),
('Test Document', 'sample.pdf', 43146, 1);


-- =========================
-- PDF SESSIONS
-- =========================
INSERT INTO pdfa_pdf_sessions
(pdfs_session_id, pdfs_pdf_id, pdfs_user_ip, pdfs_user_agent, pdfs_started_at)
VALUES
('sess_1001', 1, '192.168.1.10', 'Chrome', NOW()),
('sess_1002', 1, '192.168.1.11', 'Firefox', NOW()),
('sess_2001', 2, '192.168.1.12', 'Edge', NOW());

-- =========================
-- PDF PAGE VIEWS
-- =========================

-- Session 1 (PDF 1)
INSERT INTO pdfa_pdf_page_views
(pgvw_pdf_id, pgvw_pdfs_id, pgvw_page_no, pgvw_viewed_at)
VALUES
(1, 1, 1, NOW()),
(1, 1, 2, NOW()),
(1, 1, 3, NOW()),
(1, 1, 4, NOW()),
(1, 1, 5, NOW());

-- Session 2 (PDF 1)
INSERT INTO pdfa_pdf_page_views
(pgvw_pdf_id, pgvw_pdfs_id, pgvw_page_no, pgvw_viewed_at)
VALUES
(1, 2, 1, NOW()),
(1, 2, 2, NOW()),
(1, 2, 3, NOW());

-- Session 3 (PDF 2)
INSERT INTO pdfa_pdf_page_views
(pgvw_pdf_id, pgvw_pdfs_id, pgvw_page_no, pgvw_viewed_at)
VALUES
(2, 3, 1, NOW()),
(2, 3, 2, NOW());


-- =========================
-- DAILY PAGE STATS (AGGREGATED)
-- =========================

INSERT INTO pdfa_pdf_page_daily_stats
(pdst_pdf_id, pdst_pdf_page_no, pdst_viewed_date, pdst_total_views)
VALUES
(1, 1, NOW(), 2),
(1, 2, NOW(), 2),
(1, 3, NOW(), 2),
(1, 4, NOW(), 1),
(1, 5, NOW(), 1),
(2, 1, NOW(), 1),
(2, 2, NOW(), 1);

-- =========================
-- DB SCRIPT VERSIONS
-- =========================
INSERT INTO db_script_version(dbsv_id,dbsv_name,dbsv_date) VALUES (1,'PDF_ANALYTICS_DB_SCHEMA_V1.0',NOW());