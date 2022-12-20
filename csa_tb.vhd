library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------

entity csa_tb is
generic (n: integer:=16);--
end entity csa_tb;

architecture csa_tb of csa_tb is
component csa2 is
generic (n: integer);
port (

		A: 	in 	std_logic_vector(n-1 downto 0);
		B: 	in 	std_logic_vector(n-1 downto 0);
		cin:	in 	std_logic;
		sum: 	out 	std_logic_vector(n downto 0)
		
		);
end component csa2;

signal      aa:    std_logic_vector(n-1 downto 0):= "0000000000010010";
signal		bb:    std_logic_vector(n-1 downto 0):= "0000000000010010";
signal		cinn:  std_logic:='0';
signal		summ:  std_logic_vector(n downto 0);


begin
	u1: csa2
	generic map(n=>n)
	port map(
			A=>aa,
			B=>bb,
			cin=>cinn,
	     		sum=>summ
			
	);
	
	aa<=(aa+5) after 10 ns;
	bb<=(bb+7) after 7 ns;
	
	
end architecture csa_tb;