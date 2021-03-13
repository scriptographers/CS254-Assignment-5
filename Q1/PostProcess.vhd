-- Component: Computes carry and sum for the post-processing step
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity PostProcess is
	port (
		cin      : in std_logic;
		Gi0, Pi0 : in std_logic_vector (7 downto 0);
		p        : in std_logic_vector (7 downto 0);
		cout     : out std_logic;
		sum      : out std_logic_vector (7 downto 0)
	);
end entity;

architecture struct of PostProcess is

	signal c : std_logic_vector (8 downto 0);

	component XorGate is
		port (
			a, b : in std_logic;
			z    : out std_logic
		);
	end component;

	component CarryCell is
		port (
			c0, G, P : in std_logic;
			carry    : out std_logic
		);
	end component;

begin

	c(0) <= cin;
	-- Parallel Carry computation using for...generate statement
	carry_loop : for I in 1 to 8 generate
		carry_i : CarryCell
		port map(c0 => cin, G => Gi0(I - 1), P => Pi0(I - 1), carry => c(I));
	end generate carry_loop;

	-- Parallel Sum computation using for...generate statement
	sum_loop : for I in 0 to 7 generate
		xor_i : XorGate
		port map(a => p(I), b => c(I), z => sum(I));
	end generate sum_loop;

	cout <= c(8);

end architecture;
