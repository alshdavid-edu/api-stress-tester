ADDRESS=http://192.168.1.183:8080
mkdir -p attacks

attack()
{
    i=1
    for var in "$@"
    do
        if [ "$i" = "1" ]; then
            DURATION=$var
        fi
        if [ "$i" = "2" ]; then
            RATE=$var
        fi
        if [ "$i" = "3" ]; then
            NAME=$var
        fi
        i=$((i + 1))
    done
    echo "START:" $DURATION $RATE $NAME

    mkdir -p attacks/${NAME}
    echo "GET ${ADDRESS}" | \
        vegeta attack -duration=${DURATION}s -rate=${RATE} -connections 100000 | \
        tee attacks/tmp.bin | vegeta plot > attacks/${NAME}/${DURATION}s-${RATE}rps-${NAME}.html

    rm -f attacks/tmp.bin

    sleep 10
    echo "DONE:" $DURATION $RATE $NAME
}

DURATION=30
MSG="ethernet"

# attack ${DURATION} 250 ${MSG}
# attack ${DURATION} 300 ${MSG}
# attack ${DURATION} 350 ${MSG}
# attack ${DURATION} 400 ${MSG}
# attack ${DURATION} 450 ${MSG}
# attack ${DURATION} 500 ${MSG}
# attack ${DURATION} 550 ${MSG}
# attack ${DURATION} 600 ${MSG}
# attack ${DURATION} 650 ${MSG}
# attack ${DURATION} 700 ${MSG}
# attack ${DURATION} 750 ${MSG}
# attack ${DURATION} 800 ${MSG}
# attack ${DURATION} 850 ${MSG}
# attack ${DURATION} 900 ${MSG}
# attack ${DURATION} 950 ${MSG}
# attack ${DURATION} 1000 ${MSG}
# attack ${DURATION} 1000 ${MSG}
# attack ${DURATION} 1050 ${MSG}
# attack ${DURATION} 1200 ${MSG}
# attack ${DURATION} 1250 ${MSG}
# attack ${DURATION} 1300 ${MSG}
# attack ${DURATION} 1350 ${MSG}
# attack ${DURATION} 1400 ${MSG}
# attack ${DURATION} 1450 ${MSG}
# attack ${DURATION} 1500 ${MSG}


attack 10 $1 testing




