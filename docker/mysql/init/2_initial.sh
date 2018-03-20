cd /dump/

echo "import data..."
zcat dump_table_lns.sql.gz | mysql -uroot -plnsrootpass lns
zcat dump_data_lns.sql.gz | mysql -uroot -plnsrootpass lns
echo "done."