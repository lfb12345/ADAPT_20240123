
function spase_model_uniqueness,metadata

unique_metadata_index=0

unique_metadata=metadata

filled_mask=where(metadata ne '',filled_mask_num)

if (filled_mask_num gt 0) then begin

   unique_metadata=metadata(filled_mask)

   unique_metadata_index=uniq(unique_metadata,sort(unique_metadata))

   unique_metadata_index= $
      unique_metadata_index(sort(filled_mask(unique_metadata_index)))

   unique_metadata_index=filled_mask(unique_metadata_index)

endif

return,unique_metadata_index

end

