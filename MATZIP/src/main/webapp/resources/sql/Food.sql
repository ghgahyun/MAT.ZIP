USE MATZIP;

DROP TABLE IF EXISTS food;

CREATE TABLE food(
    f_id VARCHAR(10) NOT NULL,      -- 음식 코드 
    f_name VARCHAR(50),             -- 음식 이름 
    f_price INTEGER,                -- 가격
    f_country VARCHAR(20),          -- 나라 
    f_type VARCHAR(20),             -- 음식종류
    f_shortDesc TEXT,               -- 짧은 설명 
    f_ingredients TEXT,             -- 재료 
    f_recipe TEXT,                  -- 조리방법 
    f_allergy VARCHAR(200),         -- 알레르기
    f_image VARCHAR(50),            -- 사진 
    
    PRIMARY KEY (f_id)
) DEFAULT CHARSET=utf8;

DESC food;