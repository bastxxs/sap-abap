CLASS report_controller DEFINITION.


  PUBLIC SECTION.
  DATA: view TYPE REF TO report_view.
  DATA: model TYPE REF TO report_model.
  METHODS: constructor,
           initialization,
           selection_sc_output,
           selection_screen,
           start_of_selection,
           end_of_selection.

  ENDCLASS.


  CLASS report_controller IMPLEMENTATION.


    METHOD constructor.

      CREATE OBJECT view.
      CREATE OBJECT model.

      ENDMETHOD.

    METHOD initialization.

      ME->view->initialization( ).

      ENDMETHOD.

    METHOD selection_sc_output.

     ME->view->selection_sc_output( ).

     ENDMETHOD.

    METHOD selection_screen.

     ME->view->selection_screen( model ).

     ENDMETHOD.

    METHOD start_of_selection.

     ME->model->start_of_selection( ).

     ENDMETHOD.

    METHOD end_of_selection.

     ME->view->end_of_selection( ME->model ).

     ENDMETHOD.
    ENDCLASS.