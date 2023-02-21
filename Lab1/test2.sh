#!/bin/sh
../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /Lab1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /Lab1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /Lab1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../mapreduce-test-data/access.log /Lab1/input/

/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
-file ../Lab1/mapper.py -mapper ../Lab1/mapper.py \
-file ../Lab1/reducer.py -reducer ../Lab1/reducertest.py \
-input /Lab1/input/* -output /Lab1/output/

/usr/local/hadoop/bin/hdfs dfs -cat /Lab1/output/part-00000

/usr/local/hadoop/bin/hdfs dfs -rm -r /Lab1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /Lab1/output/
../stop.sh