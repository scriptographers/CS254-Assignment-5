-- Top Module: EightbitKogStonAddSub
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity EightbitKogStonAddSub is
	port (
		a, b : in std_logic_vector (7 downto 0); -- the two numbers to be added/subtracted
		cin  : in std_logic;                     -- cin == 0 implies a+b, cin == 0 implies a-b
		sum  : out std_logic_vector (7 downto 0);
		cout : out std_logic -- final carry
	);
end entity;

architecture struct of EightbitKogStonAddSub is

	signal g, p, Gi0, Pi0 : std_logic_vector (7 downto 0);

	signal G21, P21 : std_logic;
	signal G32, P32 : std_logic;
	signal G43, P43 : std_logic;
	signal G54, P54 : std_logic;
	signal G65, P65 : std_logic;
	signal G76, P76 : std_logic;

	signal G41, P41 : std_logic;
	signal G52, P52 : std_logic;
	signal G63, P63 : std_logic;
	signal G74, P74 : std_logic;

	component GPCell is
		port (
			Gij, Pij     : in std_logic;
			Gj_1k, Pj_1k : in std_logic; -- Gj_1k denotes G[j-1:k]
			Gik, Pik     : out std_logic
		);
	end component;
	
	component PreProcess is
		port (
			a, b : in std_logic_vector (7 downto 0);
			g, p : out std_logic_vector (7 downto 0)
		);
	end component;
	
	component PostProcess is
		port (
			Gi0, p : in std_logic_vector (7 downto 0);
			cout   : out std_logic;
			sum    : out std_logic_vector (7 downto 0)
		);
	end component;

begin

	-- Parallel Preprocessing using for...generate statement (Reference: https://www.ics.uci.edu/~jmoorkan/vhdlref/generate.html)
	preprocess_block : PreProcess
		port map(a => a, b => b, g => g, p => p);

	-- We already have GP00 G00 == g(0) and P00 == p(0)
	Gi0(0) <= g(0);
	Pi0(0) <= p(0);

	-- GP10
	cell_1 : GPCell
	port map(
		Gij => g(1), Pij => p(1),
		Gj_1k => g(0), Pj_1k => p(0),
		Gik => Gi0(1), Pik => Pi0(1)
	);
	-- GP21
	cell_2 : GPCell
	port map(
		Gij => g(2), Pij => p(2),
		Gj_1k => g(1), Pj_1k => p(1),
		Gik => G21, Pik => P21
	);

	-- GP20
	cell_3 : GPCell
	port map(
		Gij => G21, Pij => P21,
		Gj_1k => g(0), Pj_1k => p(0),
		Gik => Gi0(2), Pik => Pi0(2)
	);
	-- GP32
	cell_4 : GPCell
	port map(
		Gij => g(3), Pij => p(3),
		Gj_1k => g(2), Pj_1k => p(2),
		Gik => G32, Pik => P32
	);

	-- GP30
	cell_5 : GPCell
	port map(
		Gij => G32, Pij => P32,
		Gj_1k => Gi0(1), Pj_1k => Pi0(1),
		Gik => Gi0(3), Pik => Pi0(3)
	);
	-- GP43
	cell_6 : GPCell
	port map(
		Gij => g(4), Pij => p(4),
		Gj_1k => g(3), Pj_1k => p(3),
		Gik => G43, Pik => P43
	);

	-- GP41
	cell_7 : GPCell
	port map(
		Gij => G43, Pij => P43,
		Gj_1k => G21, Pj_1k => P21,
		Gik => G41, Pik => P41
	);

	-- GP40
	cell_8 : GPCell
	port map(
		Gij => G41, Pij => P41,
		Gj_1k => g(0), Pj_1k => p(0),
		Gik => Gi0(4), Pik => Pi0(4)
	);
	-- GP54
	cell_9 : GPCell
	port map(
		Gij => g(5), Pij => p(4),
		Gj_1k => g(4), Pj_1k => p(4),
		Gik => G54, Pik => P54
	);

	-- GP52
	cell_10 : GPCell
	port map(
		Gij => G54, Pij => P54,
		Gj_1k => G32, Pj_1k => P32,
		Gik => G52, Pik => P52
	);

	-- GP50
	cell_11 : GPCell
	port map(
		Gij => G52, Pij => P52,
		Gj_1k => Gi0(1), Pj_1k => Pi0(1),
		Gik => Gi0(5), Pik => Pi0(5)
	);
	-- GP65
	cell_12 : GPCell
	port map(
		Gij => g(6), Pij => p(6),
		Gj_1k => g(5), Pj_1k => p(5),
		Gik => G65, Pik => P65
	);

	-- GP63
	cell_13 : GPCell
	port map(
		Gij => G65, Pij => P65,
		Gj_1k => G43, Pj_1k => P43,
		Gik => G63, Pik => P63
	);

	-- GP60
	cell_14 : GPCell
	port map(
		Gij => G63, Pij => P63,
		Gj_1k => Gi0(2), Pj_1k => Pi0(2),
		Gik => Gi0(6), Pik => Pi0(6)
	);
	-- GP76
	cell_15 : GPCell
	port map(
		Gij => g(7), Pij => p(7),
		Gj_1k => g(6), Pj_1k => p(6),
		Gik => G76, Pik => P76
	);

	-- GP74
	cell_16 : GPCell
	port map(
		Gij => G76, Pij => P76,
		Gj_1k => G54, Pj_1k => P54,
		Gik => G74, Pik => P74
	);

	-- GP70
	cell_17 : GPCell
	port map(
		Gij => G74, Pij => P74,
		Gj_1k => Gi0(3), Pj_1k => Pi0(3),
		Gik => Gi0(7), Pik => Pi0(7)
	);

	-- Post processing
	postprocess_block: PostProcess
		port map(Gi0 => Gi0, p => p, cout => cout, sum => sum);
	
end architecture;
