CREATE TABLE pdf_sessions (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    session_id VARCHAR(64) NOT NULL,
    pdf_id BIGINT UNSIGNED NOT NULL,
    user_ip VARCHAR(45),
    user_agent TEXT,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_session (session_id),
    INDEX idx_pdf (pdf_id),
    CONSTRAINT fk_session_pdf FOREIGN KEY (pdf_id) REFERENCES pdfs(id)
) ENGINE=InnoDB;
