if [ $# -eq 0 ];then
    v_executeDate=`date -d "-1day" +%Y-%m-%d`
else
    echo $1 |grep -e '^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}$' > /dev/null 2>&1
    if [ $? -ne 0 ];then
        echo "date format illege! eg:2013-12-12"
        exit 1
    else
        v_executeDate=$1
    fi
fi

y=`date -d "$v_executeDate" +%Y`
m=`date -d "$v_executeDate" +%m`
d=`date -d "$v_executeDate" +%d`

USAGE="Usage: `basename $0` -date {YYYY-MM-DD} -output {dir}"
while [ $# -gt 0 ]; do
  case "$1" in
    -date)
      shift
      v_executeDate=$1
        echo $1 | grep -e '^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}$' >/dev/null 2>&1
        if [ $? -ne 0 ];then
            echo "date format illege! eg:2013-12-12"
            exit 1
        fi
      shift
      ;;
    -output)
      shift
      output=$1
      shift
      ;;
    help)
        echo -e ${USAGE}
        exit
      ;;
    *)
      break
      ;;
  esac
done

if [ -z "${v_executeDate}" ];then
    v_executeDate=`date -d "-1day" +%Y-%m-%d`
fi

y=`date -d "$v_executeDate" +%Y`
m=`date -d "$v_executeDate" +%m`
d=`date -d "$v_executeDate" +%d`

source ~/.bashrc
streamjar=$HADOOP_HOME/"share/hadoop/tools/lib/hadoop-streaming-2.2.0.jar"

for file in `hadoop fs -ls ${input_path%%/}/${y}/${m}/${d}/ | grep -v '^Found'| awk '{print $(NF)}'`; do
    INPUT="${INPUT} -input ${file}"
done
echo $INPUT

hadoop jar $streamjar -D mapred.job.name="mapred-tpl" \
                                          ${INPUT} \
                                          -output "${output}" \
                                          -numReduceTasks 10 \
                                          -mapper "python mapred.py -component mapper" \
                                          -file "mapred.py" \
                                          -reducer "python mapred.py -component reducer -date ${v_executeDate}" 
