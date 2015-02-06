/** file   discontiguous.pl -- eliminates aggravating warnings 
*   about tuples of a table not being listed sequentially **/

:- discontiguous table/2.
:- multifile run/0, dbase/2.

