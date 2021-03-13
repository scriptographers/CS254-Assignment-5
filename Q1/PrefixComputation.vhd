-- Component: Computes G[i:0] and P[i:0]
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity PrefixComputation is
	port (
		g, p         : in std_logic_vector (7 downto 0);
		G_out, P_out : out std_logic_vector (7 downto 0)
	);
end entity;

architecture struct of PrefixComputation is

	signal G1, P1 : std_logic_vector (7 downto 0);
	signal G2, P2 : std_logic_vector (7 downto 0);

	component GPCell is
		port (
			Gij, Pij     : in std_logic;
			Gj_1k, Pj_1k : in std_logic; -- Gj_1k denotes G[j-1:k]
			Gik, Pik     : out std_logic
		);
	end component;

begin

	-- First level using for...generate statement (Reference: https://www.ics.uci.edu/~jmoorkan/vhdlref/generate.html)
	G1(0) <= g(0);
	P1(0) <= p(0);
	prefixcomp_loop1 : for I in 1 to 7 generate
		gen_and_prop : GPCell
		port map(
			Gij => g(I), Pij => p(I),
			Gj_1k => g(I - 1), Pj_1k => p(I - 1),
			Gik => G1(I), Pik => P1(I)
		);
	end generate prefixcomp_loop1;

	-- Second level using for...generate statement (Reference: https://www.ics.uci.edu/~jmoorkan/vhdlref/generate.html)
	G2(0) <= G1(0);
	P2(0) <= P1(0);
	G2(1) <= G1(1);
	P2(1) <= P1(1);
	prefixcomp_loop2 : for I in 2 to 7 generate
		gen_and_prop : GPCell
		port map(
			Gij => G1(I), Pij => P1(I),
			Gj_1k => G1(I - 2), Pj_1k => P1(I - 2),
			Gik => G2(I), Pik => P2(I)
		);
	end generate prefixcomp_loop2;

	-- Third level using for...generate statement (Reference: https://www.ics.uci.edu/~jmoorkan/vhdlref/generate.html)
	G_out(0) <= G2(0);
	P_out(0) <= P2(0);
	G_out(1) <= G2(1);
	P_out(1) <= P2(1);
	G_out(2) <= G2(2);
	P_out(2) <= P2(2);
	G_out(3) <= G2(3);
	P_out(3) <= P2(3);
	prefixcomp_loop3 : for I in 4 to 7 generate
		gen_and_prop : GPCell
		port map(
			Gij => G2(I), Pij => P2(I),
			Gj_1k => G2(I - 4), Pj_1k => P2(I - 4),
			Gik => G_out(I), Pik => P_out(I)
		);
	end generate prefixcomp_loop3;

end architecture;
