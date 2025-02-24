*&---------------------------------------------------------------------*
*& Report YPHBF_REPORT_MVC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YPHBF_REPORT_MVC.

INCLUDE: YPHBF_REPORT_MVC_SCR,
         YPHBF_REPORT_MVC_MODEL,
         YPHBF_REPORT_MVC_VIEW,
         YPHBF_REPORT_MVC_CONTROLLER.


DATA: gc_controller TYPE REF TO report_controller.

INITIALIZATION.
CREATE OBJECT gc_controller.
gc_controller->initialization( ).

AT SELECTION-SCREEN OUTPUT.
  gc_controller->selection_sc_output( ).


AT SELECTION-SCREEN.
  gc_controller->selection_screen( ).

START-OF-SELECTION.
  gc_controller->start_of_selection( ).

END-OF-SELECTION.
  gc_controller->end_of_selection( ).