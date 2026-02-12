f=llm-starter

cd ../.. # cd just outside the repo
tar --exclude='.git' \
    --exclude='.idea'  \
    -czvf ${f}.tar.gz $f

if [ -f .env ]; then
    set -a  # Automatically export all variables defined in the file
    source .env
    set +a
fi

USER=${CHTC_USER}
HOSTNAME="ap2001.chtc.wisc.edu"
scp ${f}.tar.gz ${USER}@${HOSTNAME}:/staging/${USER}
rm ${f}.tar.gz