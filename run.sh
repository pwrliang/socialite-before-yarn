#!/usr/bin/env bash
./copyToMachine.sh hadoop0
./copyToMachine.sh hadoop1
./copyToMachine.sh hadoop2
./copyToMachine.sh hadoop3
#  socialite.async.Entry
# -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005 
mpjrun.sh -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005 -Xmx28G -machinesfile machines -np 5 -dev niodev -Dsocialite.output.dir=/home/gengl/socialite-before-yarn/gen -Dsocialite.worker.num=8 -Dsocialite.port=50100 -Dsocialite.master=master -Dlog4j.configuration=file:/home/gengl/socialite-before-yarn/conf/log4j.properties -cp /home/gengl/socialite-before-yarn/out/production/socialite:/home/gengl/socialite-before-yarn/ext/ST-4.0.7.jar:/home/gengl/socialite-before-yarn/ext/guava-18.0.jar:/home/gengl/socialite-before-yarn/ext/trove-3.0.3.jar:/home/gengl/socialite-before-yarn/ext/log4j-1.2.16.jar:/home/gengl/socialite-before-yarn/ext/antlrworks-1.5.jar:/home/gengl/socialite-before-yarn/ext/annotations-5.1.jar:/home/gengl/socialite-before-yarn/ext/antlrworks-1.4.3.jar:/home/gengl/socialite-before-yarn/ext/commons-lang-2.6.jar:/home/gengl/socialite-before-yarn/ext/commons-lang3-3.1.jar:/home/gengl/socialite-before-yarn/ext/RoaringBitmap-0.5.18.jar:/home/gengl/socialite-before-yarn/ext/commons-logging-1.1.1.jar:/home/gengl/socialite-before-yarn/ext/commons-collections-3.2.1.jar:/home/gengl/socialite-before-yarn/ext/commons-configuration-1.6.jar:/home/gengl/socialite-before-yarn/ext/commons-logging-api-1.0.4.jar:/home/gengl/socialite-before-yarn/ext/concurrent-prim-map-1.0.0.jar:/home/gengl/socialite-before-yarn/ext/antlr-3.5.2-complete-no-st3.jar:/home/gengl/socialite-before-yarn/jython/jython.jar:/home/gengl/socialite-before-yarn/ext/hadoop/commons-io-2.4.jar:/home/gengl/socialite-before-yarn/ext/hadoop/zookeeper-3.4.6.jar:/home/gengl/socialite-before-yarn/ext/hadoop/hadoop-auth-2.7.1.jar:/home/gengl/socialite-before-yarn/ext/hadoop/hadoop-hdfs-2.7.1.jar:/home/gengl/socialite-before-yarn/ext/hadoop/hadoop-common-2.7.1.jar:/home/gengl/socialite-before-yarn/ext/hadoop/curator-client-2.10.0.jar:/home/gengl/socialite-before-yarn/ext/hadoop/hadoop-yarn-api-2.7.1.jar:/home/gengl/socialite-before-yarn/ext/hadoop/curator-recipes-2.10.0.jar:/home/gengl/socialite-before-yarn/ext/hadoop/jackson-core-asl-1.9.13.jar:/home/gengl/socialite-before-yarn/ext/hadoop/curator-framework-2.10.0.jar:/home/gengl/socialite-before-yarn/ext/hadoop/hadoop-yarn-client-2.7.1.jar:/home/gengl/socialite-before-yarn/ext/hadoop/hadoop-yarn-common-2.7.1.jar:/home/gengl/socialite-before-yarn/ext/hadoop/jackson-mapper-asl-1.9.13.jar:/home/gengl/socialite-before-yarn/ext/hadoop/hadoop-yarn-registry-2.7.1.jar:/home/gengl/socialite-before-yarn/ext/hadoop/htrace-core-3.2.0-incubating.jar:/home/gengl/socialite-before-yarn/ext/serialize/minlog-1.3.0.jar:/home/gengl/socialite-before-yarn/ext/serialize/libthrift-0.9.3.jar:/home/gengl/socialite-before-yarn/ext/serialize/objenesis-2.5.1.jar:/home/gengl/socialite-before-yarn/ext/serialize/slf4j-api-1.7.13.jar:/home/gengl/socialite-before-yarn/ext/serialize/kryo-shaded-4.0.1.jar:/home/gengl/socialite-before-yarn/ext/serialize/protobuf-java-2.5.0.jar:/home/gengl/socialite-before-yarn/ext/serialize/slf4j-log4j12-1.7.13.jar socialite.async.Entry examples/prog2.dl
kill -9 $(ps aux|grep '[s]ocialite.async.Entry'|awk '{print $2}')
