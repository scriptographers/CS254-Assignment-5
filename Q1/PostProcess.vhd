-- Component: Computes carry and sum for the post-processing step
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity PostProcess is
	port (
		G_iTo0, P_iTo0, p_i, c_i, c_0 : in std_logic;
		c_i_next, s_i                 : out std_logic
	);
end entity;

architecture struct of PostProcess is

	signal temp_1 : std_logic;

	component AndGate is
		port (
			a, b : in std_logic;
			z    : out std_logic
		);
	end component;

	component OrGate is
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

begin

	sum_i : XorGate
	port map(a => p_i, b => c_i, z => s_i);

	and_1 : AndGate
	port map(a => P_iTo0, b => c_0, z => temp_1);

	or_1 : OrGate
	port map(a => G_iTo0, b => temp_1, z => c_i_next);

end architecture;
