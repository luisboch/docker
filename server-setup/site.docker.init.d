#!/bin/sh
set -e

### BEGIN INIT INFO
# Provides:           site
# Required-Start:     $syslog $remote_fs $docker
# Required-Stop:      $syslog $remote_fs $docker
# Should-Start:       cgroupfs-mount cgroup-lite
# Should-Stop:        cgroupfs-mount cgroup-lite
# Default-Start:      2 3 4 5
# Default-Stop:       0 1 6
# Short-Description:  Create lightweight, portable, self-sufficient containers.
# Description:
#  Docker is an open-source project to easily create lightweight, portable,
#  self-sufficient containers from any application. The same container that a
#  developer builds and tests on a laptop can run at scale, in production, on
#  VMs, bare metal, OpenStack clusters, public clouds and more.
### END INIT INFO
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

case "$1" in
        start)
		$0 stop || true
                # start docker postgresql
		sudo -u postgres /usr/bin/docker start postgresql
                sudo -u apache /usr/bin/docker run -v /home/apache/html/etc:/var/www/phalcon/etc -v /home/apache/html/uploads:/var/www/phalcon/public/uploads -v /home/apache/html/featured:/var/www/phalcon/public/img/featured -p=80:80 --net=pizzaria --ip="172.18.0.100" --name sitefornalha -d -P luisboch/pizzariafornalha
                ;;
        stop)
		# stop site
		/usr/bin/docker stop -t 2 sitefornalha
		/usr/bin/docker rm sitefornalha
		sudo -u postgres /usr/bin/docker stop postgresql
                ;;
        restart)
                $0 stop
                $0 start;
                ;;
        force-reload)
                $0 restart
                ;;

        status)
                docker -ps -a
                ;;

        *)
                echo "Usage: service docker {start|stop|restart|status}"
                exit 1
                ;;
esac

