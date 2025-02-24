CLASS report_model DEFINITION.

  PUBLIC SECTION.
  DATA: t_cabecalho TYPE TABLE OF ytsd_cab_pedido,
        s_cabecalho_pedido TYPE ytsd_cab_pedido.
  METHODS: start_of_selection,
           get_cab_pedido,
           init_modify_ped,
           modify_ped,
           validate_screen_modify.

  ENDCLASS.


  CLASS report_model IMPLEMENTATION.

    METHOD start_of_selection.

        ME->get_cab_pedido( ).

      ENDMETHOD.

      METHOD get_cab_pedido.

*        DO 5 TIMES.
*
*        s_cabecalho_pedido-numero_pedido = sy-index.
*        s_cabecalho_pedido-data_pedido = sy-datum.
*        s_cabecalho_pedido-cancelado = 'X'.
*        MODIFY ytsd_cab_pedido FROM s_cabecalho_pedido.
*
*        ENDDO.

        SELECT * FROM ytsd_cab_pedido
          INTO TABLE t_cabecalho
          WHERE NUMERO_PEDIDO IN fil_num
          AND DATA_PEDIDO IN fil_data.

        ENDMETHOD.

      METHOD init_modify_ped.

        ME->validate_screen_modify( ).
        ME->modify_ped( ).

      ENDMETHOD.

      METHOD modify_ped.


          DATA: pedido_cab TYPE ytsd_cab_pedido,
                msg TYPE string.


          pedido_cab-numero_pedido = mod_num.
          pedido_cab-data_pedido = mod_data.
          pedido_cab-cancelado = mod_canc.

          MODIFY ytsd_cab_pedido FROM pedido_cab.

          msg = mod_num.
          CONCATENATE 'PEDIDO' msg 'SALVO COM SUCESSO' INTO msg SEPARATED BY space.
          MESSAGE msg TYPE 'S'.

        ENDMETHOD.


      METHOD validate_screen_modify.


          IF mod_num IS INITIAL.
            MESSAGE 'NÚMERO OBRIGATÓRIO' TYPE 'E'.
          ENDIF.

          IF mod_data IS INITIAL.
            MESSAGE 'DATA OBRIGATÓRIA' TYPE 'E'.
          ENDIF.


      ENDMETHOD.


    ENDCLASS.