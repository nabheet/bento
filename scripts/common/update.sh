yum install -y gcc libffi-devel openssl-devel libxml2 libxslt libxml2-devel libxslt-devel git libyaml-devel libcurl-devel readline-devel gcc-c++
yum -y update

# install rbenv and ruby-build
git clone https://github.com/sstephenson/rbenv.git /usr/local/share/rbenv
git --git-dir=/usr/local/share/rbenv/.git --work-tree=/usr/local/share/rbenv checkout -b v0.4.0 tags/v0.4.0
git clone https://github.com/sstephenson/ruby-build.git /usr/local/share/rbenv/plugins/ruby-build
git --git-dir=/usr/local/share/rbenv/plugins/ruby-build/.git --work-tree=/usr/local/share/rbenv/plugins/ruby-build checkout -b v20160228 tags/v20160228

export RBENV_ROOT=/usr/local/share/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

cat >> /etc/bashrc <<EOF
export RBENV_ROOT=/usr/local/share/rbenv
export PATH="\$RBENV_ROOT/bin:\$PATH"
eval "\$(rbenv init -)"
EOF

rbenv install 2.3.0
rbenv global 2.3.0
gem install bundler
rbenv rehash

chgrp -R vagrant /usr/local/share/rbenv
chmod -R g+rwx /usr/local/share/rbenv
reboot
sleep 60
