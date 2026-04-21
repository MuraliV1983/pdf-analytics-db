CREATE TABLE pdfs (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    filename VARCHAR(255) NOT NULL,
    size_bytes BIGINT UNSIGNED DEFAULT 0,
    uploaded_by BIGINT UNSIGNED NULL,

    status ENUM('active','archived') DEFAULT 'active',
    deleted_at TIMESTAMP NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_status (status),
    INDEX idx_deleted (deleted_at)
) ENGINE=InnoDB;
