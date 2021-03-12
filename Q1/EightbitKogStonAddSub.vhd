-- Top Module: EightbitKogStonAddSub
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity EightbitKogStonAddSub is
	port(
		a, b : in std_logic_vector (7 downto 0); -- the two numbers to be added/subtracted
		cin: in std_logic; -- cin == 0 implies a+b, cin == 0 implies a-b
		sum: out std_logic_vector (7 downto 0);
		cout: out std_logic -- final carry
	);
end entity;

architecture struct of EightbitKogStonAddSub is
   
   signal g, p: std_logic_vector (7 downto 0);
	
	component GenAndProp is
		port(
			a, b : in std_logic;
			g, p: out std_logic
		);
	end component;

begin

	-- Parallel Preprocessing using for...generate statement (Reference: https://www.ics.uci.edu/~jmoorkan/vhdlref/generate.html)
	preprocess: for I in 0 to 7 generate
      gen_and_prop : GenAndProp 
			port map (a => a(I), b => b(I), g => g(i), p => p(i));
   end generate preprocess;

end architecture;