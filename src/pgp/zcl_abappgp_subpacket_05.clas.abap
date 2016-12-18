CLASS zcl_abappgp_subpacket_05 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_abappgp_subpacket .

    ALIASES from_stream
      FOR zif_abappgp_subpacket~from_stream .
    ALIASES get_name
      FOR zif_abappgp_subpacket~get_name .
    ALIASES get_type
      FOR zif_abappgp_subpacket~get_type .
    ALIASES to_stream
      FOR zif_abappgp_subpacket~to_stream .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ABAPPGP_SUBPACKET_05 IMPLEMENTATION.


  METHOD zif_abappgp_subpacket~dump.

    rv_dump = |\tSub - { get_name( ) }(sub { get_type( ) })({ to_stream( )->get_length( ) } bytes)\n\t\ttodo\n|.

  ENDMETHOD.


  METHOD zif_abappgp_subpacket~from_stream.

* todo

    CREATE OBJECT ri_packet
      TYPE zcl_abappgp_subpacket_05.

  ENDMETHOD.


  METHOD zif_abappgp_subpacket~get_name.

    rv_name = 'Trust Signature'.

  ENDMETHOD.


  METHOD zif_abappgp_subpacket~get_type.

    rv_type = zif_abappgp_constants=>c_sub_type-trust_signature.

  ENDMETHOD.


  METHOD zif_abappgp_subpacket~to_stream.

    CREATE OBJECT ro_stream.
* todo

  ENDMETHOD.
ENDCLASS.