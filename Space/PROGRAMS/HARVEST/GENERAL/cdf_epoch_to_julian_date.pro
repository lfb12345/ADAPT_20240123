
function cdf_epoch_to_julian_date,cdf_info,cdf_epoch

cdf_epoch_num=n_elements(cdf_epoch)

julian_date=make_array(cdf_epoch_num,/double)

for loop=0L,cdf_epoch_num-1L do begin

    split_cdf_epoch=strsplit(cdf_epoch(loop),' T:-',/extract)

    if (cdf_info.cdf_time_type eq 'CDF_TT2000') then begin

       year=split_cdf_epoch(0)

       month=split_cdf_epoch(1)

       day=split_cdf_epoch(2)

    endif

    if (cdf_info.cdf_time_type eq 'CDF_EPOCH') then begin

       year=split_cdf_epoch(2)

       month_char=split_cdf_epoch(1)

       case month_char of

            'Jan': month=1
            'Feb': month=2
            'Mar': month=3
            'Apr': month=4
            'May': month=5
            'Jun': month=6
            'Jul': month=7
            'Aug': month=8
            'Sep': month=9
            'Oct': month=10
            'Nov': month=11
            'Dec': month=12

       endcase

       day=fix(split_cdf_epoch(0))

    endif

    hour=fix(split_cdf_epoch(3))

    minute=fix(split_cdf_epoch(4))

    second=float(split_cdf_epoch(5))

    julian_date(loop)=julday(month,day,year,hour,minute,second)

endfor

return,julian_date

end

