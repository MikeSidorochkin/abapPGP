REPORT zabappgp_test.
* https://primes.utm.edu/lists/small/small.html


START-OF-SELECTION.
  GET TIME.
  PERFORM run.


FORM test_prime USING iv_prime TYPE string.

  DATA: t1         TYPE i,
        t2         TYPE i,
        t          TYPE p DECIMALS 2,
        lv_bool    TYPE abap_bool,
        lo_binary  TYPE REF TO zcl_abappgp_binary_integer,
        lv_length  TYPE i,
        lo_integer TYPE REF TO zcl_abappgp_integer.


  lo_integer = zcl_abappgp_integer=>from_string( iv_prime ).

  CREATE OBJECT lo_binary
    EXPORTING
      io_integer = lo_integer.
  lv_length = strlen( iv_prime ).
  WRITE: / 'string length:', lv_length.
  lv_length = lo_binary->get_binary_length( ).
  WRITE: / 'bit length   :', lv_length.

  GET RUN TIME FIELD t1.
  lv_bool = zcl_abappgp_prime=>check(
    io_integer = lo_integer
    iv_show_progress = abap_true ).
  WRITE: / 'result', lv_bool.

  GET RUN TIME FIELD t2.
  t = t2 - t1.
  WRITE: / 'Integer Runtime: ', t, 'microseconds'.

  WRITE: /.

ENDFORM.

FORM run.

*  PERFORM test_prime USING '44449'.
*  PERFORM test_prime USING '5915587277'.
*  PERFORM test_prime USING '48112959837082048697'.
*  PERFORM test_prime USING '671998030559713968361666935769'.
  PERFORM test_prime USING '2425967623052370772757633156976982469681'.
*  PERFORM test_prime USING '22953686867719691230002707821868552601124472329079'.
*  PERFORM test_prime USING '622288097498926496141095869268883999563096063592498055290461'.
*  PERFORM test_prime USING '4669523849932130508876392554713407521319117239637943224980015676156491'.
*  PERFORM test_prime USING '18532395500947174450709383384936679868383424444311405679463280782405796233163977'.
*  PERFORM test_prime USING '282755483533707287054752184321121345766861480697448703443857012153264407439766013042402571'.
*  PERFORM test_prime USING '2074722246773485207821695222107608587480996474721117292752992589912196684750549658310084416732550077'.
*  PERFORM test_prime USING '58021664585639791181184025950440248398226136069516938232493687505822471836536824298822733710342250697739996825938232641940670857624514103125986134050997697160127301547995788468137887651823707102007839'.

ENDFORM.