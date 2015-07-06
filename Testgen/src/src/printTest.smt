(benchmark res
  :logic AUFLIA
:extrafuns ((s2 Int)(s1 Int)(s0 Int))
  :assumption (> (+ s0 s1) s2)
  :assumption (not (< s2 0))
  :assumption (not (< s1 0))
  :assumption (not (< s0 0))
)
