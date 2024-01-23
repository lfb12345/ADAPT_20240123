
function match_lfb,a,b,suba,subb,count=count,sort=sort,epsilon=epsilon

;+
;
; NAME:
;
;       MATCH_LFB
;
; PURPOSE:
;
;       Routine to match values in two vectors
;
; CALLING SEQUENCE:
;
;       match_lfb,a,b,suba,subb,[COUNT=,EPSILON=,/SORT]
;
; INPUTS:
;
;       a,b - two vectors to match elements, numeric or string data types
;
; OUTPUTS:
;
;       suba - subscripts of elements in vector a with a match in vector b
;
;       subb - subscripts of the positions of the elements in vector b with matchs in vector a
;
;       suba and subb are ordered such that a[suba] equals b[subb]
;
;       suba and subb are set to !NULL if there are no matches (or set to -1 if prior to IDL Version 8.0)
;
; OPTIONAL INPUT KEYWORD:
;
;       EPSILON - If values are within EPSILON, they are considered equal. Used only only for non-integer matching.
;                 Note that the input vectors should be unique to within EPSILON to provide one-to-one mapping.
;                 The EPSILON default value is 0.
;
;       /SORT -   By default, MATCH uses two different algorithm:
;
;                 (1) The /REVERSE_INDICES keyword to HISTOGRAM is used for integer data
;                 (2) a sorting algorithm is used for non-integer data.
;
;                 The histogram algorithm is usually faster except when the input vectors are sparse and contain
;                 very large numbers, possibly causing memory problems. Use the /SORT keyword to always use the
;                 sort algorithm.
;
; OPTIONAL KEYWORD OUTPUT:
;
;       COUNT -   Set to the number of matches, integer scalar
;
; SIDE EFFECTS:
;
;       The obsolete system variable !ERR is set to the number of matches. However, the use !ERR is deprecated in
;       favor of the COUNT keyword.
;
; RESTRICTIONS:
;
;       The vectors a and b should not have duplicate values within them. You can use rem_dup function to remove
;       duplicate values in a vector.
;
; EXAMPLE:
;
;       If a=[3,5,7,9,11] & b=[5,6,7,8,9,10] then
;
;       IDL> match,a,b,suba,subb,COUNT=count
;
;       yields: suba=[1,2,3],subb=[0,2,4],COUNT=3
;
;       with a[suba]=[5,7,9],b[subb]=[5,7,9]
;
; METHOD:
;
;       For non-integer data types, the two input vectors are combined and sorted and the consecutive equal elements
;       are identified. For integer data types, the /REVERSE_INDICES keyword to HISTOGRAM of each array is used to
;       identify where the two arrays have elements in common.
;
; HISTORY:
;
;       +-------------------------------------------------------------------------------------------------------------------------+
;       | Author Name  | Program editing Description                                                                 | Month Year |
;       +-------------------------------------------------------------------------------------------------------------------------+
;       | D. Lindler   | Original program release                                                                    |  Mar 1986  |
;       | W. Landsman  | Fixed indgen call for very large arrays                                                     |  Sep 1991  |
;       | W. Landsman  | Added COUNT keyword                                                                         |  Sep 1992  |
;       | W. Landsman  | Fixed case where single element array supplied                                              |  Aug 1995  |
;       | W. Landsman  | Use a HISTOGRAM algorithm for integer vector inputs for improved performance                |  Mar 2000  |
;       | W. Landsman  | Work again for strings                                                                      |  Apr 2000  |
;       | W. Landsman  | Use size(/TYPE)                                                                             |  Dec 2002  |
;       | W. Landsman  | Work for scalar integer input                                                               |  Jun 2003  |
;       | W. Landsman  | Assume since V5.4, use COMPLEMENT to WHERE()                                                |  Apr 2006  |
;       | Kim Tolbert  | Added EPSILON keyword                                                                       |  Mar 2008  |
;       | W. Landsman  | Fix bug with Histogram method with all negative values                                      |  Unknown   |
;       | R. Gutermuth | Return !NULL for no matches                                                                 |  Nov 2017  |
;       | Kim Tolbert  | Added EPSILON test in na=1||nb=1 section (missed that when EPSILON was added in 2008        |  Jul 2018  |
;       +-------------------------------------------------------------------------------------------------------------------------+
;
;-
;-------------------------------------------------------------------------

compile_opt idl2

catch,theError

if (theError ne 0) then begin

   catch,/Cancel

   void=cgErrorMsg(/quiet)

   return,-1

endif

if (n_elements(epsilon) eq 0) then epsilon=0

if (n_params() lt 3) then begin

    print,'Syntax - match_lfb,a,b,suba,subb,[COUNT=,EPSILON=,/SORT]'

    print,'         a,b       -- input vectors for which to match elements'

    print,'         suba,subb -- output subscript vectors of matched elements'

    return,-1

endif

da=size(a,/type)

db=size(b,/type)

if (keyword_set(sort)) then hist=0b else hist=(( da le 3 ) || (da ge 12)) && ((db le 3) || (db ge 12 ))

if (~hist) then begin

;
;  Non-integer calculation
;

   na=n_elements(a)

   nb=n_elements(b)

;
;  Check for a single element array
;

   if ((na eq 1) || (nb eq 1)) then begin

      if (nb gt 1) then begin

         if (epsilon eq 0.0) then subb=where(b eq a[0],nw) else subb=where(abs(b-a[0]) lt epsilon,nw)

         if (nw gt 0) then suba=replicate(0,nw) else suba=[-1]

      endif else begin

         if (epsilon eq 0.0) then suba=where(a eq b[0],nw) else suba=where(abs(a-b[0]) lt epsilon,nw)

         if (nw gt 0) then subb=replicate(0,nw) else subb=[-1]

      endelse

      count=nw

      return,count

   endif

;
;  Combined list of a and b
;

   c=[a,b]

;
;  Combined list of indices
;

   ind=[lindgen(na),lindgen(nb)]

;
;  Flag of which vector in combined
;

   vec=[bytarr(na),replicate(1b,nb)]

;
;  List 0-a, 1-b
;

;
;  Sort the combined list
;

   sub=sort(c)

   c=c[sub]

   ind=ind[sub]

   vec=vec[sub]

;
;  Find duplicates in sorted combined list
;

;
;  Total elements in c
;

   n=na+nb

   if (epsilon eq 0.0) then firstdup=where( (c eq shift(c,-1)) and (vec ne shift(vec,-1)),count) else firstdup=where((abs(c-shift(c,-1)) lt epsilon) and (vec ne shift(vec,-1)),count)

   if (count eq 0) then begin

      suba=lonarr(1)-1

      subb=lonarr(1)-1

      return,count

   endif

;
;  Both duplicate values
;

   dup=lonarr( count*2 )

;
;  Changed to lindgen, Sep 1991
;

   even=lindgen( n_elements(firstdup))*2

   dup[even]=firstdup

   dup[even+1]=firstdup+1

;
;  Indices of duplicates
;

   ind=ind[dup]

;
;  Vector id of duplicates
;

   vec=vec[dup]

;
;  Arrayb subscripts
;

   subb=ind[where(vec,complement=vzero)]

   suba=ind[vzero]

endif else begin

;
;  Integer calculation using histogram
;

;
;  Only need intersection of ranges
;

   minab=min(a,max=maxa) > min(b,max=maxb)

   maxab=maxa < maxb

;
;  If either set is empty or if their ranges do not intersect, then the result is null, which is denoted by the value -1.
;

   !err=-1

   if (!VERSION.RELEASE ge '8.0') then begin

      suba=!null

      subb=!null

   endif else begin

      suba=-1

      subb=-1

   endelse

   count=0L

;
;  Check for no overlap
;

   if (maxab lt minab) then return,count

   ha=histogram([a],min=minab,max=maxab,reverse_indices=reva)

   hb=histogram([b],min=minab,max=maxab,reverse_indices=revb)

   r=where((ha ne 0) and (hb ne 0),count)

   if (count gt 0) then begin

      suba=reva[reva[r]]

      subb=revb[revb[r]]

   endif

endelse

return,count

end

