
.run $BASE_DIR/GENERAL/variable_attribute_superset

.run $BASE_DIR/CDAWEB/variable_attribute_superset_lookup_test

variable_attribute_superset_lookup_test

exit

