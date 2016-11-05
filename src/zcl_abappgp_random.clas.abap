class ZCL_ABAPPGP_RANDOM definition
  public
  create public .

public section.

  class-methods FROM_BITS
    importing
      !IV_BITS type I
    returning
      value(RO_RANDOM) type ref to ZCL_ABAPPGP_RANDOM .
  methods CONSTRUCTOR
    importing
      !IO_LOW type ref to ZCL_ABAPPGP_INTEGER
      !IO_HIGH type ref to ZCL_ABAPPGP_INTEGER .
  methods RANDOM
    returning
      value(RO_INTEGER) type ref to ZCL_ABAPPGP_INTEGER .
protected section.

  data MO_LOW type ref to ZCL_ABAPPGP_INTEGER .
  data MO_HIGH type ref to ZCL_ABAPPGP_INTEGER .

  methods RANDOM_DIGITS
    importing
      !IV_DIGITS type I
    returning
      value(RV_RANDOM) type STRING .
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ABAPPGP_RANDOM IMPLEMENTATION.


  METHOD constructor.

    mo_low = io_low.
    mo_high = io_high.

  ENDMETHOD.


  METHOD from_bits.

    DATA: lo_one      TYPE REF TO zcl_abappgp_integer,
          lo_low      TYPE REF TO zcl_abappgp_integer,
          lo_high     TYPE REF TO zcl_abappgp_integer,
          lo_exponent TYPE REF TO zcl_abappgp_integer.


    CREATE OBJECT lo_one
      EXPORTING
        iv_integer = 1.

    CREATE OBJECT lo_exponent
      EXPORTING
        iv_integer = iv_bits.

    CREATE OBJECT lo_high
      EXPORTING
        iv_integer = 2.
    lo_high->power( lo_exponent ).

    lo_exponent->subtract( lo_one ).
    CREATE OBJECT lo_low
      EXPORTING
        iv_integer = 2.
    lo_low->power( lo_exponent ).

    CREATE OBJECT ro_random
      EXPORTING
        io_low  = lo_low
        io_high = lo_high.

  ENDMETHOD.


  METHOD random.

    DATA: lv_str TYPE string.


    DO 100 TIMES.
      lv_str = random_digits( strlen( mo_high->to_string( ) ) ).

      SHIFT lv_str LEFT DELETING LEADING '0'.
      IF lv_str IS INITIAL.
        lv_str = '0'.
      ENDIF.

      ro_integer = zcl_abappgp_integer=>from_string( lv_str ).

      IF ro_integer->is_le( mo_high ) = abap_true
          AND ro_integer->is_ge( mo_low ) = abap_true.
* todo, or EQ?
        EXIT.
      ELSE.
        CLEAR ro_integer.
      ENDIF.
    ENDDO.

    ASSERT ro_integer IS BOUND.

  ENDMETHOD.


  METHOD random_digits.

* hmm, is CL_ABAP_RANDOM=>seed crypto secure?

    DATA: lv_str TYPE string,
          lv_tmp TYPE n LENGTH 10.


    WHILE strlen( lv_str ) <= iv_digits.
      lv_tmp = cl_abap_random=>seed( ).
* first digit cannot be larger than 2
      CONCATENATE lv_tmp+1 lv_str INTO lv_str.
    ENDWHILE.

    rv_random = lv_str(iv_digits).

  ENDMETHOD.
ENDCLASS.