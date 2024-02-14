FROM archlinux:latest

WORKDIR /app
ADD . /app

RUN \
		pacman -Syu --noconfirm --needed --noprogressbar --noconfirm nodejs npm base-devel openssl-1.1 && \
		cd /app && \
		npm install && \
		pacman -Rsc --noconfirm base-devel npm && \
		rm -rf /var/cache /var/lib/pacman/sync/* /root/.npm /root/.cache /root/.node_repl_history
