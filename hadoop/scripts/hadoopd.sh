#!/bin/bash

echo "Start Hadoop daemon: $DAEMON"

# run hadoop daemon
case $DAEMON in
  master)
    $HADOOP_HOME/sbin/start-dfs.sh
    $HADOOP_HOME/sbin/start-yarn.sh
    $HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver
    ;;
  slave)
    ;;
  *)
    echo "Wrong type of daemon: $DAEMON"
    ;;
esac

terminate() {
  echo "Terminate Hadoop daemon: $DAEMON"

  case $DAEMON in
    master)
      $HADOOP_HOME/sbin/mr-jobhistory-daemon.sh stop historyserver
      $HADOOP_HOME/sbin/stop-yarn.sh
      $HADOOP_HOME/sbin/stop-dfs.sh
      ;;
    slave)
      ;;
    *)
      echo "Wrong type of daemon: $DAEMON"
      ;;  
  esac

  exit 0
}

# wait until SIGTERM signal
trap terminate TERM
while true; do
  sleep 20 &
  wait $!
done
