FROM oraclelinux:7-slim

#Installing extra required package
RUN yum install -y gcc gcc-c++

# Installing Oracle Instant client
RUN yum -y install oracle-release-el7 && \
    yum-config-manager --enable ol7_oracle_instantclient && \
    yum -y install oracle-instantclient19.3-basiclite && \
    rm -rf /var/cache/yum

# Installing Python and cs_oracle package
RUN yum install -y oracle-epel-release-el7 && \
    yum install -y python36 && \
    yum install -y --enablerepo ol7_optional_latest python3-devel && \
    python3.6 -m pip install cx_Oracle && \
    rm -rf /var/cache/yum

# Installing Kerberos
RUN yum install -y krb5-workstation krb5-devel pam_krb5 krb5-libs krb5-pkinit cyrus-sasl-gssapi  && \
    rm -rf /var/cache/yum

#Installing librdkafka
RUN yum install -y librdkafka-devel librdkafka
