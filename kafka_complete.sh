_kafka_complete()
{
  local cur prev

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}
  
  tools=(kafka.tools.ConsoleConsumer kafka.tools.ConsoleProducer kafka.tools.ConsumerOffsetChecker kafka.tools.ConsumerPerformance kafka.tools.DumpLogSegments kafka.tools.ExportZkOffsets kafka.tools.GetOffsetShell kafka.tools.ImportZkOffsets kafka.tools.JmxTool kafka.tools.MirrorMaker kafka.tools.PerfConfig kafka.tools.ProducerPerformance kafka.tools.ReplayLogProducer kafka.tools.ReplicaVerificationTool kafka.tools.SimpleConsumerPerformance kafka.tools.SimpleConsumerShell)

  if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(echo ${tools[*]})" $cur) )
  elif [ $COMP_CWORD -eq 2 ]; then
    case "$prev" in
      "kafka.tools.ConsoleConsumer")
        COMPREPLY=( $(compgen -W "--topic --whitelist --blacklist --partition --offset --zookeeper --consumer-property --consumer.config --formatter --property --delete-consumer-offsets --from-beginning --max-messages --timeout-ms --skip-message-on-error --csv-reporter-enabled --metrics-dir --new-consumer --bootstrap-server --key-deserializer --value-deserializer --enable-systest-events" -- $cur) )
        ;;
      "kafka.tools.ConsoleProducer")
        COMPREPLY=( $(compgen -W "--topic --broker-list --sync --compression-codec --batch-size --message-send-max-retries --retry-backoff-ms --timeout --queue-size --queue-enqueuetimeout-ms --request-required-acks --request-timeout-ms --metadata-expiry-ms --max-block-ms --max-memory-bytes --max-partition-memory-bytes --value-serializer --key-serializer --line-reader --socket-buffer-size --property --producer-property --producer.config --old-producer" -- $cur) )
        ;;
      "kafka.tools.ConsumerOffsetChecker")
        COMPREPLY=( $(compgen -W "--zookeeper --topic --group --socket.timeout.ms --retry.backoff.ms --broker-info --help" -- $cur) )
        ;;
      "kafka.tools.ConsumerPerformance")
        COMPREPLY=( $(compgen -W "--zookeeper --broker-list --topic --group --fetch-size --from-latest --socket-buffer-size --threads --num-fetch-threads --new-consumer --consumer.config" -- $cur) )
        ;;
      "kafka.tools.DumpLogSegments")
        COMPREPLY=( $(compgen -W "--print-data-log --verify-index-only --index-sanity-check --files --max-message-size --deep-iteration --value-decoder-class --key-decoder-class --offsets-decoder" -- $cur) )
        ;;
      "kafka.tools.ExportZkOffsets")
        COMPREPLY=( $(compgen -W "--zkconnect --group --output-file --help" -- $cur) )
        ;;
      "kafka.tools.GetOffsetShell")
        COMPREPLY=( $(compgen -W "--broker-list --topic --partitions --time --offsets --max-wait-ms" -- $cur) )
        ;;
      "kafka.tools.ImportZkOffsets")
        COMPREPLY=( $(compgen -W "--zkconnect --input-file --help" -- $cur) )
        ;;
      "kafka.tools.JmxTool")
        COMPREPLY=( $(compgen -W "--object-name --attributes --reporting-interval --help --date-format --jmx-url" -- $cur) )
        ;;
      "kafka.tools.MirrorMaker")
        COMPREPLY=( $(compgen -W "--consumer.config --new.consumer --producer.config --num.streams --whitelist --blacklist --offset.commit.interval.ms --consumer.rebalance.listener --rebalance.listener.args message.handler --message.handler.args --abort.on.send.failure --help" -- $cur) )
        ;; 
      "kafka.tools.PerfConfig")
        COMPREPLY=( $(compgen -W "--messages --reporting-interval --date-format --show-detailed-stats --hide-header --message-size --batch-size --compression-codec --help" -- $cur) )
        ;;
       "kafka.tools.ProducerPerformance")
        COMPREPLY=( $(compgen -W "--broker-list --producer.config --topics --request-timeout-ms --producer-num-retries --producer-retry-backoff-ms --request-num-acks --vary-message-size --sync --threads --initial-message-id --message-send-gap-ms --csv-reporter-enabled --metrics-dir --new-producer" -- $cur) )
        ;;
       "kafka.tools.ReplayLogProducer")
        COMPREPLY=( $(compgen -W "--zookeeper --broker-list --inputtopic --outputtopic --messages --threads --reporting-interval --property --sync" -- $cur) )
        ;;
       "kafka.tools.ReplicaVerificationTool")
        COMPREPLY=( $(compgen -W "--broker-list --fetch-size --max-wait-ms --topic-white-list --time --report-interval-ms" -- $cur) )
        ;;
       "kafka.tools.SimpleConsumerPerformance")
        COMPREPLY=( $(compgen -W "--server --topic f--rom-latest partition --fetch-size --clientId" -- $cur) )
        ;;
       "kafka.tools.SimpleConsumerShell")
        COMPREPLY=( $(compgen -W "--broker-list --topic --partition --replica offset --clientId --fetchsize --formatter --property --print-offsets --max-wait-ms --max-messages --skip-message-on-error --no-wait-at-logend" -- $cur) )
        ;; 
       "kafka.tools.StateChangeLogMerger")
        COMPREPLY=( $(compgen -W "--logs --logs-regex --topic --partitions --start-time --end-time" -- $cur) )
        ;; 
       "kafka.tools.VerifyConsumerRebalance")
        COMPREPLY=( $(compgen -W "--zookeeper.connect --group --help" -- $cur) )
        ;;                              
      *)
        ;;
    esac
  fi

  return 0
} &&
complete -F _kafka_complete kafka-run-class.sh
