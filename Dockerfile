FROM kalilinux/kali-linux-docker

WORKDIR /tools

# Install the kali top 10 base
RUN apt-get update && apt-get install -y kali-linux-top10

# Make sure python is up to date
RUN apt-get update && apt-get install -y \
        python      \
        python3     \
        python-pip  \
        python3-pip && \
    python  -m pip install --upgrade pip  && \
    python3 -m pip install --upgrade pip  && \
    rm /usr/local/bin/pip*

# Install PowerShell Empire
RUN git clone https://github.com/EmpireProject/Empire.git && \
    cd Empire &&                \
    ./setup/install.sh  &&      \
    echo password | python2 ./setup/setup_database.py

# Install and setup wordlists
RUN apt-get update && apt-get install -y dirb dirbuster wordlists && \
    ln -s /usr/share/wordlists/dirb /usr/share/dirb/wordlists && \
    ln -s /usr/share/wordlists/dirbuster  /usr/share/dirbuster/wordlists && \
    ln -s /wordlists /usr/share/wordlists

# Install anything else
RUN apt-get update && apt-get install -y \
    gobuster        \
    npm             \
    proxychains     \
    net-tools

# Setup anything else
RUN echo "alias ll='ls --color=auto -l'" >> ~/.bashrc

CMD ["/bin/bash"]
