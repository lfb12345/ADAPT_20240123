
DASHES="+"$(printf "%0.s-" $(seq 1 273))"+"

printf "\n%s\n\n" $DASHES

sed 's/(Recs: [0-9][0-9]*)/(Recs: 0)/' MASTERS_20210802/CURL/BARREL_ALL/bar_[1-5][a-z]_l2_ephm_00000000_v01.metadata | sed 's/bar_[1-5][a-z]/bar_xx/' | sed 's/bar_[1-5][A-Z]/bar_XX/' | sed 's/_20[12][0-9][01][0-9][0-3][0-9]_/_00000000_/' | sed 's/"20[12][0-9][01][0-9][0-3][0-9]"/"00000000"/' | sort | uniq -c | grep -v ^'\ \ 52\ '

printf "\n%s\n\n" $DASHES

sed 's/(Recs: [0-9][0-9]*)/(Recs: 0)/' MASTERS_20210802/CURL/BARREL_ALL/bar_1[a-z]_l2_fspc_00000000_v01.metadata | sed 's/bar_1[a-z]/bar_xx/' | sed 's/bar_1[A-Z]/bar_XX/' | sed 's/_20[12][0-9][01][0-9][0-3][0-9]_/_00000000_/' | sed 's/"20[12][0-9][01][0-9][0-3][0-9]"/"00000000"/' | sort | uniq -c | grep -v ^'\ \ 18\ '

printf "\n%s\n\n" $DASHES

sed 's/(Recs: [0-9][0-9]*)/(Recs: 0)/' MASTERS_20210802/CURL/BARREL_ALL/bar_[2-5][a-z]_l2_fspc_00000000_v01.metadata | sed 's/bar_[2-5][a-z]/bar_xx/' | sed 's/bar_[2-5][A-Z]/bar_XX/' | sed 's/_20[12][0-9][01][0-9][0-3][0-9]_/_00000000_/' | sed 's/"20[12][0-9][01][0-9][0-3][0-9]"/"00000000"/' | sort | uniq -c | grep -v ^'\ \ 34\ '

printf "\n%s\n\n" $DASHES

sed 's/(Recs: [0-9][0-9]*)/(Recs: 0)/' MASTERS_20210802/CURL/BARREL_ALL/bar_[1-5][a-z]_l2_hkpg_00000000_v01.metadata | sed 's/bar_[1-5][a-z]/bar_xx/' | sed 's/bar_[1-5][A-Z]/bar_XX/' | sed 's/_20[12][0-9][01][0-9][0-3][0-9]_/_00000000_/' | sed 's/"20[12][0-9][01][0-9][0-3][0-9]"/"00000000"/' | sort | uniq -c | grep -v ^'\ \ 52\ '

printf "\n%s\n\n" $DASHES

sed 's/(Recs: [0-9][0-9]*)/(Recs: 0)/' MASTERS_20210802/CURL/BARREL_ALL/bar_[1-5][a-z]_l2_magn_00000000_v01.metadata | sed 's/bar_[1-5][a-z]/bar_xx/' | sed 's/bar_[1-5][A-Z]/bar_XX/' | sed 's/_20[12][0-9][01][0-9][0-3][0-9]_/_00000000_/' | sed 's/"20[12][0-9][01][0-9][0-3][0-9]"/"00000000"/' | sort | uniq -c | grep -v ^'\ \ 52\ '

printf "\n%s\n\n" $DASHES

sed 's/(Recs: [0-9][0-9]*)/(Recs: 0)/' MASTERS_20210802/CURL/BARREL_ALL/bar_[1-5][a-z]_l2_mspc_00000000_v01.metadata | sed 's/bar_[1-5][a-z]/bar_xx/' | sed 's/bar_[1-5][A-Z]/bar_XX/' | sed 's/_20[12][0-9][01][0-9][0-3][0-9]_/_00000000_/' | sed 's/"20[12][0-9][01][0-9][0-3][0-9]"/"00000000"/' | sort | uniq -c | grep -v ^'\ \ 52\ '

printf "\n%s\n\n" $DASHES

sed 's/(Recs: [0-9][0-9]*)/(Recs: 0)/' MASTERS_20210802/CURL/BARREL_ALL/bar_[1-5][a-z]_l2_rcnt_00000000_v01.metadata | sed 's/bar_[1-5][a-z]/bar_xx/' | sed 's/bar_[1-5][A-Z]/bar_XX/' | sed 's/_20[12][0-9][01][0-9][0-3][0-9]_/_00000000_/' | sed 's/"20[12][0-9][01][0-9][0-3][0-9]"/"00000000"/' | sort | uniq -c | grep -v ^'\ \ 52\ '

printf "\n%s\n\n" $DASHES

sed 's/(Recs: [0-9][0-9]*)/(Recs: 0)/' MASTERS_20210802/CURL/BARREL_ALL/bar_[1-5][a-z]_l2_sspc_00000000_v01.metadata | sed 's/bar_[1-5][a-z]/bar_xx/' | sed 's/bar_[1-5][A-Z]/bar_XX/' | sed 's/_20[12][0-9][01][0-9][0-3][0-9]_/_00000000_/' | sed 's/"20[12][0-9][01][0-9][0-3][0-9]"/"00000000"/' | sort | uniq -c | grep -v ^'\ \ 52\ '

printf "\n%s\n\n" $DASHES

sed 's/(Recs: [0-9][0-9]*)/(Recs: 0)/' MASTERS_20210802/CURL/BARREL_ALL/bar_[1-5][a-z]_l2_uspc_00000000_v01.metadata | sed 's/bar_[1-5][a-z]/bar_xx/' | sed 's/bar_[1-5][A-Z]/bar_XX/' | sed 's/_20[12][0-9][01][0-9][0-3][0-9]_/_00000000_/' | sed 's/"20[12][0-9][01][0-9][0-3][0-9]"/"00000000"/' | sort | uniq -c | grep -v ^'\ \ \ 9\ '

printf "\n%s\n\n" $DASHES

sed 's/(Recs: [0-9][0-9]*)/(Recs: 0)/' MASTERS_20210802/CURL/BARREL_ALL/bar_[1-5][a-z]_l2_xspc_00000000_v01.metadata | sed 's/bar_[1-5][a-z]/bar_xx/' | sed 's/bar_[1-5][A-Z]/bar_XX/' | sed 's/_20[12][0-9][01][0-9][0-3][0-9]_/_00000000_/' | sed 's/"20[12][0-9][01][0-9][0-3][0-9]"/"00000000"/' | sort | uniq -c | grep -v ^'\ \ \ 9\ '

printf "\n%s\n\n" $DASHES

