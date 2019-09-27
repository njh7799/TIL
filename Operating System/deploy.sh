echo ">데이터 베이스 초기화"
bash setup_database.sh
echo ""
echo "> 현재 구동중인 애플리케이션 pid 확인"

CURRENT_PID=$(pgrep -f www)

echo "$CURRENT_PID"
echo ""
echo ""

if [ -z "$CURRENT_PID" ]; then
        echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다."
else
        echo "> 현재 구동중인 애플리케이션 종료"
        sudo kill -15 $CURRENT_PID
        sleep 5
fi

echo ""
echo ""

echo "> 서버 실행"
