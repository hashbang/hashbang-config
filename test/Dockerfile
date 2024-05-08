FROM debian:bookworm

RUN \
<<-EOF
	adduser admin
	apt-get clean
	apt-get update
	apt-get install -y --force-yes \
		bats \
		bats-assert \
		sudo \
		postgresql-client \
		curl \
		tmux \
		jq \
		ssh
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EOF

WORKDIR /home/test

ENV LANG=C.UTF-8
ENV TZ=UTC
ENV TERM=xterm-256color
ENV HOME="/home/test"

CMD ["/usr/bin/bats", "/test/test.bats"]
