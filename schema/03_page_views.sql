CREATE TABLE pdf_page_views (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pdf_id BIGINT UNSIGNED NOT NULL,
    session_id VARCHAR(64) NOT NULL,
    page_number INT NOT NULL,
    viewed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_pdf_date (pdf_id, viewed_at),
    INDEX idx_pdf_page (pdf_id, page_number),
    INDEX idx_session (session_id),
    CONSTRAINT fk_views_pdf FOREIGN KEY (pdf_id) REFERENCES pdfs(id)
) ENGINE=InnoDB;
