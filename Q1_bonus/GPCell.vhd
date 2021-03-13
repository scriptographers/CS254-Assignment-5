-- Component: GP Cell as described in the slides
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity GPCell is
	port (
		Gij, Pij     : in std_logic;
		Gj_1k, Pj_1k : in std_logic; -- Gj_1k denotes G[j-1:k]
		Gik, Pik     : out std_logic
	);
end entity;

architecture struct of GPCell is

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

begin

	and_1 : AndGate
	port map(a => Pij, b => Gj_1k, z => temp_1);

	or_1 : OrGate
	port map(a => Gij, b => temp_1, z => Gik);

	and_2 : AndGate
	port map(a => Pij, b => Pj_1k, z => Pik);

end architecture;
