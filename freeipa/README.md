# FreeIPA

## Setup

**auth1**

```
ipa-server-install --no-ntp
```

**auth2**

```
export ADMIN_PASSWORD='xxxx'
ipa-replica-install --server=auth1 --principal=admin --admin-password=$ADMIN_PASSWORD --no-ntp
```

## Troubleshooting

High uid values cause ssh issues.  Try decreasing to 5000 range.
