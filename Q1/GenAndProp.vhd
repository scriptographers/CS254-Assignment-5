-- Component: Computes g and p for the pre-processing step
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity GenAndProp is
	port(
		a, b : in std_logic;
		g, p: out std_logic
	);
end entity;

architecture struct of GenAndProp is
	
	component AndGate is
		port(
			a, b : in std_logic;
			z: out std_logic
		);
	end component;
	
	component XorGate is
		port(
			a, b : in std_logic;
			z: out std_logic
		);
	end component;

begin

	gen: AndGate
		port map (a => a, b => b, z => g);
	
	prop: XorGate
		port map (a => a, b => b, z => p);

end architecture;