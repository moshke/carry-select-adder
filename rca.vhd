library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity rca is
		generic(n: integer);
		port(
		a    : in std_logic_vector(n-1 downto 0);
		b    : in std_logic_vector(n-1 downto 0);
		cin  : in std_logic;
		out_sum  : out std_logic_vector(n-1 downto 0);
		cout 	 : out std_logic
		);
end entity rca;

architecture arc_rca of rca is
	signal t1, t0: std_logic_vector(n+1 downto 0);--18bit vector
	
begin

	t1 <= ('0' & a & '1') + ('0' & b & '1');--18bit+18bit=18bit--17-0
	t0 <= ('0' & a & '1') + ('0' & b & '0');--18bit+18bit=18bit--16-0
	process(cin,t0,t1)
	begin
	   if (cin = '1') then
		out_sum <=  t1 (n downto 1);--taking 16-1 from the vector 
		cout <= t1(n+1);--taking the last bit (18)
	   else
		out_sum <= t0 (n downto 1);--taking 16-1 from the vector
		cout <= t0(n+1);--taking the last bit (18)
	  end if;
	end process;
end architecture arc_rca;