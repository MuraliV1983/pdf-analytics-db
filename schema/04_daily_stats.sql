CREATE TABLE pdf_daily_stats (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pdf_id BIGINT UNSIGNED NOT NULL,
    view_date DATE NOT NULL,
    total_views INT DEFAULT 0,
    unique_sessions INT DEFAULT 0,
    UNIQUE KEY uk_pdf_date (pdf_id, view_date),
    CONSTRAINT fk_daily_pdf FOREIGN KEY (pdf_id) REFERENCES pdfs(id)
) ENGINE=InnoDB;
