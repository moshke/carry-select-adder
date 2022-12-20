library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity csa2 is
generic(n: integer:= 16);
		port(
		A: 	in   std_logic_vector(n-1 downto 0);
		B: 	in 	 std_logic_vector(n-1 downto 0);
		cin: in  std_logic;
		sum: out std_logic_vector(n downto 0)	
		);
end entity csa2;

architecture arc_csa of csa2 is
signal cout: 	std_logic_vector(5 downto 0);
begin

u1_1 : entity work.rca
generic map (n=>1)
port map(

A=> A(0 downto 0),
B=> B(0 downto 0),
cin=> cin,
out_sum=>sum(0 downto 0),
cout=> cout(0)
);

u1_2 : entity work.rca
generic map (n=>1)
port map(

A=> A(1 downto 1),
B=> B(1 downto 1),
cin=> cout(0),
out_sum=>sum(1 downto 1),
cout=> cout(1)
);

u2 : entity work.rca
generic map (n=>2)
port map(

A=> A(3 downto 2),
B=> B(3 downto 2),
cin=> cout(1),
out_sum=>sum(3 downto 2),
cout=> cout(2)
);

u3 : entity work.rca
generic map (n=>3)
port map(

A=> A(6 downto 4),
B=> B(6 downto 4),
cin=> cout(2),
out_sum=>sum(6 downto 4),
cout=> cout(3)
);

u4 : entity work.rca
generic map (n=>4)
port map(

A=> A(10 downto 7),
B=> B(10 downto 7),
cin=> cout(3),
out_sum=>sum(10 downto 7),
cout=> cout(4)
);

u5 : entity work.rca
generic map (n=>5)
port map(

A=> A(15 downto 11),
B=> B(15 downto 11),
cin=> cout(4),
out_sum=>sum(15 downto 11),
cout=> cout(5)
);
sum(n)<=cout(5);
end architecture arc_csa;

