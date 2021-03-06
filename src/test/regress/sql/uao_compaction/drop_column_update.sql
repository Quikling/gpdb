-- @Description Tests dropping a column after a compaction with update

CREATE TABLE ck_ct_ao_analyze3(
text_col text,
bigint_col bigint,
char_vary_col character varying(30),
int_array_col int[],
drop_col numeric) with (appendonly=true);

INSERT INTO ck_ct_ao_analyze3 values ('1_zero', 1, '1_zero', '{1}', 1);
ALTER TABLE ck_ct_ao_analyze3 DROP COLUMN drop_col;
Select char_vary_col, int_array_col from ck_ct_ao_analyze3;
INSERT INTO ck_ct_ao_analyze3 values ('2_zero', 2, '2_zero', '{2}');
update ck_ct_ao_analyze3 set bigint_col = bigint_col + 1 where text_col = '1_zero';
Select char_vary_col, int_array_col from ck_ct_ao_analyze3;
