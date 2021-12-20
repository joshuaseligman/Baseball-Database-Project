CREATE TABLE xPlayer (
    Player_ID       Integer,
    Player_Name     Nvarchar2(30)   NOT NULL,
    Position        Nvarchar2(2)    CHECK (Position IN 
                                        ('P', 'C', '1B', '2B', '3B', 
                                        'SS', 'LF', 'CF', 'RF'))        NOT NULL,
    Bats            Char(1)         CHECK (Bats IN ('R', 'L', 'S'))     NOT NULL,
    Throws          Char(1)         CHECK (Throws IN ('R', 'L'))        NOT NULL,
    
    PRIMARY KEY (Player_ID)
);