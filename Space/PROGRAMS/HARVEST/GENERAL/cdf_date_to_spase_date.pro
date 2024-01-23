
function cdf_date_to_spase_date,cdf_date

split_date=strsplit(cdf_date,/extract)

year=split_date(4)

month=split_date(1)

day=string(split_date(2),'(I02)')

hhmmss=split_date(3)

case month of 
     'Jan': month='01'
     'Feb': month='02'
     'Mar': month='03'
     'Apr': month='04'
     'May': month='05'
     'Jun': month='06'
     'Jul': month='07'
     'Aug': month='08'
     'Sep': month='09'
     'Oct': month='10'
     'Nov': month='11'
     'Dec': month='12'
endcase

spase_date=split_date(4)+'-'+month+'-'+day+'T'+hhmmss

return,spase_date

end

