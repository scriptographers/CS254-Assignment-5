-- Component: Computes g(i) and p(i) for the pre-processing step
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity PreProcess is
	port (
		a, b : in std_logic_vector (7 downto 0);
		g, p : out std_logic_vector (7 downto 0)
	);
end entity;

architecture struct of PreProcess is

	component AndGate is
		port (
			a, b : in std_logic;
			z    : out std_logic
		);
	end component;

	component XorGate is
		port (
			a, b : in std_logic;
			z    : out std_logic
		);
	end component;

	component GenAndProp is
		port (
			a, b : in std_logic;
			g, p : out std_logic
		);
	end component;

begin

	-- Parallel Preprocessing using for...generate statement (Reference: https://www.ics.uci.edu/~jmoorkan/vhdlref/generate.html)
	preprocess_loop : for I in 0 to 7 generate
		gen_and_prop : GenAndProp
		port map(a => a(I), b => b(I), g => g(i), p => p(i));
	end generate preprocess_loop;

end architecture;
