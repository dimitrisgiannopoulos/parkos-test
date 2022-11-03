FROM launcher.gcr.io/google/nodejs

# Install nginx and supervisor
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y -q \
    supervisor curl gnupg2 ca-certificates lsb-release

RUN echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list

RUN curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -

RUN apt-key fingerprint ABF5BD827BD9BF62

RUN apt update

RUN apt install nginx

# Install node.js 14.15.5 LTS
RUN install_node v14.15.5

# Copy application code.
COPY . /app/

# Copy config files
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY nginx.conf /etc/nginx/conf.d/001-nuxt.conf

# Create required folders
RUN mkdir -p /var/log/supervisor /data/nginx/cache

# Install dependencies.
RUN npm --unsafe-perm install

CMD ["/usr/bin/supervisord"]
