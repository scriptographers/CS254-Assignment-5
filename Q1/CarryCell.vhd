-- Component: Computes carry for the post-processing step
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity CarryCell is
  port (
    c0, G, P : in std_logic;
    carry    : out std_logic
  );
end entity;

architecture struct of CarryCell is

  signal pcarry : std_logic;

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

  prop_carry : AndGate
  port map(a => P, b => c0, z => pcarry);

  gen_carry : OrGate
  port map(a => G, b => pcarry, z => carry);

end architecture;
