CLASS report_view DEFINITION.


  PUBLIC SECTION.
  DATA: salv_alv TYPE REF TO cl_salv_table.

  METHODS: initialization,
           selection_sc_output,
           selection_screen IMPORTING model TYPE REF TO report_model,
           end_of_selection IMPORTING model TYPE REF TO report_model,
           display_alv IMPORTING model TYPE REF TO report_model,
           set_toolbar,
           set_fieldcat,
           set_text IMPORTING name TYPE lvc_fname
             short TYPE scrtext_s
             long TYPE scrtext_l
             columns TYPE REF TO cl_salv_columns_table.

  ENDCLASS.

  CLASS report_view IMPLEMENTATION.

    METHOD initialization.

      filter = '@4G@FILTROS'.
      modify = '@17@CRIAÇÃO/MODIFICAÇÃO'.
      mod_btn = '@2L@SALVAR'.


       ENDMETHOD.

    METHOD selection_sc_output.

      ENDMETHOD.

    METHOD selection_screen.

      CASE sy-ucomm.

        WHEN 'MODIFY_REG'.


          model->init_modify_ped( ).

      ENDCASE.
      ENDMETHOD.

    METHOD end_of_selection.

      ME->display_alv( model ).

      ENDMETHOD.

      METHOD: display_alv.

      cl_salv_table=>factory(
      IMPORTING r_salv_table = salv_alv
        CHANGING t_table = model->t_cabecalho ).

      ME->set_toolbar( ).
      ME->set_fieldcat( ).

      salv_alv->display( ).


        ENDMETHOD.

      METHOD set_toolbar.

      DATA: functions TYPE REF TO cl_salv_functions_list.
      functions = salv_alv->get_functions( ).
      functions->set_all( ).

        ENDMETHOD.

      METHOD set_fieldcat.

      DATA: columns TYPE REF TO cl_salv_columns_table,
            column TYPE REF TO cl_salv_column.

        columns = salv_alv->get_columns( ).
        columns->set_optimize( abap_true ).

        column = columns->get_column( 'MANDT' ).
        column->set_visible( abap_false ).

        ME->set_text( EXPORTING name = 'NUMERO_PEDIDO' short = 'Order'  long = 'Order Number' columns = columns ).


        ENDMETHOD.


    METHOD set_text.

        DATA column TYPE REF TO cl_salv_column.

        column = columns->get_column( name ).
        column->set_short_text( short ).
        column->set_long_text( long ).

      ENDMETHOD.

    ENDCLASS.