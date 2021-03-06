FROM ruby
ADD ./ /app
WORKDIR /app
# 使用国内中科大镜像源加快apt速度
COPY ./sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y locales locales-all ttf-wqy-microhei ffmpeg cron && \
    bundle install
# 定时任务
RUN crontab cron-sorry
CMD cron && ruby src/sorry.rb
