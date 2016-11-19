class ZCL_ABAPPGP_SUBPACKET_22 definition
  public
  create public .

public section.

  interfaces ZIF_ABAPPGP_SUBPACKET .

  aliases FROM_STREAM
    for ZIF_ABAPPGP_SUBPACKET~FROM_STREAM .
  aliases GET_NAME
    for ZIF_ABAPPGP_SUBPACKET~GET_NAME .
  aliases GET_TYPE
    for ZIF_ABAPPGP_SUBPACKET~GET_TYPE .
  aliases TO_STREAM
    for ZIF_ABAPPGP_SUBPACKET~TO_STREAM .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ABAPPGP_SUBPACKET_22 IMPLEMENTATION.


  METHOD zif_abappgp_subpacket~dump.

    rv_dump = |\tSub - { get_name( ) }(sub { get_type( ) })\n\t\ttodo\n|.

  ENDMETHOD.


  METHOD zif_abappgp_subpacket~from_stream.

* todo

    CREATE OBJECT ri_packet
      TYPE zcl_abappgp_subpacket_22.

  ENDMETHOD.


  METHOD zif_abappgp_subpacket~get_name.

    rv_name = 'Preferred Compression Algorithms'.

  ENDMETHOD.


  METHOD zif_abappgp_subpacket~get_type.

    rv_type = zif_abappgp_constants=>c_sub_type-preferred_compression.

  ENDMETHOD.
ENDCLASS.