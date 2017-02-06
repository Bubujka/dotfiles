# Алиасы для s3, чтобы он мог работать с разными аккаунтами
alias s3-kotex='s3cmd -c ~/.s3cfg-kotex'
alias s3-my='s3cmd -c ~/.s3cfg-my'
alias s3-beta='s3cmd -c ~/.s3cfg-beta'
alias s3-canario='s3cmd --access_key=$(pass show canario/s3_access) --secret_key=$(pass show canario/s3_secret)'

