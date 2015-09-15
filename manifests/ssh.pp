class pi_puppet::ssh {

  # Set up keys for remote access without passwords.
  ssh_authorized_key { 'instructor_key':
    ensure => present,
    user   => 'pi',
    key    => 'AAAAB3NzaC1kc3MAAACBAOULViMGqVjTdLDH3odEiolnn76Jkm9c3fZXbPK1Ai6Gnvo+aCEfWss91weyn+6fM8BsdCSZrkcbSAADF9qYedMMG4mp7R5Ss2JrkaiKMeJLt8GezRvaBWTV3fsqJcVe2u9uh9DE+e51f+OavtdDy0a/+82CttKOndZsNoyTZXHfAAAAFQDl5awPvHA8s5RMjGEj0l+cCgzCCQAAAIEAwFyJRGmohHtd+4/7CQfmxFGxGEMcdLCOsPNQeLXmGy0Od+MQSkJ54tzxGbuQGqozN3xh/enPl2V82706PW7izEdPkdfcCiDanVhdZrrvkVW7WCn7w8WyWEbWni/hk9htHahybEKjAkUFjflcXRcAnYVUO5+ykR9ePGyyZrV+/QkAAACBAKlkkbtDat/BK/yyeieKGDIm24/GE5gEszwyHyuJBI2nNYBEm63KGa2rlrixaEfpp2BM2HCWzD7iruiSxwg0Ur9E7vsb0gzubkYIcqBY9AFZlpR3Df7DZXlS/k67Sln0ruZoVw67a9eCt13u3y6iJXgNB5k+UcGRULMU67Tzfr1z',
    name   => 'cmuphyscomp_instructor',
    type   => 'ssh-dss',
  }

}
