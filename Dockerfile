# 使用 Ubuntu 作為基礎映像
# For x86_64
# FROM ubuntu:22.04

# For Apple Silicon
FROM --platform=linux/amd64 ubuntu:22.04

# =========================

# 設定環境變數，避免在安裝過程中出現互動提示
ENV DEBIAN_FRONTEND=noninteractive

RUN echo "* hard nproc 100" >> /etc/security/limits.conf

# 更新包列表並安裝必要的軟體，包括 OpenSSH 服務
RUN apt-get update && apt-get install -y \
    sudo \
    vim \
    curl \
    wget \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# 創建 SSH 目錄
RUN mkdir /var/run/sshd

# 創建一個新使用者並設置密碼
RUN useradd -m -s /bin/bash template && echo "template:passwd" | chpasswd && adduser template sudo

# 設置 SSH 配置以允許密碼登入
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Challenge 1： 在 .bashrc 文件中添加自動輸出文字
RUN echo 'echo "P!ng{welcome_to_the_ctf}"' >> /home/template/.bashrc

# Challenge 2: Matryoshka Doll
COPY ./src/Mikhail /home/template/Mikhail

# Challenge 3: The Ghost User
RUN mkdir -p /home/P\!ng\{you_found_the_ghost\}

# Challenge 4: Where is the cat?
COPY ./src/Iam_a_cat /home/template/Iam_a_cat

# Challenge 5: Give Me Permission
COPY ./src/run_me /home/template/run_me
RUN chmod -x /home/template/run_me

# Challenge 6: Yummy Dumplings
COPY ./src/make_dumplings /home/template/make_dumplings

# Challenge 7: Thief
COPY ./src/trash /home/template/trash
COPY ./src/open_the_door /home/template/open_the_door

# Challenge 8: Find a Needle in The Haystack
# None

# 創建 20 個學生帳號並設置密碼
RUN for i in $(seq 1 20); do \
        useradd -m -s /bin/bash stu$i && \
        echo "stu$i:student" | chpasswd && \
        adduser stu$i sudo && \
        cp -r /home/template/. /home/stu$i/ && \
        chown -R stu$i:stu$i /home/stu$i; \
    done

# 設置工作目錄
WORKDIR /home/template

# 開放端口 22 以便 SSH 連接
EXPOSE 22

# 啟動 SSH 服務和 bash
CMD ["/usr/sbin/sshd", "-D"]
