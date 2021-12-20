CREATE TABLE xDivision (
    League          Char(2)         CHECK (League IN ('AL', 'NL')),
    Region          Nvarchar2(7)    CHECK (Region IN ('East', 'Central', 'West')),
    Year_Founded    Integer         CHECK (Year_Founded > 0)    NOT NULL,
    
    PRIMARY KEY (League, Region)
);