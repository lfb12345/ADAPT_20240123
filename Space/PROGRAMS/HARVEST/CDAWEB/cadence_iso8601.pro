
function cadence_iso8601,cadence_source

split=strsplit(strlowcase(cadence_source),'_-',/extract)

cadence='PT99999.999S'

cadence_mask=where(strmatch(split,'*[0-9]ms') eq 1,cadence_mask_num)

if (cadence_mask_num eq 1) then begin

   cadence='PT'+string(strsplit(split(cadence_mask),'ms',/extract)/1000.0,format='(f5.3)')+'S'

endif else begin

   cadence_mask=where(strmatch(split,'*[0-9]s') eq 1,cadence_mask_num)

   if (cadence_mask_num eq 1) then begin

      cadence='PT'+strsplit(split(cadence_mask),'s',/extract)+'S'

   endif else begin

      cadence_mask=where(strmatch(split,'*[0-9]min') eq 1,cadence_mask_num)

      if (cadence_mask_num eq 1) then begin

         cadence='PT'+strsplit(split(cadence_mask),'min',/extract)+'M'

      endif else begin

         cadence_mask=where(strmatch(split,'*[0-9]hr') eq 1,cadence_mask_num)

         if (cadence_mask_num eq 1) then begin

            cadence='PT'+strsplit(split(cadence_mask),'hr',/extract)+'H'

         endif else begin

            cadence_mask=where(strmatch(split,'*[0-9]day') eq 1,cadence_mask_num)

            if (cadence_mask_num eq 1) then begin

               cadence='P'+strsplit(split(cadence_mask),'day',/extract)+'D'

            endif else begin

               cadence_mask=where(strmatch(split,'*[0-9]month') eq 1,cadence_mask_num)

               if (cadence_mask_num eq 1) then begin

                  cadence='P'+strsplit(split(cadence_mask),'month',/extract)+'M'

               endif

            endelse

         endelse

      endelse

   endelse

endelse

return,cadence

end

